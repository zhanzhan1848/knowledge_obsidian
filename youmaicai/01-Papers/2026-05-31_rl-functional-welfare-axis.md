# RL in Language Models Recruits a Functional Welfare Axis

## 元信息
| 标题 | How's it going? Reinforcement learning in language models recruits a functional welfare axis |
| 作者 | Andy Q Han et al. |
| 发表 | Preprint (81 pages, 43 figures) |
| 链接 | [原文](https://arxiv.org/abs/2605.30232) |
| arXiv | arXiv:2605.30232 |

## 核心贡献
1. **核心发现**：RL 招募了一个**预存在的功能福利表征**（functional welfare representation）——模型对自身目标达成好坏程度的估计
2. **实验设计**：在语义中立的迷宫环境中训练 LLM，提取奖励/惩罚轨迹的概念向量，在非迷宫设置中评估
3. **惩罚向量**（negative welfare）：
   - 促进失败和不可能 token
   - 与负面情绪概念对齐
   - 负向追踪目标达成
   - 引导它诱发负面自我报告、病理性回溯、拒绝、不确定性
4. **正负 reward 向量近似反平行**（nearly antiparallel）
5. **效应鲁棒性**：控制 tile-to-reward 映射、规模、instruct tuning、RL 算法、模型家族、LoRA vs 全量微调，且在 RL 替换为 SFT 后基本保留
6. **关键结论**：功能福利轴**先于后训练而存在**，被后训练**招募**，而非被创造

## 可解释性意义
- 最小奖励信号可以通过招募预存在的福利表征广泛影响模型行为
- 对可解释性、后训练动态和对齐有影响

## 标签
#interpretability #RLHF #representation-learning #alignment