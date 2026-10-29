---
type: concept
created: 2026-10-29
updated: 2026-10-29
tags: [concept, 代理模型, 降阶基, 神经算子, 网格无关, FNO]
domain: fluid-dynamics
agent: caixin
related: [[2026-10-29-arXiv-2610.37485_AMOR-Adaptive-Modal-Operator-Refinement]], [[Neural Operator]], [[FNO]]
---

# 降阶基神经算子（Reduced-Basis Neural Operator）

## 背景

Fourier Neural Operator (FNO) 的标准 FFT 实现**假设等距笛卡尔网格**——这是真实工程几何中的例外而非常态。CAD 生成的网格在孔、圆角、接触、边界层处加密，单元尺寸相差几个数量级。重采样到均匀网格的代价：

- 间距由包围盒中**最小特征**决定 → 网格量爆炸
- 边界变成**阶梯或掩码**
- 预测结果需**插值回原网格**（载荷、约束、峰值应力都定义在原节点上）

## 核心思路

用**降阶基块**替代 Fourier 谱卷积，在**网格节点上直接求值**。

### 三个设计要素

**1. 输入/输出基独立**

$$\bm{\Pi}_{\rm in}=\bm{\varphi}^{\rm in}(\bm{\varphi}^{\rm in})^{*},\qquad \bm{\Pi}_{\rm out}=\bm{\varphi}^{\rm out}(\bm{\varphi}^{\rm out})^{*}$$

输入场（系数场）与输出场（位移场、速度场）物理性质不同，共用一个基会受限。PODNO 用了共享基，AMOR 推广为**分离基**。

**2. 跨基稠密耦合**

$$\mathcal{K}_{\rm RB}^{(\ell)}h=\bm{\varphi}_{\rm dec}^{(\ell)}\bigl[T^{(\ell)}(\bm{\varphi}_{\rm enc}^{(\ell)})^{*}h\bigr],\qquad T^{(\ell)}\in\mathbb{R}^{k_{\rm dec}\times k_{\rm enc}\times d_v\times d_v}$$

核 $\kappa^{(\ell)}(x,y)_{(c,i),(c',j)}=\sum_{n,m}T^{(\ell)}_{n,m,i,j}\varphi^{\rm dec}_{n,c}(x)\varphi^{\rm enc}_{m,c'}(y)$ —— **既非平移不变，也非卷积核**。

**3. 无张量积维度依赖**

FNO 的谱权重按 $m^d$ 增长（$d=3$ 时 $m^3$）；降阶基块不随空间维数增长。实测：宽度 8→64 时 FNO 推理 5.1→55.9 ms（11×），AMOR 5.0→26.1（5.3×）。

## 关键洞见：位置编码可以内部生成

**通用逼近性**要求基能"点分离"（模态值映射单射）。直觉上这需要显式坐标输入，但事实是：

> **跨模态耦合把常数通道解码成分离点的模态值，从而内部提供了位置编码。**

定理：若基连续、点分离、含归一化常数模态 $(C|\Omega|)^{-1/2}\mathbf{1}$，则 AMOR 可一致逼近紧集上任意连续算子。证明基于"平均化局部特征"逼近论证。

## 适用边界

| 场景 | 更优选择 |
|---|---|
| 结构网格 + 输运主导（周期、统计均匀）| **FNO**（平移等变性 + 傅里叶模态天然匹配）|
| 非规则网格 + 几何主导 | **降阶基算子** |
| 移动前沿、强多尺度耦合 | FNO（静态基需要过多模态，效率优势丧失）|
| 训练数据稀缺 | Laplacian / 多项式等**免拟合预设基** |

> 学习基误差比 PCA 低 19–42%，但每 epoch 训练时间增加 3.5–6.4 倍。

## 网格迁移

需要一次性的**基延拓** + 目标网格 **Gram 加权对偶编码器**构造——这是 FNO 的分辨率无关 Fourier 基不需要的步骤。但在研究的问题中该步骤成本低、迁移精度强。

实测：非线性扩散 100×100 训练 → 50²/150²/200²，$L^1$ 误差 2.00%/1.87%/1.88%（训练网格 1.91%）。

## 相关

- [[2026-10-29-arXiv-2610.37485_AMOR-Adaptive-Modal-Operator-Refinement]] — 完整案例
- [[Physics-Prior-Surrogate-Modeling]] — 与均值函数注入范式的对比
