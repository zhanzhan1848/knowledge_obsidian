# Trust Between AI Agents: Measuring Formation, Breakage, and Recovery

## 元信息
| 标题 | Trust Between AI Agents: Measuring Formation, Breakage, and Recovery, with Implications for Governing Multi-Agent Systems |
|------|-----|
| 作者 | Yujiao Chen |
| 链接 | [原文](https://arxiv.org/abs/2606.14923) |
| arXiv | arXiv:2606.14923 |
| 领域 | cs.AI, cs.CY, cs.MA |

## 核心贡献
1. 提出基于**代价验证**的行为信任测量方法：在合作生存游戏中，检查队友工作消耗资源，信任错误答案可能是致命的
2. 相比无记忆版本的同一模型，减少验证 ≈ 可观测的信任度量
3. 研究了 6 个前沿模型快照的信任形成、破裂和恢复模式
4. 发现：信任倾向可以在部署前测量，**校准而非最大怀疑**应该是多 Agent AI 系统的治理核心

## 方法：合作生存游戏
### 设置
- Agent 团队合作完成需要验证的任务
- 验证队友工作：消耗资源
- 信任错误答案：导致任务失败
- 相对无记忆基线，减少的验证量 = 信任程度

### 信任行为指标
```
Trust = 1 - (有记忆模型的验证率 / 无记忆模型的验证率)
```

## 实验结果

### 信任形成
- 4 个模型（Claude Opus 4.6, Claude Sonnet 4.6, GPT-5.1, Gemini 3.1 Pro）当与可靠队友配对时，验证率降低 **60-85%**
- 2 个较小模型：几乎没有调整

### 信任破裂
- 失败逆转信任折扣
- 模型反应差异：
  - 一些集中审查罪魁祸首
  - 另一些对整个团队更加谨慎

### 信任恢复
- **恢复比形成慢**
- **集中失败**比分散失败维持更长的怀疑期

### 实用影响
| 信任倾向 | 行为表现 | 任务收益 |
|----------|----------|----------|
| 高信任 | 验证少、决策快 | 高收益 |
| 过度验证 | 犹豫不决 | 低收益（并非更安全）|

## 治理启示
1. 信任倾向可以在部署前测量
2. **校准 > 最大怀疑**：过度验证关联于犹豫不决，而非安全
3. 多 Agent 系统的治理应关注信任校准，而非消除信任

## 关键词
`Multi-Agent Systems` `Trust` `AI Governance` `Cooperation` `Verification` `AI Safety`
