# Boltzmann Attention: Learnable Ising Couplings for Cooperative Attention

## 基本信息
| 标题 | Boltzmann Attention: Learnable Ising Couplings for Cooperative Attention |
|------|------|
| 作者 | Gilhan Kim, Daniel K. Park |
| 链接 | [原文](https://arxiv.org/abs/2606.12478) |
| arXiv | arXiv:2606.12478 |

## 核心贡献
1. **Boltzmann Attention**：能量-based 泛化，将注意力模式建模为相互作用的 Ising 模型
2. **可学习的成对耦合**：为标准注意力添加可学习的 position 间相互作用，超越 softmax/sigmoid 注意力
3. **量子计算路径**：Ising 公式天然通向量子计算采样策略——演示 diabatic quantum annealing 作为实用训练方法

## 模型架构
```math
能量函数: E(x) = -\sum_i h_i x_i - \sum_{i<j} J_{ij} x_i x_j
注意力模式由 Ising 模型控制，而非仅 q-k 相似度
```
- **局部场（Local Fields）**：数据依赖的标准 q-k 交互
- **成对耦合（Pairwise Couplings）**：学习 position 间相关性
- **Ising 模型**：显式建模合作或对抗的 co-attention 结构

## 实验结果
- 字符级语言建模和合成括号匹配任务
- 随序列长度增加，优势更明显
- 四路消融确认改进来自可学习的成对耦合
- 量子 annealing 训练保持与精确 Boltzmann 计算相当的性能

## 关键发现
- 标准注意力层不显式参数化注意力决策间的交互
- 显式 position 间交互提供原则性增强

## 局限性
- 计算成本随耦合数量增加
- 需要额外的训练开销

## 建议
- 是否推荐使用：**是**（注意力机制改进，值得关注）
- 适用场景：长序列建模、需要建模位置相关性的任务

---
Tags: #transformer #attention #energy-based #Ising-model #quantum