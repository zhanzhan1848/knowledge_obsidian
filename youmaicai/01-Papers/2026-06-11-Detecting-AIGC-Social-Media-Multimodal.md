# Detecting AI-Generated Content on Social Media with Multimodal Language Models

## 元信息
| 标题 | Detecting AI-Generated Content on Social Media with Multi-modal Language Models |
|------|-----|
| 作者 | Chenyang Yang, Shen Yan, Yibo Yang, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.11200) |
| arXiv | arXiv:2606.11200 |
| 领域 | Multimodal · AIGC Detection · Social Media |

## 核心贡献

1. **多模态 AIGC 检测pipeline**：持续整理多样化多模态社交媒体数据，训练紧凑型视觉-语言模型用于检测和解释
2. **泛化能力提升**：解决现有方法泛化到新生成模型能力差的问题
3. **可解释性**：提供检测结果的解释能力
4. **真实部署验证**：在社交媒体平台用于帖子推荐，观察到用户参与度的正向影响

## 现有挑战
- 泛化能力差（对新生成模型）
- 依赖单一模态
- 缺乏可解释的解释

## 核心方法
- **持续数据整理**：持续收集多样化多模态社交媒体数据
- **紧凑型视觉-语言模型**：在整理后的数据上训练
- **检测 + 解释**：同时输出检测结果和解释

## 关键结果
- 在公开基准上达到 **SOTA 检测性能**
- 在多个平台的内部社交媒体数据集上展示鲁棒的检测和解释能力
- 已部署于社交媒体平台进行帖子推荐，对用户参与度有正向影响

## 建议
- **是否推荐使用**：是
- **适用场景**：社交媒体内容审核、AI 生成内容检测

## 相关概念
- [[Multimodal Learning]]
- [[AI-Generated Content Detection]]
- [[Vision-Language Models]]