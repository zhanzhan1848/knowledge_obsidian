# When Calibration Rankings Reverse: Accuracy-Controlled Evaluation for Fair Comparison of LLMs

## 元信息
| 标题 | When Calibration Rankings Reverse: Accuracy-Controlled Evaluation for Fair Comparison of LLMs |
|------|------|
| 作者 | Zhichao Yang, Caiqi Zhang, Ruihan Yang, Chengzu Li, Nigel Collier, Deqing Yang |
| 链接 | [原文](https://arxiv.org/abs/2606.30814) |
| arXiv | arXiv:2606.30814 [cs.CL] |
| 发表 | 2026-06-29 |

## 核心贡献

1. **揭示校准度量的混淆问题**：理论上和实验上证明，直接用 ECE（Expected Calibration Error）和 Brier Score 比较不同 LLM 的校准度是不公平的，因为这些指标被模型准确率混淆
2. **提出 ACE 框架**：Accuracy-Controlled Evaluation，包含三个互补视角：
   - Instance-Aligned calibration（实例对齐校准）
   - Distribution-Aligned calibration（分布对齐校准）
   - Candidate-Aligned calibration（候选对齐校准）
3. **发现排名反转**：许多在原始全局指标下被认为校准更好的模型，在控制准确率后失去优势

## 核心问题

现有校准研究使用 ECE 和 Brier Score 比较不同 LLM 的校准：

$$ECE = \sum_{k=1}^{K} \frac{|B_k|}{n} |acc(B_k) - conf(B_k)|$$

**问题**：这些指标同时衡量两个不同维度——准确率和校准。当模型 A 比模型 B 更准确时，即使两者校准相同，A 的 ECE/Brier Score 也会更低。

## ACE 框架

### 三个互补视角

1. **Instance-Aligned**：将不同模型在相同实例上的表现对齐后比较校准
2. **Distribution-Aligned**：在相同准确率分布下比较校准
3. **Candidate-Aligned**：在相同候选集合下比较校准

### 理论证明

论文给出了理论分析：对于正确/错误的二值场景，校准指标与准确率之间存在数学耦合。

## 实验发现

- 在 small vs large models 和 thinking vs non-thinking models 两个维度的比较中
- Raw global metrics 下许多优势消失或反转
- Ranking reversal 频繁发生

## 建议

- **是否推荐使用**：是
- **适用场景**：LLM 评估、校准研究、模型选择
- **使用建议**：进行跨模型校准比较时，应使用 accuracy-controlled 方法而非 raw global metrics

## 标签
#LLM-evaluation #calibration #ECE #model-comparison
