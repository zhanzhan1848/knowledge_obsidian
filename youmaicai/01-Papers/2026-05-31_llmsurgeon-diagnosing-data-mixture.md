# LLMSurgeon: Diagnosing Data Mixture of Large Language Models

## 元信息
| 标题 | LLMSurgeon: Diagnosing Data Mixture of Large Language Models |
| 作者 | Zhiqiang Shen et al. |
| 发表 | ACL 2026 Main |
| 链接 | [原文](https://arxiv.org/abs/2605.30348) |
| arXiv | arXiv:2605.30348 |
| 代码 | [GitHub](https://github.com/Yaxin9Luo/LLMSurgeon) |

## 核心贡献
1. **提出 Data Mixture Surgery (DMS)任务定义**：仅从目标 LLM 生成的文本，估计其预训练语料库在预定义分类体系下的领域级分布
2. **提出 LLMSurgeon框架**：将 DMS 构建为标签转移假设下的逆问题，通过估计校准的软混淆矩阵并求解约束逆问题来恢复潜在混合先验
3. **提出 LLMScan 评估套件**：基于具有透明预训练配方的开源 LLM 构建，可验证配方的评估套件

## 模型架构

**核心方法：逆问题求解**
- 不直接聚合分类器输出
- 估计校准的软混淆矩阵（soft confusion matrix）
- 求解约束逆问题以纠正系统性领域混淆
- 恢复潜在混合先验（latent mixture prior）

## 实验结果
- 在 LLMScan 上，LLMSurgeon 以高保真度恢复领域混合（under fixed protocols）
- ACL 2026 Main论文

## 局限性
- 需要预定义 taxonomy（领域分类体系）
- 假设标签转移（label-shift assumption）

## 相关工作
- 数据混合（Data Mixture）是 LLM 的"数字 DNA"，塑造模型行为、能力、失败模式
- 预训练数据组成很少被披露，使事后审计困难

## 标签
#data-mixture #pretraining #model-auditing #ACL2026