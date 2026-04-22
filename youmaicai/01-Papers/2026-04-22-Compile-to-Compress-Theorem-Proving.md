# Compile to Compress: Boosting Formal Theorem Provers by Compiler Outputs

## 元信息
| 标题 | Compile to Compress: Boosting Formal Theorem Provers by Compiler Outputs |
|------|---------------------------------------------------------------------|
| 作者 | Guchan Li, Rui Tian, Hongning Wang |
| 链接 | [原文](https://arxiv.org/abs/2604.18587) |
| arXiv | arXiv:2604.18587 |
| 发表日期 | 2026-03-13 |
| 类别 | cs.LG, cs.AI, cs.LO, cs.PL |
| 会议/期刊 | - |

## 核心贡献
1. **编译器输出压缩**：利用编译器将大量不同证明尝试映射到紧凑的结构化失败模式集合
2. **Learning-to-Refine 框架**：基于此压缩特性进行高效学习和证明探索
3. **局部树搜索纠错**：基于显式验证器反馈本地修正错误，避免积累长历史证明尝试的高成本

## 方法架构

### 核心观察
编译器在形式验证中将大量多样的证明尝试映射到一小部分结构化失败模式 → 提供了可利用的压缩结构

### 学习-修正框架
- Tree search that corrects errors locally conditioned on explicit verifier feedback
- Circumvents costs of accumulating long history of proof attempts
- 对 ~8B 和 ~32B 参数模型均有效

### 实验结果
- **PutnamBench**: 在可比测试时间预算下，达到 ~8B 和 ~32B 参数模型中公开报告的最高性能
- 跨不同规模的 base provers 均一致提升推理能力

## 局限性
- 依赖编译器提供的结构化反馈
- 主要针对形式定理证明任务

## 建议
- **是否推荐使用**：是（SOTA 结果）
- **适用场景**：LLM theorem proving, verifier-guided reasoning, formal verification

## 相关工作
- LLM for formal theorem proving
- Test-time compute scaling
- Massive roll-outs / extended context windows approaches

## 标签
#theorem-proving #formal-verification #LLM #test-time-compute #compiler #tree-search