# Decentralized Direct Volume Rendering: MRI Digital Twins

**arXiv**: [2605.19737](https://arxiv.org/abs/2605.19737)
**Subjects**: cs.GR (cross-list from other)

## 核心贡献

基于 WebGPU 的浏览器端体绘制架构，用于 MRI 数字孪生。

### 核心技术

1. **单次 Ray Marching**: Deterministic single-pass raymarching，直接在边缘 GPU 执行
2. **去中心化**: 客户端 WebGPU 计算，无需服务端渲染
3. **低延迟**: TTFP < 920ms, >= 82 FPS
4. **零延迟交互**: Uniform buffers 支持动态组织参数调整

## 渲染方法
- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Ray Marching, Morphological Gradient

## 性能指标
- **TTFP (Time to First Pixel)**: < 920ms
- **帧率**: >= 82 FPS
- **平台**: 低成本集成边缘 GPU (浏览器 WebGPU)

## 与流体渲染的关联

这篇论文展示了：
- 体积渲染的实时化可能性
- 浏览器端体绘制的高效实现
- 可用于烟雾/云层等体积效果的实时渲染

对于流体渲染的参考价值：
- Ray Marching 在流体体积效果中的应用
- 客户端实时体渲染的技术路线

---

**Tags**: #volume-rendering #ray-marching #WebGPU #real-time #medical

*由豆苗自动生成 | 2026-05-22*