# REOPOLD: Scaling Reasoning Efficiently via Relaxed On-Policy Distillation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Scaling Reasoning Efficiently via Relaxed On-Policy Distillation |
| 作者 | Jongwoo Ko, Sara Abdali, Young Jin Kim, Tianyi Chen, Pashmina Cameron |
| 链接 | [arXiv:2603.11137](https://arxiv.org/abs/2603.11137) |
| arXiv | arXiv:2603.11137 |
| 分类 | cs.LG, cs.CL |
| 日期 | 2026-03-11 |

## 核心贡献
1. **理论洞见**：将 on-policy distillation 解释为策略优化，teacher-student log-likelihood ratio 作为 token reward
2. **REOPOLD 框架**：通过放松严格模仿约束稳定优化
3. **突破性效率**：6.7~12x 样本效率提升，7B student 匹配 32B teacher

## 背景：On-Policy Distillation

### 问题
- 用于将推理能力迁移到容量受限模型
- 容易不稳定和负迁移

### 传统视角
- 知识蒸馏
- 模仿学习

### 新视角：Policy Optimization
```
On-policy distillation = Policy optimization
Teacher-student log-likelihood ratio = Token reward
```

## 方法：REOPOLD

**R**elaxed **O**n-**P**olicy **D**isti**ll**ation (REOPOLD)

### 三大技术
1. **Mixture-based Reward Clipping**：基于混合的奖励裁剪
2. **Entropy-based Token-level Dynamic Sampling**：基于熵的 token 级动态采样
3. **Unified Exploration-to-Refinement Training Strategy**：统一的探索到精炼训练策略

### 核心思想
- 适度且选择性地利用 teacher 的奖励
- 放松标准 on-policy distillation 的严格模仿约束

## 实验结果

### 样本效率
| 对比 | 结果 |
|------|------|
| vs RL 方法 | 6.7~12x 更高样本效率 |

### 推理性能
| 任务 | 结果 |
|------|------|
| 数学推理 | 显著提升 |
| 视觉推理 | 显著提升 |
| Agent 工具使用 | 显著提升 |

### 惊人结果
> **7B student matches 32B teacher in visual reasoning with ~3.32x inference speedup.**

### 测试时扩展
- 训练时更高的样本效率
- 推理时增强的测试时扩展能力

## 关键洞见

### 理论贡献
- On-policy distillation 可以形式化为策略优化
- Teacher-student log-likelihood ratio 作为奖励信号

### 实践贡献
- 放松约束比严格模仿更有效
- 选择性利用 teacher 奖励避免负迁移

## 应用场景
- 推理能力迁移
- 模型压缩
- 高效推理系统
- 数学/视觉/Agent 推理任务

## 标签
#distillation #reasoning #sample-efficiency #policy-optimization #LLM #knowledge-transfer
