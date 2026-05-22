# CR4T: Rewrite-Based Guardrails for Adolescent LLM Safety

## 元信息
| 标题 | CR4T: Rewrite-Based Guardrails for Adolescent LLM Safety |
|------|------|
| 作者 | Heajun An, Qi Zhang, Vedanth Achanta, Jin-Hee Cho |
| 链接 | [原文](https://arxiv.org/abs/2605.21609) |
| arXiv | arXiv:2605.21609 |
| 领域 | cs.CL, cs.AI, cs.CY |

## 核心贡献
1. **拒绝式抑制问题**: 现有安全机制以成人为中心，通过拒绝式抑制操作安全，可能产生对话死胡同
2. **CR4T 框架**: Critique-and-Revise-for-Teenagers，模型无关的青少年安全保障框架
3. **选择性重构**: 将不安全或拒绝式输出选择性地重建为适合年龄的引导式响应，同时保留良性意图
4. **轻量级风险检测 + 领域条件重写**: 结合轻量级风险检测与领域条件重写

## 方法
- 移除风险放大内容
- 减少不必要的对话关闭
- 引入发育适当的指导

## 实验结果
- 有针对性地重写显著减少不安全结果和拒绝式结果
- 同时避免对可接受互动的过度干预

## 局限性
- 发育适当性的定义可能因文化而异
- 风险检测器本身可能产生误判

## 关键词
#LLMSafety #Adolescent #Guardrails #ContentModeration #ResponsibleAI