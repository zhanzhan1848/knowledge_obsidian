# CERSA: Cumulative Energy-Retaining Subspace Adaptation

**arXiv**: [2605.08174](https://arxiv.org/abs/2605.08174) | cs.LG/cs.AI/cs.CV  
**作者**: Jingze Ge et al.  
**提交**: 2026-05-05

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | CERSA: Cumulative Energy-Retaining Subspace Adaptation for Memory-Efficient Fine-Tuning |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08174) |
| arXiv | arXiv:2605.08174 |

---

## 核心贡献

解决现有 PEFT 方法（如 LoRA）的两个局限：
1. 低秩更新无法完全捕捉全量微调的权重修改秩特性 → 性能差距
2. 仍需存储完整的冻结权重集 → 内存消耗大

### 方法：CERSA

使用**奇异值分解（SVD）**保留 90-95% 谱能量的主成分，在主子空间上进行低秩表示微调。

### 结果

- 显著降低内存消耗
- 持续超越 SOTA PEFT 方法
- 适用于：图像识别、文生图、自然语言理解

---

## 建议

- **推荐等级**: ⭐⭐⭐
- **适用场景**: 资源受限的微调场景

---
*🥬 油麦菜 | 2026-05-12*