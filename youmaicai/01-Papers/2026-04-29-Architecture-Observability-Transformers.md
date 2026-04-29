# Architecture Determines Observability in Transformers

## 元信息
| 标题 | Architecture Determines Observability in Transformers |
|------|------|
| 作者 | Thomas Carmichael |
| 链接 | [原文](https://arxiv.org/abs/2604.24801) |
| arXiv | arXiv:2604.24801 |
| 代码 | [GitHub](https://github.com/tmcarmichael/nn-observability) |
| 发表 | cs.LG |

## 核心贡献
1. **Observability 定义**: 从冻结中间层激活线性读取每个 token 决策质量的能力（控制 max-softmax confidence 和激活范数后）
2. **发现架构决定可观测性**: 在 Pythia 控制套件中，(24层, 16头) 配置完全 collapse (rho_partial ~0.10)，而其他6种配置保持在 0.21-0.38 的健康范围
3. **训练动态**: Collapse 在训练过程中逐渐出现，checkpoint 动态显示信号在最早测量的 checkpoint 就已形成，但训练会擦除 (24L, 16H) 类配置中的信号
4. **跨架构泛化**: Qwen 2.5 vs Llama 3.1 8B 在 3B 规模上相差 2.9x；Mistral 7B 保持可观测性，Llama 3.1 8B 则 collapse

## 核心概念

### Observability
定义：从冻结中间层激活，线性预测模型决策质量的能力。

控制变量：必须控制 max-softmax confidence 和激活范数，否则 confidence 控制吸收了 57.7% 的原始探测信号。

### Collapse 现象
某些架构配置无法从中间激活中读出决策质量信号：
- 即使探针非线性、层扫描都无法恢复
- 损失函数继续改善，但可观测性丢失
- 这是架构选择问题，不是训练问题

## 实验发现

### Pythia Suite
- (24L, 16H): 全部 collapse
- 其他6种配置：健康可观测
- 跨 3.5x 参数范围和两种 Pile 变体均如此

### 跨模型验证
| 模型 | 可观测性 |
|------|---------|
| Mistral 7B | ✓ 保持 |
| Llama 3.1 8B | ✗ collapse |
| Qwen 2.5 3B | 低 |
| Llama 3.1 3B | 高 |

### 应用价值
- 在 20% flag rate 下，独家 catch rate 达 10.9-13.4%（9个模型-任务对中7个）
- 能够在置信度出错时代替 confidence 捕捉错误
- WikiText 训练的 observer 可迁移到下游 QA 任务

## 核心结论
> **架构选择就是监控决策**。在部署前评估模型的内部可观测性是必要的。

## 实践建议
- 评估 LLM 时增加 Activations Monitoring 测试
- 关注中间层信号保留能力，而非仅看最终输出
- 相同参数规模下不同架构可观测性差异巨大

## 相关标签
#transformer #interpretability #observability #architecture #error-detection
