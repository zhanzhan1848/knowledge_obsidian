---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 波动光学, 路径追踪, 衍射, 干涉, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2508.17386
---

# Wave Tracing: Generalizing The Path Integral To Wave Optics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Wave Tracing: Generalizing The Path Integral To Wave Optics |
| **作者** | Shlomi Steinberg, Matt Pharr |
| **发表** | **Computer Graphics Forum (Eurographics) 2026 — Best Paper Honorable Mention**；预印本 arXiv 2508.17386（2025-08-26） |
| **链接** | [原文](https://arxiv.org/abs/2508.17386) |
| **单位** | NVIDIA |

---

## 核心贡献

> 严格分析经典路径积分能重现哪些波动光学现象，提出**双线性路径积分**刻画路径间干涉，再发展出**弱局部路径积分 + 椭圆锥**——既保留波动效应，又让**局部分布采样**变得可行。

1. **对经典路径积分的严格能力界定**：分析哪些波动光学现象可由经典路径积分重现、哪些不能。
2. **双线性路径积分 (bilinear path integral)**：引入**互贡献函数** `F: Ω×Ω→R`，把路径积分推广为对**所有路径对**的求和，从而建模路径间的**干涉**。该形式**统一了**依赖「相位携带射线」的主流方法（含基于 **UTD** 的衍射模型）。
3. **弱局部路径积分 (weakly-local path integral)**：形式化**区域到区域（region-to-region）传输**，用**椭圆锥**替代射线。
   - 证明**椭圆锥是 PLT（path integral light transport）光输运基元的紧几何包络**；
   - 基于此给出实用的、通用的**椭圆锥 wave tracing** 算法与完整系统；
   - 关键收益：**允许局部的路径采样**（双线性形式下无法做到）。
4. **完整系统与应用**：实现**完全偏振（fully polarimetric）光谱渲染器**；应用于 (A) 光渲染（任意几何的衍射）、(B) 长波辐射传播与衍射仿真（如无线电信号强度分布）、(C) 复杂环境中的声学/射频仿真。

---

## 技术方案

### 核心思想

经典路径积分（Veach 1997）是**线性/单线性**的：路径贡献只依赖自身，无法表达两条路径之间的**相干叠加**。因此经典路径追踪无法产生干涉条纹；而基于 UTD 的射线方法虽能产生干涉，却是**隐式**使用双线性形式，且**难以采样**。

本文的路线分两步：
- **先做正确的理论基础**：双线性路径积分，明确指出**双线性性从根本上破坏了局部分布采样**——「采样了一条好路径，之后可能采样到另一条与其**破坏性干涉**的路径，导致总贡献可忽略」。这是双线性方法的核心困境。
- **再做可用的算法**：弱局部路径积分把「点对点」改成「区域对区域」，用椭圆锥承载，从而**恢复局部分布采样能力**。

### 关键技术

| 组件 | 设计 | 关键性质 |
|------|------|------|
| **互贡献函数 `F`** | `I = ∫_{Ω×Ω} F(x,y) dμ(x) dμ(y)` | 三条公理：① 对称 `F(x,y)=F(y,x)`；② 单路径非负 `F(x,x)≥0`；③ Cauchy–Schwarz `\|F(x,y)\|² ≤ F(x,x)F(y,y)`。由 (1)(2)(3) 可证积分结果非负（论文 Section S2 给出证明）。`x≠y` 时 `F` 可为负 → 干涉 |
| **物理对应** | `F(x,y) = ⟨ψ(x)ψ*(y)⟩` | 即**互相干函数**（mutual coherence function），量化波系综的二阶统计（cross-correlation）。当 `F` 作用于不同波长的路径时可自然处理**光谱渲染**下的时间涨落（如传感器未做时间平均时的声学仿真） |
| **弱局部路径积分** | 区域到区域传输，用**椭圆锥**替代射线 | 形式化「光与落在区域内的所有材料的聚合相互作用」；**无路径间干涉**（这是放弃双线性以换取可采样性的代价） |
| **椭圆锥作为紧包络** | 证明椭圆锥是 PLT 光输运基元的紧几何包络 | 支撑「用椭圆锥做区域查询」的正确性 |
| **椭圆锥追踪** | 锥几何变换后与距离区间 `[d_min, d_min+δ)` 求交 | 若锥立即（不再传播）终止则进入下一分支；否则继续锥追踪。需**加速结构遍历**与任意椭圆锥的**图元（边/三角形）求交** |
| **自由空间衍射** | 当椭圆锥被部分遮挡时采用 **UTD-based free-space diffractions** | 与 BDPT 结合：连接策略中从两个路径顶点各自**波追踪一半**；若两束均未被遮挡则相遇并在其各自的**空频足迹**上积分 |
| **MIS 调整** | BDPT 的 multiple importance sampling 需修改 | 因为部分连接策略可能被遮挡、另一些不会 |

### 两个形式的对比（论文 Fig. 2）

- **(A) 双线性路径积分**：处理**所有路径对**的干涉 → 正确但**难以局部分布采样**。
- **(B) 弱局部路径积分**：区域到区域，椭圆锥传输 → 需要更复杂的机制（椭圆锥追踪 + 聚合波动相互作用），但**允许关键的局部分布采样**。

---

## 公式

**经典路径积分（渲染方程）：**

```math
L(x,\omega) = E(x,\omega) + \int_{\Omega} L_i(x,\omega')\, f(x,\omega,\omega')\, n\cdot\omega'\, d\omega'
```

**双线性路径积分（本文的核心推广）：**

```math
I = \int_{\Omega\times\Omega} F(x,y)\, d\mu(x)\, d\mu(y)
```

**互贡献函数的三条公理：**

```math
\begin{aligned}
&\text{(1) 对称：}\quad F(x,y) = F(y,x) \\
&\text{(2) 单路径非负：}\quad F(x,x) \ge 0 \\
&\text{(3) Cauchy–Schwarz：}\quad |F(x,y)|^2 \le F(x,x)\,F(y,y)
\end{aligned}
```

**统计/物理解释（互相干函数）：**

```math
I = \Big\langle\Big|\int_{\Omega} \psi(x)\, d\mu(x)\Big|^2\Big\rangle
  = \int_{\Omega\times\Omega} \psi(x)\,\psi^*(y)\, d\mu(x)\, d\mu(y),
\qquad F(x,y) = \langle \psi(x)\psi^*(y)\rangle
```

**弱局部路径积分（区域到区域）：**

```math
I_{\text{weak}} = \int_{\Omega\times\Omega} F_{\text{region}}(x,y)\, d\mu(x)\, d\mu(y),
\qquad F_{\text{region}} \text{ 聚合区域内所有材料的作用}
```

**椭圆锥求交的区间约束：**

```math
\text{intersect the elliptical cone within a distance range } [d_{\min},\; d_{\min}+\delta)
```

---

## 代码片段

```cpp
// 椭圆锥追踪的骨架（依论文描述重构）
// 1) 锥几何变换：把任意椭圆锥变换为「标准圆锥」以便复用现有图元求交
// 2) 在距离区间 [d_min, d_min+delta) 内与加速结构求交
// 3) 累积聚合的波动相互作用（aggregate wave-optical interactions）

struct EllipticalCone {
    Vec3  apex;        // 锥顶点
    Mat3  axes;        // 椭圆的两个主轴方向 + 锥轴
    Vec2  radii;       // 两个半轴半径
    double d_min;      // 距离区间下界
    double delta;      // 距离区间宽度
};

void trace_cone(const EllipticalCone& cone,
                const Scene& scene,
                std::vector<Interaction>& out)
{
    Mat3 M = cone_transform_to_canonical(cone);   // -> 圆锥
    double d = cone.d_min;

    while (d < cone.d_min + cone.delta) {
        // 与三角形/边求交（复用标准 BVH 遍历，圆锥形式）
        Hit h = scene.traverse_cone(M, d);
        if (!h.valid) break;

        // 累积该区域内所有材料对波的聚合作用
        aggregate_wave_interaction(out, cone, h);

        if (h.immediately_terminates) break;        // 分支 (a): 锥立即终止
        d = h.t;                                    // 分支 (b): 继续锥追踪
    }
}

// BDPT 连接：两束各波追踪一半
bool connect_beams(Beam a, Beam b) {
    EllipticalCone ca = a.cone_to(b.vertex);
    EllipticalCone cb = b.cone_to(a.vertex);
    trace_cone(ca, scene, a.interactions);
    trace_cone(cb, scene, b.interactions);
    if (a.occluded || b.occluded) return false;    // MIS 需据此调整
    // 两束相遇：在各自的空频足迹上积分
    integrate_over_frequency_footprint(a, b);
    return true;
}
```

---

## 实验结论

- **验证基准**：与 **BEM（边界元法）波求解器**对照。
  - 整体与参考解**吻合良好**，但计算的是 **3D 解**（而非 BEM 的 2D 切片），且**只需其一小部分计算资源**。
- **应用场景**：
  - **建筑无线电传播**：Office 场景与 Building 场景（3 层楼的 rss 分布），含复杂几何、细节、玻璃窗（大量能量透射走）、楼梯/栏杆造成的多次衍射。
  - **光学渲染**：金属屏幕 + 准直光源 + 墙上几何孔径 → 自由空间衍射；**所有渲染均为光谱 + 偏振**。
- **性能统计（Table 2，每次相互作用的椭圆锥横截面积均值/标准差，及三角形数均值/标准差）**：

| 场景 | 锥横截面积 (m²) | 三角形数 |
|------|----------------|----------|
| Office | 1.100 ± 1.364 | 34 ± 470 |
| Building | 2 ± 40 | 29 ± 905 |
| Room (optical) | (0.2 ± 1.0) mm² | 14 ± 261 |
| 另一场景 | — | 1.05k / 1.2k |

- 渲染吞吐以 **samples per millisecond** 报告。

---

## 局限性

- **弱局部形式放弃了路径间干涉**——这是为换取局部分布采样能力而做的自觉取舍，因此不能同时得到完全干涉与高可采样性。
- 需要**任意椭圆锥的图元求交**（边、三角形）与**椭圆锥的加速结构遍历**——这是全新的几何内核，工程量大。
- 自由空间衍射部分仍**依赖 UTD**（几何绕射理论），属于经典射线方法，精度受限。
- 论文自述渲染器「**from scratch** 专为椭圆锥追踪与波动仿真设计」，完全偏振光谱渲染——实现与计算成本极高。
- 验证主要是与 BEM 在特定频段（论文提到 5GHz）对照，光学渲染的定量精度指标相对薄弱。

---

## 相关工作

- [[Veach Path Integral]]（Veach 1997）
- [[UTD 几何绕射理论]]
- [[BEM 边界元法]]
- [[BDPT 双向路径追踪]]
- [[Path Integral Light Transport (PLT)]]

---

## 实现建议

- **实现难度**：**极高**。需要从零实现：椭圆锥的几何变换与求交内核、椭圆锥的 BVH 遍历、聚合波动相互作用、偏振光谱传输、以及 BDPT 的适配。论文明确说渲染器是「from scratch」。
- **预期性能**：与 BEM 参考解吻合良好，但用远小于 BEM 的计算资源得到 3D 解；BEM 本身不适合交互式渲染。
- **适用场景**：
  1. **波动光学渲染**（衍射、干涉、光学成像）——目前主流渲染器基本无此能力；
  2. **长波辐射 / 无线电传播仿真**（5G/6G 室内外覆盖、室内信号强度分布）——这是新兴且真实的工业需求；
  3. **声学仿真**。
- **行动建议**：**⚠️ 谨慎评估 / 建议跟踪**。完整实现成本极高，与主流实时渲染管线关联弱。但有**两条高性价比的借鉴**：
  1. **「双线性性破坏局部分布采样」这一诊断**——对任何多路径干涉/相干性建模的工作（尤其是用「相位携带射线」做干涉的方案）都是重要的警示：**采样效率是根本障碍，不只是实现难度问题**。**优先级：中高（作为设计决策依据）**；
  2. **「用区域（椭圆锥）替代点（射线）以恢复可采样性」**——这是一个通用的算法设计模式，可迁移到其它需要弱化耦合的场景。**优先级：中**。
  完整实现优先级：**低**（除非团队业务明确涉及波动光学/射频仿真）。
