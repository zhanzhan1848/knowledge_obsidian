# The Model Says Walk: LLM 推理中的表面启发式覆盖

## 元信息
| 标题 | The Model Says Walk: How Surface Heuristics Override Implicit Constraints in LLM Reasoning |
|------|------|
| 作者 | Yubo Li, Lu Zhang, Tianchong Jiang, Ramayya Krishnan, Rema Padman (CMU) |
| 链接 | [原文](https://arxiv.org/abs/2603.29025) |
| arXiv | arXiv:2603.29025 [cs.CL] |
| 领域 | LLM推理 · 评估基准 · 认知偏差 |

## 核心贡献

### 发现的现象：启发式覆盖 (Heuristic Override)
当显著的表面线索与未明确说明的可行性约束冲突时，LLM 系统性地遵循启发式而失败。

**典型案例**（Car Wash Problem）：
> "I want to wash my car. The car wash is 50 meters away. Should I walk or drive?"
> 正确答案：Drive（车必须在洗车场）。53个模型的评估中，42个建议步行，仅5个在10次试验中持续正确。

### 诊断-测量-桥接-治疗框架
1. **诊断**：因果行为分析——启发式主导比（Heuristic Dominance Ratio, HDR）= 8.7–38×
2. **测量**：HOB 基准——14模型，无一超过75%严格准确率
3. **桥接**：参数探针——sigmoid模式泛化到成本/效率/语义相似性启发
4. **治疗**：Goal-decomposition prompting 恢复 +6–9 pp

## HOB: Heuristic Override Benchmark
- **500 instances**，4 个启发式家族 × 5 个约束家族
- **14 个模型**评测：包括 GPT-5.4, Claude Opus 4.6, DeepSeek R1, Gemini 3.1 Pro 等
- **严格评估（10/10 correct）**：无模型超过 75%
- **存在约束**是最难类型（44.4%），**能力约束**最简单（71.6%）

### 启发式家族
- **H-prox**: 短距离 → 步行
- **H-cost**: 低成本 → 选择某方案
- **H-eff**: 高效率 → 推荐某方案
- **H-sem**: 语义相似 → 关联某答案

### 约束家族
- **C-pres**: 存在约束（物体必须在场）
- **C-cap**: 能力约束（行动者能否执行）
- **C-val**: 有效性约束
- **C-sco**: 范围约束
- **C-pro**: 程序约束

## 关键指标：Heuristic Dominance Ratio (HDR)
```
HDR = |A(H)| / |A(G)|
```
在 Car Wash 问题中，distance cue 对 goal 的影响比为 8.7×–38×，表明距离线索至少比目标高一个数量级。

## 关键发现
1. **推理瓶颈而非知识缺失**：仅添加一个 minimal hint（如强调关键对象）平均恢复 +15.3 pp
2. **保守偏差**：12/14 模型在约束被移除时表现变差（最多 -38.5 pp），揭示表面正确掩盖了推理缺陷
3. **Sigmoid 模式广泛存在**：不仅限于距离，在 cost、efficiency、semantic-similarity 启发式上也观察到类似 sigmoid 失败模式
4. **Goal-decomposition prompting 有效**：强制模型在回答前列举前提条件，弱模型恢复 +6–9 pp

## 与Shortcut Learning的区别
| 特征 | Shortcut Learning | Heuristic Override |
|------|------------------|-------------------|
| 移除启发式后 | 性能恢复 | 性能下降（保守偏差）|
| 问题类型 | 分类特征 | 开放决策 |
| 关系 | 虚假特征相关 | 表面线索与隐式约束竞争 |

## 实践意义
在医疗分类、法律推理、财务规划等需要隐式约束推理的领域，LLM 可能产生系统性的错误建议。

## 标签
#LLM推理 #评估基准 #认知偏差 #启发式 #常识推理
