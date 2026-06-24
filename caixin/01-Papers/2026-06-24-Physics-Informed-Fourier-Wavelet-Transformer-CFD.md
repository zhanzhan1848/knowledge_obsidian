---
type: paper
created: 2026-06-24
updated: 2026-06-24
tags: [paper, CFD, surrogate-model, PINN, transformer, physics-informed, neural-network]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.24696
---

# A Physics-Informed Fourier-Wavelet Transformer for Multiscale Computational Fluid Dynamics Surrogate Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Physics-Informed Fourier-Wavelet Transformer for Multiscale Computational Fluid Dynamics Surrogate Modeling |
| **作者** | Somyajit Chakraborty et al. (Shanghai Jiao Tong University) |
| **发表** | arXiv physics.flu-dyn / cs.LG |
| **链接** | [原文](https://arxiv.org/abs/2606.24696) |
| **DOI** | 10.48550/arXiv.2606.24696 |
| **代码** | N/A |

---

## 核心贡献

> 提出一种结合傅里叶-小波混合谱编码和物理偏置自注意力的Transformer，用于多尺度CFD代理建模

1. **混合谱编码**: 结合Fourier和Wavelet变换处理全局模式和局部多尺度结构
2. **物理偏置自注意力**: 基于PDE残差诊断的物理信息自注意力机制
3. **自监督预训练**: 通过掩码物理预测（Masked Physics Prediction）和方程一致性预测进行预训练
4. **SOTA性能**: 圆柱尾流基准测试中NMSE=0.05875, Pearson=0.97019

---

## 技术方案

### 核心思想

传统PINN和神经算子方法难以同时捕获全局流动模式和局部多尺度结构。该研究提出一种物理信息傅里叶-小波Transformer，结合：
- 混合Fourier-Wavelet谱编码器
- 物理偏置自注意力（PDE残差诊断）
- 自监督预训练策略

### 关键技术

| 技术 | 说明 |
|------|------|
| Fourier谱编码 | 捕获全局、长程流动结构 |
| Wavelet变换 | 捕获局部、多尺度特征 |
| 物理偏置注意力 | PDE残差引导的注意力权重 |
| 掩码物理预测 | 自监督预训练策略 |
| 方程一致性预测 | 确保PDE物理约束 |

### 网络架构

```
输入 → Fourier-Wavelet 混合编码 → 物理偏置Transformer → 物理一致性损失 → 输出
                                    ↑
                              PDE残差监督
```

---

## 公式

### 物理信息损失函数

```math
L_{total} = L_{data} + \lambda_{PDE} L_{PDE} + \lambda_{phys} L_{phys}
```

其中:
- $L_{data}$: 数据重建损失
- $L_{PDE}$: Navier-Stokes方程残差损失
- $L_{phys}$: 物理解析性约束损失

### 性能指标

**圆柱尾流基准:**
- NMSE: 0.05875
- Pearson相关系数: 0.97019

**流固耦合基准:**
- NMSE: $2.70 \times 10^{-4}$ (vs 基线 $4.02 \times 10^{-4}$)

---

## 实验结论

- **基准**: 圆柱尾流、流固耦合基准
- **基线**: FNO, Transformer, PINN, 算子学习方法
- **结果**: 在局部尾流结构（近体、尾核、远尾流）重建上优于所有基线方法
- **优势**: 保持精度-计算成本权衡实用性

---

## 局限性

- 对高Reynolds数湍流的泛化能力待验证
- 需要进一步评估在不同几何形状上的迁移能力

---

## 相关工作

- Fourier Neural Operator (FNO)
- PINNs / PINNsFormer
- PITT (Physics-Informed Transformer)
- 神经算子学习方法

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ (需要Transformer+PDE知识)
- **适用场景**: 实时CFD预测、参数扫描、不确定性量化
- **预期性能**: 对中等复杂度流动可实现~97%相关系数
