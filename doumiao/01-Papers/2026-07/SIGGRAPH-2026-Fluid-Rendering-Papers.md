# SIGGRAPH 2026 流体渲染论文速览

> 日期: 2026-07-26
> 来源: SIGGRAPH 2026 Technical Papers
> 关键词: fluid simulation, water rendering, FLIP, fluid mixing

---

## 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**奖项**: 🏆 SIGGRAPH 2026 Best Paper

**作者**: Doug L. James (Stanford University), Ethan James (Independent Researcher)

**DOI**: https://doi.org/10.1145/3811312

### 核心创新

- **锐利2D流体画笔**: 提出 sharp 2D fluid brushes 概念
- **GPU加速解析方法**: 基于圆柱齿（cylindrical tines）势流推导
- **渐进式物理混合**: 支持 progressive, resolution-independent 混合
- **无网格重采样**: 评估每个样本的漂移（drift）无需网格或中间重采样
- **实时任意分辨率**: 支持实时、任意分辨率的流体混合和渲染
- **极低数值耗散**: negligible numerical dissipation

### 技术方法

1. **势流解析解**: 从圆柱齿周围的势流推导解析方法
2. **GPU加速**: 利用 GPU 并行计算
3. **无网格采样**: 每个样本独立评估漂移
4. **渐进式混合**: 支持逐步细化

### 渲染技术分类

- **类型**: 表面渲染 / 粒子渲染
- **技术**: 流体画笔、势流解析解
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是

### 性能指标

- **帧率**: 实时
- **分辨率**: 任意分辨率（与网格无关）
- **数值耗散**: 极低

### 应用场景

- 2D 流体艺术创作
- 实时流体混合效果
- 游戏中的流体交互

---

## 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**奖项**: 🎖️ SIGGRAPH 2026 Honorable Mention

**作者**: Bernhard Braun, Rene Winchenbach (TU Munich), Jan Bender (RWTH Aachen), Nils Thuerey (TU Munich)

**DOI**: https://doi.org/10.1145/3811289

### 核心创新

- **时空FLIP扩展**: ST-FLIP 将 FLIP 方法扩展到时空维度
- **4D粒子坐标**: 粒子具有四维时空坐标
- **超大时间步长**: 支持比传统求解器大一个数量级的时间步长
- **多十亿粒子模拟**: 可以在单台工作站上运行多十亿粒子模拟
- **高网格分辨率**: 支持极高的网格分辨率
- **保留表面细节**: 保持详细的表面结构和视觉保真度

### 技术方法

1. **时空粒子采样**: 将粒子视为四维时空中的样本
2. **FLIP方法扩展**: 对标准FLIP、PIC、APIC求解器的轻量级插件
3. **大时间步长**: 时间步长提升高达10倍
4. **多倍加速**: 多十亿粒子模拟实现数倍加速

### 渲染技术分类

- **类型**: 粒子渲染 / 体积渲染
- **技术**: FLIP, PIC, APIC, 自由表面, 两相流
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是

### 性能指标

- **时间步长提升**: 10倍
- **模拟规模**: 多十亿粒子
- **硬件需求**: 单工作站

### 应用场景

- 电影/视觉特效高分辨率预览
- 更多创意迭代
- 生产环境中的大规模流体模拟

---

## 3. Fire as a Service (FaaS) - 机器人仿真中的火焰动力学

**来源**: arXiv:2603.19063 (cross-list cs.GR, cs.RO)

**作者**: Soren Pirk et al.

**arXiv**: https://arxiv.org/abs/2603.19063

### 核心创新

- **异步联合仿真框架**: FaaS 框架增强现有机器人仿真器
- **多组分热力学传热**: 多组分（CO₂、水蒸气等）热力学传热
- **视觉一致的体积烟雾**: 体积烟雾渲染与物理仿真一致
- **双向质量/动量/热量交换**: 基于能量的蒸发模型耦合液体粒子与气体网格
- **实时性能**: 支持人机交互遥操作
- **物理准确的火焰动力学**: 包括真实的羽流行为、热传递和烟雾形成

### 技术方法

1. **多组分燃烧模型**: 物理准确的燃烧反应
2. **体积烟雾渲染**: 体积烟雾与火焰动态一致
3. **能量蒸发模型**: 液固相变
4. **实时仿真**: 双向耦合

### 渲染技术分类

- **类型**: 体积渲染 / 烟雾渲染 / 火焰效果
- **技术**: 体积光、体积烟雾、火焰羽流
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 否

### 应用场景

- 消防机器人仿真
- 火灾场景训练数据生成
- 多模态感知策略学习

---

## 总结

| 论文 | 类型 | 技术亮点 | 适用场景 |
|------|------|----------|----------|
| Mixwell | 2D流体画笔 | GPU解析计算、任意分辨率 | 实时艺术创作 |
| ST-FLIP | 自由表面/两相流 | 10倍大时间步、多十亿粒子 | 电影/特效预览 |
| FaaS | 火焰/烟雾 | 多组分热力学、体积渲染 | 机器人仿真 |

---

## 相关链接

- [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/program/technical-papers/)
- [Mixwell PDF](https://doi.org/10.1145/3811312)
- [ST-FLIP PDF](https://doi.org/10.1145/3811289)
- [FaaS arXiv](https://arxiv.org/abs/2603.19063)
