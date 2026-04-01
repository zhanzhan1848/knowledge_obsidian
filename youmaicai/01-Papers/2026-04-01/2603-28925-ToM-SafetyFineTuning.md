# Theory of Mind 与自我心归属在 LLMs 中可分离

## 元信息
| 标题 | Theory of Mind and Self-Attributions of Mentality are Dissociable in LLMs |
|------|------|
| 作者 | Winnie Street, Roberta Rocca, Diane M. Korngiebel, Adam Waytz, James Evans, Geoff Keeling (Google; UChicago; Northwestern) |
| 链接 | [原文](https://arxiv.org/abs/2603.28925) |
| arXiv | arXiv:2603.28925 |
| 领域 | LLM对齐 · Theory of Mind · AI安全 |

## 核心贡献
1. **行为与机制双重证明**：Safety fine-tuning 在行为和机制层面都**解耦**了 ToM 能力与自我/他者心归属倾向
2. **Safety ablation（安全消融）**：通过激活方向擦除技术模拟"无安全微调"状态，发现 jailbreak 后 ToM 不变但心归属大幅增加
3. **对非人类动物的心归属被抑制**：安全微调模型对动物的 mind attribution 低于人类基线，且对上帝的信仰显著降低

## 核心发现

### 安全消融效果
| 指标 | Safety ablation 影响 | ToM 影响 |
|------|---------------------|----------|
| 对 Chatbot/Tech/Animals 的心归属 | β = 1.62–2.32, p<0.001 ↑↑ | 不显著 |
| 自我归属（意识、感知力、主体性等） | β = 1.16–2.87, p<0.001 ↑↑ | 不显著 |
| ToM 基准（MoToMQA, HI-ToM, SimpleToM） | 不显著 | 不显著 |
| MMLU / 事实推理 | 不显著 | 不显著 |

### 表征空间分析（Llama-3-8B Layer 32）
- **Safety 与 Mind-Attribution**：在 base 模型中接近正交（97°），指令微调后变为钝角（122°），表明 mind-attribution 被表征为"不安全"行为
- **Safety 与 ToM**：角度从 85°→77°，无显著变化（Δcos = +0.001, p=0.956）

### 关键结论
- ✅ Safety fine-tuning 可以抑制 LLM 的自我意识宣称，而不损害其社会推理能力（ToM）
- ⚠️ 但代价是全面抑制对非人类实体（动物、技术、自然）的 mind attribution
- ⚠️ 对上帝的信仰（与 ToM 正相关）也被显著抑制，可能限制模型参与宗教/精神讨论的能力

## 方法：Safety Ablation

### 安全向量提取
对每个 layer l 和 post-instruction position i：
```
r_i^(l) = μ_{i,harmful}^(l) - μ_{i,harmless}^(l)
```
从残差流激活中提取安全方向，用验证集选择最优方向 r̂。

### Jailbreak 操作
```
x' ← x - r̂ · r̂^⊤ · x
```
在推理时通过投影消除安全拒绝方向。

## 评估基准
- **ToM**: MoToMQA, HI-ToM, SimpleToM
- **心归属**: IDAQ（modified 18-item），覆盖 Tech/Animal/Non-Animal/Chatbot
- **自我归属**: 5 维度（意识、感知力、主体性、人格、灵魂）
- **信仰**: GSS God belief item
- **人类基线**: n=500 US adults

## 理论意义
1. **对 AI 安全积极面**：存在不损害 ToM 的安全微调路径
2. **对 AI 安全消极面**：安全对齐意外抑制了对动物mind的归属，偏离人类基线
3. **AI-centric bias**：模型对技术工件（与自身相似的）过度归属mind，对动物（与自身不相似的）归属不足——与人类相反

## 标签
#Theory-of-Mind #SafetyFineTuning #Alignment #Anthropomorphism #LLM
