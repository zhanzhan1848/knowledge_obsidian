# LSR-Anchoring: Latent Space Refusal Anchoring for Low-Resource African Languages

## 元信息
| 标题 | Latent Space Refusal Anchoring for Low-Resource African Languages: Mechanistic Safety Recovery Without Retraining |
|---|---|
| 作者 | Godwin Abuh Faruna |
| 机构 | Independent Researcher |
| 链接 | [原文](https://arxiv.org/abs/2608.18089) |
| arXiv | arXiv:2608.18089 |
| 会议 | ICML 2026 Workshop on Global South in ML |

## 核心贡献
1. 提出 **LSR-Anchoring**（隐空间拒绝锚定），无需重训练即可恢复低资源语言的安全拒绝能力
2. 核心思想：从英语 prompts 提取拒绝方向，在推理时 clamp 到残差流
3. 覆盖四种非洲低资源语言：**Yoruba、Igbo、Igala、Hausa**
4. 四种架构验证：**Llama-3-8B、Llama-3.1-70B、Mistral-7B-Instruct、Qwen2.5-7B**

## 关键公式

**Refusal Centroid Drift (RCD)**：
```math
RCD = 1 - \cos(\mathbf{R}_{en}, \mathbf{R}_{lang})
```

**MAS（主要变体）——残差钳制操作**：
```math
\mathbf{h}' = \mathbf{h} + \max(0, \alpha - \langle \mathbf{h}, \hat{v} \rangle) \cdot \hat{v}
```
其中：
```math
\hat{v} = \frac{\bar{\mathbf{h}}_{harmful} - \bar{\mathbf{h}}_{benign}}{\|\bar{\mathbf{h}}_{harmful} - \bar{\mathbf{h}}_{benign}\|}
```

**SDS（SAE 导向 steering）——Llama-3-8B 专用**：
- 用 SAE feature 112639 替换密集均值差方向
- KL 散度降低 3.5-7×，避免良性崩塌

## 关键发现
| 模型 | 结果 |
|------|------|
| Mistral / Qwen | 安全恢复，良性降级 < 0.08 |
| Llama-3-8B | MAS 过校正（DPL 1.00），SDS 解决 |
| Arabic | 所有架构均失败（几何错位，非基线效应）|

- MMLU 精度下降 < 0.35 个百分点

## 核心机制
- 第 12 层（Layer 12）作为目标 hook 层
- 拒绝表征在残差流中以几何可分离子空间形式存在
- SAE 特征 112639 在有害/良性激活上 L2 分离达 3.97

---
*关键词：Activation Steering，Safety，RLHF，低资源语言，Llama，Mistral，多语言 NLP，LLM 安全*
*领域：cs.CL, cs.AI*
