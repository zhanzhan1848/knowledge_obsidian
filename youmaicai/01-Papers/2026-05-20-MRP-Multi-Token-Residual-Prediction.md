# Multi-Token Residual Prediction

## 元信息
| 标题 | Multi-Token Residual Prediction |
|------|-----|
| 作者 | Yufeng Xu, Zishuo Bao, Qian Wang, Zeshen Zhang, Haoqi Zhang, Bowen Peng, Ang Li, Rahul Chalamala, Yucheng Lu |
| 链接 | [原文](https://arxiv.org/abs/2605.18817) |
| arXiv | arXiv:2605.18817 |
| 发表 | 2026-05-12 |
| 代码 | - |

## 核心贡献

1. **问题**: Diffusion Language Models (DLMs) 在每步去噪中可解码多个 token，但质量随每步解码数量增加而下降

2. **MRP 模块**: Multi-Token Residual Prediction，在单次前向传播中启用依赖感知的multi-token 去噪

3. **关键洞察**: 相邻去噪步骤的 logit 分布非常相似，MRP 预测步骤间的残差而非运行第二次 backbone

4. **双重解码模式**: direct decoding (可调质量-速度权衡) 和 speculative decoding (无损加速)

## 模型架构

### 背景: Diffusion Language Models

DLMs 通过迭代去噪 masked token 序列生成文本，相比自回归模型在并行性和质量之间存在权衡

### MRP 方法

**核心观察**: 相邻去噪步骤的 logit 分布 $p(x_{t-1}|x_t)$ 和 $p(x_{t-2}|x_{t-1})$ 非常相似

**MRP 模块**: 从 backbone 的隐藏状态预测步骤间的残差:
$$\hat{p}(x_{t-1}|x_t) = p(x_{t-1}|x_t) + \text{MLP}(h_t)$$

### 两种推理模式

#### Direct Decoding
使用校正后的 logit 而无需验证，实现可调质量-速度权衡

#### Speculative Decoding
用 MRP 提议，backbone 验证，实现无损加速

## 实验结果

### SDAR 模型实验 (1.7B, 4B, 8B)

| 模型规模 | 基准 | MRP 加速 | 任务 |
|---------|------|---------|-----|
| 1.7B | SGLang baseline | 1.42× | Reasoning |
| 4B | SGLang baseline | 1.42× | Reasoning |
| 8B | SGLang baseline | 1.42× | Reasoning |

### 推理和代码生成基准

在 reasoning 和 code generation benchmarks 上验证，提升均达到 1.42× 无损加速

## 关键公式

### MRP 预测
$$\hat{p}(x_{t-1}|x_t) = p(x_{t-1}|x_t) + \text{ResidualPrediction}(h_t)$$

其中 $h_t$ 是 backbone 在步骤 $t$ 的隐藏状态

## 局限性

1. 主要验证 SDAR 模型架构
2. 其他 diffusion language models 的泛化性待验证

## 建议

- **是否推荐使用**: 是 (对于使用 diffusion language models 的场景)
- **适用场景**: LLM 推理加速，特别是 SDAR 等 diffusion-based 模型

---

标签: #Diffusion-Language-Models #Inference-Acceleration #Speculative-Decoding #MRP