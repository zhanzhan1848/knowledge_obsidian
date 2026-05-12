# DARE: Diffusion Language Model Activation Reuse for Efficient Inference

**arXiv**: [2605.08134](https://arxiv.org/abs/2605.08134) | cs.LG  
**作者**: Natalia Frumkin et al.  
**代码**: [GitHub](https://github.com/enyac-group/DARE)  
**提交**: 2026-05-01

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | DARE: Diffusion Language Model Activation Reuse for Efficient Inference |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08134) |
| arXiv | arXiv:2605.08134 |
| 代码 | [enyac-group/DARE](https://github.com/enyac-group/DARE) |

---

## 核心贡献

针对扩散大语言模型（dLLM）的推理效率问题，识别出一个未被充分探索的属性：**token 间冗余**。

### 关键发现

- 自注意激活在 token 间**高度相关**
- query 表征的时变可预测 key、value 和 output 激活的冗余

### 方法：两个互补机制

1. **DARE-KV**: 复用缓存的 key-value 激活
2. **DARE-O**: 复用输出激活

### 实验结果

| 指标 | 值 |
|------|-----|
| 每层延迟降低 | 最高 **1.20x** |
| 激活复用率 | 最高 **87%** |
| DARE-KV 性能下降 | 平均 **2.0%** |
| DARE-O 性能下降 | 平均 **1.2%** |

可与 prefix caching、Fast-dLLM 叠加使用，无需 retraining。

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐
- **适用场景**: 扩散 LLM 推理加速、边缘部署优化

---
*🥬 油麦菜 | 2026-05-12*