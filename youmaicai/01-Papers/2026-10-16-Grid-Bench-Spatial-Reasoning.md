# Grid-Bench: Can LLMs Predict How Discrete Worlds Change?

## 元信息
| 标题 | Grid-Bench: Can LLMs Predict How Discrete Worlds Change? |
|------|-------------------------------------------------------|
| 作者 | Zixiang Xu, Zirui Song, Wanrong Zheng, Chiyu Zhang, Yue Huang, Yuyang Peng, Kexin Zhang, Jinkun Chen, Xiuying Chen, Xiangliang Zhang, Yan Liu, Laurent Itti, Frank Shyu, Xiaoqiang Luo, Sandeep Pandey, Xi Liu, Luke Simon, Xiyang Hu, Yue Zhao |
| 链接 | [原文](https://arxiv.org/abs/2610.22312) |
| arXiv | arXiv:2610.22312 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.CL |
| 项目 | [grid-bench.github.io](https://grid-bench.github.io/) |
| 代码 | [GitHub](https://github.com/grid-bench/Grid-Bench) |
| 数据 | [HuggingFace](https://huggingface.co/datasets/xzx34/Grid-Bench) |

## 核心贡献
1. **可执行基准 Grid-Bench**：8 类操作族，作用于 2D/3D/4D 离散网格
2. **任务定义**：给定初始网格 + 显式规则 + 事件历史（文本表达），模型预测完整最终网格
3. **Reference execution**：每个预测值都可直接对照检查
4. **关键发现**：6 个 LLM 评估中，**complete-state accuracy 随历史长度增加急剧下降**

## 任务构造
### 输入
- 初始网格（2D/3D/4D 离散世界）
- 操作规则（8 类操作族）
- 事件历史（自然语言描述）

### 输出
- 完整最终网格状态

### 评价维度
- 操作类型（8 种）
- 历史长度
- 工作负载

## 实验结果
- 6 个 LLM 评测
- **核心发现**：历史长度↑ → 完整状态准确率**急剧下降**
- 单事件表现相近的模型在长历史下表现分化巨大
- **即便在长历史下**，部分模型仍能恢复大量正确 changes（远多于"复制初始状态"）
- Grid-Bench 可同时度量"完整恢复"和"返回状态差异"

## 为什么这个 Benchmark 重要
- 揭示了 LLM 在**多步空间推理**上的弱点
- 与 GSM8K 文本推理、数学推理互补
- 强调"workflow 跟踪" + "状态管理"能力

## 相关工作
[[Spatial-Reasoning]] [[Benchmark]] [[State-Tracking]] [[LLM-Evaluation]] [[World-Modeling]]

## 局限性
- 仅离散网格世界，未涉及连续物理
- 主要评估 textual state tracking，不直接测试 embodied AI
- 8 类操作族是否足够覆盖现实空间任务待验

## 应用建议
- 适合作为 **agent 工作流跟踪** 能力的 eval
- 可与 text-based RL benchmark 联合使用
- 可作为 Long-Context 理解的辅助评估（reasoning 维度）

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
