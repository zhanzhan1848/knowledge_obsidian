---
type: paper
created: 2026-10-21
updated: 2026-10-21
tags: [paper, geometry-processing, point-cloud, denoising, test-time-adaptation, contrastive-learning, domain-generalization, cs.GR, CAD]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.27410
arxiv_id: 2610.27410v1
---

# Test-time Adaptation for Point Cloud Denoising under Unseen Noise

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Test-time Adaptation for Point Cloud Denoising under Unseen Noise |
| **作者** | Kun Jiang, Shida Fu, Fanhao Yi, Weiqing Li, Zhiyong Su |
| **发表** | arXiv 2026-10-20 · **Computer-Aided Design, 203: 104182, 2027** |
| **链接** | [原文](https://arxiv.org/abs/2610.27410) · [HTML](https://arxiv.org/html/2610.27410v1) |
| **DOI** | [10.1016/j.cad.2026.104182](https://doi.org/10.1016/j.cad.2026.104182) |
| **代码** | 论文未给出（截至 v1） |

---

## 核心贡献

> 点云去噪模型在真实噪声分布下会崩，本文提出**测试时自适应**框架：无需重训练、无需额外监督，逐样本在线适配到未知噪声。

1. **提出 TTAD（Test-Time Adaptive Denoising）框架**：让已有去噪模型在测试时适配未知噪声模式，**不依赖源数据重训练、不依赖额外监督**。
2. **RDNM（Residual-Driven Noise Modeling）**：通过分析「噪声输入」与「初始模型去噪后的伪干净版本」之间的偏差，估计**样本特定的噪声分布**。
3. **NACA（Noise-Aware Contrastive Adaptation）**：从去噪后的点云构造样本特定的 **noisy–noisier** 测试时训练对，用对比学习在少量适配步内更新模型参数。
4. **扩展到 CTTAD（Continual TTAD）**：面对噪声分布一致的序列测试样本时，做渐进式精化，降低每样本计算成本。

---

## 技术方案

### 核心思想

```
预训练去噪模型 M  +  测试噪声点云 P_noisy
        ↓
RDNM：残差 = P_noisy − M(P_noisy)  →  估计样本特定噪声分布
        ↓
NACA：构造 (P_noisy', P_noisier') 测试时训练对
        ↓
对比学习少量步数更新 M 的参数（每个样本单独适配）
        ↓
输出：适配后的去噪结果
```

### 关键设计

| 模块 | 作用 | 设计要点 |
|------|------|----------|
| **RDNM** | 样本特定噪声建模 | 用模型自身的「伪干净输出」作为伪标签，残差即噪声代理信号 |
| **NACA** | 噪声感知对比适配 | noisy–noisier 对构造是自监督关键：无需真值即可形成对比信号 |
| **CTTAD** | 连续样本复用 | 噪声分布一致时复用上次参数，仅渐进精化 → 摊薄适配成本 |

### 为什么 noisy–noisier 对是关键

真实场景没有 ground-truth 干净点云，但**可以通过人为加噪构造更差的版本**作为负样本，从而建立对比学习信号。这把「无监督测试时适配」变成了可能。

---

## 复杂度分析

| 项 | 说明 |
|----|------|
| **时间** | O(A × batch)，A 为每样本适配步数（论文强调「few adaptation steps」） |
| **空间** | O(|P|)，点云规模级别；适配仅更新网络参数 |
| **额外推理成本** | ⚠️ 每样本需 M(P) 前向 + 适配迭代 → 高于传统推理，但 CTTAD 可摊薄 |

---

## 实现难度评估

| 维度 | 评估 |
|------|------|
| **算法复杂度** | 中。框架本身清晰，但 RDNM 的噪声分布估计是核心难点 |
| **数值稳定性** | ✅ 较好。纯学习式，无线性求解病态问题 |
| **依赖项** | PyTorch；任意点云去噪 backbone（PointNet/PoinTr/SeedFormer 等）即可挂载 |
| **工程成本** | 中高。测试时逐样本适配对批量流水线不友好（串行、显存占用叠加） |

---

## 推荐结论

⚠️ **谨慎评估**

**优势**：思想优雅、可插拔、真实数据收益明确；对 CAD/CAM 场景（几何重建流水线）价值较高（已录用于 CAD 期刊）。

**风险**：
- 测试时逐样本适配 → **批处理吞吐会显著下降**，嵌入式/CAD 内核场景需评估
- 依赖初始模型质量，若 backbone 在该噪声下已失效，RDNM 的伪标签就不可靠 → 退化风险

**实现建议**：
- 先在 CAD 扫描数据上做 POC，验证真实噪声下的增益
- 明确 batch vs. CTTAD 两种模式的吞吐对比
- 作为**后处理可选模块**设计，不改动主去噪链路

---

## 可行性分析

### 算法复杂度
- **时间**：O(A × batch × |P|)，A 小（few steps）时接近单次推理的常数倍
- **空间**：O(|P|) + 网络参数

### 实现难度
- **算法复杂度**：中
- **数值稳定性**：✅ 好
- **依赖项**：PyTorch；任意点云去噪 backbone

### 开源参考
- **对比方法**：PoinTr、SeedFormer、PointNet++ 去噪变体
- **相关工具**：libigl `igl::weld_vertex_distance`、Open3D `remove_statistical_outlier`
- **相关概念**：Test-Time Adaptation (TTA)、SimCLR 式对比学习

---

## 相关笔记

- [[Point-Cloud-Denoising]]
- [[2026-10-20-2610-28598-Neural-Implicit-Energy-LiDAR-Mapping]]
- [[Surface-Reconstruction]]

---
💡 已传递给 @墨鱼丸。