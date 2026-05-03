---
tags: [avatar, relighting, 扩散模型, 渲染]
created: 2026-05-03
---

# D-Rex: Diffusion Rendering for Relightable Expressive Avatars

## 论文信息
- **arXiv**: [2604.27871](https://arxiv.org/abs/2604.27871)
- **会议**: (from MPI)
- **作者**: Xilong Zhou
- **项目页**: https://vcai.mpi-inf.mpg.de/projects/DRex/

## 核心方法

### 问题定义
现有可重光照全身avatar方法依赖于显式3D固有分解与解析反射模型，需要精确的几何配准和仔细的优化才能捕获真实光传输效果。这种relighting与avatar建模的紧密耦合阻碍了表达性——据所知，没有现有方法同时展示强大的面部动画和重光照。

### 核心思想
将relighting完全与avatar建模解耦，作为图像空间后处理：
- 从平面光照、反照率类渲染到目标HDR照明的学习翻译
- 利用预训练视频扩散relighting模型的强生成先验
- 通过LoRA在光 stage捕获的成对平光和重光帧上微调

### 方法流程
1. 平光驱动帧由独立表达性全身avatar框架生成（白光照条件下训练）
2. 无需修改即可支持relighting
3. 可直接应用于任何白光照avatar系统

## 创新点
- 解耦relighting与avatar建模
- 保留表达性运动和细粒度面部细节
- 视图和时间一致性重光照

## 实现难度
- **算法复杂度**：高
- **依赖项**：视频扩散模型、光 stage数据

## 推荐结论
⚠️ **谨慎评估** - 主要为渲染/avatar方向，与核心几何处理有一定距离

## 传递意见
关注其几何表示与渲染解耦的思想，可能对几何处理管线有启发。