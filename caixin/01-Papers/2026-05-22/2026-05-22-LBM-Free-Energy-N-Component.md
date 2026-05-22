# N-Component Free Energy Lattice Boltzmann Method with Reduction Consistency and Global Momentum Conservation

## Metadata
- **arXiv ID**: [2605.22214](https://arxiv.org/abs/2605.22214)
- **Submitted**: Thu, 21 May 2026
- **Author**: Michael Rennick
- **Journal**: Accepted to Journal of Chemical Physics
- **Subjects**: physics.flu-dyn

## 核心创新点

### 方法特点
1. **任意N组分** - 可模拟任意数量不混溶组分流体系统
2. **Reduction Consistency** - 确保缺失的流体组分不会自发萌生
3. **全局动量守恒** - 表面张力离散化严格保证动量守恒到机器精度
4. **Flux Correction** - 通过与 mobility 无关的通量修正强制 reduction consistency

### 技术细节
- **表面张力处理**: 新型离散格式实现全局动量守恒
- **验证算例**: 液滴透镜、Janus 液滴、四元相分离、六组分层状 Poiseuille 流

### 关键公式
新型表面张力力的离散化确保：
$$\sum \mathbf{F}_{surface} = 0$$
全局动量守恒

## 应用场景
- 多相流模拟
- 液滴生成与聚并
- 微流控乳液生成
- 图案化液面

## 可行性分析：多相流 LBM

### 控制方程
自由能泛函方法，相场方程 + Cahn-Hilliard 方程

### 数值方法
- **LBM 框架**: 多组分可混溶/不混溶流体
- **离散化**: D2Q9/D3Q19 晶格
- **稳定性**: 取决于 mobility 参数

### 计算成本
- 中等网格需求
- 并行性好
- 适合多相流界面追踪

### 推荐结论
✅ **强烈推荐实现** - Reduction consistency 是多相流 LBM 的重要进步

---
**标签**: #LBM #multiphase #free-energy #reduction-consistency #momentum-conservation