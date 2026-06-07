# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

## 论文信息
- **来源**: SIGGRAPH 2026 Best Paper
- **作者**: Doug James, Ethan James
- **发表时间**: 2026年7月 (SIGGRAPH 2026)
- **URL**: https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

## 核心贡献

### 技术创新
Mixwell 引入了**尖锐的2D流体画笔**概念，结合GPU加速的解析方法实现渐进式、分辨率无关的物理流体混合。

### 关键技术
1. **势流绕圆柱齿理论 (Potential Flow around Cylindrical Tines)**
   - 从势流理论推导而来
   - 每样本评估drift无需网格或中间重采样

2. **核心特性**
   - 实时性能 (real-time)
   - 任意分辨率 (arbitrary-resolution)
   - 极低的数值耗散 (negligible numerical dissipation)
   - 物理基础 (physics-based)

### 渲染方法
- **类型**: 表面渲染 / 粒子
- **技术**: 基于势流的2D流体混合与渲染

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐ (SIGGRAPH Best Paper)
- **风格化支持**: 是

## 性能预期
- **帧率**: 实时
- **GPU需求**: GPU加速
- **内存占用**: 低

## 实现建议
- **着色器复杂度**: 中等
- **管线要求**: GPU计算管线
- **推荐度**: ✅✅✅

## 关键技术公式
Mixwell使用势流理论评估drift：
$$V = \frac{\Gamma}{2\pi}\frac{\vec{r} \times \hat{z}}{|\vec{r}|^2}$$

## 创新点
1. 首次实现尖锐的2D流体画笔
2. 无网格依赖的解析方法
3. 渐进式混合控制
4. 任意分辨率下的物理一致性

## 应用场景
- 数字艺术创作
- 交互式流体模拟
- 实时流体渲染
- 游戏引擎流体特效