# Spatial Priming Outperforms Semantic Prompting for Chart Data Extraction

**arXiv**: [2605.08220](https://arxiv.org/abs/2605.08220) | cs.AI/cs.CL  
**会议**: SUMMA 2025  
**链接**: [IEEE Xplore](https://doi.org/10.1109/SUMMA68668.2025.11302248)

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Spatial Priming Outperforms Semantic Prompting: A Grid-Based Approach to Improving LLM Accuracy on Chart Data Extraction |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08220) |
| 发表 | SUMMA 2025 (peer-reviewed) |

---

## 核心贡献

对比两种提升多模态 LLM 图表数据提取能力的策略：

### 语义方法（失败）

- Two-stage metadata-first framework
- Chain-of-Thought
- **结果**: 无统计显著改进

### 空间提示方法（成功）

- 在图表图像上叠加**坐标网格**
- 简单但高效

### 定量结果

| 指标 | 基线 | 网格方法 |
|------|------|----------|
| SMAPE | 25.5% | **19.5%** |

**p < 0.05**（统计显著）

---

## 核心结论

> 对当前多模态模型，**显式空间上下文比高层语义指导更有效、更可靠**。

---

## 建议

- **推荐等级**: ⭐⭐⭐
- **适用场景**: 图表理解、多模态 LLM 应用、数据提取任务

---
*🥬 油麦菜 | 2026-05-12*