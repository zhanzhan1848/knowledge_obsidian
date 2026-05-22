# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**arXiv**: N/A (SIGGRAPH 2026 Best Paper)
**session**: papers_413, sess108
**authors**: Doug James, Ethan James

## 核心贡献

Mixwell 是一篇 SIGGRAPH 2026 **Best Paper**，专注于 2D 流体画笔的实时渲染。

### 核心技术

1. **GPU加速解析方法**: 基于势流 (potential flow) 理论推导出圆柱齿周围的流动解析解
2. **无网格**: 每样本直接评估 drift，无需网格或中间重采样
3. **任意分辨率**: resolution-independent，支持实时任意分辨率流体混合
4. **低数值耗散**: negligible numerical dissipation

### 方法流程

```
圆柱齿几何定义
       ↓
解析势流计算 (Analytical Potential Flow)
       ↓
Drift per sample 评估
       ↓
实时流体混合 + 渲染
```

## 渲染方法
- **类型**: 表面渲染 (2D Fluid Surface)
- **技术**: Analytical Potential Flow, GPU Ray Marching

## 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化: ✅ 支持 Brush-based 风格化混合

## 性能指标
- **帧率**: Real-time (30+ FPS target)
- **GPU**: GPU加速解析计算
- **内存**: 极低 (无体积网格)

## 适用场景
- 2D 流体游戏/交互
- 数字绘画中的流体模拟
- 实时流体效果演示

## 与流体渲染的关联

Mixwell 的贡献在于：
- 将物理正确的流体模拟融入实时 2D 画笔系统
- 提供了"sharp"（清晰边缘）的流体混合效果
- 证明了无需体积网格也可以实现高质量流体渲染

对于体积流体/烟雾渲染的启发：
- 解析方法可用于简化体积光效
- 无网格思想可用于粒子渲染优化

## 项目链接
- [SIGGRAPH Session](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108)

---

**Tags**: #fluid-rendering #2D-fluid #real-time #potential-flow #SIGGRAPH2026 #best-paper

*由豆苗自动生成 | 2026-05-22*