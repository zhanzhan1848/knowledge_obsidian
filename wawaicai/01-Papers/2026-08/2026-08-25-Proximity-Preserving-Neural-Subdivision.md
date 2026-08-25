---
tags: [几何, 网格细分, 神经几何处理, 等变性, arXiv]
date: 2026-08-25
arxiv: 2608.14704
---

# Proximity-Preserving Neural Subdivision (PNS)

## 核心方法

PNS 提出了一种**可学习的细分规则**，在经典 Loop 细分基础上添加有界的、**曲率门控的校正项**：

$$q_i^\theta = q_i^0 + h_i^2 \gamma_i F_i \eta_\theta(\varphi_i)$$

其中：
- $q_i^0 = \frac{3}{8}(p_a + p_b) + \frac{1}{8}(p_c + p_d)$ 是标准 Loop 边点
- $h_i^2$ 为局部边长平方，保证 $O(h^2)$ proximity
- $\gamma_i = \tanh(c\|\varphi_i^{curv}\|^2)$ 为曲率门控，平坦区域抑制校正
- $F_i \in SO(3)$ 为协变局部框架，保证 SE(3) 等变性
- $\eta_\theta$ 为神经网络

## 关键性质（架构级保证）

| 性质 | 说明 |
|------|------|
| SE(3) 等变性 | 任意有限网络权重下严格成立 |
| 仿射再生 | 平面输入精确重现 Loop |
| $O(h^2)$ Proximity | 对 Loop 的有界偏差 |
| 线性化一致 | 平面 valence-k 星上退化为 Loop |
| 迭代稳定性 | 重复细分不产生高频伪影 |

## 与 prior work 区别

| 对比项 | Neural Subdivision | PNS |
|--------|-------------------|-----|
| 等变性 | 无 | 架构级保证 |
| Proximity envelope | 无 | $O(h^2)$ 有界 |
| 迭代行为 | 高频伪影 | 稳定 |
| 线性化 | 无 | 与 Loop 一致 |

## 创新点

1. **结构约束优先于拟合精度**：不追求单步最优拟合，而是学习一个**参数化的受限算子类**
2. ** proximity 分析框架**：将 Wallner-Dyn proximity 理论应用于神经细分
3. **曲率门控机制**：$\gamma_i$ 在平面区域精确为零，保证线性化一致性

## 实验结果

- 局部 ridge 特征近似精度优于无约束 baseline
- 重复 4 次细分后，无约束方法 proximity ratio 达到 $10^4$ 量级，PNS 保持在 1 以内
- 法向量 jump 与 Loop 相当

## 算法复杂度

- 时间：与 Loop 细分相同（额外网络前馈 $O(1)$ 每边）
- 空间：MLP 参数存储

## 开源参考

- GitHub: 待补充（论文未提供）

## 可行性分析

✅ **推荐实现**

理由：
1. 架构约束优雅，理论保证扎实
2. 可作为 libigl `subdivision` 模块扩展
3. 适合特征敏感的网格细分场景
4. 等变性保证对下游任务有价值

传给 @墨鱼丸：可作为高细节网格生成的预处理或后处理模块。

## 相关笔记

[[Mesh-Subdivision-Literature]]
[[Neural-Geometry-Processing]]
