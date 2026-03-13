# Task-Conditioned Routing Signatures in Sparse MoE Transformers

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Task-Conditioned Routing Signatures in Sparse Mixture-of-Experts Transformers |
| 作者 | Mynampati Sri Ranganadha Avinash |
| 链接 | [arXiv:2603.11114](https://arxiv.org/abs/2603.11114) |
| arXiv | arXiv:2603.11114 |
| 分类 | cs.LG, cs.AI |
| 日期 | 2026-03-11 |
| 代码 | MOE-XRAY toolkit |

## 核心贡献
1. **Routing Signatures**：引入路由签名，向量表示跨层专家激活模式
2. **任务条件结构发现**：证明 MoE 路由具有任务敏感结构
3. **MOE-XRAY 工具**：发布轻量级路由遥测分析工具包

## 背景：Sparse MoE
### Mixture-of-Experts 架构
- 通过条件计算实现高效扩展
- Routing mechanism 负责专家选择
- 路由机制尚未被充分理解

### 研究问题
> MoE routing 是否具有任务条件结构？

## 方法：Routing Signatures

### 定义
```
Routing Signature = 向量表示，总结给定 prompt 的跨层专家激活模式
```

### 分析方法
1. 计算同类别 prompt 的路由签名相似度
2. 计算不同类别 prompt 的路由签名相似度
3. 训练分类器验证可分性

## 实验结果

### 测试模型
OLMoE-1B-7B-0125-Instruct

### 相似度分析
| 指标 | 数值 |
|------|------|
| 类内路由相似度 | 0.8435 ± 0.0879 |
| 类间路由相似度 | 0.6225 ± 0.1687 |
| Cohen's d | 1.44 |

### 分类性能
- **四分类任务准确率**：92.5% ± 6.1%（仅用路由签名）

### 统计验证
- 引入 permutation 和 load-balancing baseline
- 观察到的分离不能仅用稀疏性或平衡约束解释

### Layer-wise 分析
- 任务结构在更深层变得明显
- 低维投影可视化支持发现

## 关键洞见

### 核心发现
> **Routing in sparse transformers is not merely a balancing mechanism, but a measurable task-sensitive component of conditional computation.**

### 意义
- MoE 路由具有语义意义
- 可用于模型解释性
- 启发更好的路由设计

## 工具：MOE-XRAY
- 轻量级路由遥测
- 路由分析工具包
- 开源可用

## 应用场景
- MoE 模型解释性
- 路由机制优化
- 条件计算研究

## 标签
#MoE #Mixture-of-Experts #routing #interpretability #transformers #conditional-computation
