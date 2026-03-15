# EndoCoT: Scaling Endogenous Chain-of-Thought Reasoning in Diffusion Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | EndoCoT: Scaling Endogenous Chain-of-Thought Reasoning in Diffusion Models |
| 作者 | Xuanlang Dai, Yujie Zhou, Long Xing, Jiazi Bu, Xilin Wei, Yuhong Liu, Beichen Zhang, Kai Chen, Yuhang Zang |
| 链接 | [原文](https://arxiv.org/abs/2603.12252) |
| arXiv | arXiv:2603.12252 |
| 领域 | cs.CV, cs.CL |
| 发表时间 | 2026-03-12 |

## 核心贡献
1. **识别问题**: MLLMs 作为文本编码器存在两大限制：(i) 单步编码无法激活 Chain-of-Thought 过程；(ii) 解码过程中指导保持不变，阻止了复杂指令的逐步分解
2. **提出 EndoCoT 框架**: 通过迭代思想引导模块激活 MLLMs 的推理潜力，迭代细化潜在思想状态
3. **终端思想接地模块**: 确保推理轨迹与文本监督保持一致，将最终状态与 ground-truth 答案对齐

## 模型架构
- **核心组件**:
  - Iterative Thought Guidance Module: 迭代细化潜在思想状态
  - Terminal Thought Grounding Module: 对齐最终状态与监督信号
- **工作流程**: MLLM 文本编码器 → 思想状态迭代 → DiT 去噪过程 → 逐步解决复杂任务

## 训练方法
- 将 MLLM 推理状态桥接到 DiT 的去噪过程
- 渐进式执行精心推理的指导

## 实验结果
- **基准测试**: Maze, TSP, VSP, Sudoku
- **平均准确率**: 92.1%
- **性能提升**: 比最强基线高 8.3 个百分点

## 局限性
- 未明确提及

## 技术要点
- 关键词: `#Chain-of-Thought` `#Diffusion` `#MLLM` `#reasoning` `#DiT`
- 创新点: 首次在扩散模型中实现内生 Chain-of-Thought 推理

## 推荐评估
- **是否推荐**: ✅ 是
- **适用场景**: 复杂空间推理任务、需要多步推理的图像生成、组合优化问题可视化

## 相关论文
- [[Chain-of-Thought Prompting]]
- [[Diffusion Models]]
- [[Multimodal LLMs]]
