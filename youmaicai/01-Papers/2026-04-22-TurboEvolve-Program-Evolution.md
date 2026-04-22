# TurboEvolve: Towards Fast and Robust LLM-Driven Program Evolution

## 元信息
| 标题 | TurboEvolve: Towards Fast and Robust LLM-Driven Program Evolution |
|------|---------------------------------------------------------------|
| 作者 | Yang Yang, Zining Zhong, Jindong Li, Jiemin Wu, Kaishen Yuan, Wenshuo Chen, Menglin Yang, Yutao Yue |
| 链接 | [原文](https://arxiv.org/abs/2604.18607) |
| arXiv | arXiv:2604.18607 |
| 发表日期 | 2026-04-12 |
| 类别 | cs.NE, cs.AI |
| 备注 | 12 pages, 8 figures |

## 核心贡献
1. **Multi-island evolutionary framework**: 提升 sample efficiency 和 robustness
2. **Verbalized Sampling**: LLM 生成 K 个多样化候选 + 显式自分配采样权重
3. **Online scheduler**: 自适应调整 K——停滞时扩展探索，稳态时减少开销
4. **Seed-pool injection**: 聚类种子跨岛分配 + 受控扰动 + 精英保留

## 方法架构

### 问题
LLM-driven program evolution 成本高 + run-to-run 方差大 → 阻碍可靠进展

### TurboEvolve 组件

#### 1. Verbalized Sampling
- Prompt LLM 发出 K 个多样化候选
- 每个候选附带显式自分配采样权重
- 借鉴 evolutionary algorithms 的 multiple-offspring 策略

#### 2. Online Scheduler
```python
if stagnation:  # 探索停滞
    K += delta  # 扩大 K，扩展探索
else:  # 稳态进展
    K -= delta  # 减小 K，减少开销
```

#### 3. Seed-pool Injection
- 聚类现有 solution pool 中的种子
- 跨岛屿分配 + 受控扰动
- 精英保留：balance diversity and refinement

### 实验结果
- 多个 program-optimization benchmarks 一致更强
- 相同预算下更高性能
- 多个任务上改进 best-known solutions

## 局限性
- 依赖 LLM 的 sampling diversity 能力
- 超参数（K 调整策略）需调优

## 建议
- **是否推荐使用**：是（预算受限场景特别有效）
- **适用场景**: Program synthesis, 自动代码优化, evolutionary computation

## 标签
#LLM #program-synthesis #evolutionary-algorithms #program-evolution