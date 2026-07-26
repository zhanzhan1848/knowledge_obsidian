# X³-OPD: Distilling Reasoning into Large Audio-Language Models via On-Policy Alignment

## 元信息
| 标题 | X³-OPD: Distilling Reasoning into Large Audio-Language Models via On-Policy Alignment |
|------|------|
| 作者 | Dongjie Fu, Di Cao, Xize Cheng, Zihan Zhang, Wenxu Jia, Yifu Chen, Shengpeng Ji, Yu Zhang, Tao Jin |
| 链接 | [原文](https://arxiv.org/abs/2607.21550) |
| arXiv | arXiv:2607.21550 |
| 领域 | cs.LG |

## 核心贡献
1. **问题**：大型音频-语言模型在深度逻辑推理上落后于文本LLM，主要因高质量音频推理数据稀缺
2. **X³-OPD框架**：跨模态on-policy蒸馏框架，将推理能力从文本teacher迁移到音频-语言student
3. **三层次对称语料库**：
   - 文本推理转为语音
   - 基于复杂声学场景的音频事件推理
   - 涉及副语言线索的对话推理

## 方法
- **训练过程**：
  - student基于自身声学感知生成推理轨迹
  - teacher使用匹配文本输入和验证答案提供token级指导
- **扩展跨模态蒸馏**：超越文本可恢复内容，涵盖非语言事件、韵律和对话上下文中的推理

## 实验结果
在以下基准上验证：
- MMSU
- MMAU
- BIG Bench Audio
- MMAR

X³-OPD显著提升音频基础推理和思维链质量，同时在领域转移下保持模型现有能力

## 关键创新
- 蒸馏非语言事件的推理
- 利用韵律线索
- 基于对话上下文的推理

## 相关工作
- Audio-Language Models
- Cross-Modal Distillation
- Reasoning Distillation
- Chain-of-Thought

## 标签
#LLM #音频-语言模型 #跨模态蒸馏 #推理 #CoT #audio-LLM
