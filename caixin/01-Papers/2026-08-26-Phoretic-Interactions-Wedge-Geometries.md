---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [phoretic, active-colloid, wedge-geometry, Fourier-Kontorovich-Lebedev-transform, multiphase, physics.flu-dyn]
status: new
agent: caixin
---

# Phoretic Interactions in Two-Medium Wedge Geometries

## 论文信息

| 字段 | 内容 |
|------|------|
| **arXiv** | [2608.24566](https://arxiv.org/abs/2608.24566) |
| **类别** | physics.flu-dyn, cond-mat.soft |
| **作者** | Abdallah Daddi-Moussa-Ider |
| **发表日期** | 2026-08-25 |
| **DOI** | 10.48550/arXiv.2608.24566 |
| **页数** | 19 pages, 4 figures |

## 核心贡献

研究化学各向同性活性胶体在三维楔形双介质中的扩散泳动（diffusiophoresis）运动。利用 Fourier-Kontorovich-Lebedev 变换求解浓度场，获得任意楔形张角和界面 контраст 下的精确解。

## 关键发现

### 解析解框架
- Fourier-Kontorovich-Lebedev 变换 → 精确浓度场
- 界面参数 $\Gamma = (1-\lambda\ell)/(1+\lambda\ell)$
  - $\lambda$：扩散率对比
  - $\ell$：溶质分配系数

### 极限情况
- $\Gamma = \pm 1$ + 匹配楔形角 → 有限镜像构造（finite image constructions）
- 奇/偶匹配性有不同的结构
- 可退化到 planar-interface 和 semi-infinite-interface 极限

### 泳动速度
- 界面性质和几何的强耦合 → 决定运动幅度和方向
- 楔形几何 + 界面属性可联合调控泳动运动

## 低雷诺数物理

- $Pe \to 0$（Péclet → 0）：扩散主导
- $Re \to 0$：惯性可忽略
- 泳动速度由化学活性产生的浓度梯度驱动

## 解析方法

### 控制方程（低 Pe）
$$\nabla^2 c = 0$$

（无对流的稳态扩散）

### 变换技术
- Fourier 变换（角向）
- Kontorovich-Lebedev 变换（径向）
- 格林函数法求解楔形边界问题

## 工程应用

- 微流控芯片中的主动粒子输运
- 多相受限环境中的自驱动颗粒
- 药物递送（纳米机器人）

## 可行性分析

🥢 可行性分析：双介质楔形扩散泳动

## 控制方程
- Laplace 方程（低 Pe，稳态）
- 浓度边界条件：活性胶体表面化学通量

## 数值方法
- 离散化：解析解（积分变换），无需数值离散
- 求解器：特殊函数（K-Bessel 函数）求和
- 稳定性：解析解无条件稳定

## 计算成本
- 解析公式求值：O(N) for N terms
- 参数扫描（张角、界面参数）：极低成本

## 推荐结论
✅ 推荐实现（微流控/活性粒子方向）
