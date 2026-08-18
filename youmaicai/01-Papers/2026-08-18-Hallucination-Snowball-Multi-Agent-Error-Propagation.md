# Hallucination Snowball: Error Propagation in Multi-Agent LLM Pipelines

## 元信息
| 标题 | The Hallucination Snowball: Modeling Error Propagation as State Transitions in Multi-Agent LLM Pipelines |
|------|-----|
| 作者 | Prabhjot Singh 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.14588) |
| arXiv | arXiv:2608.14588 |
| 会议 | FAGEN Workshop (ICML 2026) |
| 领域 | cs.AI, cs.CL, cs.MA |

## 核心贡献
1. **幻觉雪球效应**：多Agent流水线中幻觉的四状态一阶马尔可夫过程
2. **四状态传播链**：
   - **Raw Fact** → **Derived** → **Narrative** → **Invisible**
3. 各边界实测逃逸概率：
   - Raw Fact → Derived: **24.6%**（75.4% 可捕获）
   - Derived → Narrative: **48.3%**
   - Narrative → Invisible: **89.3%**（几乎不可逆）
4. 最强模型 Qwen3.5-397B-A17B 在 Stage 1 检测率 87.0%，最终阶段检测率仅 **~60-65%**

## 关键发现
- gpt-4o 在 4-Agent 金融分析流水线（FinanceBench）：
  - Stage 1 检测率: 72.0%
  - Stage 4 检测率: 50.9%
  - **23.7% 幻觉在最终输出中完全未被检测**
- **边界门控比端到端检查有效得多**：
  - 边界验证：幻觉存活率从 58.4% 降至 16.2%
  - 端到端检查：仅改善 2.3pp

## 最优验证资源分配
- **投资 S1→S2 边界**：75.4% 幻觉仍可捕获
- 不要投资 S3→S4：89.3% 已逃逸

## 公式
```
幻觉存活概率 = ∏(1 - 逃逸概率_i)
```

## 实验设置
- 346 次自动注入幻觉
- FinanceBench 4-Agent 金融分析流水线
- 跨 gpt-4o, Qwen3.5-397B-A17B 等模型

## 局限性
- 主要在金融领域验证，泛化性需进一步研究
- 线性流水线建模，多分支/循环结构未覆盖

## URL
- Workshop: FAGEN @ ICML 2026
