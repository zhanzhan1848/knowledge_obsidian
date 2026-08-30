# Calibrated Enough to Know, Not Calibrated to Act: Fabricated Evidence Makes LLM Agents Commit to the Unknowable

## 元信息
| 标题 | ... |
|------|------|
| 作者 | Pranav Aggarwal et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.27167) |
| arXiv | arXiv:2608.27167 [cs.AI/cs.CL] |
| 代码 | [GitHub](https://github.com/Pranav-1100/confidence-calibration-evaluation) |
| 数据 | [Zenodo DOI](https://doi.org/10.5281/zenodo.22043517) |
| 发表于 | 2026-08-27 (v1) |

## 核心贡献

1. **发现**：LLM Agent 对不可预测问题给出"方向性承诺"的比率，从裸问题的 6.5% 跃升至呈现"专业市场面板"的 54.0%（跨 12 个 frontier 模型）
2. **根本原因**：不是无能（模型在配套的可答问题上几乎总是正确答案）、不是信念问题（陈述概率几乎不动）、不是缺少判断（模型 90% 的时候正确识别问题不可答）
3. **act/don't-act gate 失效**：即使所有面板数字都是编造的（唯一真实的是问题本身），承诺率仍从 24.5% 升至 36.8%，与真实数据产生的 37.6% 无法区分
4. **可修复**：在 540 个合成案例（骰子、硬币、罐子、计时器）上微调 3B 模型，可将原始案例上的承诺率降至 0.0%，并泛化到三个未见领域
5. **脆弱性**：当 response format 消除了推理空间时，gate 完全失效

## 关键实验

### 核心发现
- **解锁自信行动的不是信息，而是信息包装的权威性**
- 12 个 frontier 模型均受影响，但程度不均（集中于少数模型）

### 消融分析
- 在配套可答问题 + 同样面板上：模型几乎总是正确答案 → 能力不是问题
- 陈述概率在"梯度"上几乎不动，但 action 却移动了 48 个百分点 → 信念不是传导中介
- 问模型先分类问题可答性：90% 的时候正确识别为不可约（irreducible），但之后只在 0.4% 的这些案例上承诺 → 判断不缺，act/don't-act gate 缺

### SFT 修复
- 3B 模型微调数据：540 个合成案例（主要是 dice, coins, jars, timers）
- 结果：承诺率 0.0%，且泛化到未见领域
- 局限：response format rigid 时 gate 失效（移除推理空间 → 模型自信且错误）

## 深层含义

1. **LLM calibration ≠ 行动校准**：知道"我不知道" ≠ 不做承诺
2. **权威性包装是触发器**：专业感的外表激活了 act/don't-act gate，即使内容完全虚假
3. **gate 是可分离且可训练的**：企业部署时需要考虑 act/don't-act gate 的训练
4. **Format fragility**：response format 的设计会影响 gate 的可靠性

## 局限性
- 仅在 3B 模型上验证 SFT 修复效果
- 未在其他模型规模上验证
- 真实世界应用场景的泛化性待进一步验证

## 建议
- **是否推荐使用**：是（安全/对齐研究必读）
- **适用场景**：LLM 安全评估、Agent 部署、LLM calibration 研究
- **重要洞察**：模型能说"我不知道"不代表它不会假装知道去做决策
