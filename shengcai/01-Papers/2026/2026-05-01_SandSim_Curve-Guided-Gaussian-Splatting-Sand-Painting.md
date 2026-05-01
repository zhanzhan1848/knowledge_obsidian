---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [gaussian-splatting, process-reconstruction, rendering, simulation]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.27572
---

# SandSim: Curve-Guided Gaussian Splatting for Reconstructing Sand Painting Processes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SandSim: Curve-Guided Gaussian Splatting for Reconstructing Sand Painting Processes |
| **作者** | Yilin Wang (et al.) |
| **发表** | arXiv cs.GR, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.27572) |
| **DOI** | 10.48550/arXiv.2604.27572 |

---

## 核心贡献

> 从单张图像重建沙画创作过程，提出 curve-guided Gaussian representation：stroke 表示为沿连续轨迹的各向异性高斯基元序列，配合减法合成模拟光衰减，实现时序连贯的沙画过程重建。

1. **Curve-Guided Gaussian 表示**：stroke 建模为沿连续轨迹的各向异性高斯基元序列，光滑核捕获沙粒边界
2. **减法合成方案 (Subtractive Compositing)**：模拟沙堆叠时光衰减效果
3. **语义引导规划模块**：场景分解 + 绘制顺序推断
4. **联合优化**：stroke 几何与外观联合优化，可集成物理模拟器

---

## 技术方案

### 核心问题

沙画是过程驱动艺术，从单张图像重建创作过程需要建模连贯 stroke 结构和材质依赖效果。现有 stroke-based 优化和 diffusion 视频合成缺乏结构性一致性和材质一致性。

### 方法

- **Curve-Guided Gaussian**: stroke = 沿轨迹的各向异性高斯序列
  - 光滑核捕获沙 stroke 软边界
  - 支撑连贯 stroke 形成
- **Subtractive Compositing**: 光衰减模拟
- **Semantic-Guided Planning**: 场景分解 + 绘制顺序
- **物理模拟器集成**: 可做 interactive sand dynamics 和 editing

---

## 实验结论

- **任务**: 从单图重建沙画过程
- **基线**: stroke-based optimization, diffusion-based video synthesis
- **结果**: temporal coherent + visually realistic，时序连贯性和感知保真度均优于基线

---

## 局限性

- 专门针对沙画材质，效果可能不适配其他艺术形式
- 物理模拟器集成可能增加计算复杂度

---

## 实现建议

- **实现难度**: 中-高（Gaussian Splatting + 自定义 stroke 模型）
- **预期性能**: 生成质量好，与物理模拟集成后可交互
- **适用场景**: 数字艺术创作、过程动画、材质渲染研究
- **可借鉴点**: curve-guided 各向异性高斯的思想可用于其他 stroke-based 渲染任务

---

## 相关工作

- [[Gaussian Splatting]]
- [[Stroke-Based Rendering]]
- [[Artistic Process Reconstruction]]
- [[Neural Rendering]]
