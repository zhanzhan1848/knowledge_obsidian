# Uncertainty-Aware Generation and Decision-Making Under Ambiguity

## 元信息
| 标题 | Uncertainty-Aware Generation and Decision-Making Under Ambiguity |
|------|------|
| 作者 | Nico Daheim et al. (UKPLab) |
| 链接 | [原文](https://arxiv.org/abs/2606.30578) |
| arXiv | arXiv:2606.30578 [cs.CL/cs.LG] |
| 代码 | [GitHub](https://github.com/UKPLab/arXiv2026-uncertainty-aware) |
| 类别 | LLM Decision-Making, Uncertainty Quantification, Conformal Prediction |

## 核心贡献
1. **研究空白**：LLM 决策算法（decision-making algorithms）研究不足；现有工作关注训练更好的模型，但忽视决策算法
2. **方法**：将**贝叶斯决策理论**和**风险厌恶决策**应用于 LLM 生成的 tutoring 和 automatic peer reviewing 任务
3. **Conformal Prediction**：对 tutoring strategies 和 review scores 使用 CP 提供 guarantees
4. **关键发现**：
   - Uncertainty-aware 算法能提升 generation utility
   - 但高模糊性场景下需谨慎实现（risk-averse rules 可能降级性能）
   - 贝叶斯方法通常表现更好

## 决策框架
```python
# 伪代码：Uncertainty-aware tutoring
uncertainty = compute_ensemble_disagreement(responses)
if uncertainty < threshold:
    strategy = "confident_generation"
else:
    strategy = risk_averse_selection()  # Bayesian or conformal
```

## 应用场景
- **Tutoring**: 生成教学回复时考虑策略不确定性
- **Peer Reviewing**: 生成评审意见时考虑评分不确定性

## 局限性
- 仅测试 tutoring 和 peer reviewing 两个任务
- Conformal prediction 在高维生成任务上效果有限

## 建议
- **适用场景**：需要高可信度输出的 LLM 应用（教育、评审、医疗建议）
- **推荐指数**: ⭐⭐⭐⭐
- **亮点**：首个系统研究 LLM 不确定性感知决策的工作之一

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30578
- HTML: https://arxiv.org/html/2606.30578v1
