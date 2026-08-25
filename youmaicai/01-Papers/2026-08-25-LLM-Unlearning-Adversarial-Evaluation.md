# Can LLMs Truly Forget? Revealing Unlearning Gaps Through Adversarial Evaluation

## 元信息
| 标题 | Can LLMs Truly Forget? Revealing Unlearning Gaps Through Adversarial Evaluation |
|------|------|
| 作者 | Hima Varshini Surisetty |
| 链接 | [原文](https://arxiv.org/abs/2608.21606) |
| arXiv | arXiv:2608.21606v1 |
| 领域 | cs.CL |

## 核心贡献
1. **Adversarial Robustness Evaluation**: 填补现有基准仅在非对抗性查询下评估 unlearning 的空白
2. **Attack Success Rate (ASR)**: LLM-as-judge 指标，测量对抗响应泄漏分数超过 0.2 的比例
3. **8 攻击套件**: 系统评估在对抗条件下的信息恢复能力
4. **关键发现**: 
   - Forget Quality > 0.91 的方法在标准指标下表现优异
   - 但对抗环境下 ASR 达 72.8%-84.3%，接近未保护模型的 87.5%
   - 多语言改写仅 2.95% 泄漏

## 核心指标
- **ASR (Attack Success Rate)**: 对抗响应泄漏分数 > 0.2 的比例
- **Forget Quality**: 标准非对抗指标

## 关键结论
标准指标表现优异不足以建立 unlearning 的鲁棒性，对抗压力测试应成为 unlearning 评估的互补组成部分。

## 标签
#Machine-Unlearning #Adversarial-Evaluation #LLM-Safety #Privacy
