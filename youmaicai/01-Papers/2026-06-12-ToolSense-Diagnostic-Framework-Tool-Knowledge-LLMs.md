# ToolSense: A Diagnostic Framework for Auditing Parametric Tool Knowledge in LLMs

## 基本信息
| 标题 | ToolSense: A Diagnostic Framework for Auditing Parametric Tool Knowledge in LLMs |
|------|------|
| 作者 | Ashutosh Hathidara, Sai Shruthi Sistla, Sebastian Schreiber, Sahil Bansal |
| 链接 | [原文](https://arxiv.org/abs/2606.12451) |
| arXiv | arXiv:2606.12451 |
| 代码 | [GitHub](https://github.com/SAP/toolsense) |

## 核心贡献
1. **ToolSense 诊断框架**：开源 LLM 驱动的诊断工具，可自动生成三个基准测试（RRB、MCQ、QA）
2. **知识-检索解离发现**：揭示了参数化工具检索模型存在严重解离——在 RRB 查询上性能下降 50-64 个百分点
3. **ToolBench 诊断基准**：在 ~47k 工具的 ToolBench 上进行评估，发现即使检索性能强的模型在事实探测上也接近随机

## 模型架构
- **参数化工具检索**：将每个工具编码为虚拟 token 附加到 LLM 词汇表
- **两阶段微调**：记忆阶段 → 检索 SFT 阶段
- **三种歧义层级**：Realistic Retrieval Benchmark (RRB) 包含三个歧义层级查询

## 关键发现
- 现有基准使用冗长的完全指定查询，约束解码限制输出为有效 token 路径
- 标准基准无法揭示模型是否真正理解工具
- 知识-检索解离：强检索性能 ≠ 真正理解工具

## 局限性
- 当前基准不能真正评估工具理解能力
- 参数化检索方法在复杂查询下性能严重退化

## 建议
- 是否推荐使用：**是**（框架开源，适合诊断工具理解能力）
- 适用场景：LLM Agent 工具使用评估、工具检索系统诊断

---
Tags: #LLM #tool-use #agent #diagnostic #benchmark