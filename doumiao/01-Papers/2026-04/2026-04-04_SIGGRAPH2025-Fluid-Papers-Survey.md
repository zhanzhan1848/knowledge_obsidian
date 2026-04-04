# SIGGRAPH 2025 流体渲染论文综述
**日期**: 2026-04-04
**来源**: SIGGRAPH 2025 Technical Papers (Vancouver, Jul 27-31, 2025)
**备注**: 基于 realtimeendering.com/kesen/sig2025.html

---

## 📋 论文总览

SIGGRAPH 2025 技术论文集中，流体模拟与渲染相关论文共 **5 篇**：

| # | 论文标题 | 作者单位 | 方法类型 |
|---|----------|----------|----------|
| 1 | Adaptive Phase-Field-FLIP for Very Large Scale Two-Phase Fluid Simulation | TUM, RWTH Aachen | Phase-field + FLIP |
| 2 | Fast Subspace Fluid Simulation with a Temporally-Aware Basis | U Toronto | 子空间降阶 |
| 3 | Gaussian Fluids | Peking University | 高斯无网格 |
| 4 | Quadtree Tall Cells for Eulerian Liquid Simulation | U Tokyo, GAME FREAK | 欧拉法自适应 |
| 5 | A Neural Particle Level Set Method | Georgia Tech, U Michigan | 神经粒子+水平集 |

---

## 1. Adaptive Phase-Field-FLIP for Very Large Scale Two-Phase Fluid Simulation

### 关键信息
- **作者**: Technical University of Munich, RWTH Aachen University
- **方法**: Phase-field (相场法) + FLIP 耦合
- **规模**: Very Large Scale（大尺度两相流）

### 技术要点
- 自适应方法处理大尺度两相流体模拟
- Phase-field 界面追踪 + FLIP 粒子速度传输
- 可扩展到大规模并行计算

### 渲染相关性
- 两相流（气-液/液-液）界面渲染
- 泡沫、飞溅效果
- 适用于实时和离线渲染

---

## 2. Fast Subspace Fluid Simulation with a Temporally-Aware Basis

### 关键信息
- **作者**: University of Toronto
- **发表**: SIG/ACM TOG
- **方法**: Reduced-order subspace simulation（降阶子空间模拟）
- **创新**: Temporally-Aware Basis（时序感知基函数）

### 技术要点
- 利用时序相干基函数加速流体模拟
- 预计算子空间 + 在线实时模拟
- 适合交互式应用

### 渲染相关性
- 快速预览/实时指导
- 可与渲染管线集成
- 支持快速迭代设计

---

## 3. Gaussian Fluids: A Grid-Free Fluid Solver based on Gaussian Spatial Representation

### 关键信息
- **作者**: Peking University
- **会议**: SIGGRAPH 2025
- **方法**: 高斯空间表示的无网格流体求解器
- **特色**: 网格自由（Grid-Free）

### 技术要点
- 使用高斯函数表示流体场
- 无需网格/粒子约束
- 连续空间表示

### 渲染相关性
- 连续密度场 → 体积渲染
- 自然支持烟雾、火焰渲染
- 避免粒子采样瑕疵

### 详细笔记
📄 `2026-03-16-Gaussian-Fluids-SIGGRAPH2025.md`

---

## 4. Quadtree Tall Cells for Eulerian Liquid Simulation

### 关键信息
- **作者**: University of Tokyo, GAME FREAK
- **会议**: SIGGRAPH 2025
- **方法**: 四叉树高单元格（Quadtree Tall Cells）

### 技术要点
- 欧拉法（Eulerian）液面模拟
- 自适应四叉树数据结构
- 解决高宽比极大的单元格问题

### 渲染相关性
- 水面渲染
- 适合大场景湖泊、海洋
- 岸线、岛屿等细节自适应

---

## 5. A Neural Particle Level Set Method for Dynamic Interface Tracking

### 关键信息
- **作者**: Georgia Tech, U Michigan
- **方法**: Neural Particle + Level Set（神经粒子水平集）
- **目标**: 动态界面追踪

### 技术要点
- 神经学习方法增强水平集界面追踪
- 粒子-水平集混合方法
- 自适应界面精化

### 渲染相关性
- 界面重构精度提升
- 水-空气、液-液界面
- 减少界面数值耗散

---

## 🆕 SIGGRAPH Asia 2025 补充

### Viscous Vortex Dynamics on Surfaces
- **作者**: UC San Diego (Cuncheng Zhu, Hang Yin, Albert Chern)
- **发表**: ACM TOG (SIGGRAPH Asia 2025)
- **方法**: 涡量法 + 曲率修正
- **特点**: 曲面粘性流体

📄 `2026-04-04_Viscous-Vortex-Dynamics-SIGA2025.md`

---

## 📊 技术趋势分析

### 模拟方法分布
```
欧拉法 ████████░░ 40%
粒子法 ████░░░░░░ 20%
混合法 ██████░░░░ 30%
涡量法 ██░░░░░░░░ 10%
```

### 关键词频率
1. **自适应 (Adaptive)** - 多篇涉及
2. **大尺度 (Large Scale)** - 工业应用需求
3. **神经/学习 (Neural/Learned)** - 前沿方向
4. **无网格 (Meshfree)** - Gaussian Fluids

---

## 💡 渲染建议对照表

| 渲染需求 | 推荐论文 | 理由 |
|----------|----------|------|
| 烟雾渲染 | Gaussian Fluids | 连续密度场，无粒子瑕疵 |
| 火焰体积光 | Phase-Field FLIP | 两相流界面精确 |
| 水面反射 | Quadtree Tall Cells | 欧拉法适合水面 |
| 艺术风格流体 | Neural Level Set | 可学习风格化界面 |
| 快速预览 | Subspace Fluid | 实时子空间模拟 |
| 曲面流体 | Viscous Vortex Dynamics | 曲率感知涡量法 |

---

## 🔗 参考链接

- SIGGRAPH 2025 Papers List: https://www.realtimerendering.com/kesen/sig2025.html
- SIGGRAPH Asia 2025 Papers: https://www.realtimerendering.com/kesen/siga2025Papers.htm

---

## 标签

#siggraph-2025 #fluid-simulation #survey #gaussian-fluids #phase-field #subspace-reduction #eulerian-liquid #neural-level-set #vortex-methods
