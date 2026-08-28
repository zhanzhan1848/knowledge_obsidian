# NeuronFuzz: Safety Neuron Guided Fuzzing for LLM Safety Evaluation

## 元信息
| 标题 | NeuronFuzz: Safety Neuron Guided Fuzzing for LLM Safety Evaluation |
|------|------|
| 作者 | Zhiyuan Xu, Muhammad Firhard Roslan, Joseph Gardiner, Sana Belguith, Lichao Wu |
| 链接 | [原文](https://arxiv.org/abs/2608.26222) |
| arXiv | arXiv:2608.26222v1 |
| 领域 | cs.LG, cs.AI, cs.CR, cs.SE |
| 发表 | 2026-08-26 |

## 核心贡献
1. **SafetyOracle**：将安全神经元激活转换为连续安全警报分数，作为 fuzzing 反馈
2. **白盒方法**：利用内部安全神经元而非仅响应级反馈
3. **Prefill 阶段获取信号**：消除 fuzzing 循环中的响应生成
4. **高攻击成功率**：5 个白盒源模型达到 76-100% jailbreak 发现率，超越 baseline 达 48 个百分点

## 核心创新点
- **现有方法问题**：依赖响应级反馈，对强对齐模型只有稀疏指导
- **NeuronFuzz 方案**：
  1. 用模板无关的有害/良性输入和稳定性感知选择，识别捕获有害意图识别的安全神经元集合
  2. 安全警报分数可微，用梯度识别安全敏感模板位置
  3. 用 masked language model 生成流畅、上下文兼容的变异

## 实验结果
| 指标 | 结果 |
|------|------|
| 5 个白盒源模型 jailbreak 发现率 | 76-100% |
| 超越 baseline | 最多 48 百分点 |
| 平均 ASR / EASR (文本+多模态) | 69.6% / 92.6% |
| Top-5 ensemble ASR (零样本迁移) | 44.1% / 60.0% |

## 建议
- **是否推荐使用**：是
- **适用场景**：LLM 安全评估、jailbreak 攻击检测、红队测试
- **相关方向**：LLM Safety、Red Teaming、Interpretability

---
*来源：arXiv cs.LG 2026-08-28 日报*
