---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [PINN, artificial-compressibility, Navier-Stokes, incompressible, unsteady]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04191
---

# An Artificial-Compressibility Physics-Informed Neural Network for the Unsteady Incompressible Navier-Stokes Equations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | An artificial-compressibility physics-informed neural network for the unsteady incompressible Navier-Stokes equations |
| **作者** | Aytekin Çıbık |
| **发表** | arXiv 2026-08-04 |
| **链接** | [原文](https://arxiv.org/abs/2608.04191) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04191 |
| **代码** | - |

---

## 核心贡献

> 提出人工压缩性 PINN（AC-PINN）求解不可压 NS 方程，将散度约束松弛为可微残差

1. **人工压缩性松弛**：将不可压散度约束 $\nabla \cdot \mathbf{u} = 0$ 转化为 $\partial_t p/\epsilon$ 形式的残差
2. **参数影响分析**：$\epsilon$ 越大，残差散度和速度误差越大
3. **传感器同化**：少量稀疏速度传感器数据恢复 Re=100 圆柱绕流的非稳态涡街
4. **Strouhal 数精度**：预测值 0.176 vs 文献值 0.164-0.172

---

## 技术方案

### 人工压缩性方程

原始不可压 NS：

$$\nabla \cdot \mathbf{u} = 0$$

人工压缩性形式：

$$\frac{\partial p}{\partial t} = -\frac{1}{\epsilon}\nabla \cdot \mathbf{u}$$

将 DAE 约束转化为可最小化的普通残差

### 参数影响

| $\epsilon$ | 散度残差 | 速度误差 |
|-----------|---------|---------|
| 大 | 高 | 高 |
| 小 | 低 | 低（饱和）|

---

## 验证案例

| 案例 | 结果 |
|------|------|
| Taylor-Green vortex | 解析解验证，$\epsilon$ 影响可量化 |
| Re=100 圆柱 | 传感器同化后恢复涡街，St ≈ 0.176 |

---

## 局限性

- 需要边界层解析的参考数据做同化
- 对传感器位置和质量敏感

---

## 实现建议

- **实现难度**: ★★★☆☆
- **预期性能**: 适合低 Re 圆柱绕流等标准问题
- **适用场景**: PINN 基础研究、流动重建、稀疏传感器数据同化
