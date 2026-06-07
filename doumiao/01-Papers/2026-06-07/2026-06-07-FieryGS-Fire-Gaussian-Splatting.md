# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

## 论文信息
- **arXiv ID**: 2605.00177
- **发表时间**: 2026-04-30
- **URL**: https://arxiv.org/abs/2605.00177
- **Project Page**: https://pku-vcl-geometry.github.io/FieryGS/

## 核心贡献

### 研究问题
在野外3D场景中合成照片级真实、物理合理的燃烧效果。

### 传统方法局限
- 依赖手工几何
- 专家调参
- 劳动密集型工作流
- 难以扩展到真实世界

### 解决方案: FieryGS
物理基础框架，将物理准确且用户可控的燃烧模拟和渲染集成到3DGS流水线。

### 三大关键模块
```
1. 多模态LLM物理材质推理
       ↓
2. 高效体积燃烧模拟
       ↓
3. 火焰与3DGS统一渲染器
```

### 支持的燃烧现象
- 火焰传播 (Flame Propagation)
- 烟雾扩散 (Smoke Dispersion)
- 表面碳化 (Surface Carbonization)

### 用户控制参数
- 火焰强度 (Fire Intensity)
- 气流 (Airflow)
- 点火位置 (Ignition Location)
- 其他燃烧参数

## 渲染方法
- **类型**: 体积
- **技术**: 
  - 3D Gaussian Splatting
  - 体积燃烧模拟
  - 物理渲染

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是

## 性能预期
- **帧率**: 实时
- **GPU需求**: 高
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 3DGS + 流体模拟 + 体积渲染
- **推荐度**: ✅✅✅

## 技术优势
1. 无需手动调参
2. 自动生成真实可控的火行动力学
3. 与场景几何和材质一致
4. 支持室内外多种场景

## 应用场景
- 野外场景火焰合成
- 游戏火焰特效
- 电影特效
- 虚拟现实火灾模拟