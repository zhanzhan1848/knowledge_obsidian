# 2604.21797: Turbulent mixing of hydrogen jet in crossflow — DNS/LES/RANS 模型评估

## 论文信息
- **arXiv ID**: 2604.21797v1
- **作者**: Yiqing Wang, Chao Xu, Riccardo Scarcelli, Ben Cantrell, Jon Anders, Sameera Wijeyakulasuriya
- **发表日期**: 2026-04-23
- **分类**: physics.flu-dyn
- **链接**: https://arxiv.org/abs/2604.21797
- **DOI**: 10.48550/arXiv.2604.21797

## 研究背景
氢气燃料直喷 (PFI) 发动机中，氢气射流与空气横流 (JICF) 的混合过程对燃料-空气预混程度至关重要，直接影响发动机性能和排放。

### 密度比特征
- H2 密度远小于空气，密度比 << 1
- 物理属性（密度、粘度、扩散系数）是局部 H2 浓度的函数
- H2 高扩散性导致 H2 稀薄区域分子 Schmidt 数非常小

## 核心研究目标
1. 生成高分辨率、充分解析的 DNS 数据集（H2 射流与空气横流）
2. 用 DNS 数据评估 RANS 和 LES 方法中的湍流和混合模型

## DNS 配置
- **代码**: Nek5000 (谱元法 CFD 代码)
- **网格**: 268,000 谱元，7th order 多项式 → 约 9300 万网格点
- **壁面处理**: y+ < 1
- **时间积分**: 半隐式二阶向后差分 + OIFS (可变时间步 CFL up to 2)
- **计算成本**: 每个 FTT 约 36 小时 (4096 CPUs, AMD EPYC 7713)

## LES/RANS 配置
- **代码**: CONVERGE CFD v4.0 (有限体积法)
- **LES**: Dynamic Structure 模型
- **RANS**: RNG k-ε 模型

## 关键发现

### LES 性能
- 出色预测平均速度和 Reynolds stress
- 与 DNS 的 H2 混合预测高度一致

### RANS 问题
- 显著低估所有 Reynolds stress 分量
- 严重低估 H2 混合过程

### 根因分析 (从 DNS 数据提取)
1. RANS 中使用的湍流扩散率远小于 DNS 推导值
2. 原因：湍流 Schmidt 数 (Sct) 被过度预测 + 湍流粘度被低估
3. RANS 假设各向同性湍流扩散率在当前配置下不成立

### 关键公式
- **梯度扩散假设 (GDH)**:
  ```
  ū_i'C' = -Dt ∂C̄/∂x_i
  Dt = νt / Sct
  ```
- 典型 Sct 范围 0.7-1.0，但 JICF 问题中倾向于低估混合，推荐值 0.2-0.3

## 关键结论
1. LES 准确预测氢气横流射流中的湍流和混合
2. RANS 表现不佳源于湍流输运属性的综合误差
3. 各向同性湍流扩散假设在 JICF 配置中失效

## 可行性分析
🥢 可行性分析：氢气射流横流湍流混合 DNS/LES/RANS 评估

## 控制方程
- 可压缩 NS 方程 (质量、动量、能量)
- 物种传输方程 (H2 混合)
- 状态方程：密度、粘度随局部浓度变化

## 数值方法
- 离散化：DNS (谱元法) / LES (有限体积) / RANS (有限体积)
- 稳定性：DNS 高分辨率，LES/RANS 工业级

## 计算成本
- DNS: ~93M 网格点，4096 CPU × 36h/FTT
- LES: 远低于 DNS，但高于 RANS
- RANS: 最低，适合工业迭代设计

## 推荐结论
✅ 推荐 LES / ⚠️ RANS 需改进模型

DNS 数据集为 H2 发动机 CFD 提供了独特基准。LES 可作为 RANS 改进的基准。

## 标签
#hydrogen #JICF #DNS #LES #RANS #turbulent-mixing #hydrogen-engine #CFD