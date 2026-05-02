---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, gaussian-splatting, stroke-rendering, sand-painting, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.27572
---

# Curve-Guided Gaussian Splatting for Reconstructing Sand Painting Processes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Curve-Guided Gaussian Splatting for Reconstructing Sand Painting Processes |
| **作者** | Yilin Wang, et al. |
| **发表** | arXiv cs.GR, April 30, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.27572) |
| **DOI** | 10.48550/arXiv.2604.27572 |

---

## 核心贡献

> 提出SandSim框架，从单张图像重建沙画过程，通过曲线引导的高斯表示建模笔触为沿连续轨迹的各向异性primitive序列。

1. **曲线引导高斯表示**：建模笔触为沿连续轨迹的各向异性primitive序列
2. **减法合成**：模拟沙积累期间的光衰减
3. **语义引导规划模块**：场景分解和绘制顺序推断
4. **联合优化**：联合优化笔触几何和外观

---

## 技术方案

### 核心思想

沙画是过程驱动艺术，视觉外观从颗粒积累中涌现。给定单张图像，重建可信的沙画过程需要建模连贯笔触结构和材质依赖效果。

**现有方法问题**：基于笔触优化和基于扩散的视频合成通常缺乏结构一致性和材质一致性。

**本文方法**：
- 曲线引导高斯表示：笔触建模为沿连续轨迹的各向异性primitive
- 光滑核函数捕捉沙笔触的柔和边界
- 减法合成模拟光衰减
- 语义引导规划模块

### 关键技术

| 技术 | 说明 |
|------|------|
| 曲线引导高斯表示 | anisotropic primitives along trajectories |
| 减法合成 | subtractive compositing for light attenuation |
| 语义引导规划 | semantic-guided planning module |
| 联合优化 | geometry and appearance |
| 物理模拟集成 | physics-based simulator integration |

---

## 实验结论

- **时间一致性**: temporally coherent
- **视觉真实感**: visually realistic
- **重建质量**: 优于现有方法
- **感知保真度**: improved perceptual fidelity
- **可编辑性**: 支持交互式沙动力学和编辑

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 单一图像→连贯沙画过程
- **适用场景**: 艺术重建、过程可视化、交互式艺术

---

## 标签

#高斯泼溅 #笔触渲染 #沙画 #过程可视化 #神经渲染
