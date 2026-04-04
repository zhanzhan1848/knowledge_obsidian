# Viscous Vortex Dynamics on Surfaces
**Conference**: SIGGRAPH Asia 2025 (ACM Transactions on Graphics)
**Authors**: Cuncheng Zhu, Hang Yin, Albert Chern (UC San Diego)
**Equal Contribution**: Cuncheng Zhu, Hang Yin
**URL**: https://cunchengzhu.github.io/project_pages/ViscousVortex2025.html
**DOI**: https://doi.org/10.1145/3763320
**Code**: Houdini implementation (supplementary.zip)

---

## 摘要 (Abstract)

提出一种涡量法（vorticity method）模拟曲面上不可压缩粘性流动，服从 Navier-Stokes 方程。与以往方法不同，本方法首次将高斯曲率相关项（Gaussian-curvature-dependent term）纳入粘性力的公式，该项同时影响涡量方程和调和分量的演化。

关键发现：这些曲率相关项对重现物理正确的流体行为至关重要。

---

## 核心创新

### 1. 曲率相关粘性力项
传统曲面流体模拟忽略的高斯曲率依赖项：
- 影响涡量方程中的粘性扩散
- 影响调和模态（harmonic modes）的演化
- 在自由滑移边界条件下产生 Kutta 条件

### 2. 几何公式
提出多个显式几何公式：
- **涡量跳跃条件**（Vorticity jump condition）：跨曲率片（curvature sheets）
- **摩擦系数与边界曲率的对应关系**
- **边界曲率对调和模态的影响**

### 3. IMEX 数值格式
- 隐式-显式（Implicit-Explicit）方案
- 适用于三角形网格
- 支持任意拓扑（包括不可定向曲面）
- 支持多种边界条件

---

## 技术方法

### 曲面 Navier-Stokes 方程

在曲面上参数化 Navier-Stokes 方程：

```
∂u/∂t + (u·∇)u = -∇p/ρ + νΔu + f
div u = 0
```

其中 Δ 是 Laplace-Beltrami 算子，黏性项需包含曲率修正。

### 涡量-流函数 formulation

涡量 ω = ∇ × u，在曲面上：

```
∂ω/∂t + L(ω) = D(ω, curvature)
```

L: 对流-扩散算子
D: 曲率相关修正项

### 曲率依赖项的物理意义

1. **Gaussian 曲率 K 的影响**：
   - 粘性力在曲面弯曲处需要修正
   - K > 0（球面）和 K < 0（双曲面）行为不同
   
2. **Kutta 条件涌现**：
   - 自由滑移边界 + 曲率 → 自然的翼型升力条件

---

## 实验验证

### 测试场景
- 任意拓扑曲面（包括环面、莫比乌斯带）
- 多种边界条件
- 不同曲率分布

### 数值稳定性
- IMEX 格式的条件稳定性
- 时间步长选择准则

---

## 与流体渲染的关联

| 方面 | 相关性 |
|------|--------|
| 体积渲染 | ❌ 主要贡献在模拟，非渲染 |
| 曲面流渲染 | ✅ 直接相关：曲面上流体效果 |
| 烟雾/火焰 | ⚠️ 可用于烟雾涡旋结构 |
| 交互式流体 | ✅ Houdini 实现可用于实时预览 |

---

## 技术亮点

- **首个**包含曲率修正的曲面粘性流体模拟
- 完整的几何理论框架
- 实用 Houdini 实现
- 支持不可定向曲面（如莫比乌斯带）

---

## 实现细节

### Houdini 代码
- 三角形网格曲面表示
- 涡量场可视化
- 交互式参数调整

### 可扩展方向
- 与渲染器集成（体积/曲面）
- 多相流体（曲率界面）
- 实时模拟优化

---

## 参考资源

- Paper PDF: `ViscousVortex.pdf`
- Houdini Code: supplementary.zip
- Project Page: https://cunchengzhu.github.io/project_pages/ViscousVortex2025.html

---

## 标签

#fluid-simulation #vortex-methods #differential-geometry #siggraph-asia-2025 #navier-stokes #surface-fluid #houdini
