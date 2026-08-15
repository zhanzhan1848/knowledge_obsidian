# Forecasting Side Effects of Activation Steering

## 元信息
| 标题 | Forecasting Side Effects of Activation Steering |
| 作者 | Chong Yong Ong, Alson Wei Jie Sim, Peixin Zhang, Jun Sun |
| 链接 | [原文](https://arxiv.org/abs/2608.11227) |
| arXiv | arXiv:2608.11227 |
| 代码 | 代码随论文发布（artifact index、cross-effect matrices 及分析代码） |

## 核心贡献
1. **Cross-effect matrix**: 构建了覆盖 67 个行为的交叉效应矩阵，在三个开源模型（Gemma-3-4B、Gemma-3-12B、Qwen2.5-7B）上系统测量激活 steering 的副作用
2. **副作用是常见、结构化、非对称的**: 33–50% 的行为对存在显著耦合，且存在大量不对称效应（ steering A → B 与 steering B → A 效果相反）
3. **副作用可预测**: 无需实际执行 steering，仅从模型的 unsteered 表征即可预测副作用的方向（放大或抑制），准确率 68–78%
4. **余弦相似度启发式不足**: 现有基于 steering 方向相似度预测副作用的方法只能解释 ≤23% 的耦合强度

## 方法

### 行为分类体系（67 个行为）
覆盖 7 个部署组，从编码辅助到安全敏感请求不等。每个行为通过对比表达该行为的 prompts 与抑制该行为的 prompts 构建 steering 方向（标准差分法）。

### Cross-Effect Matrix 构建
- 对每个 validated source behavior（52/52/47 个，分别在三个模型上），在标定的 steering 系数窗口内 sweep 5 个等距值
- 每组生成 4 个独立样本，每个 generation 由独立 judge 模型（Gemma-4-31B）在全部 67 个行为上打分
- 矩阵条目 M_ij = β̂_ijp 对 prompt p 上 steered score 对 steering 系数的斜率进行平均
- 通过 Benjamini–Hochberg 校正（q < 0.05）筛选显著条目

### 预测框架
- **任务一（幅度预测）**: 预测哪些目标行为将受到最强影响
- **任务二（方向预测）**: 预测 steering 是放大还是抑制目标行为
- 方法：将 steering 方向通过从 unsteered text 学习到的 propagation map 传播，再用线性 behavior probe 解码
- 零样本基准：仅用 steering 方向和 probe 的余弦相似度

## 关键发现

### 副作用普遍且结构化
- 33–50% 的行为对存在显著耦合，每个 steered 行为平均影响 22–33 个其他行为
- 单一主导模式解释了约 64% 的矩阵方差（主要捕捉 elaboration ↔ terseness 的权衡）
- 本征维度仅 4.6–4.9，远低于随机对照的 23–26
- 安全相关行为在不同模型家族中占据显著不同的行为空间区域

### 现有预测直觉失效
- 18–26% 的双向显著效应符号相反（不对称）
- 例如：在 Gemma-3-4B 上，steering toward thoroughness 增加 uncertainty disclosure，而 steering toward uncertainty disclosure 抑制 thoroughness
- Steering 方向余弦相似度只能解释 ≤23% 的耦合

### 副作用可预测
- 方向预测：在 flagged cases 中正确预测放大/抑制方向达 68–78%，显著优于简单基准
- 副作用幅度主要取决于目标行为本身
- 副作用方向可从模型的 unsteered 表征预测（ propagation map + linear probe）
- 方法只需 source behavior 的 steering 方向和 target behavior 的 probe，自然扩展到无法被 steering 的行为

### 控制实验
- 最小可检测耦合：0.10–0.12 judge points；显著耦合中位数为其约 2 倍
- 随机 steering 方向仅改变 judge scores ~0.007
- 主导轴在 unsteered generations 上仅解释 8.6–10.0% 方差，确认结构源于 steering 而非评估流程

## 局限性
- Cross-effect matrix 规模巨大（每个模型约 128,000 次 generation，每次评估全部 67 个行为），计算成本高
- 主要在三个开源模型上验证，结论对其他模型家族的泛化性待进一步研究
- Safety-related behaviors 的 steering 效应在不同模型家族间差异显著，可能限制结论的通用性
- 预测方法依赖线性 probe 和 propagation map，对极强 steering 下的非线性效应覆盖不足

## Tags
#LLM #activation-steering #interpretability #safety #model-editing
