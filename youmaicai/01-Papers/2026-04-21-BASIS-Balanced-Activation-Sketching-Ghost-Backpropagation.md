# BASIS: Balanced Activation Sketching with Invariant Scalars for Ghost Backpropagation

## 元信息
| 标题 | BASIS: Balanced Activation Sketching with Invariant Scalars for "Ghost Backpropagation" |
|------|------|
| 作者 | Vladimer Khasia |
| 链接 | [原文](https://arxiv.org/abs/2604.16324) |
| arXiv | arXiv:2604.16324v1 |
| 代码 | [GitHub](https://github.com/VladimerKhasia/basis) |
| 发表 | 2026-03-05 |

## 核心贡献
1. 提出 **BASIS** (Balanced Activation Sketching with Invariant Scalars)，解耦激活内存与 batch/sequence 维度的反向传播算法
2. 提出 **Balanced Hashing**：消除 off-diagonal 碰撞方差
3. 提出 **Invariant Scalars**：保角偏差-方差权衡，确定性保留空间几何的连续能量范数

## 核心创新点
- **问题**：精确反向传播所需的激活内存随网络深度、上下文长度和特征维度线性增长，形成 $O(L \cdot BN)$ 的空间瓶颈
- **方法**：BASIS 传播精确误差信号 (dX) 以保持完美梯度流，但使用高度压缩的 rank-R 张量计算权重更新 (dW)
- **理论**：BASIS 将激活内存降至 $O(L \cdot RN)$，大幅减少反向传播矩阵乘法足迹

## 实验结果
- GPT 架构训练 50,000 步验证：
  - R = 32：与精确反向传播验证 loss 持平（6.575 vs 6.616），甚至略优（充当隐式正则化器）
  - R = 1（极端压缩）：模型仍能平滑收敛，验证了估计器的极端鲁棒性

## 关键公式
- 激活内存复杂度：$O(L \cdot BN)$ → $O(L \cdot RN)$
- 能量范数保留：Invariant Scalars 保证空间几何连续能量范数

## 关键词
`backpropagation` `activation memory` `GPT training` `gradient sketching` `model compression`

## 相关工作
- Randomized Automatic Differentiation
- Ghost Backpropagation
- 模型训练效率优化

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*