# Well-posedness of neural turbulence closures and tangent dissipation

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-17
- **类别**: physics.flu-dyn
- **关键词**: neural turbulence closure, well-posedness, tangent dissipation, RANS, eddy viscosity

## 核心创新点

### 1. 神经湍流闭合问题定义
神经湍流闭合定义新边界值问题：
$$R(U) = N(U) + F(U) = 0$$
其中 N 是原始平均流算子，F 是学习到的闭合项

### 2. 全局切耗散的两种后果
对于单调原始算子：
- 正均匀边际保证存在性、唯一性和全局逆灵敏度界
- a posteriori 误差与 a priori 残差的关系

对于一般原始算子：
- 耗散闭合不能恶化切耗散，但不保证唯一性

### 3. 促进切耗散的两种方法
1. **精确积分构造**: 强制非负切扩散，反应无约束
2. **惩罚方法**: 对采样状态的切反应违反进行惩罚

### 4. 数值验证
- Channel flow, Re_τ = 180–5200
- 50 个训练种子/雷诺数案例
- Re_τ = 5200 时，逆灵敏度分别降低约 372× 和 11×

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#neural-turbulence-closure #well-posedness #tangent-dissipation #RANS #eddy-viscosity
