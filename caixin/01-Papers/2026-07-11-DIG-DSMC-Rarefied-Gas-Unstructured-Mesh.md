# 2607.08195 - Parallel DIG-Augmented DSMC for Rarefied Gas Flows on Unstructured Meshes

## 论文信息
- **arXiv**: [2607.08195](https://arxiv.org/abs/2607.08195)
- **作者**: Tao Huang, Liyan Luo, Hong Deng, Lei Wu
- **提交日期**: 2026-07-09
- **字数**: 未提供
- **学科**: Computational Physics (physics.comp-ph); Fluid Dynamics (physics.flu-dyn)
- **DOI**: 10.48550/arXiv.2607.08173

## 关键词
- Direct Simulation Monte Carlo (DSMC)
- DIG (Direct Intermittent General synthetic iterative scheme)
- Rarefied gas flows
- Unstructured meshes
- MPI parallel
- Asymptotic-preserving
- Load balancing
- Ghost cells

## 研究背景
DSMC是模拟稀薄气体流的主流随机粒子方法，但在近连续介质区域计算成本过高。DIG方法通过将DSMC与宏观合成方程耦合，提供快速收敛和渐近保持特性。

## 核心创新点
1. **DIG增强DSMC求解器**: 开发了用于三维稀薄气体流模拟的并行DIG增强DSMC求解器
2. **间歇耦合框架**: 在标准DSMC的粒子输运和碰撞算法基础上，构建了随机DSMC模块与确定性宏观合成方程之间的可靠间歇耦合框架
3. **MPI + Ghost Cells**: 采用混合MPI架构配备ghost cells，实现局部粒子跟踪和批量进程间粒子迁移
4. **动态负载均衡**: 集成基于图划分的动态负载均衡策略

## 方法论

### DSMC组件
- 粒子输运
- 碰撞算法

### DIG耦合
- 宏观流数据交换
- 合成迭代方程
- 渐近保持(AP)特性

### 并行架构
- 混合MPI
- Ghost cells用于局部粒子跟踪
- 图划分动态负载均衡

## 验证结果
- 与SPARTA DSMC结果满意一致
- 收敛速度显著加快
- 空间网格数量和统计采样步数大幅减少
- 计算内存和运行时间大幅降低

## 开放科学
- 代码可在GitHub开发者仓库获取

## URL
- Abstract: https://arxiv.org/abs/2607.08195
- PDF: https://arxiv.org/pdf/2607.08195
