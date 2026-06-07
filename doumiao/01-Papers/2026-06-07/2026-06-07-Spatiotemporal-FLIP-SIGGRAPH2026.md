# Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation

## 论文信息
- **来源**: SIGGRAPH 2026 Honorable Mention
- **作者**: Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey
- **发表时间**: 2026年7月 (SIGGRAPH 2026)
- **URL**: https://s2026.conference-schedule.org/

## 核心贡献

### 技术创新
实现**极长时间步长**的快速自由表面和两相流体模拟。

### 关键技术
1. **Spatiotemporal FLIP方法**
   - 时空域的FLIP (Fluid-Implicit Particle) 改进
   - 支持大步长时间积分

2. **核心特性**
   - 快速模拟 (Fast)
   - 大时间步长 (Very Large Time Steps)
   - 自由表面支持 (Free-Surface)
   - 两相流支持 (Two-Phase)

## 渲染方法
- **类型**: 粒子 / 体积
- **技术**: FLIP粒子模拟 + 自由表面渲染

## 性能预期
- **帧率**: 高
- **GPU需求**: 中等
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 中等
- **管线要求**: FLIP粒子管线
- **推荐度**: ✅✅✅

## 技术优势
1. 比传统FLIP更快的收敛速度
2. 支持更大的时间步长，减少模拟迭代次数
3. 保持自由表面和两相流的物理准确性
4. 适合大规模流体模拟场景

## 应用场景
- 水花/溅泼模拟
- 液体-气体两相流
- 工业流体仿真
- 游戏中的流体特效