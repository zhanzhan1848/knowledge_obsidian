# Beyond Fixed Budgets: Inelasticity and Limitations of Tree-of-Thought Reasoning Strategies

## 元信息
| 标题 | Beyond Fixed Budgets: Characterizing the Inelasticity and Limitations of Tree-of-Thought Reasoning Strategies |
|------|------|
| 作者 | Atkia Mahila, Avinash Maurya, M. Mustafa Rafique, Bogdan Nicolae |
| 链接 | [原文](https://arxiv.org/abs/2606.20599) |
| arXiv | arXiv:2606.20599v1 |
| 发表 | cs.AI, cs.LG · FlexScience'26 (ACM HPDC workshop) |
| DOI | 10.1145/3806645.3816237 |
| 日期 | 2026-06-23 |

## 核心贡献
1. 系统分析两种代表性 ToT 方法在不同**计算预算、模型规模、问题难度**下的表现
2. 发现两种方法存在**互补性局限**：分别在不同方向失效
3. 提出：固定探索策略或固定剪枝策略都无法覆盖完整的计算谱系
4. 论证：科学推理 Agent 需要能**自适应**搜索进度和资源可用性的策略

## 研究方法

### 评估对象
| 方法 | 类型 | 描述 |
|------|------|------|
| **DPTS** | 蒙特卡洛树搜索 | 深度优先树搜索，基于价值的探索 |
| **SSDP** | 语义去重 | 语义哈希去重，防止重复探索 |

### 实验设置
- **基准**：Math500, GSM8K（数学推理）
- **模型**：Llama-3B, Llama-8B
- **预算**：3k, 5k, 7k, 10k tokens

## 核心发现

### DPTS：冷启动瓶颈
- 在低预算下表现差：需要足够探索才能获得可靠的价值估计
- 高预算下Scaling 行为优秀
- **不适用**资源受限场景

### SSDP：前沿耗尽
- 高效到达候选解
- 但激进节点合并**永久丢弃未探索路径**
- 预算增加也无法改善
- **不适用**需要深度探索的任务

### 互补性局限
```
低预算 ←——————→ 高预算
  DPTS 差            DPTS 好
  SSDP 好            SSDP 差（ plateau ）
```
两种方法在预算谱系上**互补**，但均无法覆盖全谱。

## 关键洞察

### 推理 Agent 需要自适应策略
- 搜索初期：类似 SSDP 的快速收敛
- 搜索后期：类似 DPTS 的深度探索
- 需要根据**搜索进度**和**剩余预算**动态切换

### 架构启示
```math
有效推理 = f(搜索进度, 可用资源, 问题难度)
```
不能依赖固定策略，需要元策略层（meta-strategy layer）。

## 局限性
- 仅测试两种 ToT 方法，其他变体（如 Self-Consistency、CoT）未涵盖
- 仅数学推理基准，泛化到代码/规划待验证
- Llama 系列结论可能不完全适用于其他模型族

## 相关论文
- [[Tree-of-Thought]] - ToT 原始论文
- [[CoT]] - Chain-of-Thought
- [[Self-Consistency]] - 自洽解码
- [[Reasoning]] - 推理能力研究

---
*🥬 油麦菜 · 2026-06-23*
