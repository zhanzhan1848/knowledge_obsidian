# LayerBoost: Layer-Aware Attention Reduction for Efficient LLMs

## 元信息
| 标题 | LayerBoost: Layer-Aware Attention Reduction for Efficient LLMs |
|------|-------|
| 作者 | Mohamed Ali Souibgui et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.22050) |
| arXiv | arXiv:2604.22050 |
| 分类 | cs.LG, cs.CL |

## 核心贡献

1. **LayerBoost**: 层感知注意力削减方法，根据单个 transformer 层的敏感性选择性修改注意力机制
2. **三策略框架**:
   - 高敏感层：保留标准 softmax 注意力
   - 中敏感层：替换为线性滑动窗口注意力
   - 低敏感层：完全移除注意力
3. **轻量级蒸馏恢复**: 仅需 10M 额外训练 tokens 即可恢复性能

## 性能结果

| 指标 | 提升 |
|------|------|
| 推理延迟降低 | 最高 68% |
| 高并发吞吐量 | 大幅提升 |
| 质量保持 | 与 base model 持平 |

## 方法流程

```
1. 预训练模型敏感性分析
        ↓
2. 分层策略应用：
   - 高敏感 → softmax attention
   - 中敏感 → linear sliding window
   - 低敏感 → remove attention
        ↓
3. 轻量级蒸馏愈合（10M tokens）
```

## 与 SOTA 对比

- 匹配 base model 性能
- 多数基准仅轻微下降
- 显著优于现有注意力线性化方法

## 建议
- **适用场景**: LLM 高效推理、硬件受限部署、高并发服务
- **推荐指数**: ⭐⭐⭐⭐ (工程实用性强的效率优化工作)
