---
title: Swimm3R: Splatting with Medium-aware SfM for Underwater 3D Reconstruction
authors: (arXiv pending)
date: 2026-08-03
source: arXiv cs.CV (cross-list rendering related)
url: https://arxiv.org/abs/2608.00950
pdf: https://arxiv.org/pdf/2608.00950
tags: [rendering, gaussian splatting, 3D reconstruction, underwater, 2026]
status: unread
---

# Swimm3R: Splatting with Medium-aware SfM for Underwater 3D Reconstruction

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Swimm3R: Splatting with Medium-aware SfM for Underwater 3D Reconstruction |
| 作者 | (arXiv pending) |
| 来源 | arXiv (cross-list) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.00950) |
| PDF | [下载](https://arxiv.com/pdf/2608.00950) |

## 核心贡献
1. 提出 **Swimm3R**：统一框架，结合 medium-aware Structure-from-Motion (SfM) 与 Underwater Beta Splatting
2. **Medium-aware SfM**：将空中几何先验蒸馏到前馈 backbone，物理头部回归水下成像参数
3. **Underwater Beta Splatting**：扩展 Gaussian Splatting，引入 Beta primitives 和散射感知几何梯度
4. 建立 **Barbados 水下视频数据集**：用于验证挑战性散射环境下的方法效果
5. PSNR 提升 **1.47 dB** (vs WaterSplatting)，RRA@15 和 RTA@15 分别提升 2.0% 和 2.4%

## 技术方案

### 问题背景
- 水下 3D 重建面临散射 (scattering) 和衰减 (attenuation) 挑战
- 传统 SfM 在水下失效（缺乏清晰特征）
- 现有方法在挑战性散射条件下效果差

### 核心方法
```
空中先验蒸馏
     ↓
Medium-aware SfM → 相机位姿 + 图像形成参数
     ↓
Underwater Beta Splatting
- Beta primitives（替代 Gaussian）
- 散射感知几何梯度
     ↓
水下场景 3D 重建
```

### Underwater Beta Splatting
- 扩展 3D Gaussian Splatting 框架
- 引入 Beta primitives 建模水下光传输特性
- 散射感知梯度 → 稳定水下几何表示

## 性能指标
| 指标 | 数值 |
|------|------|
| PSNR 提升 | +1.47 dB (vs WaterSplatting) |
| RRA@15 | +2.0 百分点 |
| RTA@15 | +2.4 百分点 |
| 数据集 | Barbados Underwater Video Dataset |

## 实验结论
- 在挑战性散射条件下鲁棒恢复水下场景结构
- 生成相干的海底几何
- 下游定位性能显著提升

## 局限性
- 依赖特定水下环境数据集验证
- Beta primitives 计算开销未知
- 对极端浊度水体的效果待验证

## 可行性分析
- 实现难度：**高**（SfM + 扩展 Gaussian Splatting + 水下物理模型）
- 性能预期：需特定硬件支持，实时性未明确
- 适用场景：水下勘测、海洋考古、海洋机器人导航

## 相关工作
- 3D Gaussian Splatting (Kerbl et al. 2023)
- WaterSplatting (水下 Gaussian Splatting baseline)
- Underwater 3D Reconstruction

## 笔记
Swimm3R 是 Gaussian Splatting 在水下场景的重要扩展。核心创新在于：1) 将空中几何先验迁移到水下；2) Beta primitives 替代 Gaussian 更准确地建模水下散射介质。这展示了 GS 框架的可扩展性——通过修改基元类型和优化目标适配特定物理场景。对渲染领域的启示：光传输介质的建模不仅影响几何重建，也直接影响渲染质量。
