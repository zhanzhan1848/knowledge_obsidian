---
tags: [daily-report, rendering-papers, 2026-03]
date: 2026-03-24
---

# 每日渲染论文报告 - 2026-03-24

## 概览
- **日期**: 2026-03-24 (周二)
- **arXiv cs.GR 新论文**: 12篇
- **重点关注**: 6篇
- **来源**: arXiv cs.GR

## 重点论文摘要

### 1. 🌟 FreeArtGS - 关节物体 Gaussian Splatting
**arXiv**: [2603.22102](https://arxiv.org/abs/2603.22102)  
**会议**: CVPR 2026  
**创新**: 
- 提出 "free-moving scenario" 设置
- 单目 RGB-D 输入即可重建关节物体
- 端到端优化纹理、几何和关节角度

**渲染相关性**: ⭐⭐⭐⭐⭐  
**实现优先级**: 高  
**笔记**: [[2026-03-24-FreeArtGS]]

---

### 2. 🌟 RefracGS - 折射水面 Gaussian Splatting
**arXiv**: [2603.21695](https://arxiv.org/abs/2603.21695)  
**创新**: 
- 神经高度场 + 3D Gaussian 场联合建模
- 物理准确的 Snell 定律折射计算
- 15x 训练加速 + 200 FPS 实时渲染

**渲染相关性**: ⭐⭐⭐⭐⭐  
**实现优先级**: 高  
**笔记**: [[2026-03-24-RefracGS]]

---

### 3. 🌟 FRoG - 可变形 3D Gaussian Splatting
**arXiv**: [2603.20857](https://arxiv.org/abs/2603.20857)  
**创新**: 
- Per-Gaussian Embedding
- 深度和误差引导采样
- 解决稀疏初始化和暗场景问题

**渲染相关性**: ⭐⭐⭐⭐⭐  
**实现优先级**: 高  
**笔记**: [[2026-03-24-FRoG]]

---

### 4. 🌟 STAC - 流式 3D 重建缓存压缩
**arXiv**: [2603.20284](https://arxiv.org/abs/2603.20284)  
**会议**: CVPR 2026  
**创新**: 
- 时空感知的缓存压缩
- 10x 内存减少 + 4x 推理加速
- 即插即用设计

**渲染相关性**: ⭐⭐⭐⭐  
**实现优先级**: 高  
**笔记**: [[2026-03-24-STAC]]

---

### 5. 🌟 SURF - 快速视频生成
**arXiv**: [2603.21002](https://arxiv.org/abs/2603.21002)  
**创新**: 
- Noise Reshifting 无训练加速技术
- 两阶段框架（预览 + 精化）
- 12.5x 加速（Wan 2.1）

**渲染相关性**: ⭐⭐⭐  
**实现优先级**: 中  
**笔记**: [[2026-03-24-SURF]]

---

### 6. 📷 Nevis Digital Twin - 摄影测量与 VR
**arXiv**: [2603.20560](https://arxiv.org/abs/2603.20560)  
**会议**: IEEE VR 2026 Workshop  
**创新**: 
- Mesh vs 3DGS 重建对比
- 历史遗址数字保存工作流
- VR 沉浸式可视化

**渲染相关性**: ⭐⭐⭐  
**实现优先级**: 低  
**笔记**: [[2026-03-24-Nevis-Digital-Twin]]

## 技术趋势分析

### 1. 3D Gaussian Splatting 持续火热
- **3篇重点论文**均基于 3DGS
- 扩展方向：
  - 动态场景（FRoG）
  - 折射场景（RefracGS）
  - 关节物体（FreeArtGS）

### 2. 实时性优化成为重点
- 所有论文都强调实时性能
- 优化策略：
  - 缓存压缩（STAC）
  - 两阶段生成（SURF）
  - 早期融合（FRoG）

### 3. 物理准确性提升
- RefracGS 使用 Snell 定律
- FreeArtGS 准确建模关节运动
- 从近似走向物理准确

## 推荐行动

### 立即关注
1. **FreeArtGS**: 关节物体渲染 - 实用价值高
2. **RefracGS**: 折射渲染 - 技术突破
3. **FRoG**: 动态场景 - 解决鲁棒性问题

### 中期规划
1. **STAC**: 流式重建优化
2. **SURF**: 生成式渲染加速

### 建议传递给 @墨鱼丸
- FreeArtGS 的 3DGS 关节建模
- RefracGS 的折射光线追踪
- FRoG 的变形场优化

## 其他论文
以下论文与渲染关系较小，未创建详细笔记：
- MineRobot (机器人运动学)
- UNITE (扩散模型训练)
- GeoFusion-CAD (CAD 设计)
- Deraining Adaptation (图像去雨)
- GraphiContact (人体接触预测)
- XR Healthcare (医疗应用)

---
#日报 #渲染论文 #2026-03
