# OmniVerifier-C1: Decomposed Graded Verifier for Rule-Governed Generative World Modeling

## 元信息
| 标题 | OmniVerifier-C1: Decomposed Graded Verifier for Rule-Governed Generative World Modeling |
|------|--------------------------------------------------------------------------------------|
| 作者 | Bowei Liu, Xinchen Zhang, Xuhuan Li, Tianlin Zhang, Kaian Jiang, Jingwei Liu, Congyang Zhao, Yifei Qian, Junhong Liu, Zhiheng Li, Yujiu Yang, Yang Cai, Ling Yang |
| 链接 | [原文](https://arxiv.org/abs/2610.22355) |
| arXiv | arXiv:2610.22355 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.CL |
| 会议 | **NeurIPS 2026** |
| 项目 | [GitHub](https://github.com/Cominclip/OmniVerifier) |

## 核心贡献
1. **从二元 True/False verifier 转向 graded pointwise verifier**：把复杂 prompt 自动分解为细粒度子组件，并对每个组件打分（连续信号）
2. **Decoupled RL 训练策略**：联合优化子问题级二元判断 + 全局对齐评分
3. **Rule-governed 生成世界建模**：从"生成图像"扩展到"规则驱动的世界仿真"
4. **理论 + 实证**：理论上证明 pairwise verification 比 pointwise 更准（仅在有 GT 图像时）

## 方法
### Verifier 三层结构
```math
\text{Verifier}(prompt) \rightarrow \{(sub_q_i, score_i)\}
```
- 自动分解：复杂 prompt → 子问题
- 对每个子问题打分（0~1 或有序等级）
- 全局对齐评分作为最终质量信号

### 训练策略
- **子问题级二元判断**：学"细粒度验证能力"
- **全局对齐评分**：用精确局部反馈建立可靠全局信号
- 在 RL 框架下联合训练

## 实验结果
- **Text-to-image 场景**：graded verifier **显著优于** binary verifier
- **Maze / Sudoku 等结构化世界建模任务**：pairwise verification 在有 GT 图像时更准
- **OOD 多模态评估任务**：结构化可解释输出**提升泛化**

## 关键洞察
> "The transition from generative models to structured world-modeling agents critically hinges on the availability of accurate pairwise graded visual verifiers."

- 结构化、可解释的 verifier 输出 → 更易迁移到 OOD 任务
- 通用 RL 框架下，无需专属架构改进即可拿到这些增益

## 相关工作
[[Multimodal-LLMs]] [[Visual-Verifier]] [[World-Models]] [[Reward-Model]] [[RLHF-for-Vision]] [[Generative-World-Modeling]]

## 局限性
- 仅在 maze/sudoku 等规则驱动世界验证
- 实际物理世界（连续、开放域）是否适用待验
- Decomposed sub-question 的生成依赖 prompt 复杂度

## 实践建议
- 当把生成模型当作 agent 用时，graded verifier 是更优的奖励信号
- 在 Rule-governed 环境中是 SOTA
- 可与 [[Process-Reward-Models]] 思路结合：子问题级评估接近 process supervision

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
