# When Does LLM Self-Correction Help? A Control-Theoretic Markov Diagnostic

## 元信息
| 标题 | When Does LLM Self-Correction Help? A Control-Theoretic Markov Diagnostic and Verify-First Intervention |
|------|-------|
| 作者 | Jingxiang Meng et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.22273) |
| arXiv | arXiv:2604.22273 |
| 分类 | cs.AI |

## 核心贡献

1. **控制理论框架**: 将自校正建模为控制论反馈循环，同一语言模型同时作为控制器和被控对象
2. **双态马尔可夫诊断**: 使用 {Correct, Incorrect} 两状态马尔可夫模型，导出部署诊断准则：仅当 ECR/EIR > Acc/(1 - Acc) 时迭代
3. **EIR 阈值发现**: 发现 EIR（错误反转率）近零阈值（≤0.5%）分隔有益与有害自校正

## 关键公式

```
迭代条件：ECR/EIR > Acc/(1 - Acc)
其中 EIR 作为稳定性裕度，prompt 作为轻量级控制器设计
```

## 实验结果

### 自校正有益模型
| 模型 | 提升 | EIR |
|------|------|-----|
| o3-mini | +3.4 pp | 0% |
| Claude Opus 4.6 | +0.6 pp | ~0.2% |
| o4-mini | ±0 pp | - |

### 自校正有害模型
| 模型 | 下降 |
|------|------|
| GPT-5 | -1.8 pp |

### Verify-First Prompt 消融
- GPT-4o-mini: EIR 从 2% 降至 0%，-6.2 pp 降至 +0.2 pp（McNemar p < 10^-4）
- ASC 停止有害精炼但有 3.8 pp 置信度获取成本

## 核心发现

1. **EIR 阈值关键**: 仅当 EIR ≤ 0.5% 时自校正有益
2. **自校正非默认行为**: 应作为控制决策而非默认行为
3. **Verify-First 干预**: 通过 prompt 可将 EIR 降至阈值以下
4. **ASC 的权衡**: 停止有害精炼但有置信度获取成本

## 建议
- **适用场景**: Agentic LLM 系统中的自校正决策
- **推荐指数**: ⭐⭐⭐⭐⭐ (实践性强，直接影响系统设计)
