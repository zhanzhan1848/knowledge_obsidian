---
tags: [几何, 点云, 时序重建, 植物表型, 去噪]
date: 2026-09-04
source: arXiv cs.CV
---

# SynthCrop4D: Denoising-Aware Temporal Point Cloud Completion for 3D Crop Architecture Recovery

## 核心方法

解决植物 3D 重建中时序补全方法评估数据集缺失的问题。

**贡献：**
1. **SynthCrop4D 数据集**：程序生成的时序植物点云数据集
   - 可控噪声、遮挡、完整几何
   - 用于基准测试重建方法
2. **两阶段管道**：
   - 去噪模块：去除激光扫描点云的结构伪影
   - 时序点云补全：Adaptive Temporal PoinTr 模型
   - 利用 t-1 阶段信息重建 t 阶段

## 性能指标
- SynthCrop4D: Chamfer Distance = 0.0061 (Temporal PoinTr + Mamba-DG)
- Pheno4D 真实数据: F-Score = 0.2080 (Vanilla PoinTr + Mamba-DG)
- 植物高度、冠层宽度、凸包体积等表型性状提取

## 数据集价值
- 填补时序点云补全基准数据集空白
- 支持无噪声/有噪声对比实验

## 相关技术
[[点云补全]], [[时序重建]], [[去噪]], [[植物表型]], [[LiDAR]], [[3D重建]]

## 可行性评估

⚠️ **领域特定，谨慎评估**

- 数据集构建方法可参考
- 时序补全 + 去噪耦合 pipeline 有参考价值
- 但应用场景偏向农业表型

**几何处理共性：**
- 点云去噪方法可迁移
- 时序一致性约束对其他领域有价值
