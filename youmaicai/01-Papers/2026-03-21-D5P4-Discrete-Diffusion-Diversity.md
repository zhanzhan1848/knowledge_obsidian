# D5P4: Partition Determinantal Point Process for Diversity in Parallel Discrete Diffusion Decoding

## 元信息
| 标题 | Partition Determinantal Point Process for Diversity in Parallel Discrete Diffusion Decoding |
|------|------|
| 作者 | Jonathan Lys |
| 链接 | [原文](https://arxiv.org/abs/2603.19146) |
| arXiv | arXiv:2603.19146 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 提出离散扩散的广义 beam-search 框架
2. 引入 D5P4：使用行列式点过程（DPP）实现多样性选择
3. 在保持生成质量的同时提升多样性

## 问题背景
- 离散扩散模型是自回归方法的有前途替代
- 解码方法研究不足
- 自回归的 beam search 不直接适用
- 现有扩散解码技术对批次内多样性控制有限

## 核心方法
**D5P4 框架**：
- **并行候选生成**：广义 beam-search 框架
- **模块化选择目标**：支持自定义 beam-selection 目标
- **DPP 选择**：
  - 将选择步骤建模为 DPP 的 MAP 推理
  - 使用可扩展的贪婪求解器
  - 保持多 GPU 兼容性
- **显式权衡**：模型概率 vs 目标多样性
- **计算开销**：几乎为零

## 实验结果
- **任务**：自由生成、问答
- **改进**：
  - 相比强基线提升多样性
  - 保持竞争性生成质量
  - 近零计算开销

## 局限性
- 未提及

## 应用场景
- 离散扩散模型解码
- 多样性文本生成
- 并行解码

## 相关链接
- [[discrete-diffusion]]
- [[diversity-in-generation]]
- [[determinantal-point-process]]
- [[beam-search]]
- [[parallel-decoding]]
