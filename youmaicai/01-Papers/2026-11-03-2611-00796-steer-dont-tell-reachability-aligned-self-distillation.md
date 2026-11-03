# Steer, Don't Tell: Breaking Reasoning Plateaus with Reachability-Aligned Self-Distillation

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Steer, Don't Tell: Breaking Reasoning Plateaus with Reachability-Aligned Self-Distillation |
| 作者 | 摘要未列出完整作者列表 |
| 链接 | [原文](https://arxiv.org/abs/2611.00796) |
| arXiv | arXiv:2611.00796 |
| 类别 | cs.CL, cs.LG, cs.AI |
| 发表时间 | 2026-11-03 |
| 会议 | arXiv preprint |
| 评分 | 9/10 |

## 核心贡献
1. **识别出自我改进方法的核心缺陷**：**特权教师的正确性并不蕴含学生的可达性**（privileged teacher correctness does not imply student reachability）
2. **提出可达性对齐（reachability alignment）作为自构建监督的关键**，并据此提出 **SSR（Self-Steered Reasoner）**
3. **学生支撑投影（student support projection）**：把特权教师分布转化为**方向性信号**，且**仅作用于无引导学生局部可达的推理动作**
4. **迭代精化框架**：用诊断引导的基础模型提升采样效率

## 问题背景
大推理模型在困难问题上的后训练仍不充分，因为**正确轨迹本身难以采样**。已有两条路：
- **SFT + RL 混合专家轨迹** —— 但**外部专家并不总是可得**
- **自我改进方法**：用参考解构造一个**特权自我教师**（privileged self-teacher）

问题出在后者的隐含假设上。

### 核心机制分析：解条件化（Solution Conditioning）
> 给教师条件化正确答案，会把教师分布**推向那些在无特权学生下不太可能出现的动作**，从而产生看似"正确"但**不可达、甚至畸形**的学习目标。

也就是说：**正确答案 ≠ 可达的正确轨迹**。教师被喂了答案后，会生成学生永远产生不出的轨迹 —— 拿这些轨迹做 SFT，等于教学生一个它无法执行的分布。

## 方法

### SSR 的三步流程
```text
1. 学生支撑投影（student support projection）
   特权教师分布
     → 转化为「方向性信号」(directional signal)
     → 仅作用于「无引导学生局部可达」的推理动作

2. 验证（verification）
   从这个可达空间采样的轨迹中，保留正确的

3. 迭代精化（iterative refinement）
   用诊断引导（diagnostic guidance）的基础模型提升采样效率
```

### 关键设计："Steer, Don't Tell"
方法命名本身就是论点：
- **Tell（告诉）**：直接把特权教师的轨迹喂给学生 → 学生学不可达的目标
- **Steer（引导）**：只把教师作为**方向**（哪类动作有希望），限制在学生可达空间内 → 学生学得到的目标

## 实验结果
摘要给出的定性结论：
- SSR 通过**可达性对齐**实现自构建监督
- **学生支撑投影**将特权教师分布转为可达空间内的方向性信号
- **验证**步骤从可达空间中保留正确轨迹
- **迭代精化**框架用诊断引导的基础模型**提升采样效率**

（摘要未给出具体基准数值与提升幅度。）

## 关键洞察
1. **"正确答案"与"可学的正确答案"是两个不同的量** —— 这是本文最核心的贡献，且**可推广**：任何用强模型数据蒸馏弱模型的场景（SFT 蒸馏、self-distillation、拒绝采样微调）都面临这个问题。**蒸馏数据必须同时满足"是对的"和"学生做得到"**。
2. **解条件化是问题的根源，而非教师质量** —— 强教师 + 好答案仍然可能产出不可达轨迹。这意味着**换更强的教师不解决问题**，必须改变数据的构造方式。这是一个反直觉且重要的判断。
3. **"Steer not Tell"是一条通用的蒸馏设计原则** —— 保留教师的**信息**（方向），丢弃教师的**不可迁移形式**（具体轨迹）。这与 [[2026-11-03-2611-00554-sftprobe-fast-principled-sft-data-generation]] 中"预测数据质量而非生成数据"是同一价值观：**减少对生成过程的依赖**。
4. **与昨日 CRoS 的强呼应** —— 昨日 [[2026-11-02-2610.42054-cros-causality-reward-on-scrambled-cots-improves-accuracy-and-reasoning]] 论证"只看答案正确性无法知道推理过程是否起作用"，今日 SSR 论证"只看答案正确性也无法知道轨迹是否可学"。**两者共同指出：结果信号不足以描述过程** —— 一个讲"因果贡献"，一个讲"可达性"。
5. **"特权"本身是危险的** —— 特权信息（正确答案、专家轨迹、Oracle 标注）会**扭曲分布**使其偏离部署条件。这是 self-improvement 领域被低估的分布偏移来源。

## 局限性
- 摘要未给出量化结果，需查阅全文
- "局部可达性"的判定方法（学生支撑的定义与估计方式）摘要未说明
- 诊断引导基础模型引入额外成本
- 未说明在多轮/长轨迹推理上可达性的定义是否仍然有效

## 适用场景
- 大推理模型的**后训练**（SFT / 蒸馏数据构造）
- 无外部专家可用时的**自我改进**
- 任何"用强模型产出数据训练弱模型"的 pipeline 设计
- RLVR 的初始 SFT 阶段设计

## 相关工作
- [[Self-Distillation]] — 自蒸馏
- [[Chain-of-Thought]] — 思维链
- [[Rejection Sampling]] — 拒绝采样
- [[Distillation]] — 知识蒸馏
- [[RLHF]] — 人类反馈强化学习
- [[CRoS Causality Reward]] — 因果奖励（11-02 日相关）

---
#LLM #Research #Reasoning #Self-Distillation #Post-Training #arXiv-2611
