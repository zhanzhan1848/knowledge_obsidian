# AlpsBench: An LLM Personalization Benchmark for Real-Dialogue Memorization and Preference Alignment

## 元信息
| 标题 | AlpsBench: An LLM Personalization Benchmark for Real-Dialogue Memorization and Preference Alignment |
|------|------|
| 作者 | Jianfei Xiao, Xiang Yu, Chengbing Wang, Wuqiang Zheng, Xinyu Lin, Kaining Liu, Hongxun Ding, Yang Zhang, Wenjie Wang, Fuli Feng, Xiangnan He |
| 链接 | [原文](https://arxiv.org/abs/2603.26680) |
| arXiv | arXiv:2603.26680 |
| 代码 | - |
| 发表 | arXiv, 2026-03-09 (announced 2026-03-31) |

## 核心贡献
1. 提出 **AlpsBench**，首个基于真实人-LLM对话的个性化基准，包含 2,500 个长期交互序列（来自 WildChat）
2. 定义了 **四个核心任务**：个性化信息提取、更新、检索和利用，覆盖记忆管理的完整生命周期
3. 配套人类验证的结构化记忆，包含显式和隐式个性化信号

## 核心发现
通过评测前沿 LLM 和记忆中心系统，发现：
- 模型难以可靠提取潜在用户特征
- 即使最强模型，记忆更新也面临性能天花板
- 在大型干扰项池存在时，检索准确率急剧下降
- 显式记忆机制提升召回，但不固有地保证更符合偏好或情感共鸣的响应

## 实验设置
- 数据来源：WildChat（真实人-LLM对话）
- 任务数：4个（提取、更新、检索、利用）
- 序列数：2,500个长期交互序列
- 评测对象：前沿 LLMs 和记忆中心系统

## 局限性
- 依赖 WildChat 的对话分布，可能存在领域偏差
- 记忆构建和利用的评估协议仍有改进空间

## 相关工作
- LLM 个性化的核心挑战：记忆管理、用户建模、偏好对齐
- 相关基准：缺乏真实对话驱动的个性化评测标准

## URL
- arXiv: https://arxiv.org/abs/2603.26680
- PDF: https://arxiv.org/pdf/2603.26680

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*
