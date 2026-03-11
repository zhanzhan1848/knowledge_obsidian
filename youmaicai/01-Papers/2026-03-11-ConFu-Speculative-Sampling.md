# ConFu: Contemplate the Future for Better Speculative Sampling

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | ConFu: Contemplate the Future for Better Speculative Sampling |
| 作者 | Zongyue Qin, Raghavv Goel, Mukul Gagrani, Risheek Garrepalli, Mingu Lee, Yizhou Sun |
| 链接 | [原文](https://arxiv.org/abs/2603.08899) |
| arXiv | arXiv:2603.08899 |
| 类别 | cs.CL |
| 发表时间 | 2026-03-09 |
| 会议 | ICLR 2026 Workshop on Latent & Implicit Thinking |

## 核心贡献
1. **ConFu框架**: 首个让draft模型能够"展望未来"的推测解码框架
2. **三大创新机制**:
   - Contemplate tokens + soft prompts (低成本获取未来信号)
   - 动态contemplate token机制 + MoE (上下文感知未来预测)
   - Anchor token采样 + 未来预测复制的训练框架
3. **连续推理token桥接**: 首次将推测解码与连续推理token连接

## 问题背景
### 推测解码
- 使用轻量draft模型提议候选token
- 目标模型验证
- 现有限制: draft模型仅基于当前前缀，导致误差累积

### EAGLE系列的问题
- 仅condition on当前prefix
- 预测随步骤漂移

## ConFu架构
```text
1. Contemplate Tokens: 允许draft模型利用目标模型的未来导向信号
2. Dynamic MoE: 上下文感知的未来预测
3. Training Framework:
   - Anchor token sampling
   - Future prediction replication
```

## 实验结果
- **Token接受率**: 提升 8-11% (vs EAGLE-3)
- **生成速度**: 提升 8-11% (vs EAGLE-3)
- 模型: Llama-3 3B, 8B
- 下游任务: 多任务验证

## 关键创新
- 首次将推测解码与连续推理token桥接
- 为LLM推理加速提供新方向

## 适用场景
- LLM推理加速
- 低延迟生成场景
- 大规模部署优化

## 相关工作
- [[Speculative Decoding]] - 推测解码
- [[EAGLE]] - EAGLE系列
- [[LLM Inference]] - LLM推理优化

---
#Speculative-Decoding #LLM-Inference #Acceleration #ConFu
