# GeneralThinker: Domain-General Reasoning through Likelihood-Guided Optimization

## 元信息
| 标题 | GeneralThinker: Domain-General Reasoning through Likelihood-Guided Answer-Conditioned Optimization |
|------|------|
| 作者 | Shengmin Piao |
| 链接 | [原文](https://arxiv.org/abs/2605.27934) |
| arXiv | arXiv:2605.27934 |
| 发表 | 2026-05-27 (v1) |
| 领域 | cs.CL |

## 核心贡献

1. **Dense Answer-Conditioned Optimization**: 将推理监督重新表述为密集的答案条件优化
2. **Response-level Evaluation**: 实现响应级评估，无需领域特定验证器
3. **Token-level Credit Assignment**: 细粒度 token 级信用分配

## 方法论

### 核心机制

1. **Likelihood-based Evaluation**: 
   - 使用正确答案的似然评估生成的推理轨迹
   - 推导 token 级兼容性信号

2. **Stabilization Techniques**:
   - Clipping: 约束 token 级更新
   - Direction-preserving Modulation: 方向保持调制

### 与传统 RL 对比
| 方面 | 传统 RL | GeneralThinker |
|------|--------|----------------|
| 验证器 | 领域特定 | 通用 |
| 奖励 | 稀疏 outcome | 密集答案条件 |
| 信用分配 | 粗粒度 | 细粒度 token 级 |

## 实验结果

### 覆盖范围
- **11 个基准测试**: 数学、STEM、一般推理

### 发现
- 最佳平均性能
- 无控制的 token 级调制可能破坏训练稳定性
- 受控调制使细粒度信用分配始终有效

## 关键词
#RL #Reasoning #Credit-Assignment #Domain-General #Answer-Conditioned