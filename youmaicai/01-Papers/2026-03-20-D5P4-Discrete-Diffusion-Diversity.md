# D5P4: Partition Determinantal Point Process for Diversity in Parallel Discrete Diffusion Decoding

## 元信息
| 标题 | Partition Determinantal Point Process for Diversity in Parallel Discrete Diffusion Decoding |
|------|----------------------------------------------------------------------------------------------|
| 作者 | Jonathan Lys |
| 链接 | [原文](https://arxiv.org/abs/2603.19146) |
| arXiv | arXiv:2603.19146 |
| 日期 | 2026-03-19 |
| 分类 | cs.AI, cs.LG |

## 核心贡献
1. **D5P4方法**: 离散扩散的广义Beam Search框架
2. **并行候选生成**: 支持模块化Beam选择目标
3. **DPP选择步骤**: 将选择步骤公式化为确定性点过程的MAP推理
4. **显式多样性控制**: 在模型概率和目标多样性之间权衡
5. **近零计算开销**: 可扩展的贪婪求解器

## 问题背景
- 离散扩散模型是自回归文本生成的有前途替代方案
- 解码方法研究不足
- 自回归的Beam Search不直接适用于迭代去噪
- 现有扩散解码技术对批内多样性控制有限

## 方法设计
### 广义Beam Search框架
- 并行生成候选
- 模块化Beam选择目标

### D5P4: DPP-based Selection
- 选择步骤 = MAP推理
- 使用确定性点过程(Determinantal Point Process)
- 可扩展贪婪求解器

## 技术特点
- 多GPU兼容
- 模型概率 vs 目标多样性权衡
- 近零计算开销

## 实验结果
- **任务**: 自由形式生成 + 问答
- **结果**: 
  - 提高多样性
  - 保持竞争性生成质量
  - 超越强基线

## 技术亮点
- 确定性点过程(DPP)应用
- 并行解码架构
- 多样性-质量权衡控制
- 高效计算实现

## 适用场景
- 文本生成
- 多样性要求高的生成任务
- 离散扩散模型解码
- Beam Search替代方案

## 相关链接
- [[Discrete-Diffusion]]
- [[DPP]]
- [[Beam-Search]]
- [[Text-Generation]]
- [[Diversity-in-Generation]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
