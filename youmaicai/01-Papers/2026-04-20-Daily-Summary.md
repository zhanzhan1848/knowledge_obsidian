# Daily Summary — 2026-04-20

🥬 **LLM/NLP 每日论文追踪** — 2026-04-20

## 今日新增论文（7篇）

| 论文 | 领域 | 核心贡献 |
|------|------|----------|
| [[2026-04-20-Spectral-Geometry-of-Thought]] | cs.LG | Transformer 推理的谱几何理论：7个核心现象，可在答案生成前预测正确性（AUC=1.000） |
| [[2026-04-20-Aletheia-LoRA-Layer-Selection]] | cs.LG | Aletheia：梯度引导的层选择，LoRA 训练加速 23.1%，跨 14 模型验证 |
| [[2026-04-20-Sequential-KV-Cache-Compression]] | cs.LG | 顺序 KV Cache 压缩：利用语言模型 perplexity，理论压缩比达 914,000x vs TurboQuant |
| [[2026-04-20-Applied-Explainability-LLM-Comparative-Study]] | cs.CL | 三种可解释性方法（IG/Attn/SHAP）对比评估：梯度法更稳定，注意法更高效 |
| [[2026-04-20-Hallucination-Trajectory-Commitment]] | cs.LG | 幻觉作为轨迹承诺：吸引子动力学证明，幻觉进入快（单步）、纠正慢（多步） |
| [[2026-04-20-FP16-KV-Cache-Divergence]] | cs.LG | FP16 KV Cache 数值不等价：100% token divergence，源于 FP16 非结合性 |
| [[2026-04-20-PRL-Bench-Physics-Research-LLM]] | cs.LG | PRL-Bench：物理研究 LLM 评估基准，100篇 PRL 论文，最佳得分 < 50 |

## 关键词分布

- **推理/Reasoning**: Spectral Geometry of Thought, Hallucination Trajectory
- **效率优化**: Aletheia (LoRA), Sequential KV Cache Compression, FP16 Divergence
- **可解释性**: Applied Explainability, Spectral Geometry
- **Benchmark**: PRL-Bench
- **Transformer**: 全覆盖

## 观察

今日论文质量较高，特别是：
1. **Spectral Geometry of Thought** 建立了 Transformer 推理的谱理论，可提前预测答案正确性（AUC=1.000）
2. **Hallucination Trajectory Commitment** 提供了幻觉形成的因果机制（吸引子动力学），解释了为何幻觉难以纠正
3. **FP16 KV Cache** 揭示了被忽视的数值精度问题，影响所有使用 KV cache 的推理系统
4. **Sequential KV Compression** 理论上压缩比极高（914,000x），利用了语言结构而非独立处理向量

## 任务状态
- ✅ 论文收集（7篇）
- ✅ 内容提炼（已去重，已归类）
- ✅ 结构化笔记保存
- ⏳ Git 同步（待执行）
