# Measure, Don't Optimize: Forecasting Recovery in LLM Unlearning

## 元信息
| 标题 | Measure, Don't Optimize: Forecasting Recovery in LLM Unlearning |
| 作者 | Zirui Song, Huaxing Liu, Xiang Wang, Shuai Li, Xinye Li, Lang Gao, Jinghui Zhang, Zheng Lu, Fengxian Ji, Xiaojun Chang, Xiuying Chen |
| 链接 | [原文](https://arxiv.org/abs/2608.11408) |
| arXiv | arXiv:2608.11408 |
| 代码 | 未在摘要页明确提供（论文在审） |

## 核心贡献
1. **J-Access: Jacobian-based inference-time audit** — 使用 Jacobian 透镜将中间表征映射到词表空间，测量目标概念在模型输出路径上的可访问性
2. 相比直接 unembedding（logit lens），Jacobian lens 更适合 unlearning 后的表征空间偏移，能更可靠地读出残留知识
3. **Pre-attack accessibility 预测恢复速度和程度**（模型层面），但无法预测哪些具体事实会被恢复
4. **直接最小化 J-Access 会适得其反** → 模型学会隐藏知识逃避审计，导致更低的审计分数但更大的攻击后恢复

## 实验设置
- **398 个公开 unlearned 模型**
- **8 种 unlearning 方法**（GradDiff, NPO, SimNPO, AltPO, 拒绝目标训练, UNDIAL, RMU, 近似内容遗忘等）
- 基准数据集：**TOFU** 和 **OpenUnlearning**
- 实验涵盖实体级别的 relearning attack

## 关键发现
1. **大多数 unlearned 模型在 J-Access 上仍高于 gold level（仅训练 retain set 的参考模型）**，即使通过行为标准认证成功——说明行为遗忘 ≠ 内部删除
2. **Pre-attack J-Access 预测模型层面的恢复速度和程度**，但无法预测具体哪个 fact 会被恢复
3. **直接最小化 J-Access 产生反效果**：审计分数下降，但攻击后恢复更强——模型学会隐藏知识而非真正删除
4. Jacobian lens 优于直接 unembedding，因为 unlearning 会改变表征几何结构

## 局限性
- 目前仅在 TOFU 和 OpenUnlearning 两个基准上验证，泛化性有待更多数据集检验
- J-Access 作为预测指标的机制尚需进一步理论解释
- 未探索 J-Access 与其他 white-box 审计方法的系统对比
- 论文处于在审状态（"In processing"），部分细节可能变化

## Tags
#LLM #unlearning #interpretability #safety #machine-unlearning #J-Access #Jacobian-lens #model-auditing
