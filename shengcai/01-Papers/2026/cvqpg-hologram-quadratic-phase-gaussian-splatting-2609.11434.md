---
title: Hologram Representation via Quadratic Phase Gaussian Splatting
authors: Haolong Wang et al.
date: 2026-09-10
source: SIGGRAPH Asia 2026 Technical Communications
url: https://arxiv.org/abs/2609.11434
pdf: https://arxiv.org/pdf/2609.11434
tags: [rendering, gaussian-splatting, hologram, rendering, 2026, siggraph-asia]
status: unread
---

# Hologram Representation via Quadratic Phase Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Hologram Representation via Quadratic Phase Gaussian Splatting |
| 作者 | Haolong Wang et al. |
| 来源 | SIGGRAPH Asia 2026 Technical Communications |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.11434) |
| PDF | [下载](https://arxiv.org/pdf/2609.11434) |

## 核心贡献
1. 提出 **Complex-Valued Quadratic Phase Gaussian (CVQPG)**：用二维二次相位函数替代标准 2D Gaussian，作为全息表示的基础
2. CVQPG 引入额外的可学习参数控制基函数的曲率
3. 在参数数量相同的条件下，RGB 重建质量提升 **+0.19 dB**，灰度提升 **+0.33 dB**
4. 频域分析表明 CVQPG 成功保留了自然图像的中高频带

## 技术方案

### 核心思想
用二维二次相位函数替代标准 Gaussian Splatting 中的 2D Gaussian 表示：

```math
G_{CVQPG}(x, y) = A \cdot \exp\left( i \cdot (ax^2 + bxy + cy^2) + \text{phase offset} \right)
```

其中 $a, b, c$ 控制曲率（可学习参数）。

### 关键创新
- **二次相位调制**：通过调制基元波前曲率增强全息表示能力
- **轻量级增强**：不增加过多参数，仅通过相位曲率调制实现质量提升
- **高频保留**：频域分析验证了中高频信息的保留

### 实验结果
| 指标 | CVQPG | 对比方法 |
|------|-------|----------|
| RGB PSNR 提升 | +0.19 dB | 相同参数数量 |
| 灰度 PSNR 提升 | +0.33 dB | 相同参数数量 |
| 频率保留 | 中高频保留 | - |

## 局限性
- 全息特定应用，非通用渲染技术
- Technical Communications 论文，方法可能尚在早期阶段

## 可行性分析
- **实现难度**：中。将现有 2D Gaussian Splatting 框架替换为二次相位函数需修改核函数和光栅化过程
- **性能预期**：中等。参数效率提升，渲染成本基本持平
- **适用场景**：全息显示、光场重建、数字全息

## 相关工作
- 2D Gaussian Splatting
- Holographic Display
- Neural Rendering for Displays

## 笔记
> 📝 **参考价值**：SIGGRAPH Asia 2026 Technical Communications，是 Gaussian Splatting 在全息领域的应用扩展。核心贡献是用二次相位函数替代 Gaussian，通过曲率控制增强波前表达能力。适合作为 Gaussian Splatting 变体研究参考。
