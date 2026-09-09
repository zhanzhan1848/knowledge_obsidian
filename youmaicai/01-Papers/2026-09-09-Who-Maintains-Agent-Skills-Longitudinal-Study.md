# Who Maintains Agent Skills? A Longitudinal Study of Human-Governed, AI-Assisted Skill Maintenance

## 元信息
| 标题 | Who Maintains Agent Skills? A Longitudinal Study of Human-Governed, AI-Assisted Skill Maintenance |
| 作者 | Chen Shen, Estevam Hruschka |
| 链接 | [原文](https://arxiv.org/abs/2609.05677) |
| arXiv | arXiv:2609.05677 |
| 代码 | N/A（数据、codebooks、mining scripts、replay protocol 均发布） |
| 发表 | 2026-09-09 |

## 核心贡献
1. 首次**直接研究** AI skill artifacts（SKILL.md 等 Markdown 文件）的维护过程，基于 5 个公共 AI-skill 仓库的完整 commit 历史（873 commits, 143 skill files, 254 项实质性编辑）
2. 三个核心发现：
   - 每项实质性编辑均通过**具名人类账户**创作/合并，62% 带 AI co-author trailer
   - 这些编辑是**真正的 curation**：内容改变为主，操作以添加和修正为主
   - 规则相似性（rule-likeness）编码**无法通过可靠性门控**——从 commit artifacts 可靠编码规则相似性仍是开放问题
3. 发布语料库、codebooks、mining scripts 和 replay protocol

## 核心创新点
本文填补了 AI skill curation 研究中"人类维护是未测量瓶颈"这一空白。通过纵向 commit 分析，揭示当前公开 skill 维护实际上是"human-governed, AI-assisted loop"，而非自主pipeline，为未来自动 curation 工具提供必须度量和操作的基准。

## 模型架构 / 方法
- **数据来源**：5 个公共 AI-skill 仓库（ purposive sample of AI-tooling organizations）
  - 时间：2025年10月 - 2026年6月
  - 规模：873 commits, 143 skill files, 254 实质性后创建编辑
- **编码方案**：pre-registered governance / operation / trigger-evidence codebooks
- **审计**：每项编辑经过 audit sample 验证（内容改变为主）

## 实验结果
- 100% 实质性编辑有具名人类作者/合并者
- 62% 带 AI co-author trailer（仓库间差异大）
- 操作类型：dominated by additions and corrections
- Rule-likeness axis：**fails reliability gate**（无法可靠编码）

## 局限性
- 仓库样本有限（5个）
- 仅公共仓库，私有场景未知

## 关键词
#LLM-Agent #Skill维护 #Skill-Curation #SKILL.md #Agent系统 #AI辅助 #人机协作

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
