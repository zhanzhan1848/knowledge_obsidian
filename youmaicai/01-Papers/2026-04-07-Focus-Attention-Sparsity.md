# Focus: 注意力稀疏性 — 专注是关键

## 元信息
| 标题 | Why Attend to Everything? Focus is the Key |
|------|------|
| 作者 | Hengshuai Yao, Xing Chen, Ahmed Murtadha, Jin Li, Shuai Shao, Yasin Abbasi Yadkori, Guan Wang, Mingli Yuan, William Chen, Sen Song |
| 链接 | [原文](https://arxiv.org/abs/2604.03260) |
| arXiv | arXiv:2604.03260v1 |
| 领域 | cs.CL, cs.AI |

## 核心贡献

### 1. Learnable Centroids 聚类路由
- 可学习聚类中心 (centroids) 将 token 分配到组
- 远程注意力限制在同一组内；局部注意力保持全分辨率
- 所有模型权重冻结，**纯加性模块**

### 2. Centroid-Only Training
- 仅训练 148K 参数即可改善领域 perplexity
- 零下游基准退化
- 从 124M 到 70B 跨 5 种注意力架构有效

### 3. 推理加速
- 限制每个 token 到 top-k 最高分路由 → 硬稀疏模式
- 2x 加速，同时超越预训练基线 (41.3 vs 42.8 PPL)
- 分解为两个标准 FlashAttention 调用 → **1M tokens 下 8.6x 墙钟加速**，无需自定义 kernel

### 4. 保留对齐 (vs LoRA)
- LoRA 在所有学习率和秩下均降低 TruthfulQA 分数
- Focus 的 centroid routing 保留对齐：指令微调后 TruthfulQA 分数维持

### 5. Sinkhorn 归一化 + 可解释分组
- Sinkhorn 归一化强制平衡分组作为硬约束
- 分组无需监督即可发现可解释的语言学类别

## 实验结果

| 规模 | 配置 | Focus | Full Attention |
|------|------|-------|----------------|
| 124M | Retrofitting | 30.3 PPL | 31.4 PPL |
| 7B | From scratch | 13.82 PPL | 13.89 PPL |
| 推理加速 | Top-k hard routing | 2x | - |
| 推理加速 | FlashAttention decomposition | 8.6x @ 1M tokens | - |

## 关键洞察

> "Focus learns which token pairs matter rather than approximating all of them"

- 传统注意力假设所有 token pair 同等重要 → 计算浪费
- 核心思想：大部分 token 对任务贡献极小，只需关注真正重要的交互
- 与其近似全注意力，不如学习专注哪些关系

## 技术细节

### 架构
```
Tokens → Centroid Assignment → Group-Restricted Attention + Local Attention → Output
```

### Sinkhorn 归一化
- 传输最优分配中的 Sinkhorn 算法用于强制分组平衡
- 硬约束保证每个组的 token 数量均衡

### 推理时
- 给定每个 token 的 top-k 最高分 centroids
- 离散化为硬稀疏模式
- 可用两个标准 FlashAttention 调用实现

## 相关研究
- 稀疏注意力: StreamingLLM, H2O, BigBird
- 高效注意力: Linformer, Performer, Reformer
- LoRA, QLoRA 等 PEFT 方法

## 评估
- **推荐指数**: ⭐⭐⭐⭐⭐
- **适用场景**: 长上下文推理、边缘部署、延迟敏感应用
- **亮点**: 理论与实践兼备 — 可解释分组 + 实用加速 + 保留对齐
