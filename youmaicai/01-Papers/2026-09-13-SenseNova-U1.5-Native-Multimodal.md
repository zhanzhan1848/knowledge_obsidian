# SenseNova-U1.5: Towards Native Unified Visual Intelligence

## 元信息
| 标题 | SenseNova-U1.5: Towards Native Unified Visual Intelligence |
| 作者 | Haiwen Diao, Jiahao Wang, Chenjing Ding et al. (50+ authors) |
| 链接 | [原文](https://arxiv.org/abs/2609.11929) |
| arXiv | arXiv:2609.11929 |
| 代码 | [GitHub](https://github.com/OpenSenseNova/SenseNova-U1) |

## 核心贡献
1. **8B-MoT 原生统一多模态模型**: Encoder-free 和 VAE-free 架构，统一理解和生成
2. **空间一致 Patch 重建**: 增强视觉接口，支持 4K 原生分辨率
3. **多专家 On-Policy 蒸馏**: 视觉美学、双语文本渲染、信息图生成、图像编辑等专家能力整合

## 模型架构
- 8B Mixture-of-Experts (MoT)
- Encoder-free, VAE-free
- 原生统一多模态：理解 + 推理 + 生成
- 最高 4K 原生分辨率

## 训练策略
1. **数据**: 精心筛选的生成和编辑数据
2. **任务公式**: 改进的任务定义
3. **结构化 Prompt 增强**
4. **后训练**: 多专家 SFT + RL + On-policy 蒸馏

## 实验结果
- 图像保真度大幅提升
- 双语文本渲染改善
- 复杂构图能力增强
- 多参考编辑和交错生成改善
- 指令遵循提升，主体身份、几何形状保留

## 关键发现
1. 原生统一建模是感知、推理、创建的统一框架的有效路径
2. 多模态理解能力可迁移到视觉规划和创作
3. 在生成数据格式有限暴露下仍能泛化到长、复杂、结构化视觉指令

## 建议
- 是否推荐使用：是（开源）
- 适用场景：多模态理解与生成、视觉规划
- 关键词：Multimodal, Encoder-free, MoT, Visual Generation, On-Policy Distillation

> 注：cs.CV 类别，与 LLM/NLP 直接关联较少，但涉及多模态 LLM 架构创新
