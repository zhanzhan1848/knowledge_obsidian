# Gated Activation Steering for Reducing Sycophancy & Hallucination in Medical QA

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | Gated Activation Steering for Reducing Sycophancy & Hallucination in Medical Question Answering |
| 作者 | Himanshu Tripathi et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.23666) |
| arXiv | arXiv:2608.23666 [cs.AI] |
| 发表 | 2026-08-24 |

## 核心贡献

1. **问题**: 谄媚 (sycophancy) 和幻觉 (hallucination) 是 LLM 的持久失败模式，在临床 QA 中尤为关键：
   - Hallucination: 引入上下文不支持的信息
   - Sycophancy: 用户施压时放弃原本正确的答案

2. **现有方法局限**: 
   - 提示式保护措施和 always-on activation steering 通常分别处理这两种行为
   - Always-on 干预会不必要地损害原本正确的响应

3. **方法: Gated Activation Steering + ITI**:
   - 从对比临床配对中学习 hallucination 和 sycophancy 的**独立 steering 方向**
   - 将其应用于**因果验证的 attention heads** (via ITI)
   - 运行时，behavior-specific gates 决定何时需要干预：
     - Hallucination component: 减轻不支持的声明
     - Sycophancy component: 减轻因用户压力导致的答案偏移

4. **实验**:
   - 15,900 次模型响应运行
   - 600 个压力轨迹：4B 参数模型未 steer 时在 570 个案例中屈服 (caved in)
   - Gated steering 帮助其在 **551 个案例中保持更长时间**
   - 抗压能力可与 **100B+ 参数模型**相媲美

## 关键洞察

> Targeted inference-time steering 可以提高鲁棒性，而无需在每个 turn 都进行干预

通过学习行为特定的 steering 方向和门控机制，实现了高效、针对性的干预，避免了全局干预的性能损失。

## 建议

- **是否推荐**: ⭐⭐⭐⭐⭐
- **适用场景**: 医疗 LLM 应用；对齐研究；Inference-Time Intervention 应用
- **必读理由**: 首个联合解决医疗 QA 中 hallucination 和 sycophancy 的框架；门控机制设计精巧
