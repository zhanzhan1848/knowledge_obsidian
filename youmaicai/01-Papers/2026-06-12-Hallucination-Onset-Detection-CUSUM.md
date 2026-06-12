# Quickest Detection of Hallucination Onset: Delay Bounds and Learned CUSUM Statistics

## 基本信息
| 标题 | Quickest Detection of Hallucination Onset: Delay Bounds and Learned CUSUM Statistics |
|------|------|
| 作者 | Igor Itkin |
| 链接 | [原文](https://arxiv.org/abs/2606.12476) |
| arXiv | arXiv:2606.12476 |

## 核心贡献
1. **幻觉 onset 检测问题形式化**：将 token 级幻觉检测重新定义为最快变化检测问题
2. **Lorden 下界推导**：在一阶 Markov 忠实/幻觉潜状态模型下，推导检测延迟下界约 1.3 tokens（虚警率 0.01）
3. **CUSUM 统计学习**：因果循环标注器作为带学习增量的 CUSUM，在匹配虚警率下检测延迟 11-13 tokens vs 线性 baseline 的 31 tokens

## 技术方法
```math
检测延迟下界（Lorden's lower bound）: ≈ 1.3 tokens @ false-alarm rate = 0.01
CUSUM 检测延迟: 11-13 tokens
线性 per-token baseline: 31 tokens
```
- **一阶 Markov 潜状态模型**：基于 RAGTruth 验证
- **Donsker-Varadhan 型信息率最优性定理**：解释剩余数量级差距——学习得分仅实现特征的 1/4.5 散度

## 关键洞察
- 分类指标（ AUC）掩盖了延迟结构
- 顺序分析使检测延迟可测量
- 有限视野效应是差距的主要来源

## 局限性
- 学习的 CUSUM 增量仅实现 1/4.5 的特征散度
- 重新校准无法消除此 deficit

## 建议
- 是否推荐使用：**是**
- 适用场景：实时幻觉监测、流式生成质量控制

---
Tags: #LLM #hallucination #detection #change-point #streaming