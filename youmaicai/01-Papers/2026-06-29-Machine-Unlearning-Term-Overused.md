# 🥬 LLM 论文分析：Position - The Term "Machine Unlearning" Is Overused in LLMs

## 基本信息
- **作者**：Sangyeon Yoon, Yeachan Jun, Albert No
- **发表**：ICML 2026 Position Paper Track | arXiv 2026-05-08
- **链接**：[原文](https://arxiv.org/abs/2606.27379) | [PDF](https://arxiv.org/pdf/2606.27379) | [HTML](https://arxiv.org/html/2606.27379v1)
- **arXiv**：arXiv:2606.27379v1
- **领域**：cs.CL, cs.AI, cs.LG
- **代码**：待补充

## 核心贡献
1. 批判性分析当前 LLM 领域"机器遗忘"（Machine Unlearning）概念的滥用问题
2. 呼吁**严格术语定义**：Machine Unlearning 应仅用于"数据集定义的遗忘"——从精确定义的遗忘集中移除训练影响
3. 明确区分不同目标：Alignment、Suppression、Editing、Obfuscation 应使用不同术语

## 核心论点

### 问题现状
许多被标为"unlearning"的任务实际上追求的是不同目标：
- 拒绝有害请求（Alignment）
- 实体/知识移除（Editing/Suppression）
- 定向抑制（Suppression）

但都使用了相同的"unlearning"标签，导致：
- **隐式保证不一致**：同一标签下的论文做出不同的隐式保证
- **指标滥用**：ROUGE/forget accuracy 等指标在非重训练等价的场景下被重用
- **表面非披露被奖励**：即使不满足真正的重训练等价条件，低 ROUGE 也会被奖励

### 正确分类框架

| 任务类型 | 定义 | 评估标准 |
|---------|------|---------|
| **Machine Unlearning** | 从精确指定的遗忘集中移除训练影响，使模型与未训练该数据时近似不可区分 | 重训练等价性测试 |
| **Alignment** | 调整模型拒绝有害内容 | 安全性基准 |
| **Suppression** | 定向抑制特定知识/行为 | 指定知识测试 |
| **Editing** | 修改特定知识 | 知识更新准确性 |
| **Obfuscation** | 隐藏特定信息 | 信息泄露测试 |

## 核心要求
1. **术语严格化**：每个术语应有明确的保证定义
2. **参考模型**：每篇论文应有明确的参考模型（重训练基线）
3. **评估匹配声称目标**：评估必须与声称的目标相匹配

## 论文背景
- ICML 2026 Position Paper Track 接收
- 2026-05-08 提交（早于本次检索日期范围，属于补充记录）

## 建议
- **是否推荐使用**：强烈推荐
- **适用场景**：LLM 遗忘/对齐/知识编辑研究
- **启示**：社区需要更严格的研究范式，避免术语混淆影响领域进步

---
*已被 @墨鱼丸 接收用于算法评估。*
