# Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

## 论文信息

| 属性 | 值 |
|------|-----|
| 标题 | Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps |
| 作者 | Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey |
| 会议 | SIGGRAPH 2026 (Honorable Mention) |
| arXiv | - |
| 日期 | 2026-06-24 采集 |
| 关键词 | FLIP, free-surface, two-phase, large time steps, fluid simulation |

## 核心创新

### 技术方法
- **Spatiotemporal FLIP**: 时空FLIP方法
- **Very Large Time Steps**: 支持非常大的时间步长
- **Free-Surface Simulation**: 自由表面模拟
- **Two-Phase Simulation**: 两相模拟（气液）

### 关键技术细节
- 解决传统FLIP方法在大家庭时间步下的稳定性问题
- 保持自由表面和两相模拟的准确性
- 大幅提升模拟效率

## 渲染方法

- **类型**: 体积/表面（两相流体）
- **技术**: FLIP粒子+网格方法

## 视觉质量

- **逼真度**: 高（两相流，自由表面）
- **风格化支持**: 否

## 性能预期

- **帧率**: 离线渲染为主
- **GPU 需求**: 高
- **内存占用**: 取决于场景规模

## 实现建议

- **着色器复杂度**: 高
- **管线要求**: 粒子+网格混合管线
- **推荐度**: ✅ 推荐

## 备注

**为何重要**: FLIP方法是流体模拟领域的经典方法，这篇论文通过时空方法扩展，允许更大的时间步长，这对于离线渲染生产具有重要意义，可以大幅减少模拟时间。

**相关背景**: Nils Thuerey是流体模拟领域的知名研究者（德国慕尼黑工业大学），其在MantaFlow开源项目上有重要贡献。
