# OpenForgeRL: Train Harness-native Agents in Any Environment

## 元信息
| 标题 | OpenForgeRL: Train Harness-native Agents in Any Environment |
|------|------|
| 作者 | Xiao Yu, Baolin Peng, Ruize Xu, Hao Zou, Qianhui Wu, Hao Cheng, Wenlin Yao, Nikhil Singh, Zhou Yu, Jianfeng Gao |
| 链接 | [原文](https://arxiv.org/abs/2607.21557) |
| arXiv | arXiv:2607.21557 |
| 领域 | cs.AI, cs.CL |

## 核心贡献
1. **OpenForgeRL 框架**：开源框架，用于在任何环境中端到端训练基于harness的智能体
2. **轻量级代理**：服务harness的模型调用，同时记录为标准RL代码库的训练数据
3. **Kubernetes编排器**：每个rollout在独立远程容器中运行
4. **解耦训练和推理**：允许研究者在真实harness和环境中直接训练、研究和改进智能体

## 方法
- **架构**：
  - 轻量级proxy：记录harness模型调用
  - 标准RL后端（如veRL）
  - Kubernetes编排
- **支持的harness**：Claude Code, Codex, OpenClaw, ZeroClaw等
- **环境**：工具/claw智能体、多模态GUI浏览器和计算机使用智能体

## 实验结果
### OpenForgeClaw
- ClawEval: 31.7 pass@1, 55.9 pass@3
- QwenClawBench: 33.7

### OpenForgeGUI
- OSWorld-Verified: 37.7
- Online-Mind2Web: 63.0
- WebVoyager: 72.3

两者在相似规模的开放基线上优于大多数基准，在GUI设置下匹配或超越更大模型

## 关键发现
- 某些harness学习难度显著高于其他
- RL提升智能体可靠性：自我验证、工具覆盖、多步骤计划完成
- 错误恢复等关键能力仍然薄弱

## 相关工作
- AI智能体训练
- RLHF
- 多模态智能体

## 标签
#LLM #强化学习 #AI智能体 #RLHF #OpenClaw #agent-training
