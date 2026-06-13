# ArogyaSutra: A Multi-Agent Framework for Multimodal Medical Reasoning in Indic Languages

## 元信息
| 标题 | ArogyaSutra: A Multi-Agent Framework for Multimodal Medical Reasoning in Indic Languages |
|------|-----|
| 作者 | Tanmoy Kanti Halder, Akash Ghosh, Subhadip Baidya, Arijit Roy, Sriparna Saha |
| 链接 | [原文](https://arxiv.org/abs/2606.13572) |
| arXiv | arXiv:2606.13572 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **ArogyaBodha**: 大规模多语言多模态医学问答数据集
   - 来源：8 个异构源
   - 覆盖：31 个身体系统、6 种成像模态、21 个临床领域
   - 语言：英语 + 7 种印度语言
2. **ArogyaSutra**: Actor-Critic 多智能体框架
   - 集成工具接地（tool grounding）
   - 双重记忆机制（dual-memory）
   - 逐步推理感知决策（step-wise reasoning-aware decision making）
   - 使用存储的 actor-critic 模拟轨迹进行蒸馏

## 核心创新
- 解决英语中心 MLLM 无法支持印度语言医疗场景的问题
- 农村印度患者用母语提问 + 医学图像 multimodal 输入
- Actor-critic 架构 + 工具接地 = 可解释的医学推理

## 数据集规模
- 7 种印度语言 + 英语
- 31 body systems
- 6 imaging modalities (X光、CT、MRI 等)
- 21 clinical domains

## 局限性
- 依赖 Indic 语言医学语料库质量
- 低资源场景下的跨语言迁移挑战

## 标签
#Multimodal #Medical #Indic-Languages #Multi-Agent #Actor-Critic #Healthcare