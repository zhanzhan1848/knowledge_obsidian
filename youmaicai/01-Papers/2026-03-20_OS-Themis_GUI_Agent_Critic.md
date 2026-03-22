# OS-Themis: Scalable Critic Framework for GUI Agents

## 元信息
| 属性 | 值 |
|------|------|
| 标题 | A Scalable Critic Framework for Generalist GUI Rewards |
| 作者 | Zehao Li, Zhenyu Wu, Yibo Zhao, Bowen Yang et al. |
| 链接 | [arXiv:2603.19191](https://arxiv.org/abs/2603.19191) |
| arXiv | arXiv:2603.19191 |
| 日期 | 2026-03-19 |
| 类别 | cs.AI |

## 核心贡献
1. **OS-Themis框架**: 可扩展准确的多Agent评论框架
2. **里程碑分解**: 将轨迹分解为可验证里程碑
3. **证据链审计**: 严格审计证据链后做出裁决
4. **OmniGUIRewardBench**: 跨平台GUI奖励基准

## 模型架构
### 多Agent Critic框架
```
GUI轨迹输入
    │
    ↓
里程碑分解 (Milestones)
    │
    ├─→ 里程碑1 → 证据提取
    ├─→ 里程碑2 → 证据提取
    └─→ 里程碑N → 证据提取
            │
            ↓
      证据链审计 (Review)
            │
            ↓
        最终裁决
```

### 核心组件
1. **里程碑分解器**: 分离关键决策点
2. **证据提取器**: 提取里程碑证据
3. **审计机制**: 严格验证证据链
4. **裁决器**: 基于完整证据做出判断

## 训练方法
### RL训练支持
- 在线RL训练
- 轨迹验证与过滤
- 自训练循环

## 实验结果
### OmniGUIRewardBench (OGRBench)
- 所有评估模型在OS-Themis下达到最佳性能
- 跨平台GUI奖励评估

### AndroidWorld实验
| 应用场景 | 提升 |
|----------|------|
| 在线RL训练 | +10.3% |
| 自训练循环过滤 | +6.9% |

### 关键发现
1. 奖励函数质量对GUI Agent RL训练至关重要
2. 里程碑分解有效隔离关键证据
3. 审计机制提高裁决准确性

## 局限性
- 需要里程碑定义
- 增加评估计算开销

## 建议
- **是否推荐使用**: 是
- **适用场景**:
  - GUI Agent训练
  - 轨迹评估
  - 自动化测试

## 技术细节
### GUI Agent奖励挑战
| 方法 | 可扩展性 | 性能 |
|------|----------|------|
| 单一评判器 | 高 | 低 |
| 人工标注 | 低 | 高 |
| OS-Themis | 高 | 高 |

### 里程碑定义
```
里程碑 = {
    action: 执行的动作,
    state: 执行前状态,
    expected: 期望结果,
    evidence: 验证证据
}
```

## 相关链接
- [[gui-agents]]
- [[rl-training]]
- [[reward-modeling]]
- [[multimodal-agents]]
