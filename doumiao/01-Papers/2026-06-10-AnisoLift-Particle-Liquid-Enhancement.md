# AnisoLift: 各向异性潜在表示粗粒度粒子液体增强

> **论文**: AnisoLift: Anisotropic Latent Representations for Coarse Particle Liquid Enhancement
> **arXiv**: [2606.10473](https://arxiv.org/abs/2606.10473) | [PDF](https://arxiv.org/pdf/2606.10473) | [HTML](https://arxiv.org/html/2606.10473v1)
> **作者**: Zhengqing Gao, Huaxi Huang, Runqi Lin, Yuanyuan Wang, Meng Li, Xi Zhou, Tongliang Liu, Mingming Gong, Xiao Sun
> **机构**: Shanghai AI Lab, MBZUAI, Oxford, HKUST, Melbourne, Sydney
> **日期**: 2026-06-09 (v1)
> **类别**: cs.GR (Graphics)
> **标签**: #粒子模拟 #液体模拟 #SPH #MPS #细节增强 #各向异性 #Latent-Representation

---

## 核心创新点

### 问题定义
基于粒子的液体模拟（如 SPH、MPS）在图形学和物理建模中广泛应用，但高分辨率模拟计算代价高昂。现有的粗粒度增强方法通常依赖额外粒子生成，带来大量计算开销且表示质量差。

### 核心方法：AnisoLift
提出**结构化潜在闭包框架**，为每个粗粒粒子附加**可学习的各向异性椭球分量**，在不增加粒子数量的情况下捕获高分辨率流动的方向性局部结构。

**关键创新**：
1. **固定粒子预算的粗粒液体增强** — 不使用粒子加密或可微求解器 rollout
2. **各向异性椭球潜在表示** — 每个粗粒粒子携带椭球足迹编码局部几何
3. **粗粒支撑的参考对齐** — 通过局部聚合参考粒子构建逐粒子监督目标

### 技术pipeline

```
粗粒轨迹 → 特征提取 φθ(𝒮, i) → 残差预测 g_res + 几何预测 g_geo
                                            ↓
                          修正状态 (x̂, v̂, C) → 对齐目标
```

### 损失函数
$$
\mathcal{L} = \lambda_x \mathcal{L}_x + \lambda_v \mathcal{L}_v + \lambda_{ekin} \mathcal{L}_{ekin} + \lambda_{geo} \mathcal{L}_{geo}
$$

- $\mathcal{L}_x, \mathcal{L}_v$：位置/速度修正损失
- $\mathcal{L}_{ekin}$：动能辅助损失（质量归一化比动能）
- $\mathcal{L}_{geo}$：log-协方差几何损失（流形几何）

---

## 方法详解

### 3.1 问题公式化
粗粒状态：
$$
\mathcal{S}^c_t = \{(\mathbf{x}^c_{i,t}, \mathbf{v}^c_{i,t}, \rho^c_{i,t}, p^c_{i,t}, m^c_i, \tau^c_i)\}_{i=1}^{N_c}
$$

参考状态：
$$
\mathcal{S}^r_t = \{(\mathbf{x}^r_{j,t}, \mathbf{v}^r_{j,t}, m^r_j, \tau^r_j)\}_{j=1}^{N_r}, \quad N_c \ll N_r
$$

修正状态：
$$
\widehat{\mathbf{x}}_{i,t} = \mathbf{x}^c_{i,t} + \Delta\mathbf{x}_{i,t}, \quad \widehat{\mathbf{v}}_{i,t} = \mathbf{v}^c_{i,t} + \Delta\mathbf{v}_{i,t}
$$

### 3.3 粗粒支撑参考对齐
由于粗粒和参考粒子无一一对应，定义局部参考邻域：
$$
\mathcal{N}_{i,t_k}^r = \{j \in \mathcal{F}^r \mid \|\mathbf{x}^r_{j,t_k} - \mathbf{x}^c_{i,t_k}\|_2 \leq R_i\}
$$

核权重归一化：
$$
\alpha_{ij,t_k} = \frac{\omega_{ij,t_k}}{\sum_{\ell \in \mathcal{N}_{i,t_k}^r} \omega_{i\ell,t_k}}
$$

对齐目标：
$$
\mathbf{x}^*_{i,t_k} = \sum_{j \in \mathcal{N}_{i,t_k}^r} \alpha_{ij,t_k} \mathbf{x}^r_{j,t_k}, \quad \mathbf{v}^*_{i,t_k} = \sum_{j \in \mathcal{N}_{i,t_k}^r} \alpha_{ij,t_k} \mathbf{v}^r_{j,t_k}
$$

协方差目标：
$$
\mathbf{C}^*_{i,t_k} = \sum_{j \in \mathcal{N}_{i,t_k}^r} \alpha_{ij,t_k} (\mathbf{x}^r_{j,t_k} - \mathbf{x}^*_{i,t_k})(\mathbf{x}^r_{j,t_k} - \mathbf{x}^*_{i,t_k})^\top + \epsilon_{geo}\mathbf{I}
$$

### 3.4 结构化潜在闭包
协方差矩阵预测（正定约束）：
$$
\mathbf{C}_{i,t_k} = \mathbf{L}_{i,t_k} \mathbf{L}_{i,t_k}^\top + \epsilon_{geo}\mathbf{I}
$$

椭球定义：
$$
\mathcal{E}_{i,t_k} = \{\mathbf{y} \in \mathbb{R}^d \mid (\mathbf{y} - \widehat{\mathbf{x}}_{i,t_k})^\top \mathbf{C}_{i,t_k}^{-1} (\mathbf{y} - \widehat{\mathbf{x}}_{i,t_k}) \leq 1\}
$$

---

## 实验验证

- **数据集**：Lagrangian 2D/3D 粒子基准测试（SPH 和 MPS求解器）
- **基准方法**：与 MLFLIP、Neural UpFlow 等对比
- **评估指标**：位置/速度精度、动能、保真度

### 贡献总结
1. 固定预算粗粒粒子液体增强公式
2. AnisoLift 结构化潜在闭包框架
3. 粗粒支撑参考对齐方法
4. 2D/3D SPH/MPS 基准验证

---

## 渲染/模拟关联

| 方面 | 技术 |
|------|------|
| **模拟方法** | SPH, MPS, WCSPH, PCISPH, APIC, FLIP/PIC, MPM |
| **渲染管线** | 粒子→椭球→表面重建→光线追踪 |
| **各向异性** | ASPH,椭圆核, Gaussian 表示 |
| **应用场景** | 自由表面、大变形、飞溅、拓扑变化 |

---

## 技术洞察

### 为什么各向异性椭球有效？
粗粒求解器保留全局流动 motion，但粒子缺乏编码高分辨率状态中方向性局部结构的能力。通过为每个粒子附加椭球分量，可以：
- 不增加粒子数量 → 保持计算效率
- 编码子粒子结构 → 恢复薄界面、拉伸界面
- 方向性几何 → 捕获局部各向异性

### 与 Gaussian Splatting 的联系
Gaussian Fluids (2025) 已展示各向异性原语的表达力。AnisoLift 将这一思想应用于 **Lagrangian 粒子**，而非 Eulerian 速度场。

###潜在应用
- **实时液体模拟**：低分辨率 SPH + AnisoLift 上采样
- **游戏/VR**：固定预算粒子系统的视觉质量提升
- **渲染管线集成**：椭球可直接用于 splatting 或曲面重建

---

## 可行性分析：粗粒粒子液体增强

## 渲染方法
- 类型：粒子渲染 + 隐式曲面
- 技术：各向异性椭球潜在表示 + 粒子到椭球映射

## 视觉质量
- 逼真度：⭐⭐⭐⭐ (需配合表面重建)
- 风格化支持：是（椭球形状可控）

## 性能预期
- 帧率：高（固定粒子预算， inference 仅一次前向传播）
- GPU 需求：中
- 内存占用：低（无额外粒子）

## 实现建议
- 着色器复杂度：中
- 管线要求：标准深度学习框架（PyTorch）
- 推荐度：✅ 优先研究

---

## 参考链接
- arXiv: https://arxiv.org/abs/2606.10473
- PDF: https://arxiv.org/pdf/2606.10473
- HTML: https://arxiv.org/html/2606.10473v1