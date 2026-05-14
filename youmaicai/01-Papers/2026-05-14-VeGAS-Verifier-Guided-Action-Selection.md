# VeGAS: Verifier-Guided Action Selection for Embodied Agents

## 元信息
| 标题 | Think Twice, Act Once: Verifier-Guided Action Selection For Embodied Agents |
|------|-----|
| 作者 | Nishad Singhi, Christian Bialas, Snehal Jauhri, Vignesh Prasad, Georgia Chalvatzaki, Marcus Rohrbach, Anna Rohrbach |
| 链接 | [原文](https://arxiv.org/abs/2605.12620) |
| arXiv | arXiv:2605.12620 |
| 会议 | CVPR 2026 (Findings) |
| 类别 | cs.AI |

## 核心贡献
1. **问题**：基于 MLLM 的具身智能体在分布外场景仍脆弱
2. **方案**：VeGAS（Verifier-Guided Action Selection），测试时框架，通过显式验证步骤提高鲁棒性
3. **核心机制**：采样候选动作集合，使用生成式验证器识别最可靠选择，不修改底层策略
4. **关键发现**：直接用 MLLM 做验证器无提升 → 提出 LLM 驱动的数据合成策略，自动构建多样化失败案例课程

## 方法
```
推理时：
1. 采样多个候选动作
2. 生成式验证器识别最可靠选择
3. 不修改底层策略

训练时（数据合成）：
- 自动构建 failure cases curriculum
- 暴露验证器丰富错误分布
```

## 实验结果
- 在 Habitat 和 ALFRED 环境中一致提升泛化
- 最具挑战性的多目标、长期任务上较 CoT 基线提升 **36% 相对性能**

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.AI | CVPR 2026