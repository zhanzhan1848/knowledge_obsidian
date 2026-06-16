# AI Engram: In Search of Memory Traces in Artificial Intelligence

## 元信息
| 标题 | AI Engram: In Search of Memory Traces in Artificial Intelligence |
|------|-----|
| 作者 | Jea Kwon et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.14997) |
| arXiv | arXiv:2606.14997 |
| 领域 | cs.AI, cs.LG |
| 备注 | **ICML 2026 Oral** |

## 核心贡献
1. 提出 **AI Engram**：从神经科学中提取记忆痕迹的标准，将生物记忆标准（特异性、再激活、充分性、必要性）形式化为约束逆问题
2. 推导出**闭式估计器**：从全局纠缠参数中隔离单个记忆痕迹
3. 发现该生物衍生解决方案对应于参数流形上的**自然梯度更新**
4. 实现记忆的**手术式操作**：通过线性算术对记忆进行组合或擦除，无需迭代优化

## 神经科学动机
### 生物记忆标准
- **特异性 (Specificity)**：记忆对特定事件/知识的编码
- **再激活 (Reactivation)**：记忆被提取时的神经活动重现
- **充分性 (Sufficiency)**：激活记忆痕迹足以引发对应行为
- **必要性 (Necessity)**：缺少该记忆则无法引发对应行为

### AI Engram 的形式化
将上述标准转化为数学约束 → 导出闭式估计器 → 隔离单个记忆痕迹

## 关键发现
### 几何框架
- AI engrams 存在于参数流形上的几何结构
- 生物衍生解决方案 ↔ 参数流形上的自然梯度更新

### 记忆操作能力
- **组合 (Composition)**：任意记忆子集可线性组合
- **擦除 (Erasure)**：无需迭代优化即可擦除特定记忆
- **手术精度**：对单个记忆的操作不影响其他记忆

## 实验验证
- **规模扩展**：从简单 MLP 到 LLMs 均验证了因果有效性和可扩展性
- **手术操作**：在分布式存储中实现功能特异性

## 意义
- 桥接生物记忆理论和人工表示学习
- 为深度网络如何在分布式存储中同时支持功能特异性提供几何洞察

## 代码
- https://github.com/jeakwon/ai-engram/

## 关键词
`Memory` `Representation Learning` `Geometric Framework` `Natural Gradient` `Memory Manipulation` `Interpretability`
