---
tags: [几何, UV参数化, 高斯溅射, 最优传输]
date: 2026-04-21
conference: Eurographics 2026 Short Papers
---

# OT-UVGS: Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 核心方法

OT-UVGS 将 UV 参数化的高斯溅射(UVGS)中的 UV 映射重新解释为**固定 UV 预算下的容量分配问题**。

### 问题背景

现有 UVGS 使用确定性球面投影分配高斯到 UV 位置：
- 忽略全局高斯分布
- 导致许多 UV 槽为空
- 密集区域频繁碰撞

### OT-UVGS 解决方案

1. **一维最优传输映射**：轻量级、可分离
2. **全局耦合分配**：保持原始 UVGS 表示
3. **基于排序的实现**：O(N log N) 复杂度

## 技术特点

- 即插即用：可直接替换球面 UVGS
- 更高的 UV 利用率：
  - 更高的非空槽比例
  - 更少的碰撞
  - 更高的保留下来的高斯比例

## 实验结果 (184 个场景)

| 指标 | 提升 |
|------|------|
| PSNR | 一致改善 |
| SSIM | 一致改善 |
| LPIPS | 一致改善 |

## 与 MeshFlow/SeamGen 的关联

三者都利用最优传输(Optimal Transport)理论：
- MeshFlow：OT 用于流匹配训练目标
- OT-UVGS：OT 用于 UV 映射容量分配
- SeamGen：OT 用于 UV seam 生成

## 开源实现

- arXiv: https://arxiv.org/abs/2604.19127
- DOI: https://doi.org/10.2312/egs.20261023

## 相关笔记

[[SeamGen-UV-Seam-Generation]]
[[UV-Parametrization-Survey]]

## 可行性分析

✅ **推荐实现**

- Eurographics 2026 认可
- O(N log N) 复杂度可扩展
- 可作为 UVGS 的改进组件
