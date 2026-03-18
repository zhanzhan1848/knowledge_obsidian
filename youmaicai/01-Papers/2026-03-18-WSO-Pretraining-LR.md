# Pre-training LLM without Learning Rate Decay Enhances Supervised Fine-Tuning

## 元信息
| 项目 | 内容 |
|------|------|
| **标题** | Pre-training LLM without Learning Rate Decay Enhances Supervised Fine-Tuning |
| **作者** | Kazuki Yano, Shun Kiyono, Sosuke Kobayashi, Sho Takase, Jun Suzuki |
| **链接** | [arXiv:2603.16127](https://arxiv.org/abs/2603.16127) |
| **arXiv** | arXiv:2603.16127v1 |
| **分类** | cs.CL, cs.LG |
| **会议** | ICLR 2026 (Accepted) |
| **日期** | 2026-03-17 |

## 核心贡献

1. **WSO 调度器**: Warmup-Stable-Only，预热后保持恒定学习率
2. **反直觉发现**: 不衰减学习率的预训练模型在 SFT 后表现更好
3. **损失地形分析**: 揭示了平坦最小值与适应性的关系

## 问题背景

### 传统观点

**学习率衰减 (LR Decay) 是标配**:
```
Warmup → 峰值 LR → 衰减到接近 0
```

**理由**: 最小化预训练损失

### 本研究的质疑

> 预训练损失最低 ≠ 下游任务性能最好

**关键问题**: LR Decay 如何影响 SFT 后的性能？

## WSO (Warmup-Stable-Only) 调度器

### 对比传统调度器

```
传统 Decay 调度器:
LR
 ↑
 │    ╱‾╲
 │   ╱   ╲
 │  ╱     ╲
 │ ╱       ╲____
 │╱             ╲___
 └──────────────────→ Steps

WSO 调度器:
LR
 ↑
 │    ╱‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
 │   ╱
 │  ╱
 │ ╱
 │╱
 └──────────────────→ Steps
```

### WSO 定义

```python
def wso_scheduler(step, warmup_steps, peak_lr):
    if step < warmup_steps:
        # Warmup phase
        return peak_lr * step / warmup_steps
    else:
        # Stable phase (no decay!)
        return peak_lr
```

## 实验结果

### 模型规模

- **1B 参数模型**
- **8B 参数模型**

### 关键发现

| 调度器 | 预训练损失 | SFT 后性能 |
|--------|-----------|-----------|
| Decay | **更低** ✅ | 较差 |
| **WSO** | 较高 | **更好** ✅ |

**反直觉**: 预训练损失更高的模型，SFT 后反而更强！

### 训练阶段影响

测试了不同训练阶段:
- **Mid-training**: WSO 仍优
- **Over-training**: WSO 仍优

**结论**: 结果在不同训练 regime 下都成立

## 损失地形分析

### 核心洞察

**平坦最小值 vs 尖锐最小值**

```
损失地形示意:

尖锐最小值 (Decay 调度器):
Loss
 ↑
 │    ╱╲
 │   ╱  ╲
 │  ╱    ╲
 │ ╱      ╲
 │╱        ╲
 └──────────→ 参数空间

平坦最小值 (WSO 调度器):
Loss
 ↑
 │    ╱‾‾‾╲
 │   ╱     ╲
 │  ╱       ╲
 │ ╱         ╲
 │╱           ╲
 └─────────────→ 参数空间
```

### 理论解释

1. **Decay 调度器** → 尖锐最小值
   - 过度拟合预训练数据
   - 参数空间中"卡"在狭窄的低谷
   - 难以适应新任务

2. **WSO 调度器** → 平坦最小值
   - 保持在更宽的"高原"
   - 参数有更多自由度
   - 更容易适应下游任务

### 数学直觉

平坦最小值的优势:
```
对于小扰动 ε:
- 尖锐最小值: L(θ + ε) >> L(θ)  # 损失剧增
- 平坦最小值: L(θ + ε) ≈ L(θ)   # 损失稳定

SFT 时:
- 尖锐: 参数微调导致损失剧增，难以优化
- 平坦: 参数有调整空间，易于适应
```

## 实用指导

### 训练策略建议

**如果目标是下游任务性能**:
```python
# 推荐: WSO 调度器
scheduler = WarmupStableOnly(
    warmup_steps=2000,
    peak_lr=1e-4
)
```

**如果只看预训练指标**:
- Decay 可能看起来更好
- 但实际部署可能不如 WSO

### 模型发布策略

**两种检查点**:
1. **预训练最佳** (Decay 末期): 预训练损失最低
2. **SFT 最佳** (WSO): 下游性能更好

**建议**: 发布 WSO 预训练的模型给社区

## 与现有工作的关系

### 相关研究

- **Sharp vs Flat Minima**: 经典泛化理论
- **Learning Rate Scheduling**: 调度器设计
- **Pre-training to Fine-tuning**: 迁移学习

### 本研究的独特性

首次系统研究:
- LR Decay 对 **SFT 后性能** 的影响
- 损失地形与适应性的关系

## 局限性

- 仅测试了 1B 和 8B 模型
- 未测试超大规模 (100B+)
- SFT 任务类型可能影响结论

## 实验复现

### 推荐配置

```yaml
# WSO 配置
learning_rate: 1e-4
warmup_steps: 2000
scheduler: warmup_stable_only

# 训练
total_steps: 100000
batch_size: 2048
```

### 评估

```python
# 1. 预训练评估
pretrain_loss = evaluate_on_pretrain_data(model)

# 2. SFT
sft_model = supervised_finetune(model, sft_data)

# 3. 下游任务评估
downstream_score = evaluate_on_benchmarks(sft_model)

# 预期: WSO 的 downstream_score > Decay 的
```

## 相关概念

- [[Learning Rate Scheduling]]
- [[Sharp vs Flat Minima]]
- [[Transfer Learning]]
- [[Generalization Theory]]
- [[Pre-training Strategies]]

## 个人笔记

这篇论文挑战了一个"理所当然"的做法。LR Decay 被广泛使用，但很少有人质疑它对下游任务的影响。

核心洞察非常深刻：**优化目标 ≠ 最终目标**。预训练损失最低不代表实用性最强。平坦最小值提供更好的适应性，这是一个重要的理论贡献。

实用建议：
- 发布模型前考虑使用 WSO
- 评估模型时看下游性能，不只看预训练损失
- 可能需要重新审视其他"标准做法"

ICLR 2026 接收，说明社区开始重视这类"反直觉但重要"的研究。

---
#Pretraining #LearningRate #SFT #ICLR2026 #Optimization
