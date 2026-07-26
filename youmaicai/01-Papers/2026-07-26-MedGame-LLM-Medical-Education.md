# MedGame: Storytelling Gamification Empowered by Large Language Models for Medical Education

## 元信息
| 标题 | MedGame: Storytelling Gamification Empowered by Large Language Models for Medical Education |
|------|------|
| 作者 | Qian Wu, Xinrong Zhou, Zizhan Ma, Kai Chen, Zheyao Gao, Xun Lin, Hongqiu Wu, Longfei Gou, Yixiao Liu, Ann Sin Nga Lau, Qi Dou |
| 链接 | [原文](https://arxiv.org/abs/2607.21570) |
| arXiv | arXiv:2607.21570 |
| 领域 | cs.CL, cs.HC |

## 核心贡献
1. **MedGame 框架**：将静态临床案例转化为结构化、可执行的叙事游戏
2. **双引擎设计**：
   - Medical Narrative Designer：合成基于案例的临床故事线，包含状态和决策节点
   - Story Director：转换为依赖感知的的多模态编排计划
3. **MedGame Bench**：5,000案例基准测试，用于医学叙事生成和故事方向评估
4. 实验表明任务特定微调显著提升开源LLM在MedGame Bench上的表现

## 模型架构
- **双引擎架构**：
  - Narrative Designer：合成临床故事线
  - Story Director：多模态编排计划

## 训练方法
- 任务特定微调（task-specific fine-tuning）
- 多模态协同编排

## 实验结果
- 任务特定微调提升开源LLM表现
- 缩小与商业模型的差距
- 学生研究显示MedGame比纯文本替代方案更具吸引力和实用性

## 局限性
- 仍在探索阶段（Work in Progress）
- 主要聚焦医学教育场景

## 相关工作
- LLM在医学教育中的应用
- 游戏化学习
- 叙事驱动教育系统

## 标签
#LLM #医学教育 #游戏化 #叙事生成 #多模态 #fine-tuning
