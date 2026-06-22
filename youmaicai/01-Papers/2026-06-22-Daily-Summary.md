# 2026-06-22 LLM/NLP 论文日报

## 概览
- **日期**: 2026-06-22
- **论文数量**: 5篇
- **来源**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG)
- **关键词**: LLM interpretability, agent, multimodal, code generation, safety, RLHF
- **备注**: 今日（周一）arXiv 尚未有新提交，所整理为6月18日（周四）批次中的相关论文

## 今日亮点

### 🧠 LLM 可解释性
1. **DiffusionGemma Transparency** - 首个扩散 LLM 推理透明度系统性研究。提出双组件透明度框架（variable/algorithmic），通过 interpretable token bottleneck 将 opaque serial depth 从 28.6X 压缩至 1.1X。发现扩散特异现象：非时序推理、token涂抹、中间上下文推理。

### 🤖 LLM Agent
2. **LedgerAgent** - 推理时工具调用 Agent 的结构化状态管理方法。提出独立状态账本，避免隐式状态重建。在四个客服领域验证，pass@k 优于标准 prompt 方法，尤其在多轮一致性指标下增益最大。

### 👁️ 多模态 LLM
3. **StylisticBias** - 首个属性级 MLLM 社会偏见评估基准。约25K张图像（500基础脸×50变体）。关键发现：15个属性解释了80%总变异，年龄/体型主导identity效应，时尚风格驱动最大属性偏移。

### 💻 代码生成
4. **Multi-LCB** - 跨12种编程语言的 LLM 代码生成基准（ICLR 2026）。发现 Python 过度拟合、语言特异性污染和跨语言性能差距。评估了24个 LLM。

### 🔒 LLM 安全
5. **Safety-Aligned LLM Compliance** - 系统分析混合遵从演示对安全对齐 LLM 的影响。发现偏好优化阶段是防止 ICL jailbreaking 的关键防线，演示顺序存在强烈 recency bias。

## 分类统计

| 领域 | 论文数 | 论文 |
|------|--------|------|
| LLM 可解释性 | 1 | DiffusionGemma |
| Agent 系统 | 1 | LedgerAgent |
| 多模态/偏见 | 1 | StylisticBias |
| 代码生成 | 1 | Multi-LCB |
| 安全对齐 | 1 | Safety-Aligned LLM |

## 值得关注的技术点

### DiffusionGemma 透明度框架
- Variable transparency：理解中间计算状态
- Algorithmic transparency：重建输出过程
- Token bottleneck 映射去噪步骤间信息流

### LedgerAgent 状态账本
- 显式状态表示与隐式重建的对比
- 策略前置检查阻止违规工具调用

### StylisticBias 控制变量法
- 固定 identity，改变单一视觉属性
- 约25K图像，25个社会判断场景

### Multi-LCB 跨语言评估
- 12种编程语言
- 保留 LCB 污染控制协议
- Python 过度拟合证据

### Safety-Aligned LLM 发现
- Preference Optimization 防止良性演示增加有害遵从
- 演示顺序 recency bias
- ICL 与拒绝格式的交互模型差异

---

*由 油麦菜 Agent 自动生成 | 2026-06-22*
