# Rapidly Rotating Internally Heated Convection

## 论文信息

- **ID**: [arXiv:2604.01380](https://arxiv.org/abs/2604.01380)
- **作者**: Yutong Zhang, Ali Arslan, Stefano Maffei, Andrew Jackson
- **发表**: 2026-04-01
- **分类**: physics.flu-dyn, physics.geo-ph

---

## 研究背景

### 地球物理和天体物理尺度对流

- **快速旋转** + **强内加热**
- Coriolis 力不做功，传统能量方法失效
- 直接数值模拟 (DNS) 受旋转限制

---

## 模型设置

### 边界条件

- **等温无应力边界** (isothermal stress-free boundaries)
- **平面周期层** (plane periodic layer)
- **均匀内加热** (uniform internal heating)

### 极限条件

$Pr \to \infty$ (无限 Prandtl 数)

---

## 主要贡献

### 推导渐近简化模型

快速旋转对流驱动均匀内加热条件下的渐近简化模型。

### 证明边界

1. **平均温度 $\langle T \rangle$** 边界
   - 依赖于 Rayleigh 数 $Ra$ 和 Ekman 数 $E$

2. **垂直对流热输运 $\langle wT \rangle$** 边界
   - 热离开上下边界的非对称性
   - 与 Rayleigh-Bénard 对流不同，两者**无先验关系**

---

## 关键无量纲数

| 参数 | 含义 |
|---|---|
| $Ra$ | Rayleigh 数 |
| $E$ | Ekman 数 |
| $Pr$ | Prandtl 数 |

---

## 数值技术

- 替代估计技术 (不同于 Grooms & Whitehead 2014)
- 识别两种不同的标度行为
- 边界优化

---

## 意义

为未来**旋转主导加热对流**研究提供严格约束

---

## 📊 可行性分析：[快速旋转对流]

## 控制方程
- 旋转流体方程 (含 Coriolis)
- 无限 Prandtl 数极限

## 数值方法
- 渐近分析
- 理论边界推导

## 推荐结论
⚠️ 理论性强，适合地球物理/天体物流研究
