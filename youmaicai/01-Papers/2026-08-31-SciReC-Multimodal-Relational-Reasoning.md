# SciReC: Diagnostic Evaluation of Multimodal, Multi-Turn Relational Reasoning with Adaptive Interaction

## 元信息
| 标题 | SciReC: Diagnostic Evaluation of Multimodal, Multi-Turn Relational Reasoning with Adaptive Interaction |
|------|------|
| 作者 | Nilay Yilmaz, Naga Sai Abhiram Kusumba, Stella Wenxing Liu, Yezhou Yang |
| 链接 | [原文](https://arxiv.org/abs/2608.27461) |
| arXiv | arXiv:2608.27461 |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. 提出 **SciReC**: 模型自适应的多模态学术对话 benchmark，评估关系推理能力
2. 提出 **DMRA**: 基于 deficit 的诊断框架，量化视觉理解、知识展示、记忆recall对关系推理的贡献
3. 系统性揭示不同模型在关系推理各类别（类比、结构、因果）上的差异化表现

## 关系推理类型
- **类比推理 (Analogical)**: 概念间的映射关系
- **结构推理 (Structural)**: 概念内部结构关系
- **因果推理 (Cause-Effect)**: 事件间的因果关系

## DMRA 诊断框架
```
DMRA = Deficit-based Multi-component Relational Analysis

对每次失败案例分解为:
1. 视觉理解缺陷 (visual understanding deficit)
2. 知识展示缺陷 (exhibiting knowledge deficit)  
3. 记忆recall缺陷 (memory recall deficit)

量化各组件对最终失败的贡献比例
```

## 实验结果
| 模型 | 总体关系得分 |
|------|-------------|
| Claude 4.6 | **73%** |
| GPT 5.4 | 68% |

### 开源模型特点
- 空间关系得分最低
- 整体落后于闭源模型

### 闭源模型特点
- 分层关系和顺序关系更困难
- 在 Astronomy 领域表现最差，Psychology 最好

### DMRA 分析结论
- **关系推理本身**是所有模型的首要错误来源
- 记忆限制是第二大错误来源

## 建议
- **是否推荐使用**: 是（benchmark + 诊断框架）
- **适用场景**: 多模态模型评估、关系推理研究

---
*关键词*: 多模态LLM, 关系推理, benchmark, 诊断框架, 学术对话
*研究领域*: cs.CL, cs.AI, cs.LG
