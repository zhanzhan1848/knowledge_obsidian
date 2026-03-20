# OS-Themis: A Scalable Critic Framework for Generalist GUI Rewards

## 元信息
| 标题 | A Scalable Critic Framework for Generalist GUI Rewards |
|------|---------------------------------------------------------|
| 作者 | Zehao Li, Zhenyu Wu, Yibo Zhao, Bowen Yang, Jingjing Xie, Zhaoyang Liu, Zhoumianze Liu, Kaiming Jin, Jianze Liang, Zonglin Li, Feng Wu, Bowen Zhou, Zun Wang, Zichen Ding |
| 链接 | [原文](https://arxiv.org/abs/2603.19191) |
| arXiv | arXiv:2603.19191 |
| 日期 | 2026-03-19 |
| 分类 | cs.AI |

## 核心贡献
1. **OS-Themis框架**: 可扩展、准确的多Agent评论家框架
2. **里程碑分解**: 将轨迹分解为可验证的里程碑，隔离关键证据
3. **审查机制**: 严格审计证据链后做出最终裁决
4. **OmniGUIRewardBench (OGRBench)**: 全面的跨平台GUI结果奖励基准
5. **显著性能提升**: 在线RL训练+10.3%，自训练循环+6.9%

## 问题背景
- RL有潜力提高GUI Agent在随机环境中的鲁棒性
- 训练对奖励函数质量高度敏感
- 现有方法难以同时实现可扩展性和性能

## 方法设计
### 多Agent评论家框架
- **轨迹分解**: 分解为可验证里程碑
- **证据隔离**: 隔离关键决策证据
- **审查机制**: 严格审计证据链

### 评估基准
- **OGRBench**: 跨平台GUI结果奖励基准
- 所有模型在OS-Themis下达到最佳性能

## 实验结果
- **AndroidWorld测试**:
  - 在线RL训练: +10.3%改进
  - 轨迹验证/过滤: +6.9%增益
- **跨平台**: 在OGRBench上所有模型表现最佳

## 技术亮点
- 多Agent协作架构
- 里程碑式轨迹分解
- 证据链审查机制
- 可扩展的奖励建模

## 适用场景
- GUI Agent训练
- 轨迹评估与过滤
- RL奖励设计
- Agent自训练系统

## 相关链接
- [[GUI-Agent]]
- [[RL-Reward-Model]]
- [[Multi-Agent]]
- [[Agent-Evaluation]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
