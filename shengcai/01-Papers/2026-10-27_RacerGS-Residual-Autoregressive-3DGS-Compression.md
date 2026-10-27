---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, 渲染, 3D高斯泼溅, 压缩, 熵编码, 自回归, FiLM, GRU, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.34263
---

# RacerGS: Residual-Autoregressive Context for 3D Gaussian Splatting Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RacerGS: Residual-Autoregressive Context for 3D Gaussian Splatting Compression |
| **作者** | Wenqing Wang, Huimin Zeng, Yun Fu（西工大等） |
| **发表** | arXiv preprint 2026-10-25（cs.CV / cs.GR） |
| **链接** | [原文](https://arxiv.org/abs/2610.34263) · [HTML](https://arxiv.org/html/2610.34263v1) |
| **DOI** | 10.48550/arXiv.2610.34263（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 3DGS 压缩的三件套：**hash 投影**把原始 hash-grid 特征压成结构化上下文特征；**自适应残差量化**把 anchor 属性编码成「相对上下文预测均值的残差」；**FiLM 调制的自回归 GRU 上下文模型**用已解码的 anchor 特征块因果地精修熵模型参数。三者叠加，相对原生 3DGS 压缩 **150×+**，相对 Scaffold-GS 压缩 **28×**，渲染质量可比。

1. **Hash projection model**：把 anchor 位置处的多分辨率 hash-grid 特征 $f_i^h$ 经 MLP 投影成紧凑上下文特征 $f_i^c$ —— 这是下游熵模型从 hash grid 得到的**唯一**信号（把「表示能力」与「熵估计能力」解耦）。
2. **自适应残差量化**：属性残差 $\Delta f_i = f_i - \mu_i^s$，量化步长由网络预测 $q_i=q_0(1+\tanh(\Delta q_i))$，训练时用均匀噪声 + straight-through 梯度。
3. **FiLM 调制自回归 GRU 上下文模型**：只对 anchor 特征（切成 $N_C=5$ 块）做自回归；用 GRU 隐状态作为定长摘要（不随块数增长），再经 FiLM 自适应缩放/偏移，最后与共享的「块位置嵌入 + base 参数嵌入」拼接后预测精修的 $(\mu,\sigma,\pi)$。
4. **高斯混合熵模型**：base 分量（空间上下文预测）与 causal-refined 分量（自回归上下文预测）的混合，逐维独立求值，混合权重 $\pi_{k,i,j}$。
5. **结果**：相对原生 3DGS 压缩 **>150×**、相对 Scaffold-GS **28×**，五个数据集上存储与率失真性能均优于既有 3DGS 压缩方法。

---

## 技术方案

### 核心思想

**问题**：3DGS 参数量大，存储与传输是瓶颈。已有压缩方法的三个弱点：
1. **空间上下文建模有限** —— 原始 hash-grid 特征直接送进熵网络；
2. **熵建模低效** —— anchor 属性被直接量化，而非以「相对预测均值」的残差形式编码；
3. **无显式因果建模** —— 已解码的块要么被忽略，要么用「不断增长的拼接」处理（复杂度随块数线性膨胀，且无法跨 anchor 复用）。

**解法**：把「空间上下文（来自 hash grid，跨块共享）」与「因果上下文（来自已解码块，块间递推）」拆成两个通道，再在高斯混合熵模型里融合。

### 关键技术

| 技术 | 说明 |
|------|------|
| **基表示** | Scaffold-GS 式 anchor：位置 $x_a\in\mathbb R^3$；属性 $\mathcal A=\{f_a\in\mathbb R^{D_a},\;l\in\mathbb R^6,\;o\in\mathbb R^{3K}\}$（anchor 特征 / 6 个缩放参数 / $K$ 个 3D 偏移向量）。每个 anchor 预测 $K$ 个 Gaussian |
| **Hash projection** | $f_i^h=\operatorname{Interp}(x_a^i,H)\in\mathbb R^{D_h}$ → $f_i^c=\operatorname{MLP}_f(f_i^h)\in\mathbb R^{D_c}$。**只有 $f_i^c$ 进入下游熵模型** |
| **自适应量化步长** | $\Delta q_i=\operatorname{MLP}_q(f_i^c)$；$q_i=q_0(1+\tanh(\Delta q_i))$，$q_0$ 为属性相关初始步长 |
| **残差量化** | $\Delta f_i=f_i-\mu_i^s$；$r_i=\lfloor \Delta f_i\oslash q_i\rceil\in\mathbb Z^{D_f}$；$\Delta\hat f_i=r_i\odot q_i$；$\hat f_i=\mu_i^s+\Delta\hat f_i$ |
| **可微量化** | 训练时 $\Delta\hat f_i^{\mathrm{train}}=\Delta f_i+\epsilon_i$，$\epsilon_i\sim\mathcal U(-q_i/2,q_i/2)$，straight-through 梯度 $\partial\Delta\hat f_i^{\mathrm{train}}/\partial\Delta f_i=I$ |
| **分块自回归** | 只对 anchor 特征分块：$f_a^i=[f_{a,i,1};\ldots;f_{a,i,N_C}]$，$N_C=5$，每块 $C$ 个连续通道 |
| **GRU 递推** | 初始状态 $h_i^0=\operatorname{MLP}_{\mathrm{cxt}}([\mu_i^s;\sigma_i^s;\pi_i^s])$；$z_{i,t}=\operatorname{MLP}_{\mathrm{prev}}(\hat f_{a,i,t})$；$h_i^n=\operatorname{GRU}(z_{i,n-1},h_i^{n-1})$。隐状态**定长**，是所有已解码块的摘要 |
| **FiLM 调制** | $\gamma_i^n,\beta_i^n=\operatorname{MLP}_{\mathrm{FiLM}}(h_i^n)$；$\tilde h_i^n=h_i^n\odot(1+\tanh(\gamma_i^n))+\beta_i^n$ —— 让同一循环表示适配不同 anchor 的不确定性/混合偏好模式 |
| **共享块位置参数预测器** | $g_n=\operatorname{Emb}(n)$（可学习组位置嵌入）；$b_{i,n}=\operatorname{MLP}_{\mathrm{base}}([\mu^s_{i,n},\sigma^s_{i,n},\pi^s_{i,n}])$；$(\mu^C_{i,n},\sigma^C_{i,n},\pi^C_{i,n})=\operatorname{MLP}_p(\tilde h_i^n\oplus b_{i,n}\oplus g_n)$ |
| **高斯混合熵模型** | base 分量 $s$ + causal-refined 分量 $c$，逐特征维独立求值，混合权重 $\pi_{k,i,j}$ |
| **算术编码** | 整数残差符号用 arithmetic coding，码长 $\approx-\log_2 p(\Delta\hat f_{i,j})$ |

### 公式

**Hash 投影与基础熵参数**：
```math
f_i^h = \operatorname{Interp}(x_a^i, H) \in \mathbb{R}^{D_h},
\qquad
f_i^c = \operatorname{MLP}_f(f_i^h) \in \mathbb{R}^{D_c}
```
```math
\Delta q_i = \operatorname{MLP}_q(f_i^c),
\qquad
\mu_i^s, \sigma_i^s, \pi_i^s = \operatorname{MLP}_c(f_i^c)
```

**自适应残差量化**：
```math
\Delta f_i = f_i - \mu_i^s,
\qquad
q_i = q_0\cdot\big(1+\tanh(\Delta q_i)\big)
```
```math
r_i = \left\lfloor \frac{\Delta f_i \oslash q_i}{1} \right\rceil \in \mathbb{Z}^{D_f},
\qquad
\Delta\hat f_i = r_i \odot q_i,
\qquad
\hat f_i = \mu_i^s + \Delta\hat f_i
```

**训练期可微量化（straight-through）**：
```math
\Delta\hat f_i^{\mathrm{train}} = \Delta f_i + \epsilon_i,
\qquad
\epsilon_i \sim \mathcal{U}\!\left(-\frac{q_i}{2}, \frac{q_i}{2}\right),
\qquad
\frac{\partial \Delta\hat f_i^{\mathrm{train}}}{\partial \Delta f_i} = I
```

**GRU 因果递推（隐状态定长）**：
```math
f_a^i = [f_{a,i,1}; \ldots ; f_{a,i,N_C}],
\qquad
\hat f_{a,i,<n} = [\hat f_{a,i,1}; \ldots ; \hat f_{a,i,n-1}]
```
```math
h_i^0 = \operatorname{MLP}_{\mathrm{cxt}}\big(s_i\big),
\qquad s_i = [\mu_i^s; \sigma_i^s; \pi_i^s]
```
```math
z_{i,t} = \operatorname{MLP}_{\mathrm{prev}}(\hat f_{a,i,t}), \qquad t<n
```
```math
h_i^1 = h_i^0,
\qquad
h_i^n = \operatorname{GRU}(z_{i,n-1}, h_i^{n-1}), \qquad n = 2,\ldots,N_C
```

**FiLM 调制**：
```math
\gamma_i^n, \beta_i^n = \operatorname{MLP}_{\mathrm{FiLM}}(h_i^n),
\qquad
\tilde h_i^n = h_i^n \odot \big(1+\tanh(\gamma_i^n)\big) + \beta_i^n
```

**共享块位置参数预测器**：
```math
g_n = \operatorname{Emb}(n),
\qquad
b_{i,n} = \operatorname{MLP}_{\mathrm{base}}\big([\mu^s_{i,n}, \sigma^s_{i,n}, \pi^s_{i,n}]\big)
```
```math
\mu^C_{i,n}, \sigma^C_{i,n}, \pi^C_{i,n}
= \operatorname{MLP}_p\big(\tilde h_i^n \oplus b_{i,n} \oplus g_n\big)
```

**base 分量概率（零均值 base 残差）**：
```math
p(\Delta\hat f_i) = \prod_{j=1}^{D_f}
\int_{\Delta\hat f_{i,j}-\frac{q_{i,j}}{2}}^{\Delta\hat f_{i,j}+\frac{q_{i,j}}{2}}
\phi(x; 0, \sigma_{i,j}^s)\,dx
```
```math
= \prod_{j=1}^{D_f}\left[
\Phi\!\left(\Delta\hat f_{i,j}+\frac{q_{i,j}}{2}; 0, \sigma^s_{i,j}\right)
- \Phi\!\left(\Delta\hat f_{i,j}-\frac{q_{i,j}}{2}; 0, \sigma^s_{i,j}\right)
\right]
```

**anchor 特征残差的混合分布**：
```math
p(\Delta\hat f_a^i) = \prod_{j=1}^{D_f}
\sum_{k\in\{s,c\}} \pi_{k,i,j}\left[
\Phi\!\left(\Delta\hat f_{a,i,j}+\frac{q_{i,j}}{2}; \mu_{k,i,j}, \sigma_{k,i,j}\right)
- \Phi\!\left(\Delta\hat f_{a,i,j}-\frac{q_{i,j}}{2}; \mu_{k,i,j}, \sigma_{k,i,j}\right)
\right]
```

### 代码片段

```python
# 解码流程（论文 §2.8）
# 1) 加载已编码的 anchor 位置、hash grid、mask、decoder 网络
# 2) 查询 hash 特征并投影
f_h = hash_grid.query(anchor_pos)          # [N, D_h]
f_c = mlp_f(f_h)                            # [N, D_c]
# 3) 预测 base 统计与量化步长
mu_s, sigma_s, pi_s = mlp_c(f_c)            # [N, D]
delta_q = mlp_q(f_c)                        # [N, D]
q = q0 * (1.0 + torch.tanh(delta_q))        # 自适应步长
# 4) anchor 特征分块自回归解码（N_C = 5）
h = mlp_cxt(torch.cat([mu_s, sigma_s, pi_s], dim=-1))
for n in range(N_C):
    params = mlp_p(torch.cat([film(h), mlp_base(base_params[n]), emb(n)], dim=-1))
    r = arithmetic_decode(params, q_chunk)         # 解出整数残差 r_{i,n}
    f_hat_chunk = params.mu + r * q_chunk
    h = gru(mlp_prev(f_hat_chunk), h)              # 更新因果上下文
# 5) 反量化并重建属性
f_hat = mu_s + r_hat * q
# 6) 按 anchor 属性偏移生成 K 个 Gaussian
```

---

## 实验结论

- **数据集**：5 个数据集（论文摘要未逐一列出；3DGS 压缩常规使用 DTU、 Tanks and Temples、 Mip-NeRF 360、Blender、NeRF Synthetic）
- **基线**：既有 3DGS 压缩方法（含 Scaffold-GS 及其后继）
- **结果**：
  - 相对**原生 3DGS 压缩 > 150×**
  - 相对 **Scaffold-GS 压缩 28×**
  - 渲染质量与原生 3DGS **可比**
  - 五个数据集上，存储缩减与率失真（rate-distortion）性能均**优于**既有 3DGS 压缩方法
- **实现细节**：$N_C=5$ 个 chunk，每 chunk $C$ 个连续通道；仅 anchor 特征做自回归，缩放/不透明度/偏移等属性走非自回归路径

---

## 局限性

1. **代码未开源**（论文未给仓库链接）。
2. **自回归解码有顺序依赖**：必须按块顺序解码，无法完全并行 → 解码延迟高于并行熵编码方案。
3. **anchor 特征之外的属性未受益于因果上下文**：缩放 $l$、偏移 $o$ 只用 base 分量建模，空间冗余压缩空间有限。
4. **混合熵模型逐维独立求值**：不建模特征维之间的相关性，理论上仍有率失真空间。
5. **依赖 Scaffold-GS 的 anchor 结构**：压缩比是相对 Scaffold-GS（28×）与原生 3DGS（150×），实际占用字节数还需看具体数据集上的绝对值。
6. **GRU 顺序递推在 GPU 上并行度低**：跨块依赖导致 warp 内串行。
7. 摘要未给出绝对压缩后文件大小与率失真曲线细节（需查正文表格）。

---

## 相关工作

- [[3D-Gaussian-Splatting]] — 原始表示
- [[Scaffold-GS]] — anchor 化基线，本文的直接参照（压缩比对比对象）
- [[Scaffold-GS]] / [[Octree-3DGS]] — 稀疏结构化 3DGS 路线
- [[2026-10-25_BoundedGS-Memory-Efficient-High-Resolution-3DGS]] — 同批次训练内存优化工作
- [[2026-10-27_GaussianSpline-Adaptive-Bezier-4D-Gaussian-Splatting]] — 同批次 4D 动态表示工作

---

## 实现建议

- **实现难度**：**中**。核心是「hash 投影 + 自适应残差量化 + FiLM-GRU 自回归上下文 + 高斯混合熵模型 + 算术编码」，全部是标准组件，无 GPU 特定优化。难点在于：(a) 训练期 straight-through 量化的稳定性；(b) 自回归训练的 teacher forcing 与解码一致性；(c) 算术编码与 GPU 训练的流水线对接。
- **预期性能**：150×（vs 3DGS）/ 28×（vs Scaffold-GS）压缩比，渲染质量可比。
- **适用场景**：
  - ✅ 3DGS 场景的存储/传输（VR 流媒体、资产分发、自动驾驶场景回传）
  - ✅ 作为我们自研渲染器场景资产管线的压缩层
  - ⚠️ 需要极低解码延迟的实时流式传输（自回归解码有顺序依赖）
  - ❌ 静态单场景离线渲染（压缩无收益）
- **推荐度**：**⭐⭐⭐ 推荐** —— 技术路线成熟可复现，工程价值明确。更值得借鉴的是其**设计范式**：「把空间上下文与因果上下文分离，再在高斯混合里融合」，这个范式可直接迁移到我们自己的神经材质/辐射缓存压缩工作中。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.34263
- HTML 全文：https://arxiv.org/html/2610.34263v1
- PDF：https://arxiv.org/pdf/2610.34263
