---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, sprays, multiphase, breakup, Weber-number, atomization]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.20650
arXiv: 2610.20650
---

# Weber-number scaling and the distance dependence of drop size in full-cone pressure-swirl sprays

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Weber-number scaling and the distance dependence of drop size in full-cone pressure-swirl sprays |
| **作者** | Bilal Ben Jemaa, Vincent He, Marko Trifunović, Daniel Duke, Rishabh V. More |
| **发表** | arXiv (physics.flu-dyn, physics.app-ph), 2026-10-15 |
| **链接** | [arXiv:2610.20650](https://arxiv.org/abs/2610.20650) |
| **DOI** | 10.48550/arXiv.2610.20650 |
| **代码** | — |

---

## 核心贡献

> 首次同时量化压力旋流喷嘴雾滴体积中位直径的 Weber 数标度律和测量距离依赖性，给出可比较的实验标度公式。

1. 对两个全锥压力旋流喷嘴在多距离、多压力、多取向下作激光衍射 + 高速摄影测量
2. 给出联合标度公式 D_v50/d₀ ∝ We^{-0.31} (L/d₀)^{-0.21}
3. 验证 Kooij et al. (2018) 的 We^{-1/3} 标度
4. 提出行业警示：激光衍射报告雾滴尺寸必须同时报告测量距离

---

## 技术方案

### 核心思想

激光衍射测量的雾滴尺寸具有空间依赖，而与 Weber 数标度的关系历来被单独报告。本文联合拟合多个喷嘴的距离-压力-方向数据，分离 We 与距离效应，得出距离修正后的标准化形式。

### 关键技术

| 技术 | 说明 |
|------|------|
| **激光衍射** | 空间浓度加权滴径分布 |
| **高速成像** | 液膜破碎过程可视化 |
| **Weber 数标度律** | 滴径/喷孔直径 ∝ We^α 经典框架 |
| **距离修正** | 显式化测量距离对 D_v50 的影响 |

---

## 公式

```math
D_{v50} \sim L^{-0.18} \quad \text{(滴形成区之后)}
```

联合标度（跨喷嘴全局拟合）：
```math
\boxed{D_{v50}/d_0 \sim \mathrm{We}^{-0.31}\,\bigl(L/d_0\bigr)^{-0.21}}
```

固定距离时折合为 Kooij et al. (2018) 标度：
```math
D_{v50}/d_0 \sim \mathrm{We}^{-1/3}
```

无量纲数
```math
\mathrm{We} = \dfrac{\rho\,U^2\,d_0}{\sigma}
```

---

## 实验结论

- **数据集**: 两个全锥压力旋流喷嘴，多距离/压力/方向激光衍射 + 高速摄影数据
- **基线**: 历史上各家文献报告的 We^{-1/3} 与新发现距离修正
- **结果**:
  - D_v50 在滴形成区之后随 L 幂律下降
  - 联合标度同时符合 We 与距离效应
  - 近场与远场文献之间的差异部分可由距离依赖性解释

---

## 局限性

- 仅两个喷嘴几何，普适性有限
- 实验（不涉及 CFD）——数值模拟与该标度律的对应未给出
- 工业标准（ISO 13320 等）尚未据此更新

---

## 相关工作

- Kooij et al. (2018) We^{-1/3} 标度（被引用作基线）
- 经典雾化理论：Lin & Reitz (1998), Faeth et al.

---

## 实现建议

- **实现难度**: ✅ 低（实验测量即可复现）
- **预期性能**: 直接对喷雾 CFD 边界条件设置（D_v50 输入）有指导意义
- **适用场景**: 农业喷雾（漂移/沉积）、粉尘捕集、燃料喷射器燃烧效率、喷雾 CFD 入口/初始条件标定
