# BiCoT: Chain-of-Thought Watermarking via Robust Subspace Registration

## 元信息
| 标题 | Echoes within the Reasoning: Stealthy and Effective Watermarking via Chain of Thought |
|------|------|
| 作者 | Jiacheng Lu |
| 链接 | [原文](https://arxiv.org/abs/2605.28890) |
| arXiv | arXiv:2605.28890 |
| 发表 | 2026-05-27 (v1) |
| 会议 | **ICML 2026** |
| 领域 | cs.CR, cs.LG |

## 核心贡献

1. **BiCoT Framework**: 将所有权信号嵌入推理轨迹的内在几何结构
2. **High-saliency Structural Anchors**: 对齐高显著性结构锚点与私有签名子空间
3. **Regularization**: 规则化普通控制 token 保持语义容量

## 方法论

### 核心设计
- watermark 与推理相关表征耦合
- 移除 watermark 会破坏支持连贯推理的特征

### Robust Subspace Registration (RSR)
- Top-logprob-based 黑盒验证器
- 使用 sentinel tokens 校准输出分布的系统性偏移
- 可在模型盗窃和表征漂移下验证

## 实验

### 攻击场景
- Fine-tuning
- Quantization
- Model-level perturbations
- Adaptive output-level attacks

### 性能
- 保持推理保真度
- 跨域和 OOD 设置的鲁棒检测

## 关键词
#Watermarking #Chain-of-Thought #IP-Protection #Security #Reasoning