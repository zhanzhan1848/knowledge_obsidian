# Nemotron-Cascade 2: Post-Training LLMs with Cascade RL and Multi-Domain On-Policy Distillation

## 元信息
| 标题 | Post-Training LLMs with Cascade RL and Multi-Domain On-Policy Distillation |
|------|-----------------------------------------------------------------------------|
| 作者 | Zhuolin Yang, Zihan Liu, Yang Chen, Wenliang Dai, Boxin Wang, Sheng-Chieh Lin, Chankyu Lee, Yangyi Chen, Dongfu Jiang, Jiafan He, Renjie Pi, Grace Lam, Nayeon Lee, Alexander Bukharin, Mohammad Shoeybi, Bryan Catanzaro, Wei Ping |
| 链接 | [原文](https://arxiv.org/abs/2603.19220) |
| arXiv | arXiv:2603.19220 |
| 日期 | 2026-03-19 |
| 分类 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. **Nemotron-Cascade 2**: 开源30B MoE模型，3B激活参数
2. **卓越推理能力**: 数学推理和编程能力接近前沿开放模型
3. **IMO/IOI/ICPC金牌级性能**: 仅次于DeepSeekV3.2-Speciale-671B-A37B，但参数少20倍
4. **Cascade RL扩展**: 覆盖更广泛的推理和智能体领域
5. **多域在线策略蒸馏**: 从每个领域最强的中间教师模型蒸馏

## 模型架构
- **类型**: Mixture of Experts (MoE)
- **总参数**: 30B
- **激活参数**: 3B
- **高智能密度**: 用20倍少的参数达到相似性能

## 训练方法
1. **SFT阶段**: 精心策划的数据集
2. **Cascade RL扩展**:
   - 覆盖推理和智能体领域
   - 多域在线策略蒸馏
   - 从每个领域最强中间教师蒸馏
3. **恢复基准回归**: 高效维持强性能增益

## 实验结果
- **IMO (国际数学奥林匹克)**: 金牌级性能
- **IOI (国际信息学奥林匹克)**: 金牌级性能
- **ICPC World Finals**: 金牌级性能
- 数学推理和编码性能接近前沿开放模型

## 技术亮点
- **高智能密度**: 参数效率极高
- **Cascade RL**: 级联强化学习框架
- **多域蒸馏**: 跨领域知识迁移

## 局限性
- 模型规模仍较大（30B总参数）
- RL训练成本可能较高

## 适用场景
- 数学问题求解
- 代码生成与理解
- Agent系统
- 复杂推理任务

## 相关链接
- [[RLHF]]
- [[Model-Distillation]]
- [[MoE]]
- [[Reasoning-Models]]
- [[DeepSeek]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
