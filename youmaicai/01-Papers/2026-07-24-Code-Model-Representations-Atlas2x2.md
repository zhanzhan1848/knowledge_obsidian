# Disentangling the Roles of Task, Language, and Model in Code Model Representations

> 🥬 LLM 论文分析：代码模型表征中任务/语言/模型的解耦分析

## 基本信息
- **作者**: Piotr Wilamowski et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21491)
- **arXiv**: arXiv:2607.21491
- **代码**: [GitHub](https://github.com/piotrwilam/Atlas2x2)
- **数据集**: [HuggingFace](https://huggingface.co/datasets/piotrwilam/Atlas2x2)
- **Subjects**: cs.CL, cs.AI

## 核心贡献
1. 首次将 circuit extraction 方法扩展到 2×2 设计（Python/Rust × Qwen2.5-Coder-7B/DeepSeek-Coder-V1-6.7B）
2. 回答"独立训练的语言模型是否用相同方式表示相同事物？"——对代码任务的系统性回答
3. 关键发现：
   - **What**（哪些概念需要 dedicated 电路）：由任务决定，模型间一致（Spearman ρ ≈ 0.638-0.673）
   - **Where**（电路位置）：由模型决定，Qwen 在 late band (~L17-19)，DeepSeek 在 L6-7
   - **How**（电路如何随层增长）：由模型决定，Qwen 有 early spike，DeepSeek 没有
4. Rust 比 Python 多 2-3x concept-specific 电路（两模型均如此）
5. 两模型共享跨语言神经元（Qwen 6/7 paired constructs，DeepSeek 7/7）
6. DeepSeek 跨语言共享程度是 Qwen 的 1.94x
7. Qwen 将 Rust 类型/trait 机制的 9 个关键字绑定到一个紧密神经元 cluster（Jaccard 0.535 vs null 0.112）

## 关键发现

### universality 的多维性
"电路是否 universal？"没有单一答案：
- **What** → YES（模型一致同意哪些概念需要电路）
- **Where 和 How** → NO（电路位置和增长模式由模型决定）

### 跨语言差异
- Rust constructs 比 Python equivalents 多 2-3x 电路
- 两模型共享神经元，但 DeepSeek 共享程度更高

## 方法
Circuit extraction + linear probes + ablation，测量 58 个 Python / 57 个 Rust 语法概念的完整清单。

## 标签
#code-model #circuit-analysis #mechanistic-interpretability #Qwen #DeepSeek #Python #Rust
