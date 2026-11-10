---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, traffic-forecasting, spatiotemporal, LLM-as-prior]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.12635
arxiv: 2611.12635
---

# Beyond Sunny Skies: Using Large Language Models to Predict Urban Traffic in Adverse Weather

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Sunny Skies: Using Large Language Models to Predict Urban Traffic in Adverse Weather |
| **作者** | Zhuo Xiao, Kuan Feng, Tong Li, Chenxi Liu, Gang Wang, Zhuo Tang, Kenli Li 等 |
| **发表** | arXiv preprint（IEEE 期刊格式投稿，Hunan University 等） |
| **链接** | [原文](https://arxiv.org/abs/2611.12635) |
| **arXiv** | arXiv:2611.12635 |
| **分类** | cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 把 LLM 的"语义先验"作为知识驱动的补充，接入图时空学习框架，用于恶劣天气（数据稀疏、分布外）下的城市交通流预测。

1. **LLM 语义增强模块**：把区域 POI 构成、天气、节假日等上下文构造成自然语言 prompt 查询预训练 LLM，得到可解释的高层语义向量（8 维：早高峰/晚高峰/白天活动/夜间活动/休闲需求/天气影响/节假日影响/整体流量水平）。
2. **多模态注意力融合**：以交通特征作 query、LLM 语义特征作 key、POI 特征作 value 的跨区域注意力，叠加一个随时间与区域自适应的三模态 softmax 门控。
3. **语义增强预测头**：用带门控的残差校准来调节语义信息对骨干预测的修正幅度，在稀有事件监督不足时保持数值模式稳定。
4. **多城市实证**：在西安、沈阳、乌鲁木齐三个城市的私家车轨迹数据集上全面超越 8 个 SOTA 基线，MAE 平均降低 11.82%。

---

## 技术方案

### 核心思想
现有时空交通预测模型把天气/POI/节假日当作"浅层数值特征"直接编码或做注意力，无法表达"为什么和如何"这类外部条件改变区域流动行为的语义推理；恶劣天气样本又天然稀疏，导致模型偏向常规模式、难以泛化。Multi-STG 的做法是：先用规则网格把城市切成 2km×2km 的区域（西安 120、沈阳 153、乌鲁木齐 30 个），从私家车轨迹按小时聚合出流量序列并附加 time-of-day / day-of-week 两个协变量；然后对每个（区域, 时刻）把 POI 分布、天气向量、节假日标签组织成一句自然语言描述喂给预训练 LLM，取回一个 8 维语义影响向量，表示该条件下交通流变化的强度；再由多模态注意力融合模块把交通历史、语义向量、POI 静态特征动态加权融合（注意力权重由当前交通状态决定，门控权重由拼接后的 MLP + softmax 给出）；最后骨干是可学习自适应图的 Graph Transformer（邻接矩阵从可训练节点嵌入学出，做图传播 + 时空注意力），预测头再用一个带门控的残差校准，把语义先验作为"修正量"叠加到骨干输出上。

### 关键公式
```math
（1）可学习自适应邻接矩阵：
\mathbf{A}_t = \mathrm{softmax}\big(\mathrm{ReLU}(\mathbf{E}_t \mathbf{E}_t^{\top})\big),\quad \mathbf{E}_t\in\mathbb{R}^{N\times d}

（2）LLM 语义先验：
\mathrm{Prompt}_{i,t} = \Phi(\mathcal{E}_{i,t}),\ \ \mathcal{E}_{i,t}=\{\mathbf{p}_i, w_t, h_t\}
\mathbf{s}_{i,t} = \mathcal{M}(\mathrm{Prompt}_{i,t}) \in \mathbb{R}^{D_{sem}},\quad D_{sem}=8

（3）多模态注意力：
\mathbf{q}_{t,n}=\mathbf{W}_Q\mathbf{x}_{t,n},\ \mathbf{k}_{t,m}=\mathbf{W}_K\mathbf{s}_{t,m},\ \mathbf{v}_m=\mathbf{W}_V\mathbf{p}_m
\alpha_{t,n,m}=\mathrm{softmax}_m\!\big(\tfrac{\mathbf{q}_{t,n}^{\top}\mathbf{k}_{t,m}}{\sqrt{d}}\big),\quad
\mathbf{a}_{t,n}=\sum_m \alpha_{t,n,m}\mathbf{v}_m

（4）自适应门控：
\mathbf{g}_{t,n}=\mathrm{softmax}\big(\mathrm{MLP}([\tilde{\mathbf{x}}_{t,n}\|\tilde{\mathbf{s}}_{t,n}\|\tilde{\mathbf{p}}_n])\big)\in\mathbb{R}^3
\mathbf{g}^{\mathrm{fuse}}_{t,n}=g^{(1)}\tilde{\mathbf{x}}_{t,n}+g^{(2)}\tilde{\mathbf{s}}_{t,n}+g^{(3)}\tilde{\mathbf{p}}_n
\mathbf{F}_{t,n}=\mathbf{g}^{\mathrm{fuse}}_{t,n}+\gamma\cdot\mathbf{a}_{t,n}\quad(\gamma\text{ 可学习})

（5）语义增强预测头（门控残差校准）：
\hat{y} = \hat{y}_{\text{backbone}} + \lambda\cdot g_{\text{sem}}\odot\Delta_{\text{sem}}
```

### 关键组件
- **Regional Feature Modeling**：2km×2km 规则网格分区；小时级流量矩阵 $\mathbf{X}\in\mathbb{R}^{T\times N\times 3}$（流量 + time-of-day + day-of-week）；从轨迹出发/到达事件计数。
- **LLM-Empowered Semantic Enhancement**：结构化 prompt（任务指令 + 天气/节假日 + 区域 POI 构成）→ 预训练 LLM → 8 维语义向量；轻量 adapter 对齐到数值特征空间。
- **Multimodal Attentional Fusion**：交通作 Q、语义作 K、POI 作 V 的注意力 + 三模态 softmax 门控 + 残差融合 $\mathbf{F}=\mathbf{g}^{\text{fuse}}+\gamma\mathbf{a}$。
- **Graph Transformer Module**：可学习自适应图传播 + 时空注意力作为预测骨干。
- **Semantic-Enhanced Prediction Head**：门控残差校准，残差权重 $\lambda\in\{0.05,0.1,0.3,0.5\}$。
- **评测**：MAE / RMSE / WAPE / $R^2$；基线含 DSTAGNN、STGCN、GWaveNet、SARAF、LSTM、TACTiS、USTD、DiffSTG。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 西安（Multi-STG） | MAE 0.7556、RMSE 1.1982、WAPE 23.05%、$R^2$ 0.8917 |
| 沈阳（Multi-STG） | MAE 0.7826、RMSE 1.2836、WAPE 22.22%、$R^2$ 0.9251 |
| 乌鲁木齐（Multi-STG） | MAE 1.0189、RMSE 1.6860、WAPE 16.88%、$R^2$ 0.9468 |
| MAE 平均降幅 vs 最强基线 | 11.82%（9.90% / 12.42% / 13.15%） |
| RMSE 平均降幅 | 7.84% – 11.72% |
| WAPE 平均降幅 | 9.89% – 13.17% |
| $R^2$ 绝对提升 | +0.0192 / +0.0172 / +0.0151 |
| 消融：去掉上下文特征（STG） | MAE 相对全模型上升 10.10% / 10.16% / 10.95% |
| 消融：去掉 LLM 语义增强（A-STG） | MAE 相对全模型上升 7.52% / 7.36% / 8.43% |
| 消融：融合模块改为拼接（B-STG） | MAE 相对全模型上升 5.51% / 5.38% / 6.13% |
| 消融：去掉语义增强预测头（C-STG） | MAE 相对全模型上升 3.43% / 3.26% / 3.70% |
| 超参：残差权重 λ 敏感性 | λ∈[0.05,0.5] 内 MAE 波动 ≤1.3% |
| 超参：seq_len/pred_len（3×3 网格） | 最佳为 24h 历史 / 6h 预测（MAE 0.7499 / 0.7784 / 1.0143）；主实验用 24h→12h |
| 数据量敏感性（西安） | 25%→100% 数据：MAE 0.8144→0.7556，RMSE 1.2864→1.1982，WAPE 24.84%→23.05% |

---

## 局限性

- 数据为私有私家车轨迹数据集（西安/沈阳/乌鲁木齐），无法公开复现，跨城市泛化仅在同一数据提供方内部验证。
- 依赖预训练 LLM 在线/离线推理生成语义向量，成本与延迟未被充分讨论；LLM 选型与 prompt 敏感性缺少系统分析。
- 规则网格分区可能把功能混杂的用地切在同一 cell 内（论文自述局限），仅靠 POI 组成近似弥补。
- 对比的是点预测指标，DiffSTG/USTD/TACTiS 等概率模型的分布质量未被评估；恶劣天气子集与整体数据的分层指标缺失。
- "LLM 语义先验"带来的增益与同等规模的非 LLM 文本编码/额外特征工程的差异未做完全控制对比（消融只到"直接编码"一级）。

---

## 建议

- **是否推荐使用**：否（作为通用方法参考可用，作为可复现方案价值有限）
- **适用场景**：研究"LLM 作为外部知识先验注入时序预测模型"的范式；恶劣天气/稀有事件下的交通流预测研究；需向审稿人展示"语义先验 + 门控残差校准"组合价值。
- **值得复现**：否（私有数据）

---

**相关论文**：[[2026-03-12-Reasoning-LLMs-as-Judges]]
**主题标签**：#LLM #NLP #spatiotemporal-forecasting #traffic #LLM-as-prior
