# Steering Without Breaking: Mechanistically Informed Interventions for Discrete Diffusion Language Models

## 元信息
| 标题 | Steering Without Breaking: Mechanistically Informed Interventions for Discrete Diffusion Language Models |
|------|-------|
| 作者 | Hanhan Zhou, Shamik Roy, Rashmi Gangadharaiah |
| 链接 | [原文](https://arxiv.org/abs/2605.10971) |
| arXiv | arXiv:2605.10971 |
| 代码 | (preprint, 47 pages) |
| 领域 | cs.LG, cs.AI, cs.CL |

## 核心贡献
1. 发现从 autoregressive 模型引入的 uniform intervention 对离散扩散语言模型(DLM)造成质量下降，多属性联合 steer 时损害加剧
2. 训练 sparse autoencoders (4个 DLM, 124M-8B 参数)，发现**不同属性在不同 schedule 上commit**，变化在 timing、sharpness、magnitude 上
3. 提出**自适应调度器**：将干预集中在属性正在形成的步骤，其余 generation 保持不变

## 关键发现：属性 commitment 差异

| 属性 | 在前 % 的去噪中 commit |
|------|----------------------|
| Topic | ~2% |
| Sentiment | ~20% |

uniform intervention 浪费 steering capacity：在目标属性已固化或尚未出现时仍在干预

## 理论贡献
- 成本-控制权衡有闭合形式刻画：自适应 vs uniform 调度的优势由 commitment 分布的单一分散度统计量governed

## 实验结果
- 4 个 DLM，7 个 steering 任务
- 三属性同步控制：达到 93% steering strength，比最强 baseline 高 15 个百分点，同时保持生成质量

## 关键词
离散扩散语言模型, 可控生成, Sparse Autoencoders, 自适应调度, DLM