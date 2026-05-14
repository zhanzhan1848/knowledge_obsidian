# REVELIO: Revealing Interpretable Failure Modes of VLMs

## 元信息
| 标题 | Revealing Interpretable Failure Modes of VLMs |
|------|-----|
| 作者 | Isha Chaudhary, Vedaant V Jain, Kavya Sachdeva, Sayan Ranu, Gagandeep Singh |
| 链接 | [原文](https://arxiv.org/abs/2605.12674) |
| arXiv | arXiv:2605.12674 |
| 类别 | cs.AI, cs.LG, cs.RO |

## 核心贡献
1. **框架**：REVELIO，系统性揭示 VLMs 解释性失败模式
2. **失败模式定义**：由可解释的领域相关概念组合构成（如行人距离、恶劣天气），目标 VLM 在其下表现一致错误
3. **搜索策略**：组合空间巨大 → diversity-aware beam search + Gaussian-process Thompson Sampling

## 关键发现
**自动驾驶场景**：
- 模型空间 grounding 弱
- 忽略主要障碍物
- 导致模拟碰撞

**室内机器人场景**：
- 错过安全 hazards 或过度保守
- 误报多，降低操作效率

## 方法亮点
- 可解释的、结构化失败模式 → 可操作洞察，支持针对性 VLM 安全改进
- 覆盖 8 类失败模式，219 个不同缺陷

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.AI | VLM Safety