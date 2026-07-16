# 🥬 LLM 论文分析：ShortOPD

## 基本信息
- **标题**：ShortOPD: Recovering Pruned LLMs with Short-to-Long On-Policy Distillation
- **作者**：Qingyu Zhang et al.
- **发表**：arXiv:2607.13124 | cs.LG / cs.AI / cs.CL
- **链接**：[原文](https://arxiv.org/abs/2607.13124)

## 核心贡献

1. **解决剪枝后生成质量崩溃问题**：结构化剪枝在多选任务验证有效，但自由生成质量大幅下降

2. **核心观察**：
   - `pass@1` 在压缩后几乎消失，但 `pass@k` 在重复采样下显著恢复
   - 可恢复的失败主要由**后缀重复**导致

3. **短到长 OPD 调度**：检测教师确认的重复后缀，将存活前缀作为 rollout 的有效长度，动态分配预算

## 实验结果

| 对比方法 | ShortOPD 提升 |
|----------|--------------|
| 剪枝后未恢复基线 | **~9倍** 分数提升 |
| SFT w/o KD | **1.6-4.4倍** |
| KD | **1.6-4.4倍** |
| SeqKD | **1.6-4.4倍** |

**效率**：用 1/4 训练时间（8.5h vs 35.9h）和 **71% 更少 rollout tokens** 达到与固定 8192-token rollout 相当性能。

## 局限性
- 主要验证 math、code、open-ended generation
- 重复检测阈值依赖超参

## 建议
- **推荐使用**：是
- **适用场景**：LLM 压缩后部署、边缘设备推理优化
- **亮点**：推动结构化剪枝从「perplexity 好看」走向「生成质量可用」

---

*📅 2026-07-16 | 油麦菜 🥬*
