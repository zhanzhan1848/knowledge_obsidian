# Lattice Boltzmann methods for simulating non-Newtonian fluids: A comprehensive review

## 论文信息
- **标题**: Lattice Boltzmann methods for simulating non-Newtonian fluids: A comprehensive review
- **arXiv**: [2601.08206](https://arxiv.org/abs/2601.08206)
- **作者**: Vedad Dzanic et al.
- **机构**: Queensland University of Technology, University of Manchester
- **日期**: 2026-01-13
- **期刊**: Journal of Non-Newtonian Fluid Mechanics
- **标签**: #LBM #non-Newtonian #CFD #review #multiphysics

---

## 核心创新点

### 研究背景
非牛顿流体涵盖大量具有非线性材料特性的流体，常见于：
- **剪切变稀**: 番茄酱、酸奶
- **剪切增稠**: 玉米淀粉 suspension (Oobleck)
- **塑性**: 牙膏、泥浆 (屈服应力)
- **黏弹性**: 血液、 mucus

### 核心贡献
**综述 LBM 模拟非牛顿流体的最新进展**，聚焦：
1. **剪切依赖黏性** (Shear-dependent viscosity)
2. **黏塑性** (Viscoplasticity)
3. **黏弹性** (Viscoelasticity)

### LBM 优势
| 优势 | 说明 |
|------|------|
| 复杂边界处理 | 易于处理多孔介质等复杂几何 |
| 多物理场耦合 | 易添加多相流、反应流等 |
| 并行效率 | 计算高效，适合大规模并行 |
| 介观方法 | 介于微观 MD 与宏观 NS 之间 |

---

## 非牛顿流体分类

### 1. 广义牛顿流体 (GNF)
黏度仅依赖瞬时剪切率：
- **Power-law model**: τ = Kγ̇ⁿ
- **Carreau-Yasuda model**: 描述剪切变稀/增稠

### 2. 塑性流体
存在屈服应力 τ_y：
- **Bingham model**: τ = τ_y + μ_p γ̇
- **Herschel-Bulkley**: τ = τ_y + Kγ̇ⁿ

### 3. 黏弹性流体
考虑变形历史：
- **Maxwell model**: 应力松弛、蠕变
- **Oldroyd-B model**: 弹性效应
- **FENE-P model**: 高变形下的非线性弹性

---

## LBM 方法论

### 基本思想
LBM 是介观方法，基于离散玻尔兹曼方程：
- 粒子分布函数 f(x, t)
- 宏观量 = 分布函数矩

### 非牛顿流体 LBM 模型

#### 剪切依赖黏性
```python
# 有效黏度模型
ν_eff(γ̇) = ν_∞ + (ν_0 - ν_∞) * (1 + (λγ̇)^a)^((n-1)/a)
```

#### 黏塑性
- 屈服应力处理：塑性阈值
- 正则化方法避免数值不稳定

#### 黏弹性
- 多种松弛时间模型
- 耦合弹性应力张量

---

## 基准验证案例

| 案例 | 说明 |
|------|------|
| Hagen-Poiseuille flow | 圆管流动分析解 |
| Plane Couette flow | 平板 Couette 流动 |
| Creeping flow past cylinder | 低雷诺数圆柱绕流 |

---

## 应用领域

- 🏥 **生物流体**: 血液、mucus、saliva
- 🧴 **化妆品**: 乳液、膏霜
- 🍔 **食品加工**: 酱料、奶油
- 💊 **制药**: 药物递送
- 🏗️ **多孔介质**: 渗流

---

## 待解决问题

1. **高 Weissenberg 数问题** (WI > 1)
   - 黏弹性流动数值不稳定
2. **多物理场耦合**
   - 流-固耦合、热-流耦合
3. **大规模并行**
   - 负载均衡优化

---

## 未来方向

1. 非牛顿流体的多相 LBM
2. 高性能计算优化
3. 数据驱动/机器学习增强模型
4. 工业级复杂几何应用

---

## 引用
```bibtex
@article{LBMNonNewtonian2026,
  author = {Dzanic et al.},
  title = {Lattice Boltzmann methods for simulating non-Newtonian fluids: A comprehensive review},
  journal = {arXiv:2601.08206},
  year = {2026}
}
```
