# FluidGaussian: Propagating Simulation-Based Uncertainty Toward Functionally-Intelligent 3D Reconstruction

## 论文信息
- **arXiv**: [2603.21356](https://arxiv.org/abs/2603.21356)
- **作者**: Yuqiu Liu 等
- **提交时间**: 2026-03-22 (v1), 2026-03-27 (v2)
- **会议**: CVPR 2026
- **代码**: https://github.com/delta-lab-ai/FluidGaussian

## 核心创新

### 问题
- 现有 3D 重建方法（NeRF/Mip-NeRF 360/DrivAerNet++）主要优化视觉保真度
- 使用光度损失，在表征空间推理不确定性
- **忽略身体接触和耦合**，将功能关键区域与装饰混淆
- 导致物理不合理交互

### 方法：FluidGaussian
将几何重建与**流体-结构相互作用**紧密耦合，评估表面质量高粒度

#### 关键技术
1. **Simulation-based Uncertainty Metric**
   - 基于流体模拟的不确定性度量
   - 与主动学习集成
   - 优先考虑能同时提升视觉和物理保真度的视角

2. **流体-结构耦合评估**
   - 空气动力学/水动力学表面功能识别
   - 体素接触检测
   - 物理 plausibility 评估

### 评估数据集
- NeRF Synthetic (Blender)
- Mip-NeRF 360
- DrivAerNet++

## 实验结果
- **+8.6%** 视觉 PSNR 提升
- **-62.3%** 流体模拟中速度散度降低
- 证明物理感知重建有效性

## 评估维度

### 渲染方法
- 类型：神经渲染 + 流体评估
- 技术：NeRF/Mip-NeRF + 流体 SPH 模拟

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐ (CVPR 2026)
- 风格化支持：否

### 性能预期
- 帧率：离线（重建任务）
- GPU 需求：高
- 内存占用：高

### 创新程度
- ✅ **创新**：首次将流体模拟不确定性引入 3D 重建主动学习

## 实现建议
- 着色器复杂度：高（需要 SPH 流体模拟）
- 管线要求：神经渲染 + 物理模拟联合
- 推荐度：✅ 推荐（流体-结构交互评估方向）

## 标签
#神经渲染 #流体-结构交互 #3D重建 #主动学习 #NeRF #SPH #不确定性评估
