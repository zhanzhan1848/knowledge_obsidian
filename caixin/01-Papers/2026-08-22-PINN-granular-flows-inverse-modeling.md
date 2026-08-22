# Physics-Informed Neural Network for Inverse Modeling of Granular Flows

## Metadata
- **arXiv**: [2608.18641](https://arxiv.org/abs/2608.18641)
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **Authors**: Bidan Zhao
- **Date**: Wed, 19 Aug 2026
- **PDF**: [arxiv.org/pdf/2608.18641](https://arxiv.org/pdf/2608.18641)

## 核心创新点

### 问题背景
颗粒流广泛存在于自然和工业系统中，其复杂动力学难以表征。**逆问题**（未知入口/出口/壁面边界条件）尤其困难，传统 CFD 模拟面临挑战。

### 核心方法
**Physics-Informed Neural Network (PINN) 框架**

从稀疏观测重建管道中颗粒流的**稳态全场分布**。

### 技术要素
1. **稀疏测量数据 + 控制方程 + 本构关系** 联合驱动
2. **无量纲损失 formulation**：提升训练稳定性
3. **Physics-informed 初始化**：改善收敛
4. **动态全局加权**：平衡数据/物理损失
5. **局部加权颗粒温度 data-loss 策略**：捕捉非均匀性

### 训练数据
- CFD 高保真解（连续介质模型）生成的大规模数据集
- 稀疏测量注入物理约束

## 物理模型

### 颗粒流控制方程
- 质量守恒
- 动量守恒（颗粒相）
- 本构关系：颗粒温度（granular temperature）方程

### 颗粒温度
描述颗粒速度涨落的标量：
```
T_granular = <c'^2> / 3
```
类比分子运动论中的温度。

## 方法框架

### PINN 架构
```
输入：空间坐标 (x, y, z)，物理参数
    ↓
神经网络 → 速度场 (u, v, w)，压力 P，颗粒温度 T
    ↓
损失 = 数据损失 + 物理损失(控制方程) + 本构损失
    ↓
优化：梯度下降
```

### 关键技巧
- **无量纲化**：使网络对尺度不敏感
- **动态加权**：解决 stiffness（方程不同项尺度差异）
- **颗粒温度加权**：局部细节保留

## 逆问题应用

### 边界条件重建
- 入口速度分布未知
- 壁面滑移条件未知
- 出口压力分布未知

### 优势
- 无需完整边界条件
- 从稀疏点测量推断全场
- 物理一致性强

## 🥢 可行性分析：颗粒流 PINN 逆建模

## 控制方程
- 颗粒流质量/动量方程（连续介质）
- 颗粒温度输运方程
- 本构模型：摩擦/碰撞法向/切向应力

## 数值方法
- **PINN**：自动微分 + 梯度优化
- **训练数据**：CFD 生成（稳态）
- **评估指标**：全场 L2 误差 vs CFD 参考

## 计算成本
- 离线 CFD 数据生成成本高
- PINN 训练：GPU 小时级别
- 在线推理：毫秒级查询

## 推荐结论
✅ 推荐实现（复杂颗粒系统的快速代理/反演工具）

## 应用场景
- 工业颗粒流监控
- 管道阻塞诊断
- 流化床设计
- 颗粒输送优化

## 相关研究
- 关联：[[Granular-flow]] · [[PINN]] · [[Inverse-problems]] · [[Particle-flow]]
- 标签: #granular-flow #PINN #inverse-modeling #sparse-data #neural-network

---
*💡 由 菜心 自动抓取于 2026-08-22*
