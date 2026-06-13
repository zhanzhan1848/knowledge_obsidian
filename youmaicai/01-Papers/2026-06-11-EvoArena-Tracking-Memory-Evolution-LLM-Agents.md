# EvoArena: Tracking Memory Evolution for Robust LLM Agents in Dynamic Environments

## 元信息
| 标题 | EvoArena: Tracking Memory Evolution for Robust LLM Agents in Dynamic Environments |
|------|-----|
| 作者 | Jundong Xu, Qingchuan Li, Jiaying Wu, Yihuai Lan, Shuyue Stella Li, Huichi Zhou, Bowen Jiang, Lei Wang, Jun Wang, Anh Tuan Luu, Caiming Xiong, Hae Won Park, Bryan Hooi, Zhiyuan Hu |
| 链接 | [原文](https://arxiv.org/abs/2606.13681) |
| arXiv | arXiv:2606.13681 |
| 领域 | cs.CL |

## 核心贡献
1. **EvoArena Benchmark**: 首个模拟动态环境变化的 LLM Agent 评估基准，覆盖终端、软件、社会偏好三个领域的渐进式环境演化
2. **EvoMem**: 基于补丁的记忆范式，将记忆演化记录为结构化更新历史，使 Agent 能够推理环境变化
3. **关键发现**: 当前 Agent 在 EvoArena 上平均准确率仅 39.6%，EvoMem 可提升 1.5%，在 GAIA 和 LoCoMo 标准基准上分别提升 6.1% 和 4.8%

## 模型架构
- **EvoArena**: 三领域动态评估套件
  - 终端域（Terminal）: 命令行环境随时间变化
  - 软件域（Software）: API/界面更新
  - 社会偏好域（Social）: 用户偏好动态变化
- **EvoMem**: 补丁式记忆记录
  - 将环境更新存储为结构化 diff/patch
  - 支持链级推理（chain-level accuracy）

## 核心创新
- 提出**环境演化建模**的重要性：真实世界部署本质上是动态的
- 记忆需随环境变化而演化，而非静态快照
- EvoMem 提升证据捕获质量，保留完整演化环境状态

## 实验结果
| 基准 | 基线准确率 | +EvoMem |
|------|-----------|---------|
| EvoArena (平均) | 39.6% | +1.5% |
| GAIA | - | +6.1% |
| LoCoMo | - | +4.8% |
| EvoArena Chain-level | - | +3.7% |

## 局限性
- 当前 Agent 在动态环境中仍表现有限（<40%）
- 社会偏好域可能最难适应

## 标签
#LLM-Agent #Memory #Dynamic-Environment #Benchmark #Reasoning