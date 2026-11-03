# Human-Supervised Artificial Intelligence Researchers in Electric Power Systems: Knowledge, Physics, Simulation, and Governance for Large Language Models

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Human-Supervised Artificial Intelligence Researchers in Electric Power Systems: Knowledge, Physics, Simulation, and Governance for Large Language Models |
| 作者 | 摘要未列出完整作者列表 |
| 链接 | [原文](https://arxiv.org/abs/2611.02711) |
| arXiv | arXiv:2611.02711 |
| 类别 | cs.AI, cs.LG, cs.SE |
| 发表时间 | 2026-11-03 |
| 会议 | arXiv preprint（24 页，综述文章） |
| 评分 | 7/10 |

## 核心贡献
1. **知识-物理-仿真-治理（knowledge-physics-simulation-governance）框架**：明确划分 LLM、模拟器/验证工具与人类专家各自的责任边界
2. **LLM 的角色定位**：LLM 负责**信息抽取**与**把研究请求翻译成代码和工具调用**，但输出**仍需物理验证**
3. **研究可追溯性要求**：研究过程应保留材料以便审查 —— 结论可追溯到来源、计算可复现、失败尝试与批准过程可被检视
4. **分阶段开发路线图与研究报告规范**

## 问题背景
电力系统研究中的结论需要**清晰的证据基础**。研究者必须理解数据来源、建模假设与求解过程，才能判断一个结论在什么条件下成立。

LLM 可以：
- 从文档中抽取信息
- 把研究请求翻译成代码和工具调用

但 LLM 的输出**仍需物理验证** —— 这是本文的核心立场。

## 方法

### 知识-物理-仿真-治理框架
| 层次 | 职责 |
|------|------|
| **LLM** | 翻译信息、协调任务 |
| **模拟器与验证工具** | 测试模型 |
| **人类专家** | 保留对**关键假设、安全边界、最终结论**的权威 |

### 研究流程的可审查性要求
```text
✓ 结论可追溯到来源
✓ 计算可复现
✓ 失败尝试可被检视
✓ 批准过程可被检视
```

### 评测导向
评测应聚焦于**研究产物（research artifacts）及其验证**，而非仅仅模型输出。

## 实验结果
这是一篇**综述文章**（review article），无实验。

给出的产出：
- 电力系统 LLM 应用与相关科学工作流的综述
- 物理接地的 power AI 研究
- 使用 LLM 于科学研究的条件
- 分阶段开发路线图
- 研究报告的要求规范

## 关键洞察
1. **"LLM 输出仍需物理验证"是科学 LLM 的共识底座** —— 与 [[2026-11-03-2611.00633-evidence-grounded-llm-perovskite-solar-cell-design]] 形成有趣对照：那篇让 LLM 的选择**被物理实验证实**（PCE 27.05%），本篇则强调**验证环节必须保留在流程中**。两者共同说明：**物理验证是科学 LLM 的必经环节，而非可选装饰**。
2. **"保留失败尝试与批准过程"是研究治理的核心** —— 这与软件工程的可审计性要求同构。LLM 让研究速度提升后，**审查材料的保留反而更重要**，因为人不再逐步参与流程。
3. **责任边界的三分法很干净**：LLM 做翻译，仿真器做检验，人做裁决。这套划分可直接迁移到其他工程领域。
4. **"评测研究产物而非模型输出"** —— 这呼应了昨日的 Qistas 预注册协议、[[2026-11-02-2610.41803-what-standard-evaluations-hide-about-detectors-of-hijacked-llm-agents-ra]] 等：**评测对象要从"模型的回答"升级到"模型产出的可验证制品"**。

## 局限性
- 综述性质，无实证
- 聚焦电力系统，对其他领域的适用性需谨慎
- "分阶段开发路线图"的具体内容摘要未展开
- 未涉及 LLM 在物理建模本身的局限（模拟器本身的误差如何传播）

## 适用场景
- 电力系统 / 工程科学的 LLM 应用架构设计
- 需要向监管方或审稿人证明研究可信度的流程设计
- 研究机构的数据保留与可审计策略

## 相关工作
- [[LLM for Science]] — 科学 LLM
- [[Simulator-Grounded AI]] — 仿真器接地
- [[Research Reproducibility]] — 可复现研究
- [[AI Governance]] — AI 治理
- [[Human-in-the-Loop]] — 人在环

---
#LLM #Research #Science #Governance #Power-Systems #arXiv-2611
