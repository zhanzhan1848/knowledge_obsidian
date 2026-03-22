# Optimal Splitting of Language Models

## 元信息
| 属性 | 值 |
|------|------|
| 标题 | Optimal Splitting of Language Models from Mixtures to Specialized Domains |
| 作者 | Skyler Seto et al. |
| 链接 | [arXiv:2603.19149](https://arxiv.org/abs/2603.19149) |
| arXiv | arXiv:2603.19149 |
| 日期 | 2026-03-19 |
| 类别 | cs.CL, cs.LG |
| 页数 | 26页, 11表, 17图 |

## 核心贡献
1. **分裂模型训练**: 独立预训练多个领域专用模型
2. **计算分配优化**: 使用Scaling Laws确定最优分配
3. **损失预测**: 准确预测N参数模型在D预训练+D'专业化tokens的损失
4. **外推能力**: 扩展到更大模型和token数

## 研究背景
### 标准训练范式
1. **预训练**: 完整语料库
2. **专业化**: 高质量领域数据继续预训练

### 多领域设置
- 为每个专业领域继续预训练多个模型
- 称为"分裂模型训练"

## 方法论
### 核心思想
```
总计算预算 C = C_pretrain + C_specialize
目标: 最优分配使最终损失最小
```

### Scaling Laws应用
- 预测模型大小N的损失
- 预训练tokens D
- 专业化tokens D'

### 优化框架
```python
def optimal_allocation(C_total, N, domains):
    """
    找到预训练和专业化的最优计算分配
    """
    for C_pretrain in range(0, C_total):
        C_specialize = C_total - C_pretrain
        loss = predict_loss(N, D(C_pretrain), D'(C_specialize))
    return argmin(loss)
```

## 实验结果
### 损失预测准确性
- 准确预测不同N, D, D'组合的损失
- 外推到更大模型有效

### 基准测试改进
- **常识知识**: 一致改进
- **推理能力**: 跨模型大小改进
- **计算效率**: 不同预算下优化

### 关键发现
1. 独立预训练优于单一混合预训练
2. Scaling Laws有效指导计算分配
3. 专业化阶段收益可预测

## 局限性
- 需要领域数据划分
- 多模型训练增加复杂性

## 建议
- **是否推荐使用**: 是
- **适用场景**:
  - 多领域LLM训练
  - 计算预算优化
  - 领域专用模型开发

## 技术细节
### Scaling Laws扩展
```
原始: L(N, D)
扩展: L(N, D, D')
其中:
- N: 模型参数
- D: 预训练tokens
- D': 专业化tokens
```

### 计算分配策略
| 策略 | 预训练比例 | 专业化比例 | 最终损失 |
|------|------------|------------|----------|
| 均衡 | 50% | 50% | 中 |
| 预训练主导 | 70% | 30% | 较高 |
| 优化分配 | 动态 | 动态 | 最低 |

## 相关链接
- [[scaling-laws]]
- [[domain-adaptation]]
- [[llm-training]]
- [[compute-optimization]]
