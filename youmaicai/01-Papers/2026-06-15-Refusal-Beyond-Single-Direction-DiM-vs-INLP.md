# Refusal Beyond a Single Direction: Diff-in-Means vs INLP

## 元信息
| 标题 | Refusal Beyond a Single Direction: A Preliminary Comparison of Diff-in-Means and INLP |
|------|------|
| 作者 | Elisabetta Rocchetti, Alfio Ferrara |
| 链接 | [原文](https://arxiv.org/abs/2606.13720) |
| arXiv | arXiv:2606.13720 |
| 领域 | cs.AI |
| 日期 | 2026-06-15 |

## 核心贡献
1. 比较 **DiM（Difference-in-Means）** 和 **INLP（Iterative Nullspace Projection）** 两种拒绝 steering 方法
2. INLP counterfactual flipping 与 DiM directional ablation 在拒绝抑制上**竞争力相当**
3. Nullspace projection 持续更弱
4. 揭示两类 INLP 干预在激活空间的几何差异：
   - **Nullspace projection**：将激活折叠到 harmful/harmless cluster **之间**
   - **Counterfactual flipping**：将激活移到**相反 cluster**
5. 限制 INLP 到提取子空间的主方向可在 near-baseline perplexity 下保留大部分抑制效果

## 背景
Arditi et al. (2024) 发现安全微调聊天模型的拒绝行为由残差流中**单一线性方向**介导，可用 harmful/harmless 激活的差分均值（DiM）恢复。

## 方法对比

### DiM 方法
- Activation Addition：在激活中添加 DiM 方向
- Directional Ablation：消融 DiM 方向

### INLP 方法
- Nullspace Projection：将激活投影到提取子空间的 nullspace
- Counterfactual Flipping：在提取子空间中做翻转

## 关键发现

### 几何差异
| 方法 | 激活空间位置 |
|------|------|
| Nullspace projection | Harmful 和 Harmless cluster **之间** |
| Counterfactual flipping | **相反** cluster 中 |
| DiM ablation | 移除方向后趋于中间 |

→ 模型编码"概念缺失"与"概念相反"的方式不同

### 可调性
- 限制 INLP 到前 k 个方向可在 near-baseline perplexity 下实现可调谐的拒绝抑制

## 局限性
- 仅测试 5 个开源 chat 模型
- 需要更多跨架构验证

## 建议
- **适用场景**：LLM 安全微调、模型可解释性、拒绝行为控制
- **推荐指数**：⭐⭐⭐⭐（对安全 steering 方法有重要实证贡献）