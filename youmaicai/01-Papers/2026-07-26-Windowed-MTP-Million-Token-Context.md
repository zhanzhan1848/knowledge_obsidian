# Windowed-MTP: Removing the Full-Context Draft-KV Tax at Million-Token Context

## 元信息
| 标题 | Windowed-MTP: Removing the Full-Context Draft-KV Tax at Million-Token Context |
|------|------|
| 作者 | Alagappan Valliappan |
| 链接 | [原文](https://arxiv.org/abs/2607.21535) |
| arXiv | arXiv:2607.21535 |
| 领域 | cs.LG, cs.CL, cs.PF |

## 核心贡献
1. **问题识别**：在百万token上下文时，MTP draft head对整个KV cache运行全注意力的成本线性增长
2. **Windowed-MTP解决方案**：对draft的注意力应用StreamingLLM风格滑动窗口+attention sink，保持完整注意力验证不变
3. **训练无关**：无需训练，即插即用，无损设计
4. **KV占用降低**：在1M上下文时减少约99%的KV条目

## 方法
- **核心思想**：对draft的注意力使用滑动窗口，保留attention sink机制
- **保持完整注意力验证**：确保full-attention target仍然决定每个接受的token
- **环形缓冲区**：回收未读的draft KV（1M时占总量7.7-11%）

## 实验结果
### 测试架构
- Qwen GDN-MoE 35B/122B
- Mamba2-hybrid NoPE 120B

### 性能提升
- 单GPU在SGLang中1M上下文：
  - 每解码步成本降低28%-44%
  - 端到端解码延迟改善相同幅度
  - 部分情况下接受率也提升

## 技术细节
- **StreamingLLM**：滑动窗口 + attention sink
- **Ring Buffer**：compact设计回收未读draft KV
- **线性注意力目标**：效果更明显

## 局限性
- 主要针对特定架构
- 需要在实际部署中进一步验证

## 相关工作
- Speculative Decoding
- Multi-Token Prediction
- StreamingLLM
- KV Cache优化

## 标签
#LLM #推理优化 #speculative-decoding #MTP #KV-cache #长上下文
