# SIGGRAPH 2026 流体渲染论文汇总

> 日期: 2026-07-28
> 来源: CGinterest SIGGRAPH 2026 Technical Papers Showcase
> 关键词: fluid rendering, water rendering, smoke rendering, volume rendering

---

## Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**类型**: Best Paper (SIGGRAPH 2026)
**作者**: Doug James, Ethan James (Stanford University)
**arXiv**: - | **ACM DOI**: https://dl.acm.org/doi/10.1145/3811312
**项目页**: https://dougjam.github.io/mixwell-2026/

### 核心创新
- 基于圆柱势流(potential flow)的解析流体混合方法
- 无需网格或重采样，每样本直接评估漂移
- 任意分辨率实时模拟，数值扩散极小

### 技术细节
- **方法**: 解析流体混合 (无网格)
- **应用**: 绘画工具中的颜料混合
- **特点**: 锐利的混合边界

### 渲染方法
- 类型: 体积/表面
- 技术: 2D流体模拟 + 粒子追踪

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化支持: 是

### 性能预期
- 帧率: 实时
- GPU需求: 中等
- 内存占用: 低

### 推荐度: ✅

---

## Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**类型**: Honorable Mention (SIGGRAPH 2026)
**作者**: Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey (TU Munich / RWTH Aachen)
**项目页**: https://ge.in.tum.de/publications/spatiotemporal-flip/

### 核心创新
- 扩展FLIP (Fluid-Implicit-Particle) 方法
- 支持极大时间步长的稳定自由表面/两相流模拟
- SIGGRAPH 2026 Technical Papers Showcase展示

### 技术细节
- **方法**: 时空FLIP
- **类型**: 自由表面 + 两相流
- **特点**: 大时间步稳定性

### 渲染方法
- 类型: 表面渲染
- 技术: FLIP粒子法

### 性能预期
- 帧率: 高效
- GPU需求: 高端GPU
- 内存占用: 中等

### 推荐度: ✅

---

## Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering

**类型**: Fast Forward Top 10 (SIGGRAPH 2026)
**作者**: Jorge Condor, Nicolai Hermann, Mehmet Ata Yurtsever, Piotr Didyk (USI Lugano)
**arXiv**: https://arxiv.org/abs/2602.05081
**ACM DOI**: https://doi.org/10.1145/3811369

### 核心创新
- Gabor核方向选择性混合的体积密度场
- 连续频率滤波无额外开销
- 随机采样不同频率和方向，加速单/多散射光线遍历

### 技术细节
- **方法**: Gabor Fields
- **类型**: 体积渲染 LOD
- **特点**: 连续频率过滤、层级过渡平滑

### 渲染方法
- 类型: 体积渲染
- 技术: Ray Marching + Gabor Kernel

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化支持: 是

### 性能预期
- 帧率: 高效
- GPU需求: 中等
- 内存占用: 低 (相比voxel网格)

### 推荐度: ✅

---

## Sample Matching for Joint Extinction Gradient Estimation in Differentiable Volume Rendering

**类型**: Honorable Mention (SIGGRAPH 2026)
**作者**: Ruihan Yu, Yu-Chen Wang, Jingwang Ling, Feng Xu, Shuang Zhao
**项目页**: https://auroraryan0301.github.io/samplematching/
**GitHub**: https://github.com/AuroraRyan0301/SampleMatching

### 核心创新
- 微分体积渲染中消散系数(extinction coefficient)梯度低方差估计
- 基于样本匹配(sample matching)的方法
- 无偏估计器 + 实用有偏估计器

### 技术细节
- **方法**: Sample Matching
- **类型**: 微分体积渲染
- **应用**: 神经渲染、Inverse Rendering

### 渲染方法
- 类型: 体积渲染
- 技术: 可微分Ray Marching

### 推荐度: ✅

---

## 相关链接
- SIGGRAPH 2026 Technical Papers Awards: https://blog.siggraph.org/2026/05/siggraph-2026-technical-papers-awards-best-papers-honorable-mentions-and-test-of-time.html/
- CGinterest 汇总页: https://cginterest.com/2026/07/28/siggraph-2026-テクニカルペーパー注目研究をチェック！/

---
*整理: 鸭血 (Doumiao) | 计算机图形学流体渲染专家*
