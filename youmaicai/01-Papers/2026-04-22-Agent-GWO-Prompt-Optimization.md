# Agent-GWO: Collaborative Agents for Dynamic Prompt Optimization in LLMs

## 元信息
| 标题 | Agent-GWO: Collaborative Agents for Dynamic Prompt Optimization in Large Language Models |
|------|----------------------------------------------------------------------------------------|
| 作者 | Xudong Wang, Chaoning Zhang, Chenghao Li, Shuxu Chen, Qigan Sun, Jiaquan Zhang, Fachrina Dewi Puspitasari, Tae-Ho Kim, Jiwei Wei, Malu Zhang, Guoqing Wang, Yang Yang, Heng Tao Shen |
| 链接 | [原文](https://arxiv.org/abs/2604.18612) |
| arXiv | arXiv:2604.18612 |
| 发表日期 | 2026-04-14 |
| 类别 | cs.NE, cs.AI, cs.LG |
| 会议/期刊 | **ACL 2026** (Accepted) |
| 备注 | 9 pages, 5 figures |

## 核心贡献
1. **Agent-GWO**: 动态 prompt optimization 框架，统一 prompt templates 和 decoding hyperparameters
2. **GWO (Grey Wolf Optimizer)**: leader-follower 机制选择 α, β, δ 三个 leader agents
3. **协作更新**: leader agents 引导其余 agents 协同更新，迭代收敛到最优推理配置
4. **联合优化**: 同时优化 prompts 和 decoding hyperparameters，突破单 agent 局部搜索局限

## 方法架构

### 问题
- Chain-of-Thought (CoT) 提示策略提升了 LLM 复杂推理能力
- 但依赖人工静态 prompts，对 decoding 配置和任务分布敏感
- 现有自动 prompt optimization 方法：单 agent 局部搜索，无法联合优化 prompt + decoding 超参数

### Agent-GWO

#### 统一表示
- Prompt templates + decoding hyperparameters → 可继承的 agent configurations

#### GWO 机制
```
Leader agents: α (最优), β, δ
Follower agents: 接受 leader 引导进行协作更新
迭代收敛 → robust optimal reasoning configurations
```

### 实验
- **基准**: 多个数学推理 + 混合推理基准
- **模型**: diverse LLM backbones
- **结果**: 一致提升 accuracy 和 stability vs 现有方法

## 局限性
- 依赖 GWO 优化器超参数调优
- 主要验证 reasoning 任务

## 建议
- **是否推荐使用**：是（ACL 2026 录用，质量有保证）
- **适用场景**: LLM reasoning optimization, prompt engineering, hyperparameter tuning

## 标签
#prompt-engineering #LLM-reasoning #agent-optimization #ACL2026 #GWO