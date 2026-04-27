---
tags: [几何, 参数化, UV映射, 高斯泼溅, Eurographics2026]
---

# OT-UVGS: UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 论文信息

| 属性 | 值 |
|------|-----|
| arXiv | [2604.19127](https://arxiv.org/abs/2604.19127) |
| 分类 | cs.GR |
| 日期 | 2026-04-21 |
| 作者 | Byunghyun Kim |
| 来源 | **Eurographics 2026 Short Papers** |

## 核心方法

### 问题定义
UV-parameterized Gaussian Splatting (UVGS) 将非结构化3D高斯映射到规则UV张量，现有方法使用确定性球面投影分配高斯到UV位置，导致：
- 许多UV槽为空
- 密集区域频繁冲突

### 核心思想：OT-UVGS
将UV映射重新解释为**固定UV预算下的容量分配问题**

```
O(N log N) 最优传输启发式映射
├─ 基于排序的一维映射
├─ 全局耦合分配
└─ 保留原始UVGS表示
```

### 关键创新
1. **轻量级**：可作为球面UVGS的即插即用替代
2. **最优传输启发**：全局耦合分配而非局部投影
3. **O(N log N) 复杂度**

## 实验结果
- 184个物体中心场景 + Mip-NeRF 数据集
- PSNR、SSIM、LPIPS 一致改善
- UV利用率显著提高（更多非空槽、更少冲突、更高高斯保留率）

## 开源实现
- 暂无（Eurographics 2026 Short Paper）

## 相关笔记
[[参数化, UV映射]]

## 评估

### ✅ 推荐结论
**推荐实现** — Eurographics 2026 Short Paper，方法简洁有效。

### 实现难度
- **算法复杂度**：低（O(N log N)，基于排序）
- **数值稳定性**：稳定
- **依赖项**：基本数据结构

### 应用场景
- 3D Gaussian Splatting 压缩
- UV映射优化
- 实时渲染
