---
tags: [渲染, 全息术, 高斯泼溅, 2026, SIGGRAPH-Asia]
date: [[2026-09-12]]
status: 待读
---

# Hologram Representation via Quadratic Phase Gaussian Splatting

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Haolong Wang et al. |
| 发表 | SIGGRAPH Asia 2026 Technical Communications |
| 链接 | [arXiv:2609.11434](https://arxiv.org/abs/2609.11434) |
| PDF | [PDF](https://arxiv.org/pdf/2609.11434) |

## 核心贡献

1. **CVQPG (Complex-Valued Quadratic Phase Gaussian)** — 新型全息表示方法，用 2D 二次相位函数替代标准 2D 高斯表示
2. **可学习曲率参数** — 引入额外可学习参数控制基函数的曲率
3. **性能提升** — RGB +0.19 dB，灰度 +0.33 dB 重建质量提升
4. **频率保持** — 成功保留自然图像的中高频带

## 技术方案

### 核心思想
用复值二次相位高斯函数替代传统 2D Gaussian Splatting 中的 2D 高斯表示，通过调制基元的波前来增强全息重建质量。

### 关键改进
- 引入二次相位函数：$G(x) = e^{i\alpha x^2}$ 形式的相位调制
- 可学习参数控制曲率，实现轻量级增强
- 频域分析验证中高频保留

## 实验结论

| 指标 | 结果 |
|------|------|
| RGB PSNR 提升 | +0.19 dB |
| 灰度 PSNR 提升 | +0.33 dB |
| 参数数量 | 相等 |
| 频率保留 | 中高频带成功保留 |

## 可行性分析

| 维度 | 评估 |
|------|------|
| 实现难度 | 中 |
| 创新性 | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐ |
| 代码可用性 | 待确认 |

## 标签

#全息术 #高斯泼溅 #相位调制 #SIGGRAPH-Asia-2026
