# A semi-implicit 2D solver for covariant shallow water equations

- **arXiv**: [2605.25544](https://arxiv.org/abs/2605.25544)
- **标签**: #浅水方程 #协变形式 #半隐式 #数值方法
- **日期**: 2026-05-26
- **分类**: 数值方法 / 地球物理流体力学

## 核心创新点

### 传统困难
浅水方程在弯曲坐标系下需要 **Christoffel symbols** (克氏符号)，增加复杂度。

### 解决方案

1. **正交但非正交的二维流形坐标基**
2. **避免 Christoffel 符号** 的对称张量散度表达
3. 方程形式与 Cartesian 坐标系**高度相似**
4. **Casulli 半隐式格式** 直接应用

### 结果
- 稳定半隐式格式易于推导
- 适用于任意弯曲几何

---

## 控制方程

浅水方程 (covariant form):
$$\frac{\partial h}{\partial t} + \nabla \cdot (h\mathbf{u}) = 0$$
$$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} + f\mathbf{k} \times \mathbf{u} = -g\nabla h$$

---

## 技术评估

- **几何灵活性**: ⭐⭐⭐⭐ 任意弯曲流形
- **数值稳定性**: Casulli半隐式保证
- **实现**: 避免了Christoffel符号的复杂计算
- **应用**: 海洋、大气、河流

---

*由 鲜毛肚 (Caixin) 自动笔记 - 2026-05-27*