# Expert-Aware Refusal Steering

## 元信息
| 标题 | Expert-Aware Refusal Steering |
|------|------|
| 作者 | Anna C. Marbut, Daniel R. Olson, Travis J. Wheeler |
| 链接 | [原文](https://arxiv.org/abs/2606.04160) |
| arXiv | arXiv:2606.04160 |
| 代码 | - |
| 领域 | cs.CL, cs.LG |
| 发表 | 2026-06-02 |
| 会议 | Under review for COLM 2026 |

## 核心贡献
1. 将拒绝行为 steering 扩展到 3 个开源 MoE LLMs，发现 MoE 架构的复杂路由模式不会抑制 steering 效果
2. 提出两种 **expert-aware refusal steering** 方法：
   - 利用拒绝特异性 expert 路由模式
   - 利用 expert 特异性 steering 方向
3. 发现拒绝信号可以通过单一 expert 的输出被有效 steering
4. 结果表明 steering 方法捕获的拒绝信号与 expert 路由行为不同，暗示注意力在 MoE 拒绝行为中扮演重要角色

## 核心问题
- Safety alignment 中，steering vector 已被证明可压制密集 LLM 的拒绝行为
- MoE 架构的 expert 路由是否会干扰 steering？这一方向尚未被探索

## 方法

### 基础：Refusal Steering
- 在推理时对 hidden states 注入 steering vector，压制正常拒绝行为

### Expert-Aware Extension
1. **拒绝特异性 Expert 路由分析**：观察触发拒绝时哪些 experts 被激活
2. **Expert 特异性 Steering**：基于单个 expert 的输出进行拒绝行为的 steering

### 关键发现
- Steering 效果在 MoE 架构中不受复杂路由模式影响
- 拒绝信号可以基于单个 expert 有效 steering
- Attention 在 MoE 拒绝行为中扮演重要角色（不同于 expert 路由）

## 局限性
- 仅在有限数量的 MoE 模型上验证
- 安全性研究可能被恶意利用，需负责任披露

## 相关标签
#LLM #safety #MoE #steering-vector #refusal-behavior #alignment #COLM2026