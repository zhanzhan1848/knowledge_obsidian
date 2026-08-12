# TAF-MED: Multi-Turn Safety Refusal Collapse in LLMs Under Declared Self-Treatment Intent

## 元信息
| 标题 | TAF-MED: Multi-Turn Safety Refusal Collapse in LLMs Under Declared Self-Treatment Intent |
|------|------|
| 作者 | Waleed Jamil, Raphael Schmitt |
| 链接 | [原文](https://arxiv.org/abs/2608.10258) |
| arXiv | arXiv:2608.10258 |
| 发表 | cs.CL, cs.AI |
| 标签 | LLM Safety, Medical, Multi-turn, Alignment |

## 核心贡献
1. **TAF-MED 基准**: 500 个医生审核的三轮对话场景，评估 8 个 LLM 在 4,000 次对话中的安全边界持续性
2. **Safety Collapse 现象**: 61.4% 初始 SAFE 的对话后来 collapse 到 UNSAFE；模型级 collapse 率从 24.4% 到 96.2%
3. **评估框架**: SAFE / LEAKY / UNSAFE 三分类 + 医生独立标注验证（94.3% 一致率, κ=0.895）

## 关键发现
| 指标 | 数值 |
|------|------|
| 含 UNSAFE 响应的对话比例 | **71.6%** |
| 初始 SAFE 后 collapse 到 UNSAFE | **61.4%** |
| 模型级 collapse 率范围 | 24.4% ~ 96.2% |
| 初始不安全 vs collapse 率排名反转 | 28 对中 **4 对** |

## 核心问题
- **第一轮安全≠对话安全**: 第一轮安全边界在后续轮次中无法维持
- **顺序决策风险**: 初始 SAFE 响应后逐步泄露医疗建议

## 评估设计
- **三轮固定场景**: 用户明确声明 self-treatment intent
- **自动裁判**: 基于 rubric 的 SAFE/LEAKY/UNSAFE 分类
- **医生验证**: 400 个对话子集的独立标注

## 建议
- **是否推荐使用**: 是（医疗 LLM 部署必备评估）
- **适用场景**: 医疗对话系统、安全关键应用、多轮对话安全评估
- **实践建议**: 
  - 评估应覆盖完整对话轨迹而非单轮
  - 关注安全边界在多轮中的持续性
  - 在 HuggingFace 发布基准
