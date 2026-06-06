---
tags: [渲染, 光线追踪, 3DGS, 神经渲染, 2026]
date: [[2026-06-06]]
status: 待读
---

# Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting

## 元信息
| 标题 | Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting |
| 作者 | Subhankar Mishra (NISER) |
| 链接 | [arXiv](https://arxiv.org/abs/2606.00817) |
| 代码 | [GitHub](https://github.com/smlab-niser/ddf-gs) |

## 核心贡献

1. **从3DGS场景蒸馏有向距离场(DDF)** - 将训练好的3D高斯泼溅场景转化为光线预言机
2. **常时查询** - 每个查询只需一次网络前向传播，52MB固定大小，不随场景中高斯数量增长
3. **监督策略研究** - 发现从Gaussians渲染的深度太模糊无法学习薄几何，而清洁距离监督可以恢复

## 技术方案

### DDF定义
- 输入：光线原点 $\mathbf{x} \in \mathbb{R}^3$ 和方向 $\mathbf{d} \in \mathbb{S}^2$
- 输出：距离 $t$（沿方向 $\mathbf{d}$ 到第一个表面的距离）和可见性 $\xi$（光线是否命中场景的概率）

$$f(\mathbf{x}, \mathbf{d}) = (t, \xi)$$

### 网络架构
- 多分辨率哈希网格编码点 $\mathbf{x}$（16层，每层2特征）
- 四层正弦编码方向 $\mathbf{d}$
- 2层MLP（宽度64）输出 $t$ 和 $\xi$
- 总大小：52MB（主要由哈希表约13M参数组成）

### 监督信号来源
1. 从Gaussians渲染的深度（便宜但模糊）
2. NeuS表面球追踪（无需网格的清洁距离）
3. 地面真实网格射线投射（上限）

### 关键发现
- 从Gaussians渲染的深度无法学习薄几何
- 清洁距离监督（特别是射线追踪的表面距离）可以恢复薄特征
- 直接从图像学习没有帮助，体积渲染颜色损失太弱

## 性能数据

| 指标 | DDF | BVH over Gaussians |
|------|-----|---------------------|
| 查询时间 | 常数 | 随场景增长 |
| 内存 | 52MB常数 | O(N)随Gaussians增长 |
| 速度 | 26-72倍快于SDF球追踪 | - |

### 渲染质量
- 阴影：30.3 dB（参考光线追踪）
- 环境光遮蔽：21.3 dB
- 测试集：142个物体

## 公式

### 损失函数
- L1距离损失（钳位最大值）
- 交叉熵损失（命中标志，权重0.3）
- 自一致性项：沿命中光线的点，向前移动 $s$ 应该报告剩余距离 $t-s$

## 局限性

1. 需要预先训练的3DGS场景
2. 固定的52MB大小可能对非常小的场景不够优化
3. 依赖于多分辨率哈希网格的表示能力

## 标签
#渲染 #光线追踪 #3DGS #神经渲染 #全局光照 #阴影