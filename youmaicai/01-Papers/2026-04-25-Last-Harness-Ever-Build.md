# The Last Harness You'll Ever Build: Automated AI Agent Harness Engineering

## 元信息
| 标题 | The Last Harness You'll Ever Build |
|------|------|
| 作者 | Haebin Seong, Li Yin, Haoran Zhang |
| 链接 | [原文](https://arxiv.org/abs/2604.21003) |
| arXiv | arXiv:2604.21003 |
| 发表 | cs.AI |

## 核心贡献
1. **两级自动化框架**：Harness Evolution Loop（单任务 harness 优化）+ Meta-Evolution Loop（跨任务协议优化）
2. **零人工 harness 工程**：新领域 adaptation 无需人类专家介入
3. **将自动化本身自动化**：meta-learning 形式化，对应元学习理论

## 核心概念

### Agent = Model + Harness
Raw model 本身不是 agent。Harness 是除模型本身之外的所有代码、配置和执行逻辑：
- System/task prompts
- Tools, skills, descriptions
- Bundled infrastructure (filesystem, sandbox, browser)
- Orchestration logic (subagent spawning, handoffs, model routing)
- Hooks and middleware
- Model configurations

### Harness Evolution Loop
```
Worker Agent W_ℋ (参数化为 harness ℋ) 执行任务 → 
Evaluator Agent V 诊断失败、评分 → 
Evolution Agent E 基于历史修改 harness ℋ
```
迭代 K 步，返回最佳 harness ℋ^(best)

### Meta-Evolution Loop
跨多个任务优化演化协议 Λ = (W_ℋ, ℋ^(0), V, E) 本身，学习 Λ^(best) 使新任务上快速收敛。

### 关键组件
- **Worker Agent**：在 harness 参数化下执行任务，产生执行 trace
- **Evaluator Agent**：对抗性验证、诊断失败模式、评分（状态验证 + 标准检查 + 性能审计 + 打分）
- **Evolution Agent**：聚合诊断、生成改进 harness（新 prompt、tools、orchestration logic、observations、model config）

## 算法
```python
# Harness Evolution Loop
for k in 1..K:
    trace = W_ℋ.execute(task)
    (report, score) = V.evaluate(trace, task)
    if score > best_score:
        ℋ_best = ℋ_(k-1)
    ℋ_k = E.evolve(history, ℋ_best)
```

```python
# Meta-Evolution Loop  
for j in 0..:
    for task in train_tasks:
        (ℋ_i_best, score_i, history_i) = HarnessEvolutionLoop(task, Λ^(j), K)
    meta_score = Aggregate(score_i across tasks)
    Λ_(j+1) = E_meta.evolve(meta_history, Λ_best)
```

## 已有 harness 示例
- AdaL (SylphAI): 通用软件工程
- Claude Code (Anthropic): 通用软件工程
- Codex (OpenAI): 代码生成
- OpAgent: 自主网页导航 (WebArena SOTA)

## 局限性
- 两级进化计算成本高（跨任务元训练）
- 初始 harness ℋ^(0) 选择影响收敛速度
- 对抗性 evaluator V 的质量决定整个框架上限

## 建议
- **适用场景**：AI Agent 自动构建、Domain adaptation、AutoML for Agents
- **推荐程度**：⭐⭐⭐⭐ — 概念宏大，两级框架设计完整，值得深入研究
