# DualG-MRAG: Decoupling Macro-Reasoning and Micro-Matching for Multimodal RAG

## 元信息
| 标题 | DualG-MRAG: Decoupling Macro-Reasoning and Micro-Matching for Multimodal Retrieval-Augmented Generation |
|------|-----|
| 作者 | Jiacheng Tao, Qingyun Sun, Haonan Yuan, Ziwei Zhang, Jianxin Li |
| 链接 | [原文](https://arxiv.org/abs/2607.28580) |
| arXiv | arXiv:2607.28580 |
| 类别 | cs.AI |
| 发表 | 2026-07-30 |
| 会议 | ACM MM 2026 |

## 核心贡献

1. **Dual-tier 框架**：提出 Macro Graph + Micro Graph 的解耦架构
2. **问题解决**：解决现有 MM-RAG 在复杂多跳推理任务中的困境
3. **GNN Retriever**：将检索制定为查询驱动的消息传递过程
4. **动态规划解码**：从 GNN 前向传播直接提取显式推理路径

## 核心问题

多模态检索增强生成（MM-RAG）虽然显示出良好结果，但在复杂多跳推理任务中仍然存在困难：

**现有方法的问题**：
- 主要关注独立实例级匹配
- 无法捕获跨模态和文档的显式关系
- 图增强方法面临两难：
  - 细粒度视觉特征 → 图快速扩展 + 检索噪声
  - 粗粒度表示 → 丢弃关键局部证据

## 方法

### DualG-MRAG 架构

**Macro Graph（宏图）**：
- 用于全局拓扑路由
- 隔离全局结构推理与细粒度证据匹配
- 抑制检索噪声

**Micro Graph（微图）**：
- 用于精确局部验证
- 保留关键局部证据

### GNN Retriever
将检索制定为查询驱动的消息传递过程：
- 实现跨异构证据源的动态相关性传播
- 替代传统的独立文档块输入

### 动态规划解码
- 从 GNN 前向传播直接提取显式推理路径
- 为生成模型提供连贯的结构指导
- 替代标准隔离文档块输入

## 实验结果

- 在证据召回和复杂 QA 准确性上优于基线
- 验证了 dual-tier 解耦架构的有效性

## 关键洞察

**核心洞察**：将"全局结构推理"与"细粒度证据匹配"解耦是处理复杂多模态推理任务的关键。

## 局限性

- 主要在学术基准上验证
- 实际部署的计算成本待评估
- 对长文档场景的扩展性待验证

## 链接
- ACM MM 2026 接收
