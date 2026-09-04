---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [turbulence, compressible, DNS, dissipative-anomaly]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.03945
---

# Mach-number-dependent dissipative anomaly in isothermal compressible turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mach-number-dependent dissipative anomaly in isothermal compressible turbulence |
| **作者** | Shadab Alam et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.03945) |
| **DOI** | 10.48550/arXiv.2609.03945 |

---

## 核心贡献

> 研究等温可压缩湍流中是否存在耗散反常（dissipative anomaly），发现总动能耗散率及其 solenoidal 和 dilatational 分量随雷诺数增加趋近有限渐近值

1. 总动能耗散率在足够高雷诺数下趋近有限值（耗散反常）
2. 归一化平均耗散率呈现两个截然不同的分支：亚音速/跨音速（M_rms ≲ 1）和高度超音速（M_rms ≥ 3）
3. 三种互补分析方法验证了耗散反常的存在

---

## 技术方案

### 核心思想

可压缩湍流中，动能耗散率 ε 在高雷诺数极限下应趋近有限值（与 Re 无关）。本研究使用高达 2048³ 格点的高分辨率 DNS，系统研究等温、均匀、各向同性可压缩湍流（solenoidal forcing）的耗散反常问题。

### 关键方法

| 技术 | 说明 |
|------|------|
| DNS | 3D 高分辨率，最多 2048³ 格点 |
| Solenoidal forcing | 驱动力仅作用于散度为零分量 |
| 耗散率分解 | 将 ε 分解为 solenoidal 和 dilatational 两部分 |
| Duchon-Robert 框架 | 分析异常耗散的前兆 |
| 几何表征 | 分析高耗散区域的空间结构 |

### 核心发现

- **弱/强耗散反常**：即使网格分辨率达 2048³，Re 仍不足以明确区分弱/强耗散反常
- **马赫数依赖**：亚音速和超音速分支的归一化耗散率行为截然不同
- **Solenoidal 耗散**：对 Re 的依赖还受积分尺度和 RMS 速度选择影响

---

## 控制方程

等温可压缩 N-S 方程：

```math
\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0
```

```math
\rho \frac{D \mathbf{u}}{Dt} = -\nabla p + \mu \nabla^2 \mathbf{u} + \left(\zeta + \frac{\mu}{3}\right) \nabla(\nabla \cdot \mathbf{u})
```

等温状态方程：p = c_s² ρ

总耗散率分解：
```math
\varepsilon = \underbrace{2\nu \int |\mathbf{S}^s|^2 d\mathbf{x}}_{\varepsilon_s} + \underbrace{2(\zeta+\frac{2\mu}{3}) \int |\mathbf{S}^d|^2 d\mathbf{x}}_{\varepsilon_d}
```

其中 S^s 为 solenoidal 应变率张量，S^d 为 dilatational 应变率张量。

---

## 实验结论

- 亚音速/跨音速（M_rms ≲ 1）和高度超音速（M_rms ≥ 3）呈现两种不同的归一化耗散率分支
- 即使在 2048³ 分辨率下，也无法明确区分弱/强耗散反常
- Duchon-Robert 框架扩展到可压缩流后提供了一致的异常耗散证据

---

## 相关工作

- [[DNS compressible turbulence]]
- [[Dissipative anomaly Kolmogorov]]
- [[Compressible turbulence modeling]]
