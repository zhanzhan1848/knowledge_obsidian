# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

## 论文信息
- **arXiv/TOG**: https://doi.org/10.1145/3811312
- **发表**: SIGGRAPH 2026 Best Paper, ACM Transactions on Graphics 45(4), July 2026
- **作者**: Doug L. James (Stanford University), Ethan James
- **项目主页**: https://dougjam.github.io/mixwell-2026/

## 核心创新

### 技术方法
Mixwell 提出了一套基于圆柱势流的 2D 流体笔刷系统：
- **Kelvinlet 速度笔刷**: 源自势流理论 around cylindrical tines，捕捉 cusp 状速度场
- **Maxwell 1869 漂移公式**: GPU 高效评估粒子在无限/有限笔触中的漂移
- **Reverse-Drift Functions (RDFs)**: 位移场编码笔刷插入、运动和移除，类似 SDF 的组合性质
- **周期性组合方案**: 用于复杂 RDF 图案

### 渲染特点
- 无全局求解、无网格、无中间纹理会模糊
- 每样本独立评估 → 真正渐进式混合和渲染
- 极低数值耗散 (negligible numerical dissipation)
- 支持 GLSL/HLSL/OSL/OpenCL 着色器实现
- Houdini 生产集成

## 渲染方法
- **类型**: 2D 表面渲染 / 粒子系统
- **技术**: 势流解析解 + Reverse-Drift Functions

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐ (SIGGRAPH 2026 Best Paper)
- **风格化支持**: 是 (渐进式笔刷系统)

## 性能预期
- **帧率**: 实时 (real-time GLSL/HLSL)
- **GPU 需求**: 中等 (GPU 加速)
- **内存占用**: 低 (无全局网格)

## 实现建议
- **着色器复杂度**: 中 (解析流公式)
- **管线要求**: 独立笔刷 → 组合式 RDF
- **推荐度**: ✅

## 关键公式/代码
```glsl
// Maxwell drift formula (per sample)
vec2 driftVelocity = evaluateMaxwellDrift(samplePos, brushParams);

// Reverse-Drift Function composition
vec2 finalDisplacement = composeRDFs(rdf1, rdf2, rdf3);
```

## 应用场景
- 数字绘画
- 2D 流体艺术创作
- 游戏资产制作
- 电影/视觉特效预览

## 相关链接
- 论文: https://dl.acm.org/doi/10.1145/3811312
- 视频: https://youtu.be/-1Txagqj4N0 (ST-FLIP 视频，非本篇)
- Shadertoy: https://www.shadertoy.com (搜索 Mixwell)

---

tags: #fluid-rendering #2D-fluid #brush-system #potential-flow #SIGGRAPH2026 #best-paper
