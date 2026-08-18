# GRPO Beyond English: Multilingual RLVR Study

## 元信息
| 标题 | GRPO Beyond English: A Large-Scale Study of GRPO in Non-English and Multilingual Settings |
|------|-----|
| 作者 | Konstantin Dobler 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.13698) |
| arXiv | arXiv:2608.13698 |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. **首个大规模多语言 GRPO/RLVR 研究**
2. 跨多种基础模型、训练语言、推理语言奖励的系统性实验
3. 发现强跨语言迁移：一种语言训练常提升其他语言性能
4. 揭示语言特定退化的风险

## 关键发现

### 跨语言迁移
- 用母语训练推理常与英语训练推理差距很小
- 训练一种语言常能提升其他多种语言性能

### 语言特定退化
- 某些情况下，特定语言训练会诱导其他语言能力的严重退化
- 需要广泛评估以检测语言特定退化

## 实验设置
- 多种基础模型
- 多种训练语言
- 不同推理语言奖励

## 核心结论
- RLVR 超越英语可提供广泛的跨语言收益
- **但也需要广泛评估**以检测语言特定退化
- 趋势高度依赖具体模型和语言

## 局限性
- 具体趋势高度模型和语言依赖
- 可能需要针对每种语言对进行专门优化
