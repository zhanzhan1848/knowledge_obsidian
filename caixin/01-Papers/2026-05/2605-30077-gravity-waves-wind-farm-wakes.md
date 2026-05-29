# Gravity Waves and Wind Farm Wakes: Reduced-Order Model

## 论文信息
- **arXiv**: [2605.30077](https://arxiv.org/abs/2605.30077)
- **作者**: Hossein Kafiabad et al.
- **日期**: 2026-05-28
- **分类**: physics.flu-dyn
- **URL**: https://arxiv.org/pdf/2605.30077

## 核心创新点

### 研究背景
- 大规模风电场中重力波和湍流尾流的**双向耦合**建模
- 现有模型难以捕捉这种复杂的流相互作用

### 方法：Reduced-Order Framework

#### 方程推导
1. **线性化**: 非静水布西内斯科方程
2. **边界层近似**: 引入适当的简化
3. **分层流动**: 边界层和上覆分层自由大气分别处理

#### 耦合机制
- **动态边界条件** at capping inversion
- 直接捕获重力波对边界层流动的反馈

#### 数值方法
- **混合谱-有限差分离散化**
- 计算高效
- 保留垂直边界层结构

### 与 LES 对比验证
1. **内部风电场流动**: ✅ 成功重现
2. **大规模重力波效应**: ✅ 成功重现
3. **上游阻塞**: ✅ 捕获 adverse pressure gradients
4. **加速尾流恢复**: ✅ 在农场内和下风处实现

## 物理场景
- 风力发电场空气动力学
- 大气边界层
- 重力波-湍流相互作用

## 关键词
`重力波` `风电场尾流` `边界层` `Reduced-order model` `LES` `Boussinesq` `大气流动`

## 应用场景
- 风电场设计优化
- 大气流动建模
- 可再生能源

## 相关工作
- Large-Eddy Simulation (LES)
- Wind farm aerodynamics
- Atmospheric boundary layer
- Gravity waves in the atmosphere