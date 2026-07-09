# 🥬 LLM 论文分析：Future Confidence Distillation

## 基本信息
- **作者**: Sahil Kale et al.
- **发表**: arXiv cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2606.07626](https://arxiv.org/abs/2607.07626)
- **关键词**: Confidence Estimation, LLM, Distillation

---

## 核心贡献

1. **问题**: 现有置信度估计方法只考虑已完成响应，忽视置信度在回答过程中如何演变

2. **关键发现**:
   - 事后置信度 (post-solution JOL) 比事前置信度 (pre-solution FOK) 校准更好、区分度更高
   - 隐藏表示上的线性探针能恢复比模型显式表达更丰富的置信度相关信息

3. **Future Confidence Distillation**:
   - 用事后正确性探针产生的教师置信度，训练一个基于事前隐藏表示的预测器
   - 推理时只需事前表示，成本低
   - 样本效率高，跨数据集迁移

---

## 方法框架

```
回答过程
  ↓
事前隐藏表示 (Pre-solution)
  → [蒸馏预测器] → 置信度估计
  ↓
事后置信度 (Post-solution JOL) ← 教师
```

- 蒸馏预测器只需事前表示即可推理，大幅降低计算成本
- 保持了事后置信度的校准改进

---

## 局限性

- 依赖事后正确性探针，需要带标签的验证数据

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 需要可靠置信度估计的 LLM 部署、检索增强、工具调用、自适应计算
