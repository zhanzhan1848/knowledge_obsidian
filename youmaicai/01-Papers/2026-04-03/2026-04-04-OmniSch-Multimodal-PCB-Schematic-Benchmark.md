---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, multimodal, benchmark, diagram-reasoning, vision-language, PCB]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.00270
---

# OmniSch: A Multimodal PCB Schematic Benchmark for Structured Diagram Visual Reasoning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OmniSch: A Multimodal PCB Schematic Benchmark For Structured Diagram Visual Reasoning |
| **作者** | Taiting Lu, Kaiyuan Lin et al. (15+ authors) |
| **发表** | arXiv 2026-04-03 (v1: 2026-03-31) |
| **链接** | [原文](https://arxiv.org/abs/2604.00270) |
| **DOI** | 10.48550/arXiv.2604.00270 |
| **代码** | - |

---

## 核心贡献

> 提出 OmniSch，首个 PCB 原理图理解与空间 netlist 图构建的多模态基准。

1. **首个 PCB 原理图 benchmark**：1,854 张真实原理图，4 项任务
2. **4 项任务覆盖**：视觉定位、图推理、几何推理、工具增强 agent 推理
3. **诊断 LMM 短板**：揭示当前 LMM 在工程图理解上的系统性不足

---

## 技术方案

### 核心思想

当前 LMM 在视觉定位、文档理解、图表推理上进展迅速，但 PCB 原理图（EDA 工作流核心）理解能力未被探索。OmniSch 填补这一空白，评估 LMM 将原理图转换为机器可读空间加权 netlist 图的能力。

### 4 项任务

| 任务 | 描述 |
|------|------|
| 视觉定位 | 109.9K grounded instances，423.4K 标签到视觉区域对齐 |
| 图表到图推理 | 理解图表元素间的拓扑关系 |
| 几何推理 | 为每个连接构建布局相关权重 |
| 工具增强 Agent 推理 | 调用外部工具完成前 3 项任务 |

### 数据集

- **规模**：1,854 张真实 PCB 原理图
- **标注**：机器可读空间加权 netlist 图

---

## 实验结论

- **发现**：当前 LMM 存在系统性不足：
  - 细粒度视觉定位不可靠
  - 布局到图解析脆弱
  - 全局连接推理不一致
  - 视觉探索效率低
- **适用**：评估 LMM 在工程图领域的真实能力

---

## 局限性

- 仅 PCB 原理图，未覆盖其他工程图类型
- 需要外部工具支持（工具调用能力成为瓶颈）

---

## 实现建议

- **实现难度**：Benchmark 级别的系统工作
- **预期性能**：当前模型表现较差，有较大提升空间
- **适用场景**：评估 VLM 在工程领域的能力边界

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-04
