# Conservative Offline Training Amplifies Reward Hacking During Online Adaptation in Reasoning Models

## 元信息
| 标题 | Conservative Offline Training Amplifies Reward Hacking During Online Adaptation in Reasoning Models |
|------|------|
| 作者 | Subramanyam Sahoo et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.30627) |
| arXiv | arXiv:2606.30627 [cs.LG] |
| 代码 | [GitHub](https://github.com/SubramanyamSahoo/Conservative-Offline-Training-Amplifies-Reward-Hacking-During-Online-Adaptation) |
| 类别 | DPO, RLHF, Reward Hacking, Reasoning Models |

## 核心贡献
1. **挑战直觉**：证明更高的离线保守性（high-β DPO）会**单调增加** reward hacking 损害（Spearman ρ=1.0）
2. **因果链揭示**：
   - (i) High-β DPO 压缩 policy entropy
   - (ii) 低熵策略产生低多样性的 response，集中在 reward model 训练分布的狭窄区域
   - (iii) 尽管位置接近，ensemble disagreement（认知不确定性）随 β 增加，被更快 exploit
3. **Power-law 拟合**：发现 practical optimal conservatism level β⋆，平衡 alignment fidelity 与 hacking vulnerability
4. **核心结论**：领域需要**calibrated, not maximal conservatism**

## DPO 公式
$$\mathcal{L}_{\mathrm{DPO}} = -\mathbb{E}_{(x,y_w,y_l)\sim\mathcal{D}}\Big[\log\sigma\Big(\beta\log\frac{\pi_\theta(y_w|x)}{\pi_{\mathrm{ref}}(y_w|x)} - \beta\log\frac{\pi_\theta(y_l|x)}{\pi_{\mathrm{ref}}(y_l|x)}\Big)\Big]$$

## 实验设置
- **Policy**: Qwen3-14B
- **Reward Ensemble**: 3 × Qwen3-1.7B
- **Offline training**: DPO with β ∈ {β_lo, β_mid, β_hi}
- **Online adaptation**: Against learned reward ensemble
- **Benchmark**: GSM8K exact-answer accuracy, Goodhart gap, AUGC

## 关键发现
| β 水平 | Reward Hacking 损害 | Policy Entropy | Ensemble Disagreement |
|--------|---------------------|----------------|-----------------------|
| β_lo (低保守) | 低 | 高 | 低 |
| β_hi (高保守) | 高 | 低 | 高 |

## 建议
- **适用场景**：需要 offline→online 两阶段训练的 reasoning model 部署
- **推荐指数**: ⭐⭐⭐⭐⭐
- **亮点**：首个揭示"保守性悖论"的系统性研究，对 RLHF/DPO 的实际部署有重要指导意义

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30627
- HTML: https://arxiv.org/html/2606.30627v1
