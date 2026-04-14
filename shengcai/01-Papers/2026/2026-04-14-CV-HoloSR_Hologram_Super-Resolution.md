---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, hologram, super-resolution, volume-upsampling, deep-learning]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.10393
---

# CV-HoloSR: Hologram to Hologram Super-Resolution through Volume-Upsampling 3D Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hologram to hologram super-resolution through volume-upsampling three-dimensional scenes |
| **作者** | Duksu Kim et al. |
| **发表** | arXiv cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.10393) |
| **DOI** | arXiv:2604.10393 |

---

## 核心贡献

> 提出专门设计的复数值全息图超分辨率框架，在体 upsampling 期间保持物理一致的线性深度缩放

1. 提出 CV-HoloSR，复值全息图超分辨率框架
2. 设计复值残差密集网络 (CV-RDN) 用于保真深度缩放
3. 引入深度感知感知重建损失以恢复锐利高频干涉图案
4. 使用复值低秩适应 (LoRA) 参数高效微调策略

---

## 技术方案

### 核心思想

现有全息图超分辨率方法主要关注视角扩展，将其用于体空间 upsampling 会导致严重的二次深度失真，损害 3D 焦准确性。CV-HoloSR 通过复值网络和专门的损失函数解决这个问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| 复值残差密集网络 (CV-RDN) | 保持物理一致的线性深度缩放 |
| 深度感知感知重建损失 | 抑制过度平滑，恢复高频干涉图案 |
| 复值 LoRA | 参数高效微调，仅需 200 样本 |
| 大深度范围数据集 | 分辨率高达 4K |

---

## 实验结论

- **数据集**: 大深度范围数据集，4K 分辨率
- **基线**: State-of-the-art HSR 方法
- **结果**: LPIPS 0.2001，感知真实度提升 32%
- **效率**: 训练时间减少 75% (22.5h → 5.2h)，仅需 200 样本

---

## 局限性

- 需要预训练编码器
- 对极端深度范围可能需要额外适应

---

## 实现建议

- **实现难度**: 中高 (复值网络 + LoRA + 感知损失)
- **适用场景**: 全息显示、体全息打印、3D 全息摄影

---

## 相关工作

- [[Holographic Display]]
- [[Super-Resolution]]
- [[Neural Rendering]]