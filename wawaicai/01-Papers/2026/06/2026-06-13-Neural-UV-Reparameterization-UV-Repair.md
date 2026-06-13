---
title: "Continuous Neural Reparameterization as a Deep Geometric Prior for Robust Fixed-Chart UV Repair"
authors:
  - Mohammad Sadegh Salehi
date: 2026-06-08
tags: [几何, 参数化, UV展开, 神经参数化, SIREN]
cite: "arXiv:2606.10050 [cs.GR]"
url: "https://arxiv.org/abs/2606.10050"
github: "https://github.com/01C-Amara/NeuralUVAtlas"
---

# Continuous Neural Reparameterization as a Deep Geometric Prior for Robust Fixed-Chart UV Repair

## 核心方法

将固定 chart 的 UV 展开问题重新表述为**连续神经参数化 (Continuous Neural Reparameterization)** 问题：

1. **未训练 SIREN 网络**作为 UV 映射函数：`φ_θ(v_i) = f_θ(x_i)`
2. **输入特征**：归一化 3D 位置 + Laplace-Beltrami 特征（k=16 个非平凡特征函数）
3. **激活函数**：sin(ω₀·Wℓhℓ + bℓ)，ω₀=15，5 层，隐藏宽度 256

### 关键创新

- **Tutte 嵌入热启动**：先拟合有效的 Tutte 嵌入，再优化扭曲目标
- **C² 行列式扩展**：对 det J ≤ ε_J 使用二阶泰勒扩展处理奇异性
- **注入性屏障**：指数衰减权重 α(s) 从 10¹⁰ → 0.1
- **有效性检查重试/回退路由**：无效时恢复状态、降低学习率或标记为回退 chart

### 损失函数

$$
\mathcal{L}(\theta) = \widetilde{E}_{SD}(\phi_\theta) + \alpha(s) \sum_{t \in T}[\epsilon - \det J_t]_+^2
$$

其中 $E_{SD} = \sum_{t \in T} A_t (\|J_t\|_F^2 + \|J_t^{-1}\|_F^2)$，即 **Symmetric Dirichlet 能量**

## 算法流程 (Algorithm 1)

```
输入: Disk-like chart M=(V,T), spectral rank k, iterations N
1: 构建特征 x_i = [p̃_i ‖ ψ̃₁:k(v_i)]
2: 预计算局部框架、面积、ΔC_t^{-1}
3: 计算 Tutte 嵌入（凸边界）
4: SIREN 初始化为零残差头，pretrain 到 u^Tutte
5: for s=1 to N do
6:   预测 UV，组装 J_t = ΔU_t ΔC_t^{-1}
7:   使用 C² 扩展计算 q(d)
8:   最小化带注入性屏障的损失
9:   保存状态，执行 Adam step
10:  若有三角形翻转 → 恢复状态 + 重试
12: end for
14: 返回零翻转 UVs 或标记回退
```

## 实验结果

- **Thingi10K/xatlas-cut benchmark**: 42/47 stratified solves 零翻转
- **Amara Spatial 生成网格**: 25 资产集，1000/1000 零 UV 翻转
- **对比**：
  - BFF/OptCuts：recutting 可更快更低扭曲，但受限于改变 seam 拓扑
  - SLIM：Hand/Camel 上 1000 iter 可达零翻转（但 Bob 三组件失败）
  - **仅本方法在所有 compact chart 上零翻转**

## 核心创新点

1. **NTK-LBO 诊断**：证明谱条件化改变了更新几何（尤其在初始化和中秩子空间），但本身不能预测 chart 成功
2. **验证优先的 atlas 构建**：validation-first atlas construction for generated meshes
3. **SIREN 作为几何先验**：非学习方法，利用架构和特征提供有用先验

## 算法复杂度

- 时间：每 chart 5000 Adam iterations（~6s 快速通道）
- 空间：O(V) 顶点 + 预计算 LBO 特征 O(V)

## 实现依赖

- **libigl 2.6.2**：LSCM, ARAP, SLIM 基线
- **Blender 4.0.2**：生成网格基线
- **PyTorch**：神经网络求解器
- **Rust atlas**：大规模验证

## 可行性评估

✅ **强烈推荐实现**

| 维度 | 评分 |
|------|------|
| 算法创新性 | 高（神经 UV 展开 + 注入性保证） |
| 工程可行性 | 高（已有开源代码） |
| 数值稳定性 | 高（C² 扩展 + 屏障） |
| 与现有系统集成 | 高（可作为 xatlas 的后处理） |

### libigl 参考函数
- `parameterization.h`：LSCM, ARAP, SLIM
- `cotmatrix`, `massmatrix`：LBO 特征计算

### 潜在应用
- UV 修复流水线（生成网格的后处理）
- 验证优先的 atlas 构建
- 注入性敏感的纹理映射