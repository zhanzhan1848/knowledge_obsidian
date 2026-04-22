# Experimental Demonstration of SDRL Controller for TS Wave Suppression with DBD Actuator

## 论文信息
- **arXiv ID**: [2604.19326](https://arxiv.org/abs/2604.19326)
- **作者**: Babak Mohammed (等)
- **日期**: 2026-04-21
- **类别**: physics.flu-dyn

## 核心创新点
1. **无模型单步深度强化学习 (SDRL) 控制器**
   - 用于平面板边界层 TS (Tollmien-Schlichting) 波抑制
   - 在线从测量误差信号更新策略

2. **前馈布局部署**
   - 上游参考麦克风 → DBD 等离子体执行器 → 下游误差麦克风
   - FIR 滤波器映射参考信号到驱动命令

## 实验设置
- **风洞**: 消声设施
- **传感**: 埋入式压力麦克风 + 二分量平面 PIV
- **执行器**: DBD (介质阻挡放电) 等离子体致动器
- **触发源**: 上游 DBD 触发执行器（单频/多频/白噪声）

## 关键结果
- 在所有测试场景中一致降低下游扰动水平
- 对来流速度和入射 TS 波扰动频谱的适度变化具有鲁棒性

## 物理机制
TS 波是边界层转捩的关键触发因素：
- 在低湍流度风洞中人工引入
- SDRL 控制器通过等离子体激励抑制这些波
- 支持边界层转捩延迟的实际策略

## 方法论
| 组件 | 描述 |
|------|------|
| 控制器 | 无模型单步 DRL (Deep Reinforcement Learning) |
| 信号处理 | FIR 滤波器 |
| 在线学习 | 实时策略更新 |
| 传感 | 压力麦克风 (反馈) + PIV (验证) |

## 链接
- PDF: https://arxiv.org/pdf/2604.19326
- HTML: https://arxiv.org/html/2604.19326v1

## 标签
#flow-control #boundary-layer #TS-wave #DBD-actuator #deep-reinforcement-learning #transition-delay #plasma-actuator