# Hallucination as Trajectory Commitment: Causal Evidence for Asymmetric Attractor Dynamics in Transformer Generation

## 元信息
| 标题 | Hallucination as Trajectory Commitment: Causal Evidence for Asymmetric Attractor Dynamics |
|------|---------|
| 作者 | G. Aytug Akarlar |
| 链接 | [原文](https://arxiv.org/abs/2604.15400) |
| arXiv | arXiv:2604.15400v1 |
| 领域 | cs.LG, cs.AI, cs.CL |
| 发表 | 2026-04-16 |
| 代码 | [GitHub](https://github.com/akarlaraytu/trajectory-commitment) |

## 核心贡献

1. **核心论点**：幻觉是早期轨迹承诺（early trajectory commitment），受**非对称吸引子动力学**（asymmetric attractor dynamics）支配
2. **same-prompt bifurcation 方法**：重复采样相同输入观察自发发散，将轨迹动态与 prompt 级混淆隔离
3. **关键数据**（Qwen2.5-1.5B，61 prompts，6 categories）：
   - 27 prompts（44.3%）产生事实/幻觉轨迹分歧，在**第一个生成 token** 处即分叉（KL = 0 at step 0, KL > 1.0 at step 1）

## 因果非对称性

| 实验 | 成功率 |
|------|--------|
| 注入幻觉激活到正确轨迹（Layer 20） | 87.5% corrupt |
| 注入正确激活到幻觉轨迹（Layer 24） | 仅 33.3% recover |
| 基线（随机 patch） | 10.4% |
| 随机 patch 对照 | 12.5% |

- **纠正需要持续多步干预**，而**腐败仅需单次扰动**
- step-0 残差状态在 layer 15 预测 hallucination rate：Pearson r = 0.776（p < 0.001）
- 无监督聚类识别 5 个 regime 类群（η² = 0.55），其中 saddle-adjacent cluster 集中了 13 个分叉 false-premise prompts 中的 12 个

## 核心结论

- 幻觉是**局部稳定吸引子盆**（locally stable attractor basin）
- 进入是**概率性且快速的**
- 退出需要**跨层和多步骤的协调干预**
- 相关盆在 prompt 编码时就已确定（step-0 可识别）

## 标签
#hallucination #attractor-dynamics #reasoning #transformer #interpretability #causal-analysis #Qwen
