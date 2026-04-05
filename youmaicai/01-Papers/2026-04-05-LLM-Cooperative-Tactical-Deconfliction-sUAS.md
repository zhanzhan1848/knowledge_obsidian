# Fine-Tuning LLMs for Cooperative Tactical Deconfliction of sUAS

## 元信息
| 标题 | Fine-Tuning Large Language Models for Cooperative Tactical Deconfliction of Small Unmanned Aerial Systems |
|------|------|
| 作者 | Alex Zongo et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.28561) |
| arXiv | arXiv:2603.28561 [cs.RO, cs.AI] |
| 发表 | CVPR 2026 Workshop, 2026-03-30 |

## 核心贡献

1. **仿真到语言的数据生成管道**：基于BlueSky空管模拟器生成符合规则的冲突解决数据集
2. **LoRA + GRPO联合微调**：将LLM用于无人机空中交通管制决策
3. **验证了有监督LoRA微调显著优于预训练LLM**：减少near mid-air collisions
4. **GRPO提供额外协调收益**：但对异构智能体策略的鲁棒性下降

## 方法

### 数据生成管道
```
BlueSky空管模拟器
    ↓ 生成规则一致的冲突解决轨迹
Rule-Consistent Deconfliction Dataset
    ↓
LoRA / LoRA + GRPO Fine-tuning
    ↓
Qwen-Math-7B
```

### 两种微调策略对比

| 策略 | 决策准确性 | 一致性 | 分离性能 | 协调能力 | 鲁棒性 |
|------|-----------|--------|---------|---------|--------|
| Supervised LoRA | ↑↑ | ↑↑ | ↑↑ | - | 好 |
| LoRA + GRPO | ↑ | ↑ | ↑ | ↑↑ | 差 |

### 关键发现
- **有监督LoRA微调**： substantially improves decision accuracy, consistency, and separation performance
- **GRPO**：provides additional coordination benefits but reduced robustness with heterogeneous agent policies
- 显著减少近空中碰撞（near mid-air collisions）

## 应用场景

- 小型无人机系统（sUAS）低空空域管理
- 密集、部分可观测、多智能体环境
- 短视界决策（short-horizon decision-making）

## 局限性

- 主要在仿真环境中验证
- GRPO对异构策略的鲁棒性问题需要进一步研究
- 领域泛化能力待验证

## 标签
#LLM #无人机 #强化学习 #GRPO #LoRA #合作多智能体 #空管 #微调

## 相关论文
- GRPO (Group-Relative Policy Optimization)
- LoRA (Low-Rank Adaptation)
- Qwen-Math-7B
