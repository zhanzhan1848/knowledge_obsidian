# SEAL: Synergistic Co-Evolution of Agents and Learning Environments

## 元信息
| 标题 | SEAL: Synergistic Co-Evolution of Agents and Learning Environments |
|------|------|
| 作者 | Yihao Hu |
| 链接 | [原文](https://arxiv.org/abs/2605.24426) |
| arXiv | arXiv:2605.24426 |
| 发表 | 2026-05-23 (v1) |
| 领域 | cs.CL |

## 核心贡献

1. **Agent-Environment Misalignment**: 识别自演化方法中的结构性问题——智能体能力边界变化时环境保持静态
2. **Closed-loop Co-evolution**: SEAL 实现智能体与学习环境的闭环协同演化
3. **Diagnosis-guided Advantage Reweighting**: 使用诊断引导的优势重加权进行策略优化

## 方法论

### 核心框架
```
数据收集 → 失败诊断 → 环境适应 + 策略优化
```

### 三阶段闭环
1. **On-policy Trajectory Collection**: 收集可执行验证的 on-policy 轨迹
2. **Failure Diagnosis**: 将失败 rollout 诊断为 turn-level 失败标签
3. **Shared Signal**: 作为环境和模型优化的共享信号

### 环境适应
- 暴露更清晰的工具 affordance 线索
- 提供约束信息
- 反馈恢复导向信息

### 策略优化
- 诊断引导的优势重加权

## 实验结果

### 训练效率
- 仅需 **400 个训练样本**
- 在三个 backbone 上提升 **+8.25 ~ +26.25** 平均分

### OOD Transfer
- 正向的分布外迁移能力
- 多轮工具使用评估表现优异

## 关键词
#LLM-Agent #Self-Evolution #Environment-Adaptation #RL #Tool-Use