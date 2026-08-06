---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [viscoelastic, Oldroyd-B, thin-film, hole-expansion, free-sheet, polymer]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04345
---

# Expansion of a Hole in a Viscoelastic Liquid Sheet

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Expansion of a hole in a viscoelastic liquid sheet |
| **作者** | Tachin Ruangkriengsin |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04345) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04345 |
| **代码** | - |

---

## 核心贡献

> 建立粘弹性液膜（Oldroyd-B 模型）中孔洞扩展的解析理论，揭示粘弹性应力加速扩展的物理机制

1. **解析解**：获得弱粘弹性（$Wi \ll 1$）和超稀极限（$\mu_p \ll \mu_s$）的解析解
2. **加速机制**：粘弹性应力增加指数增长率，相对牛顿流体加速扩展
3. **膜厚变化**：孔洞回缩边缘附近膜厚增加（增厚现象）
4. **Taylor-Culick 偏离**：发现实验观察到的指数扩展而非恒速扩展的物理根源

---

## 技术方案

### 模型

Oldroyd-B 粘弹性模型：

$$\tau = \tau_s + \tau_p$$

其中 $\tau_s = 2\mu_s D$（溶剂），$\tau_p$ 服从 FENE-P 或 Oldroyd-B 方程

### 关键参数

| 参数 | 含义 |
|------|------|
| $Wi$ | Weissenberg 数（松弛时间/特征时间）|
| $\mu_s, \mu_p$ | 溶剂/聚合物粘度 |
| $\beta_p = \mu_p/(\mu_s + \mu_p)$ | 聚合物粘度比 |

### 核心公式

弱粘弹性下无量纲孔半径：

$$\tilde{R} \sim e^{(0.5 + \alpha Wi\beta_p)T}$$

其中 $\alpha \approx 0.224$

超稀极限：

$$\tilde{R} \sim e^{(0.5 + \alpha^*\beta_p)T}$$

---

## 物理机制

- **方位向拉伸 + 径向压缩**：聚合物在方位向被拉伸，径向被压缩
- **应力重分布**：修改尖端区域的应力平衡
- **更强的外向径向伸长流**：导致更快的孔洞扩展

---

## 局限性

- 轴对称假设
- 薄膜方程近似（厚度 << 孔半径）

---

## 实现建议

- **实现难度**: ★★★☆☆
- **预期性能**: 适用于液膜撕裂、涂层等领域
- **适用场景**: 涂层加工、喷墨打印、薄膜断裂
