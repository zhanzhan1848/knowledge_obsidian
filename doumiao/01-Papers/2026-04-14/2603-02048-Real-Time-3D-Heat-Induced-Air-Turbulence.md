# Real-Time 3D Simulation of Heat-Induced Air Turbulence

## 论文信息
- **arXiv ID**: 2603.02048v1
- **作者**: Wanqi Yuan et al.
- **发表日期**: 2026-03-02
- **分类**: cs.GR
- **PDF**: https://arxiv.org/pdf/2603.02048v1
- **HTML**: https://arxiv.org/html/2603.02048v1

## 研究领域
- [[空气湍流]]
- [[折射渲染]]
- [[SPH]]
- [[体积渲染]]
- [[实时渲染]]

## 核心创新点

### 问题
热感应空气湍流产生复杂、深度依赖的图像畸变，在交互式再现方面具有挑战性，因为热驱动流动必须与折射光传输耦合。现有的实时方法通常依赖单视图 2D 屏幕空间扭曲，破坏多视图一致性，不建模 3D 折射体积。

### 方法：实时全 3D 拉格朗日框架
1. **完整管线建模**: 从热传输到密度变化到光学折射的完整 3D 拉格朗日框架
2. **可压缩 SPH + 温度传输**: 增强可压缩光滑粒子流体动力学（SPH），包含温度传输、浮力和压力驱动运动，捕捉上升羽流和湍流混合
3. **曲线光线追踪**: 通过曲线光线追踪渲染连续的折射率场，建模 3D 光弯曲
4. **空间自适应步长积分**: 在强折射率梯度附近精细化步长，在平滑区域放松步长

### 技术特点
- 交互速率（约 40 fps）
- 深度依赖、多视图一致的畸变
- 与真实视频捕捉匹配

## 渲染方法
- **类型**: 体积渲染 + 折射
- **技术**: Compressible SPH + Temperature Transport + Curved Ray Tracing

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 待定

## 性能预期
- **帧率**: ~40 fps (交互式)
- **GPU 需求**: 中等
- **内存占用**: 待定

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: SPH 仿真 + 曲线光线追踪
- **推荐度**: ✅ 热感应空气湍流实时渲染的优秀方案

## 关键技术
- 可压缩 SPH (Compressible Smoothed Particle Hydrodynamics)
- 温度传输 (Temperature Transport)
- 浮力 (Buoyancy)
- 曲线光线追踪 (Curved Ray Tracing)
- 空间自适应步长 (Spatially Adaptive Step-size)

## 相关工作
- SPH (Smoothed Particle Hydrodynamics)
- Volume Rendering
- Refractive Index Field
- Air Turbulence Simulation

## 待深入
- [ ] 获取完整性能数据
- [ ] 查看与传统方法的对比
