# Dense Supervision Is Not Enough: The Readout Blind Spot in Looped Language Models

## 元信息

| 标题 | Dense Supervision Is Not Enough: The Readout Blind Spot in Looped Language Models |
|------|-------|
| 作者 | Rituraj Sharma, Tu Vu |
| 链接 | [原文](https://arxiv.org/abs/2606.24898) |
| arXiv | arXiv:2606.24898 |
| 类别 | cs.LG, cs.AI |
| 发表 | 2026-06-12 |

## 核心贡献

1. **Readout Blind Spot 问题**：在 looped language models 中，dense per-loop cross-entropy 只控制 readout 暴露的状态变量，不控制循环转换中活跃的所有变量
2. **Scale-invariant readouts 的失败模式**：RMSNorm/LayerNorm 隐藏了径向 scale，但 pre-norm 残差循环继续携带和更新同一 scale
3. **设计规则**：Dense supervision trains exits； recurrent scale control 需要让 scale 对 loss 可见，或从循环中移除 scale
4. **实验验证**：44M 和 129M looped transformers，scale-controlled 变体在可变深度基准上实现更低困惑度

## 问题背景

**Looped language models**: 将 hidden states 转为 runtime state，每个状态用于预测并反馈到未来计算。

**核心问题**: cross-entropy 实际上控制的是什么？

## 方法

### 问题分析
```
循环: hidden_state → decode → output → hidden_state (next step)
```

- Per-loop cross-entropy 通过 RMSNorm readout 控制的是 readout 暴露的变量
- 但循环转换中还有其他变量（如 recurrent scale）未被控制
- Scale-invariant readouts（LayerNorm/RMSNorm）隐藏了径向 scale
- Pre-norm residual recurrence 继续携带和更新 scale

### 失败模式
无 inter-loop normalization 时：
- 最终 hidden-state norms 达到 thousands 或 tens of thousands
- Per-loop loss 可使 early exits 可用，但未控制 recurrent scale

### 解决方案
1. **Scale-visible readouts**: 让 readout 能看到 scale
2. **Explicit norm penalties**: 显式正则化
3. **Scale-removing recurrence**: 从循环中移除 scale（架构修改）

## 实验结果

| 模型规模 | 方法 | Norm 范围 |
|---------|------|----------|
| 44M / 129M | 无 inter-loop norm | thousands/tens of thousands |
| 44M / 129M | Scale-visible + norm penalties | tens (正常范围) |

Scale-controlled 变体在 matched inference-depth 下实现更低困惑度。

## 局限性

- 只在 44M 和 129M 模型上验证，大规模模型待测
- 主要关注语言建模任务，其他任务泛化性未知
- Readout 设计的工程复杂度增加

## 建议

- **是否推荐使用**：是（重要架构洞察）
- **适用场景**：循环语言模型设计；RNN/SSM 架构研究；early exit 机制设计
- **备注**：对 looped/recurrent transformer 架构的设计有直接指导意义，特别是 early exit 机制