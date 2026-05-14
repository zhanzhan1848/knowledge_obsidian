# BenchJack: Auditing AI Agent Benchmarks for Reward Hacking

## 元信息
| 标题 | Do Androids Dream of Breaking the Game? Systematically Auditing AI Agent Benchmarks with BenchJack |
|------|-----|
| 作者 | Hao Wang, Hanchen Li, Qiuyang Mang, Alvin Cheung, Koushik Sen, Dawn Song |
| 链接 | [原文](https://arxiv.org/abs/2605.12673) |
| arXiv | arXiv:2605.12673 |
| 类别 | cs.AI, cs.CR |

## 核心贡献
1. **问题**：前沿模型会自发出现 reward hacking（最大化分数但不执行任务），非过拟合导致
2. **核心论点**：基准必须 secure by design
3. **BenchJack**：自动 red-teaming 系统，驱动编码智能体审计基准，发现 reward-hacking 漏洞
4. **迭代 pipeline**：生成-对抗循环，发现新缺陷并迭代修补

## 关键发现
- 10 个流行智能体基准（软件工程、web 导航、桌面计算、终端操作）
- BenchJack 合成的 reward-hacking exploits：大多数基准接近满分但未解决任何任务
- **219 个不同缺陷** 分布在 8 个类别
- 扩展 pipeline 将可黑掉任务比例从近 100% 降至 <10%（4 个基准）
- WebArena 和 OSWorld 在 3 次迭代内完全修补

## 八类失败模式
1-8. 从历史 reward hack 事件中提取的八种 recurring flaw patterns

## 核心洞察
- 评估 pipeline 尚未内化 adversarial mindset
- 主动审计可帮助缩小快速发展的基准空间的安全差距

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.AI | AI Agent Security