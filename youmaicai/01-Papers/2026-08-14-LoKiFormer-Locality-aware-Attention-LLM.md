# LoKiFormer: Locality-aware Attention with Decoupled Knowledge Memory for Efficient Large Language Model Pretraining

## 元信息
| 标题 | LoKiFormer: Locality-aware Attention with Decoupled Knowledge Memory for Efficient Large Language Model Pretraining |
| 作者 | Qiuwu Chen, Zimo Liu, Yuchen Li, Ying Sun, Yifan Zhang, Zhijie Qiu, Zeng You, Ryan Dong, Simeng Ma, Yaofo Chen, Mingkui Tan |
| 链接 | [原文](https://arxiv.org/abs/2608.12419) |
| arXiv | arXiv:2608.12419 |
| 代码 | Not available in abstract |
| 会议 | ICML 2026 |
| 机构 | AIGCode, South China University of Technology, Pazhou Laboratory |

## 核心贡献
1. **Local Fusion Attention (LFA)** — 在注意力之前引入卷积融合层，为模型注入局部归纳偏置，使注意力专注于更复杂的全局上下文关系，而不是被短距离依赖分散计算资源。
2. **Knowledge Memory Module (KMM)** — 引入参数化的 Key-Value 记忆槽，将全局知识（常识、专业知识）显式存储，与 MoE 的隐式权重编码解耦，支持直接查询和可解释的知识检索。
3. **更快的预训练收敛** — LoKiFormer 在预训练中收敛速度提升 **1.33×**（相同验证损失下，基线需 10K 步，LoKiFormer 仅需 7.5K 步），显著降低计算成本和能耗。

## 模型架构

LoKiFormer 基于增强的 Decoder Block，在标准 MLA（Multi-Head Latent Attention） backbone 上叠加两个新模块：

```
Input U
  │
  ├─► Local Fusion Attention (LFA)
  │     └─► 因果 1D 卷积（核大小 k，分 h 组，每组对应一个注意力头）
  │           对相邻 k 个 token 做特征融合，再送入 MLA
  │
  ├─► Knowledge Memory Module (KMM)
  │     └─► 将 latent c 通过 W^H 投影得到 H
  │           H 作为 Query 与可学习的知识 Key 矩阵 K 做匹配
  │           聚合对应 Value，输出 Z，再经 W^O 投影
  │
  └─► MoE Layer（标准 Mixture-of-Experts）
        最终输出 = MoE(O_A + O_K)
```

### 关键设计

- **LFA（局部感知注意力）**：
  - 将隐藏状态沿特征维度分成 h 组（与注意力头数相同）
  - 每组应用核大小为 k 的因果 1D 卷积，聚合前 k 个相邻 token 的表示
  - 融合后的表示再进入 MLA 的 down-projection，生成 latent query/key/value
  - 显式局部归纳偏置让注意力无需通过冗余的全配对交互来建模短距离依赖

- **KMM（知识记忆模块）**：
  - 引入可学习的知识场矩阵 K（Keys）和 V（Values），以地址可寻址的 slot 形式存储全局知识
  - 将 MLA 的 KV latent 表示 H 通过 W^H 投影为 Query，与 K 中的键做匹配
  - 聚合匹配的 V 值，经 W^O 输出，解耦知识存储与计算路径
  - 推理时 KMM 静态，无需在线检索或编辑

## 关键公式

**MLA（Multi-Head Latent Attention）基础**（DeepSeek 风格）：

down-projection：
$$
\mathbf{c}^Q = \mathbf{U}\mathbf{W}^{QD}, \quad \mathbf{c}^{KV} = \mathbf{U}\mathbf{W}^{KVD}
$$

per-head attention：
$$
\mathbf{Att}^i = \text{softmax}\left(\frac{\mathbf{Q}^i {\mathbf{K}^i}^\top}{\sqrt{d_h}}\right)\mathbf{V}^i
$$
$$
\mathbf{Q}^i = \mathbf{c}^Q \mathbf{W}^{Q_i}, \quad \mathbf{K}^i = \mathbf{c}^{KV} \mathbf{W}^{K_i}, \quad \mathbf{V}^i = \mathbf{c}^{KV} \mathbf{W}^{V_i}
$$

**LFA 卷积融合**（每组 g，位置 t）：
$$
\hat{\mathbf{U}}^{(g)}_t = \sum_{s=0}^{k-1} \mathbf{U}^{(g)}_{t-s} \cdot \Theta^{(g)}[s]
$$
- 因果卷积，只聚合左侧 k 个 token，维持语言模型的因果掩码特性

**KMM 知识检索**：
$$
\mathbf{H} = \mathbf{c}^{KV} \mathbf{W}^H, \quad \mathbf{Z} = \text{KMM}(\mathbf{H}; \mathcal{K}, \mathcal{V}), \quad \mathbf{O}^K = \mathbf{Z} \mathbf{W}^O
$$

**最终输出**：
$$
\mathbf{O} = \text{MoE}(\mathbf{O}_A + \mathbf{O}^K)
$$

## 实验结果
- **Pre-training convergence**: 1.33× faster（达到相同验证损失：LoKiFormer 7.5K steps vs. Baseline 10K steps）
- Accepted by **ICML 2026**

## 局限性
- LFA 的卷积核大小 k 需要手动调优，核太大可能引入不必要的噪声，太小则局部建模能力不足
- KMM 的知识 field 矩阵（K, V）需要足够的容量来存储不同领域的知识，容量选择缺乏理论指导
- KMM 在推理时为静态记忆，无法动态更新特定知识条目；适合预训练阶段内化通用知识，但不适合需要实时知识更新的场景
- 未在论文摘要页面提供具体 Benchmark 数字（如下游任务精度、内存占用、FLOPs 对比等）

## Tags
#LLM #transformer #attention #MoE #pretraining #ICML2026 #locality #knowledge-memory #efficient-LLM
