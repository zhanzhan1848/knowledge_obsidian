---
type: paper
created: 2026-03-23
updated: 2026-03-23
tags: [paper, 3dgs, gaussian-splatting, lod, neural-rendering, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.19234
---

# Matryoshka Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Matryoshka Gaussian Splatting |
| **作者** | Zhilin Guo, Boqiao Zhang, Hakan Aktas, Kyle Fogarty, Jeffrey Hu, Nursena Koprucu Aslan, Wenzhao Li, Canberk Baykal, Albert Miao, Josef Bengtson, Chenliang Zhou, Weihao Xia, Cristina Nader Vasconcelos, Cengiz Oztireli |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.19234) |
| **项目页** | [https://zhilinguo.github.io/MGS](https://zhilinguo.github.io/MGS) |

---

## 核心贡献

> 为标准3DGS流水线提供连续LoD能力，无需牺牲满容量渲染质量

1. **连续LoD训练框架**：无需架构修改，为标准3DGS启用连续细节层次
2. **随机预算训练**：每次迭代采样随机splat预算，同时优化前缀和完整集
3. **前缀渲染**：渲染前k个splat产生连贯重建，保真度随预算增加平滑提升
4. **零质量损失**：在满容量时匹配主干网络性能，LoD不再是成本决策

---

## 技术方案

### 核心思想

学习单个有序高斯集合，使得渲染任意前缀（前k个splat）产生连贯重建。
训练策略：随机预算训练 - 每次迭代采样随机splat预算，优化对应前缀和完整集。

### 关键技术

| 技术 | 说明 |
|------|------|
| Ordered Gaussian Set | 单个有序高斯集合，前缀即可渲染 |
| Stochastic Budget Training | 随机预算采样，两次前向传播 |
| Prefix Rendering | 渲染前k个splat，保真度平滑提升 |
| No Architecture Change | 无需修改3DGS架构 |

---

## 实验结论

- **基准**: 4个benchmark，6个baseline
- **结果**: 满容量匹配主干性能，同时支持连续速度-质量权衡
- **消融**: 验证了排序策略、训练目标、模型容量的设计选择

---

## 局限性

- 高斯排序策略的最优性待进一步研究
- 极低预算下的质量下界
- 动态场景的扩展性

---

## 相关工作

- [[3D Gaussian Splatting]] - 原始3DGS
- [[Level of Detail]] - 细节层次技术
- [[Octree-GS]] - 离散LoD方法
- [[Scaffold-GS]] - 3DGS优化

---

## 实现建议

- **实现难度**: 中 - 只需修改训练流程，无需架构变更
- **预期性能**: 单模型支持连续速度-质量权衡
- **适用场景**: 大规模场景渲染、移动端部署、带宽受限场景
- **推荐度**: ⭐⭐⭐⭐⭐ 实用价值极高，易于集成
