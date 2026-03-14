# EndoCoT: Scaling Endogenous Chain-of-Thought Reasoning in Diffusion Models

## 元信息
| 标题 | EndoCoT: Scaling Endogenous Chain-of-Thought Reasoning in Diffusion Models |
|------|------|
| 作者 | Xuanlang Dai, Yujie Zhou, Long Xing, Jiazi Bu, Xilin Wei, Yuhong Liu, Beichen Zhang, Kai Chen, Yuhang Zang |
| 链接 | [原文](https://arxiv.org/abs/2603.12252) |
| arXiv | arXiv:2603.12252 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.CV, cs.CL |
| 页数 | 23 pages, 18 figures |

## 核心贡献
1. **EndoCoT 框架**: 提出内源 Chain-of-Thought 推理框架，激活 MLLM 的推理潜力
2. **Iterative Thought Guidance**: 通过迭代细化潜在思维状态来激活推理
3. **Terminal Thought Grounding**: 确保推理轨迹与文本监督对齐

## 问题背景

### 现有范式的两个关键限制
1. **推理深度不足**: MLLM 文本编码器的单步编码无法激活 CoT 过程
2. **引导不变性**: 解码过程中引导保持不变，阻止 DiT 渐进分解复杂指令

## 方法架构

### 两大核心组件

#### 1. Iterative Thought Guidance Module (迭代思维引导模块)
- 迭代细化潜在思维状态
- 激活 MLLM 的推理潜力
- 将状态桥接到 DiT 的去噪过程

#### 2. Terminal Thought Grounding Module (终端思维接地模块)
- 将最终状态与 ground-truth 答案对齐
- 确保推理轨迹基于文本监督

### 工作流程
```
MLLM 文本编码器 → 迭代思维引导 → 渐进式 DiT 执行 → 分步解决复杂任务
```

## 实验结果

| 基准 | 准确率 | 超越最强基线 |
|------|--------|-------------|
| Maze | - | +8.3% |
| TSP | - | +8.3% |
| VSP | - | +8.3% |
| Sudoku | - | +8.3% |
| **平均** | **92.1%** | **+8.3 pp** |

## 创新点
- 首次在扩散模型中实现内源 CoT 推理
- 解决了 MLLM 作为文本编码器时的推理深度问题
- 实现了渐进式复杂任务分解

## 应用场景
- 空间推理任务 (Maze, TSP, VSP)
- 逻辑推理 (Sudoku)
- 复杂多步骤生成任务

## 局限性
- 主要针对空间/逻辑推理任务
- 需要 ground-truth 答案进行思维接地

## 标签
#diffusion-models #chain-of-thought #MLLM #reasoning #spatial-reasoning

## 相关论文
- [[Chain-of-Thought]]
- [[扩散模型]]
- [[多模态大语言模型]]
- [[空间推理]]
