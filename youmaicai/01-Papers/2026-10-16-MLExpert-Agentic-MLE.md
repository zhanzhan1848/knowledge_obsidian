# MLExpert: Towards a Generalist Agentic Model for Autonomous Machine Learning Engineering

## 元信息
| 标题 | MLExpert: Towards a Generalist Agentic Model for Autonomous Machine Learning Engineering |
|------|--------------------------------------------------------------------------------------|
| 作者 | Shangheng Du, Jinxin Shi, Shuaiyu Zhang, Yiming Wu, Junpeng Zhao, Shiyang Feng, Xin Li, Liang He, Xiangchao Yan, Bo Zhang (InternScience) |
| 链接 | [原文](https://arxiv.org/abs/2610.22344) |
| arXiv | arXiv:2610.22344 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.AI, cs.CL, cs.LG |
| 代码 | [GitHub](https://github.com/InternScience/MLExpert) |
| 模型 | [HuggingFace](https://huggingface.co/InternScience/MLExpert) |

## 核心贡献
1. **MLExpert 35B MoE 模型**：面向自主机器学习工程（MLE）的通用 Agentic 模型
2. **Windowed Interaction RL (WIRL)**：将连续实验结果之间的多轮决策视为一个执行窗口，分配统一的 outcome-based reward
3. **Kaggle-MLE Factory**：构建可执行 MLE 任务的合成数据生成流水线
4. **层级化 Agentic SFT**：通过结果引导的监督，将通用工具使用和编码能力迁移到 MLE 领域

## 模型架构
- **规模**：35B 参数 Mixture-of-Experts（MoE）
- **能力范围**：长视野实验管理、自主组织实验、根据执行反馈自适应优化策略
- **支持 SOTA 同类对比**：在 MLE-Bench Lite 上达到 72.7% 的平均奖牌率，与 Kimi-K3 和 GLM-5.3 等更大前沿模型相当

## 训练方法
### 两个阶段
1. **层级化 Agentic SFT**：用结果引导的监督信号做监督微调，将通用工具使用/编码能力迁移到 MLE 任务
2. **WIRL (Windowed Interaction RL)**：多轮决策 = 一个"执行窗口"，共享 outcome-based reward
   - 异步收集数据
   - 在轨迹结束前即可更新策略

### 关键创新
- 选择有用的监督信号，从长交互轨迹中学习中间结果
- 避免了"每次实验反馈反映许多前置决策"导致的低效训练

## 实验结果
- **MLE-Bench Lite**：奖牌率从 base model 的 37.9% 提升到 72.7%
- **NatureBench Lite**：性能提升
- **Agent 脚手架优化、算法优化**：性能均提升
- 表明学到的优化能力可泛化到其他任务

## 关键洞察
- 训练必须从长交互轨迹中"选择有用的监督"
- 一个长 MLE 运行包含许多昂贵的实验 → 需要 outcome-based reward 设计
- **Recursive Self-Improvement (RSI)** 路径：通过 AI for AI (AI4AI) 走向自我改进

## 相关工作
[[Agentic-LLM]] [[Mixture-of-Experts]] [[Reinforcement-Learning]] [[Long-Horizon-Agents]] [[Kaggle-MLE]] [[Self-Improvement]]

## 局限性
- 仅在 Kaggle-MLE / NatureBench 等受限子领域验证
- 35B MoE 仍需要显著算力
- RSI 安全性和可控性挑战未深入讨论

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
