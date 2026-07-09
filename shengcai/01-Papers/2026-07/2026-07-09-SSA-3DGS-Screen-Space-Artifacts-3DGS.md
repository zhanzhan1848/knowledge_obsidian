---
tags: [渲染, 3DGS,  artifacts, 论文, 2026]
date: [[2026-07-09]]
status: 已读
---

# SSA-3DGS: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Kristof Overdulve |
| 链接 | [arXiv](https://arxiv.org/abs/2607.05598) |
| 发表 | arXiv cs.GR (2026-07-06) |

## 核心贡献

1. **问题定义**：Novel View Synthesis (NVS) 方法（如 3DGS）依赖干净、多视角一致的带姿态输入图像。现实世界捕获常违反该假设，产生 screen-space artifacts（静态遮挡，固定在2D图像平面而非3D世界）

2. **核心方法**：提出 SSA-3DGS，无监督框架，联合优化 3D 场景和可学习的 2D 叠加层，恢复干净 3D 场景和腐败伪影

3. **创新点**：利用几何一致性跨视角将静态伪影与 3D 场景几何分离，无需监督或人工输入

## 技术方案

### 问题
- 物理传感器缺陷、环境遮挡（雨/泥）、捕获遮挡（手指/仪表盘）、数字叠加（水印/UI）
- 被错误烘焙为"floaters"或近相机伪影，降低新视角渲染质量

### 方法
- 联合优化 3D 场景 + 可学习 2D overlay
- 利用跨视图几何一致性
- 无需监督或手动输入

### 实验结论
- 在多样化合成腐败和自捕获真实世界数据集上
- 比在相同腐败输入上训练的 3DGS 提升高达 **9 dB PSNR**
- 同时忠实地保留腐败伪影

## 链接

- PDF: https://arxiv.org/pdf/2607.05598
- HTML: https://arxiv.org/html/2607.05598v1
