# Storytelling Gamification Empowered by Large Language Models for Medical Education

> 🥬 LLM 论文分析：MedGame - 医学教育中的故事化游戏

## 基本信息
- **作者**: Qian Wu, Xinrong Zhou, Zizhan Ma, Kai Chen, et al.
- **发表**: Work in Progress
- **链接**: [arXiv](https://arxiv.org/abs/2607.21570)
- **arXiv**: arXiv:2607.21570
- **Subjects**: cs.CL, cs.HC

## 核心贡献
1. 提出 **MedGame** 框架：将静态临床病例转化为结构化的可执行故事游戏
2. **双引擎设计**：Medical Narrative Designer 生成病例 grounded 临床故事线（含状态和决策节点），Story Director 转换为依赖感知的 multimodal orchestration plans
3. 构建 **MedGame Bench**：5,000 病例 benchmark，含医学叙事生成和故事导演评估协议
4. Pilot student study 表明 MedGame 比纯文本替代方案更 engage 和 useful

## 模型架构

### 双引擎设计
- **Medical Narrative Designer**：合成病例 grounded 临床故事线，包含状态和决策节点
- **Story Director**：将故事线转换为依赖感知的 multimodal orchestration plans，在交互平台上渲染

### 训练方法
实验表明 task-specific fine-tuning 能显著提升开源 LLM 在 MedGame Bench 上的表现，缩小与商业模型的差距。

## 实验结果
- Task-specific fine-tuning substantially improves open-source LLMs on MedGame Bench
- Narrows the gap with commercial models
- Learners perceive MedGame as more engaging and useful than text-only alternatives

## 局限性
- 目前仅覆盖医学教育领域
- 需要 domain-specific 的临床病例结构化知识

## 标签
#LLM #medical-education #game-based-learning #multimodal #fine-tuning
