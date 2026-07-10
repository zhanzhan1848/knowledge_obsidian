# 🥬 LLM 论文分析：AgentLens

## 基本信息
- **作者**: Andrey Podivilov, Vadim Lomshakov, Sergey Savin, Matvei Startsev, Roman Pozharskiy, Maksim Parshin, Sergey Nikolenko
- **发表**: arXiv cs.AI | Tue, 7 Jul 2026
- **链接**: [arXiv:2607.06624](https://arxiv.org/abs/2607.06624)
- **代码**: [agent-lens/agent-lens-bench](https://github.com/agent-lens/agent-lens-bench)
- **关键词**: Code Agent, Benchmark, Trajectory Evaluation, LLM

---

## 核心贡献

1. **问题**: 现有 code agent benchmark 只评估最终结果（pass/fail），忽视了用户实际体验的完整轨迹过程

2. **AgentLens 基准**: 评估完整轨迹
   - 指令遵循能力
   - 工具使用
   - 自我验证
   - 错误恢复
   - 对话交互

3. **双重验证机制**:
   - 形式验证：客观检查存在时使用
   - LLM 轨迹评审 + 并排对比：每轮运行产生可读解释

4. **生产级应用**: 可用于诊断模型行为、比较版本差异、catch 产品回归

---

## 方法框架

```
Code Agent 执行轨迹
  ↓
形式验证 (客观检查) + LLM 评审 (主观评估)
  ↓
可读性解释 + 分数
  ↓
诊断模型行为 / 版本对比 / 回归检测
```

---

## 实验结果

- 在真实代码代理场景验证
- 开源发布：https://github.com/agent-lens/agent-lens-bench

---

## 局限性

- 依赖 LLM 评审的质量
- 形式验证覆盖范围受限

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: Code agent 开发评估、产品级质量监控、模型对比
