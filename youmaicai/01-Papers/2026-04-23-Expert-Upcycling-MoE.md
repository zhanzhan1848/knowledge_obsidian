# Expert Upcycling: Shifting the Compute-Efficient Frontier of MoE

## 元信息
| 标题 | Expert Upcycling: Shifting the Compute-Efficient Frontier of Mixture-of-Experts |
|---|---|
| 作者 | Chaitanya Dwivedi, Binxuan Huang, Himanshu Gupta, Pratik Jayarao, Neeraj Varshney, Bing Yin |
| 链接 | [原文](https://arxiv.org/abs/2604.19835) |
| arXiv | arXiv:2604.19835 |
| 代码 | - |

## 核心贡献

1. **Expert Upcycling**：在持续预训练（CPT）期间通过增加专家数量渐进扩展 MoE 容量
2. **Upcycling Operator**：给定 E-expert 模型，构造 mE-expert 模型
   - Expert duplication
   - Router extension
   - 保持 top-K 路由固定，保留 per-token 推理成本

3. **理论框架**：将质量差距分解为 capacity term + initialization term
4. **Utility-based Expert Selection**：使用梯度重要性分数指导非均匀复制

## 方法

```
E-expert 模型 → Upcycling Operator → mE-expert 模型
     ↓
Expert duplication → Warm initialization
     ↓
CPT → Break symmetry → 驱动 specialization
```

## 实验结果

| 配置 | 结果 |
|------|------|
| 7B-13B 总参数实验 | 与固定大小基线匹配（验证损失） |
| GPU hours 节省 | 32% |

## 关键结论

- Upcycled 模型匹配固定大小基线验证损失，同时节省 32% GPU hours
- 提供计算高效的 MoE 扩展替代方案

## 建议

- **是否推荐使用**：是
- **适用场景**：MoE 训练优化、模型扩展、计算效率优化

---
**归档日期**：2026-04-23
**搜索关键词**：Mixture-of-Experts, MoE, model training, continued pre-training