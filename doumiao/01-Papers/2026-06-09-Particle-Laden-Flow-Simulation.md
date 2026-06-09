# Simulations of Particle-Laden Flows with Large Dispersed-Phase Size Disparities Using Highly Scalable Parallel Adaptive Methods

> 日期: 2026-06-09
> 来源: arXiv (arXiv:2605.20565)
> 搜索关键词: particle system, particle-laden flow, MPI, parallel computing, CFD

---

## 基本信息
- **arXiv ID:** 2605.20565
- **作者:** Linfeng Jiang et al.
- **领域:** 粒子系统 / 计算流体动力学

---

## 核心创新

### 研究问题
- 大尺寸差异分散相的粒子负载流
- 需要捕捉气泡-粒子相互作用
- 同质各向同性湍流中的多相流模拟

### 技术方案
1. **高度可扩展并行自适应方法**
   - MPI 并行化
   - 自适应网格

2. **浸入边界法 (Immersed Boundary Method)**
   - 圆柱表面用 357 个拉格朗日标记表示
   - 内部拉格朗日点分布在圆柱体积内

3. **曳力模型 (Drag Model)**
   - 捕捉流体-粒子相互作用

### 技术细节
- **方法:** 粒子负载流模拟、大规模并行计算
- **物理:** 气泡-粒子相互作用、曳力模型
- **应用:** 颗粒-气泡碰撞效率、湍流多相流

### 关键发现
- 在静止流中，准确捕捉水动力拦截机制
- 再现了碰撞效率标度律（与粒子-气泡尺寸比的平方成正比）
- 成功应用于完全解析的气泡与惯性点粒子在均匀各向同性湍流中的相互作用

---

## URL
https://arxiv.org/abs/2605.20565

---

## 关键词标签
#particle-system #particle-laden-flow #parallel-computing #CFD #immersed-boundary #drag-model