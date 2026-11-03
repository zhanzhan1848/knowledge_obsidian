---
type: paper
created: 2026-11-03
updated: 2026-11-03
tags: [paper, sparse-attention, mobile-npu, on-device-llm, systems, lg]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.00408
---

# TileWeave: Heterogeneous Tiling for Sparse Prefill on Mobile SoCs

## 元信息

| 属性 | 值 |
|------|-----|
| 标题 | TileWeave: Heterogeneous Tiling for Sparse Prefill on Mobile SoCs |
| 作者 | Wentao Ni, Hong Cai, Mingu Lee, Chihao Yu, Zhongming Yu, Hejia Zhang, Kangqi Zhang, Fatih Porikli, Zhijian Liu, Jishen Zhao |
| 链接 | [原文](https://arxiv.org/abs/2611.00408) |
| arXiv | arXiv:2611.00408 |
| 类别 | cs.LG |
| 发表时间 | 2026-10-30 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. 提出 **TileWeave**：一种面向移动 SoC 的**异构分块**稀疏注意力 prefill 方案，按「跨 query 复用度（cross-query reuse）」把稀疏注意力分区——高共享度的 key block 在 **NPU** 上以粗粒度 tile 执行，低复用度的 block 只在 GPU 上为**真正选中它们的 query block**计算。
2. 设计 **NPU-native pooled-key selector**，使 block 选择本身保持廉价（可在 NPU 上完成），避免把选择逻辑搬回 GPU。
3. 设计运行时机制：GPU 按 **NPU 消费顺序**发布 partial 结果，并在 NPU 已有的 output store 中完成合并，从而避免额外的同步/拷贝开销。
4. 在 RULER / LongBench 上以 Qwen3-1.7B、Llama-3.2-3B-Instruct 验证精度，并在 Snapdragon SM8750 / SM8850 真机上取得显著 prefill 加速。

## 问题背景
智能手机应用越来越需要在端侧处理长上下文 LLM，但 prefill 阶段的高延迟与内存占用限制了本地推理。块稀疏注意力（block-sparse attention）可以减少计算量与访存，但它带来的**不规则选择**与移动 NPU 偏好的**大而规整的 tile** 天然冲突。同时，稀疏注意力中不同 query 会反复选中同一批 key block，若不加以利用就会造成冗余计算，而若直接跳过又会丢失影响精度所需的选择。已有的异构加速思路（如 XAttention）没有解决「如何让 NPU 与 GPU 在稀疏 attention 上真正协同且几乎不引入同步开销」这一系统级难题。

## 方法

### 核心划分维度：跨 query 复用度

TileWeave 观察稀疏注意力选择中的两个正交性质：**一个 key block 被多少个不同的 query block 选中**（复用度），以及**每个选中关系的实际计算量**。据此把稀疏注意力计算拆成两类：

- **高复用 key block（coarse NPU tiles）**：若某个 key block 被大量 query block 选中，则在 NPU 上以**粗粒度 tile** 形式批量执行一次（权重复用），摊薄了 NPU 规整 tile 的启动代价。
- **低复用 key block（GPU，仅选中它的 query block）**：只被少数 query 选中的 block，其计算量小但在 NPU 上会引入大量不规则小 tile，于是在 GPU 上**只为实际选中它们的 query block**执行，从而避免冗余计算。

### NPU-native pooled-key selector

选择器不依赖完整 key 向量，而是使用**池化后的 key（pooled key）**作为打分依据，可在 NPU 上原生完成。选择流程与 NPU tile 执行共用数据搬运，避免额外 kernel launch 与 H2D/D2H 往返。

### 运行时：顺序化 partial 发布与 in-place 合并

GPU 计算低复用部分后，需要把 partial attention 结果交给 NPU。TileWeave 的运行时**按 NPU 实际消费的顺序**发布 GPU partials，并把结果合并进 NPU 已有的 output store 中，而不是另开一块输出缓冲区。这减少了 tile 级别的握手次数与内存占用。

### 与稠密/纯稀疏基线的对比结构

- vs. 稠密 attention：省去大量非选中 block 的计算与访存，但仍保留被选中的高精度计算路径。
- vs. XAttention 等纯 NPU 稀疏方案：把「形状不规则但复用高」的 part 交给 NPU 粗 tile，把「形状不规则且复用低」的 part 交给 GPU，规避 NPU 的 tile 尺寸偏好冲突。

> 摘要未给出具体的选择器阈值、tile 尺寸、算子实现细节与伪代码，这些应在正文补充材料中查阅。

## 实验结果

**精度（RULER）**

| 模型 | 结果 |
|------|------|
| Qwen3-1.7B | HeteroSparse 与 XAttention 精度相当（matches） |
| Llama-3.2-3B-Instruct | HeteroSparse 精度优于 XAttention（improves） |

**精度（LongBench）**：HeteroSparse 的平均分与 XAttention 相当（mean LongBench scores match）。

**速度（Snapdragon SM8750 与 SM8850 真机，全模型 prefill，1k–16k tokens）**

| 对比 | 加速比 |
|------|--------|
| vs. XAttention | **1.35× – 3.23×** 更快 |
| vs. 稠密 attention | 最高 **1.58×** 更快 |

## 关键洞察
1. **稀疏性与规整性并非天然对立**：关键在于把稀疏注意力按「跨 query 复用度」而非「稀疏模式」切分，复用度高的部分天然适合 NPU 粗 tile——这是把异构硬件能力与注意力稀疏结构对齐的通用思路，可能延伸到其他不规则稀疏算子。
2. **真正的系统瓶颈可能是数据移动与同步，而非算力**：TileWeave 的三个组件（NPU-native 选择器、按消费顺序发布 partial、in-place 合并）全部围绕减少跨设备搬运与 tile 握手，说明异构稀疏 attention 的收益主要取决于能否把调度开销压到低于计算节省。
3. **稀疏 attention 的精度损失并非均匀分布**：Llama-3.2-3B-Instruct 上优于 XAttention 而 Qwen3-1.7B 上持平，说明「保守选择低复用 block」在不同规模/训练程度模型上收益不同——小模型的稀疏预算本来就少，进一步裁剪的边际收益不明显。

## 局限性
- 摘要未给出绝对延迟/吞吐数值（只有相对加速比），也未报告不同 token 长度下加速比的逐点分布，无法判断在 1k 端点是否接近稠密基线。
- 仅在 Snapdragon SM8750 / SM8850 两款 SoC（均为高通旗舰）上验证，跨厂商（如联发科、苹果 NPU）与不同内存带宽层级下的可迁移性未说明。
- 评测仅覆盖 Qwen3-1.7B 与 Llama-3.2-3B-Instruct 两个小模型（均为 ≤3B），长上下文（>16k）行为未测。
- HeteroSparse 这一命名暗示系统内可能含多种稀疏配置，但摘要未披露其选择策略与超参。
- 摘要未说明与 XAttention 之外其他稀疏基线（如 NSA、Quest、稀疏 FlashAttention 变体）的对比。

## 适用场景
- **端侧长上下文推理**：手机/平板等移动 SoC 上运行需要长 prompt 的 LLM 应用（摘要/文档问答、端侧 Agent）。
- **异构 NPU+GPU 协同推理系统**：同时具备 NPU 与 GPU 的 SoC 平台（如 Snapdragon 8 Elite 系列）的 prefill 加速。
- **稀疏注意力工程落地**：为需要自定义 attention kernel 的推理引擎（如 llama.cpp、MLC-LLM、ExecuTorch）提供 tile 划分与调度策略参考。
- **低带宽/能耗受限部署**：稠密 attention 访存瓶颈明显、prefill 占比高的短请求场景。

## 相关工作
[[Block-Sparse Attention]], [[XAttention]], [[Prefill-Decode Disaggregation]], [[FlashAttention]], [[Mobile NPU Acceleration]], [[Sparse Attention]], [[On-Device LLM]], [[HeteroSparse]], [[Qwen3]], [[Llama-3.2]]

---
#LLM #Research #sparse-attention #arXiv-2611
