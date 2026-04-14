# Physics-Informed Video Diffusion For Shallow Water Equations

## 论文信息
- **arXiv ID**: 2603.15627v1
- **作者**: Yang Bai et al.
- **发表日期**: 2026-02-24
- **分类**: cs.GR
- **会议**: 2026 IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP)
- **PDF**: https://arxiv.org/pdf/2603.15627v1
- **HTML**: https://arxiv.org/html/2603.15627v1

## 研究领域
- [[水模拟]]
- [[浅水方程]]
- [[视频扩散模型]]
- [[物理信息神经网络]]

## 核心创新点

### 问题
传统流体动力学模拟管线结合数值求解器和渲染，产生高度真实结果但计算成本高昂。基于扩散的生成视频模型提供更快替代方案，但通常忽视物理定律，无法捕捉一致动力学。

### 方法：物理信息视频扩散框架
1. **端到端生成**: 直接将物理约束集成到生成过程中，同时预测物理状态和逼真视频，无需单独渲染步骤
2. **浅水方程**: 基于二维浅水方程和地形 topography 构建
3. **时间相干水流**: 生成时间相干的水流同时保持物理可信度
4. **超越两阶段方法**: 不同于先模拟物理变量再渲染的两阶段方法

### 技术特点
- 在真实感和物理保真度上优于纯数据驱动视频扩散基线
- 生成视频速度显著快于传统模拟+渲染管线

## 渲染方法
- **类型**: 数据驱动 + 物理模拟
- **技术**: 扩散模型 + 浅水方程 (Shallow Water Equations)

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 待定

## 性能预期
- **帧率**: 快于传统模拟+渲染
- **GPU 需求**: 扩散模型推理
- **内存占用**: 待定

## 实现建议
- **着色器复杂度**: 低（神经网络）
- **管线要求**: 扩散模型管线
- **推荐度**: ✅ 物理信息视频生成的有趣方向

## 关键公式
- 浅水方程 (Shallow Water Equations)
- 物理约束集成到扩散过程

## 相关工作
- NeRF
- Video Diffusion Models
- Physics-Informed Neural Networks
- Shallow Water Simulation

## 待深入
- [ ] 了解与传统 SPH 等方法的对比
- [ ] 查看物理保真度的量化评估
