# Consistency-Gated De-colloquialisation for Dialogue Fact-Checking (BiCon-Gate)

## 基本信息
- **arXiv**: [2604.14389](https://arxiv.org/abs/2604.14389) [cs.CL]
- **作者**: Hyunkyung Park et al.
- **发表**: 2026-04-15
- **会议**: **FEVER 2026**

## 核心贡献

### 问题背景
对话中的自动事实核查面临特殊挑战：
- 口语语言（colloquial language）频繁出现
- 但研究不足

### BiCon-Gate 框架
语义感知的一致性门控：

#### Stage 1: De-colloquialisation
保守改写候选：
- 轻量级表面规范化
- 作用域内代词消解

#### Stage 2: Consistency Gate
语义一致性选择：
- 仅当改写候选被对话上下文语义支持时选择
- 否则回退到原始声明

## 关键创新

### 为什么不一次性完成所有去口语化？
- Decoder-based one-shot LLM 改写（一次性完成所有步骤）表现较弱
- 分阶段方法更好：保持保守，仅在有把握时改写

### 门控机制
```
原始声明 → De-colloquialisation → 一致性检查
                                          ↓
              被支持？→ Yes → 使用改写版本
                                          ↓ No → 使用原始版本
```

## 实验结果

### DialFact 基准
- 改善证据检索
- 改善事实验证
- 在 **SUPPORTS** 类型上提升尤为显著

### 对比基线
优于竞争基线，包括：
- Decoder-based one-shot LLM 改写方法

## 局限性
- 仅在 DialFact 验证
- 其他对话数据集适用性待测试

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：对话事实核查、事实验证、口语处理
- **创新点**：首个将一致性门控用于对话去口语化的方法

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | 对话事实核查与 NLP*
