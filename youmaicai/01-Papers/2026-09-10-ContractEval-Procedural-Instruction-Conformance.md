# 🥬 LLM 论文分析：ContractEval

## 基本信息
- **标题**: ContractEval: Query-Conditioned Execution Matching for Procedural Instruction Conformance
- **作者**: Praphul Singh et al.
- **链接**: [arXiv:2609.09458](https://arxiv.org/abs/2609.09458)
- **arXiv**: arXiv:2609.09458v1
- **类别**: cs.AI

## 核心贡献

1. **程序义务框架**: 将程序指令表示为查询激活的义务 (query-active obligations)
2. **证据匹配**: 将义务与响应或轨迹证据匹配
3. **失败类型分类**: 遗漏、错误分支、顺序错误、额外动作、不变式违反、输出合同违规

## 核心问题

LLM Agent 从问答转向执行程序时，失败可能是"无理由的"：
- 最终回答看起来可接受
- 但系统跳过了使答案合理所需的检查/分支/依赖/不变式

**现有评估局限**:
- Output-only: 看到答案但看不到过程
- Trace-aware: 看到活动但看不到激活了哪些义务

## 方法

**ContractEval**:
```
程序指令 → 查询激活义务 → 与响应/轨迹证据匹配 → 失败类型分类
```

## 实验结果

- 在受控审计的程序合同上
- Output-only 和 trace-aware LLM judge 遗漏大量注入的结构性失败
- ContractEval 在 gold expected/observed 图下检测并定位所有失败

## 局限性

- LLM 支持的提取保留大部分信号但对校准敏感
- 不是合规保证，而是让程序合规可审计

## 建议
- **是否推荐使用**: 是（用于评估程序执行型 Agent）
- **适用场景**: Agent 合同执行审计、工作流合规性评估
- **亮点**: 首次提出程序义务的概念，为 Agent 程序执行评估提供新框架

---

标签: #LLM-Agent #程序执行 #合规性评估 #Agent评测 #工作流
