---
title: Learning View-Dependent Splatting Kernels
authors: Huakeng Ding
date: 2026-05-25
source: SIGGRAPH 2026
url: https://arxiv.org/abs/2605.25426
pdf: https://arxiv.org/pdf/2605.25426
tags: [rendering, gaussian-splatting, kernel-learning, SIGGRAPH2026, 2026]
status: unread
---

# Learning View-Dependent Splatting Kernels

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Learning View-Dependent Splatting Kernels |
| 作者 | Huakeng Ding |
| 来源 | SIGGRAPH 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.25426) |
| PDF | [下载](https://arxiv.org/pdf/2605.25426) |

## 核心贡献
1. 提出可微分框架，自动学习 view-dependent 2D kernels
2. 体元基元：边界椭球 + 3D kernel 潜在向量
3. 学习投影网络输出 2D kernel 潜在向量

## 技术方案
### 框架流程
```
边界椭球 + 3D kernel 潜在向量
        ↓
  投影网络
        ↓
  2D kernel 潜在向量
        ↓
  解码器 (马氏距离径向对称 2D kernel)
```

### 关键创新
- 投影网络输入：椭球属性 + 3D kernel 潜在向量
- 解码器输出：椭球投影边界内的径向对称 2D kernel

## 实验结论
- 在标准基准测试上验证有效性
- 在分析和学习 kernel 上均优于 SOTA

## 可行性分析
- 实现难度：中
- 性能预期：提升重建质量和表示效率
- 适用场景：新视角合成、3D 重建

## 相关工作
- [[3D Gaussian Splatting]]
- [[Novel View Synthesis]]

## 笔记
SIGGRAPH 2026 论文，涉及 splatting 技术改进。