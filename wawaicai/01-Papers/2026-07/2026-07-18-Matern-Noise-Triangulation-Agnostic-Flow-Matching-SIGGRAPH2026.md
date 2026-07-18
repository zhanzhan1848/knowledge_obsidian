---
type: paper
created: 2026-07-18
updated: 2026-07-18
tags: [flow-matching, mesh-processing, triangulation-agnostic, matern-noise, generative-model]
status: processed
domain: geometry
conference: SIGGRAPH 2026
agent: wawaicai
source: https://matern-fm.github.io/
---

# Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes |
| **作者** | Tianshu Kuai, Arman Maesumi, Daniel Ritchie, Noam Aigerman |
| **机构** | University of Montreal & Mila, Brown University |
| **发表** | ACM Transactions on Graphics (TOG), Vol. 45, No. 4, July 2026 |
| **arXiv** | - |

## 核心贡献

1. **三角化无关的流匹配框架** - 训练好的模型可以应用于不同的网格和三角剖分
2. **Matérn 噪声分布** - 提出基于 Matérn 过程的噪声分布，通过谱定义实现三角化无关性
3. **高效采样算法** - 通过求解筛选泊松方程实现高效采样

## 技术方法

### 问题定义
- 现有方法在网格上的信号生成依赖于特定三角剖分
- 不同三角剖分导致不同结果，缺乏泛化能力

### Matérn 噪声
通过求解筛选泊松方程采样：
```
(L + τM)f = Mw
```
其中 L 是余切拉普拉斯算子，M 是质量矩阵，w ~ N(0, M⁻¹) 是白噪声，τ 是筛选参数

### 关键性质
- **三角化无关性**：对同一底层表面的不同离散化产生相似分布
- **频率控制**：τ 参数控制噪声的高频内容

## 算法流程

1. **噪声采样**（左侧）：从 Matérn 噪声分布采样
2. **流匹配去噪**（中部）：迭代去噪过程
3. **PoissonNet 去噪器**：使用梯度域学习进行去噪

## 实验结果

- 在超过 **100 万面片**的网格上生成信号
- 任务：弹性静止状态采样、人体姿态生成
- 模型仅在 10k 面片分辨率训练，泛化到高分辨率

## 开源资源

- GitHub: https://github.com/kts707/matern-fm
- Project Page: https://matern-fm.github.io/

## 可行性分析

| 维度 | 评级 |
|------|------|
| 算法复杂度 | 中等 |
| 实现难度 | 中等（需熟悉流匹配 + 网格信号处理） |
| 数值稳定性 | 高（Matérn 过程有理论保证） |
| 依赖项 | PoissonNet, 网格处理库 |

## 相关笔记

[[MeshFlow]] [[LATO.2]]

---

*🥬 娃娃菜 | 几何处理专家 | 2026-07-18*
