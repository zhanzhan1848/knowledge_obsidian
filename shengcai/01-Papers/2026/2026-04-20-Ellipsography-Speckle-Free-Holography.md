---
type: paper
created: 2026-04-20
updated: 2026-04-20
tags: [paper, rendering, holography, display, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.16237
---

# Ellipsography: Single-Shot Speckle-Free Holography via Vectorial Interference Shaping

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ellipsography: Single-Shot Speckle-Free Holography via Vectorial Interference Shaping |
| **作者** | Anzhou Wen, Praneeth Chakravarthula |
| **发表** | arXiv physics.optics/cs.GR, April 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.16237) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.16237 |

---

## 核心贡献

> 通过联合调制光的相位和偏振态，结构化光学干涉从源头抑制散斑，实现近极限散斑抑制

1. **单次曝光散斑抑制**：达到等效于平均百万次传统标量全息图的图像保真度
2. **矢量波模型**：联合相位和偏振调制的完整物理模型
3. **端到端全息图合成算法**：从物理模型到显示的全流程
4. **30dB PSNR**：在真实全息显示器上首次实现高质量重建，较最佳现有技术提升 10dB

---

## 技术方案

### 问题
- 全息显示被视为"终极"显示技术，提供自然深度线索、连续视差和感知真实感
- **关键限制**：散斑噪声（相干光随机干涉的副产物）
- 现有技术（时间复用、平滑相位启发式）需要高速硬件并引入视觉伪影

### 解决方案

#### 1. Vectorial Interference Shaping
- 联合调制光的相位和偏振
- 结构化光学干涉，从源头抑制散斑
- 单次曝光实现，无需时间复用

#### 2. 完整 Pipeline
- 矢量波模型
- 端到端全息图合成算法
- 功能性原型显示

---

## 实验结论

- 在真实全息显示器上实现接近 30dB PSNR
- 较最佳现有技术提升 10dB
- 相当于百万次传统标量全息图平均效果

---

## 局限性

- 需要精确的偏振控制硬件
- 计算复杂度较高
- 原型系统仍在实验室阶段

---

## 实现建议

- **实现难度**：高（涉及复杂光学系统）
- **预期性能**：单次曝光实现极高图像质量
- **适用场景**：AR/VR 显示、全息投影、高端显示技术
- **推荐度**：⭐⭐⭐ 研究价值高，但距离实际渲染应用较远
