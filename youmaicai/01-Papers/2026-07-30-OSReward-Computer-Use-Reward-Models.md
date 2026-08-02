# OSReward: Standardized Evaluation for Cross-Platform Computer-Use Reward Models

## 元信息
| 标题 | OSReward: Instituting Standardized Evaluation for Cross-Platform Computer-Use Reward Models |
|------|-----|
| 作者 | Qiushi Sun, Kanzhi Cheng, Yian Wang, et al. (24 authors) |
| 链接 | [原文](https://arxiv.org/abs/2607.28609) |
| arXiv | arXiv:2607.28609 |
| 类别 | cs.AI, cs.CL, cs.CV |
| 发表 | 2026-07-30 |
| 代码 | https://os-copilot.github.io/OSReward-Home/ |

## 核心贡献

1. **OSReward 基准**：首个评估 CUA（Computer-Using Agent）轨迹的 VLM 法官可靠性的标准化基准
2. **OSReward-Hard**：聚焦于真正困难案例的挑战集
3. **OSReward-Multi**：用于细粒度效率和一致性评分的评估集
4. **OS-Shepherd**：开源的推理注释轨迹判断语料库（100K），包含 9B 和 35B 奖励模型

## 核心问题

CUA（计算机使用智能体）快速发展，验证其是否完成任务对评估、数据整理和强化学习至关重要。目前依赖 VLM 作为轨迹法官，但这些法官的可靠性从未被系统研究。

## 方法

### 轨迹来源
- 多样化的智能体骨干在不同平台上执行人工验证的指令
- 通过多阶段人工注释标注真实标签

### 评估发现
- 即使是最先进的 VLM 法官也达不到理想法官水平
- 存在系统性宽松偏差：将失败运行误标为成功
- 可靠的法官成本太高，无法规模化使用
- 廉价开源模型差距很大

### OS-Shepherd 模型
- 训练于 OS-Shepherd-100K 语料库
- 9B 和 35B 两种规模
- 以商业法官 30-60% 更低的成本提供可靠奖励信号

## 关键发现

1. **Leniency Bias（宽松偏差）**：现有 VLM 法官系统性地将失败运行误标为成功
2. **Cost-Reliability Trade-off**：可靠的法官成本高昂，廉价模型性能不足
3. **系统性不足**：即使是前沿模型也无法达到理想法官水平

## 局限性

- 基准覆盖范围有限
- 注释成本高
- 跨平台泛化待验证

## 链接
- 主页: https://os-copilot.github.io/OSReward-Home/
- 代码/基准/数据集/模型检查点: 开源可用
