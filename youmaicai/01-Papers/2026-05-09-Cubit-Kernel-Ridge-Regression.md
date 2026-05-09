# Cubit: Token Mixer with Kernel Ridge Regression

## 元信息
| 标题 | Cubit: Token Mixer with Kernel Ridge Regression |
|------|------|
| 作者 | Chuanyang Zheng, Jiankai Sun, Yihang Gao, Yuehao Wang, Liangchen Tan, Mac Schwager, Anderson Schneider, Yuriy Nevmyvaka, Xiaodong Liu |
| 链接 | [原文](https://arxiv.org/abs/2605.06501) |
| arXiv | arXiv:2605.06501 |
| 代码 | 待发布 |
| 会议/期刊 | Tech Report |

## 核心贡献
1. 建立统一理论框架，将 Transformer 的 token-mixing 机制与经典回归方法连接起来
2. 发现 Transformer attention = Nadaraya-Watson 回归（指数核 + L1 归一化）
3. 提出 Cubit：用 Kernel Ridge Regression (KRR) 替代 Nadaraya-Watson 回归
4. 提出 Limited-Range Rescale (LRR) 提升训练稳定性

## 核心洞察
Transformer 的 attention 模块本质上是 **Nadaraya-Watson 回归**：
- 计算 token 间相似度（通过 softmax 指数核）
- 基于相似度聚合对应 value
- L1 归一化

Cubit 将 attention 替换为 **Kernel Ridge Regression**：
- value 聚合通过核相似度
- 通过核矩阵的逆进行归一化
- 提供显式正则化（偏差-方差权衡）

## KRR 相比 NW 的优势
- 在 RKHS 中收敛速度更快
- 对噪声和边界效应更鲁棒
- 有更坚实的数学基础

## 实验结果
- Cubit 在长序列建模上优于 Transformer
- 随训练序列长度增长，性能优势增加

## 建议
- 是否推荐使用：**是**（理论贡献值得关注）
- 适用场景：长序列建模、Transformer 可解释性研究