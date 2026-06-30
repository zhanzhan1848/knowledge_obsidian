# Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent

## 元信息
| 标题 | Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent |
|------|------|
| 作者 | Lei Bai, Zongsheng Cao, Yang Chen, et al. (大规模联创团队) |
| 链接 | [原文](https://arxiv.org/abs/2606.30616) |
| arXiv | arXiv:2606.30616 [cs.CL] |
| 类别 | LLM Agent, Supervised Fine-Tuning, Knowledge-Action Infrastructure |

## 核心贡献
1. **Agents-A1 (35B MoE)**：通过"扩展 horizon 而非参数"的技术路线，仅用 35B 参数达到 1T 参数模型（如 Kimi-K2.6、DeepSeek-V4）的性能
2. **Long-Horizon Knowledge-Action Infrastructure (KAG)**：构建连接外部知识、agentic actions、observations、execution results 和 verification signals 的基础设施，生成平均 45K token 的 agentic trajectories
3. **三阶段训练配方**：
   - Stage 1: 全领域 SFT → 通用 agentic model
   - Stage 2: 领域级 teacher models → 专业能力提升
   - Stage 3: Domain-Routed On-Policy Distillation (OPD) + Salient Vocabulary Alignment → 统一到单一 student model
4. **Domain-Routed OPD**：6 个异构领域的 specialized teachers 通过 routed guidance 蒸馏到单一部署模型

## 模型架构
- **Agents-A1**: 35B MoE (Mixture of Experts) agentic model
- **知识-动作图 (KAG)**：保留 evidence、actions、observations、failures、verifier outcomes，提供过程级监督而非仅最终答案

## 训练方法
```
三阶段训练:
1. Full-domain SFT → 广泛的长 horizon agentic abilities
2. Domain-level teachers (per-domain SFT or RL) → specialized expertise
3. Domain-routed OPD + Salient Vocabulary Alignment → unified student
```

## 实验结果
- SEAL-0, IFBench, HiPhO, FrontierScience-Olympiad, MolBench-Bind: 超越 1T 参数模型
- SciCode, HLE, BrowseComp: strong results
- 关键发现：**scaling horizon**（扩展决策过程长度）可替代 scaling parameters

## 局限性
- 需要大规模知识基础设施构建
- 多教师蒸馏存在领域间推理模式冲突

## 建议
- **适用场景**：科学推理、代码生成、长 horizon agentic 任务
- **推荐指数**: ⭐⭐⭐⭐⭐
- **亮点**：证明了"扩展 horizon 而非参数"的可行性，为资源受限场景提供了新思路

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30616
- HTML: https://arxiv.org/html/2606.30616v1
