# Sampling More, Getting Less: Calibration is the Diversity Bottleneck in LLMs

## 元信息
| 标题 | Sampling More, Getting Less: Calibration is the Diversity Bottleneck in LLMs |
|------|-------|
| 作者 | Amin Banayeeanzade, Qingchuan Yang, Dhruv Tarsadiya, Fatemeh Bahrani, Leonardo Blas, Alfy Samuel, Robin Jia, Meisam Razaviyayn, Sai Praneeth Karimireddy |
| 链接 | [原文](https://arxiv.org/abs/2605.11128) |
| arXiv | arXiv:2605.11128 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **validity-diversity 框架**：将多样性崩溃归因于 LLM 在解码时如何分配概率质量
2. 识别**两类 miscalibration** 导致多样性崩溃：
   - **Order calibration**: 有效 token 不总是排在无效 token 之前，rank-based cutoff 必须在召回有效续写和接受无效续写之间权衡
   - **Shape calibration**: 概率质量过度集中在少数有效续写上，同时存在混合有效/无效 token 的 heavy-tail

## 理论框架

### Order Calibration
有效 token 不被可靠地排在无效 token 之上，导致 rank-based 截断规则必须 trade-off

### Shape Calibration  
概率质量过度集中于少量有效续写，而混合了有效/无效 token 的 heavy-tail 存在 → 保持高有效性限制了多样性

### 形式化
local failures 在解码步骤中复合，产生强烈的序列级多样性损失

## 实验设置
- 14 个语言模型，跨多个 family 和 scale
- 开发控制诊断：精确已知 valid sets 的任务 + oracle cutoff baselines

## 核心发现
多样性崩溃**不仅是特定采样启发式的局限**，而是 LLM 分布中 order 和 shape miscalibration 的结果

## 关键词
LLM 多样性, 解码策略, Calibration, 采样, 生成质量