# SIGGRAPH 2026 流体渲染相关 Best Papers

## 📅 收集日期: 2026-06-16

---

## 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**奖项**: SIGGRAPH 2026 Best Paper  
**作者**: Doug James, Ethan James  
**方向**: 流体渲染 / 2D流体模拟

### 核心创新
- **技术**: Sharp 2D fluid brushes + GPU加速解析方法
- **方法**: 基于圆柱尖钉（cylindrical tines）势流的推导
- **特点**: 
  - 渐进式（progressive）
  - 分辨率无关（resolution-independent）
  - 无网格、无中间重采样
  - 实时、任意分辨率流体混合与渲染
  - 极低的数值耗散（negligible numerical dissipation）

### 技术细节
```
Mixwell evaluates drift per sample without grids or intermediate resampling
→ Real-time, arbitrary-resolution fluid mixing and rendering
```

### 渲染方法
- 类型: 体积渲染 / 粒子渲染
- 技术: 流体笔刷 + 解析方法
- 特点: Sharp边界（清晰流体边缘）

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化支持: 是（流体笔刷可调节）

### 性能预期
- 帧率: 实时
- GPU需求: GPU加速
- 内存占用: 低（无网格）

### 实现建议
- 着色器复杂度: 中
- 管线要求: GPU计算管线
- 推荐度: ✅

### 链接
- Session: https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

---

## 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**奖项**: SIGGRAPH 2026 Honorable Mention  
**作者**: Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey  
**方向**: 流体模拟 / 自由表面 / 两相流

### 核心创新
- **技术**: Spatiotemporal FLIP
- **突破**: 支持超大时间步长的自由表面和两相模拟
- **优势**: 
  - 大时间步长稳定性
  - 快速自由表面模拟
  - 两相流支持

### 技术框架
```
Fast VEM Fluid Simulation
     ↓
Spatiotemporal FLIP
     ↓
Very Large Time Steps
     ↓
Free-Surface + Two-Phase
```

### 模拟方法
- 类型: 粒子模拟 / FLIP (Fluid-Implicit Particle)
- 技术: 时空FLIP + VEM (Virtual Element Method)

### 性能预期
- 帧率: 高（相比传统方法）
- 时间步长: 超大
- 稳定性: 优秀

### 实现建议
- 着色器复杂度: 高
- 管线要求: 高级流体模拟管线
- 推荐度: ✅

### 链接
- 来源: Physics-Based Animation Blog

---

## 📊 总结

| 论文 | 奖项 | 类型 | 实时性 | 推荐度 |
|------|------|------|--------|--------|
| Mixwell | Best Paper | 流体渲染 | ✅ 实时 | ✅ |
| Spatiotemporal FLIP | Honorable Mention | 流体模拟 | ⚠️ 接近实时 | ✅ |

### 趋势分析
1. **流体笔刷技术**: 分辨率无关的实时流体渲染
2. **大时间步长模拟**: 提升流体模拟效率
3. **GPU加速解析方法**: 替代传统网格方法

---

*笔记来源: [SIGGRAPH 2026 Technical Papers Awards](https://blog.siggraph.org/2026/05/siggraph-2026-technical-papers-awards-best-papers-honorable-mentions-and-test-of-time.html/)*
