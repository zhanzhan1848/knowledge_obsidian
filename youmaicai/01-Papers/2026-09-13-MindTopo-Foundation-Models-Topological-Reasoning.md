# MindTopo: Can Foundation Models Reason in Topological Space?

## 元信息
| 标题 | MindTopo: Can Foundation Models Reason in Topological Space? |
| 作者 | Yunfei Ge, Anbang Liu, Qineng Wang, Johnalbert Garnica, Jianwen Lyu, Zihan Wang, Reuben Tan, Jianfeng Gao, Ruohan Zhang, Yining Hong, Jiajun Wu, Manling Li |
| 链接 | [原文](https://arxiv.org/abs/2609.11900) |
| arXiv | arXiv:2609.11900 |
| 代码 | [GitHub](https://mind-topo.github.io/) |

## 核心贡献
1. **MindTopo Benchmark**: 提出首个评估基础模型拓扑推理能力的基准测试，包含 11,030 个样本，涵盖 5 种拓扑性质（连续性、分离性、序、包围、纽结）
2. **双层认知评估**: 同时评估模型的推理（reasoning）和规划（planning）能力
3. **14 个 MLLM 系统评测**: 包括 GPT-4V、Gemini、Qwen-VL 等，发现所有模型推理优于规划，最好模型仍远低于人类水平

## 模型架构
- 评测 14 个多模态大语言模型（MLLMs）
- 在 Qwen3-VL-2B-Instruct 上测试了 SFT 和 RL 微调效果
- 结合图像和视频生成的 agent 配置

## 实验设置
- 5 种拓扑性质：continuity, separation, order, enclosure, knots
- 13 种程序化生成的任务类型，可控难度
- 11,030 个实例

## 实验结果
- 所有 MLLM 在推理任务上优于规划任务
- 最好模型仍远低于人类表现
- SFT 和 RL 在 Qwen3-VL-2B-Instruct 上：推理提升 > 规划提升
- 生成观测保留局部线索但不能可靠地遵循环境动态

## 关键发现
1. 拓扑关系在连续变形下保持不变，是空间理解的基础
2. 现有基础模型评测主要关注度量或视角相关关系，忽视拓扑推理
3. 视频生成模型在规划设置中表现有限

## 局限性
- 模型在规划任务中表现差，生成观测不能可靠遵循环境动态
- 拓扑跨转换时不能保持一致性
- 最佳模型远低于人类水平

## 建议
- 是否推荐使用：评测基准，非使用性论文
- 适用场景：评估多模态模型的拓扑推理能力
