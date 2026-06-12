# ReCal: Reward Calibration for RL-based LLM Routing

## 基本信息
| 标题 | ReCal: Reward Calibration for RL-based LLM Routing |
|------|------|
| 作者 | Qihang Yu, Hanwen Tong, Zhengqi Zhang, Bo Zheng, Feng Wei, Shengyu Zhang, Zemin Liu, Fei Wu |
| 链接 | [原文](https://arxiv.org/abs/2606.12479) |
| arXiv | arXiv:2606.12479 |
| 代码 | [Code](https://anonymous.4open.science/r/ReCal) |

## 核心贡献
1. **ReCal 框架**：层级奖励分解 + 分布感知优化
2. **层级奖励分解**：组件级优势估计，解决多目标奖励聚合导致的信用分配模糊
3. **分布感知优化**：方差感知重加权 + 每数据集归一化，校准优化变异性

## 问题背景
- 异构任务（不同难度）下奖励信号不可比
- 多目标（正确性、格式行为）聚合为单一标量奖励 → 信用分配模糊、优化信号冲突
- 奖励信号在实例间存在显著变异性 → 偏好 trivial 样本而非信息样本

## 技术方法
```math
层级奖励分解: R = [R_1, R_2, ..., R_k] → component-wise advantage estimation
分布感知优化: variance-aware reweighting + per-dataset normalization
```

## 实验结果
- 7 个数据集验证一致改进
- 路由性能和训练稳定性均提升

## 关键发现
- 单一标量奖励不足以支撑 RL-based LLM 路由
- 方差感知重加权可有效校准优化偏差

## 局限性
- 需要额外的奖励分解工程
- 依赖任务特定的多目标定义

## 建议
- 是否推荐使用：**是**
- 适用场景：多 LLM 路由、RL-based LLM 训练

---
Tags: #RL #LLM-routing #reward-calibration #reinforcement-learning