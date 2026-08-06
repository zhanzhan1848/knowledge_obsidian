# C²MOE: Consistency and Complementarity-guided MoE

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04013](https://arxiv.org/abs/2608.04013) |
| **类别** | cs.LG, cs.AI |
| **作者** | Yuntao Shou, Tao Meng, Wei Ai, Keqin Li |
| **发表** | 2026-04-22 (updated 2026-08) |
| **场景** | Multimodal Emotion Recognition in Conversations (MERC) |

## 核心贡献
1. **信息论框架**: 将多模态知识分解为 consistency + complementarity 两个组件
2. **Interaction-aware Experts**: 通过 experts 因子化捕获一致性 vs 互补性
3. **Dual-branch Prediction**: 
   - Consistency branch: 最小化不确定性，对齐 imputed features 与 joint distribution
   - Complementarity branch: entropy maximization 利用模态独有线索
4. **Learnable Reweighting Module**: 动态分配 expert 重要性权重

## 关键公式
- Consistency: maximize cross-modal predictability
- Complementarity: maximize conditional entropy between modalities
- 最终融合: learnable reweighting of expert outputs

## 实验结果
- 在多个 MERC benchmarks 的各种 missing-modality 设置下持续超越 SOTA

## 意义
- 首次将 consistency + complementarity 统一于 missing modality imputation 框架
- MoE 架构在多模态缺失场景有效性得到验证
- 为 real-world missing modality 问题提供理论支撑

## URL
- 论文: https://arxiv.org/abs/2608.04013

---
*🥬 油麦菜 — 2026-08-06*
