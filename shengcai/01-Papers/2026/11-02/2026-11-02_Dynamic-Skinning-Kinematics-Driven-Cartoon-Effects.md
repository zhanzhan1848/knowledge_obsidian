---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, 渲染, 绑定蒙皮, 角色动画, 次级运动, TVCG, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.40976
---

# Dynamic Skinning: Kinematics-Driven Cartoon Effects for Articulated Characters

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic Skinning: Kinematics-Driven Cartoon Effects for Articulated Characters |
| **作者** | Damien Rohmer, Karim Salem, Niranjan Kalyanasundaram, Victor Zordan |
| **发表** | IEEE Transactions on Visualization and Computer Graphics (TVCG), vol. 32, no. 3, pp. 2684–2694, March 2026（arXiv 2026-10-29 作者接收版，10 页 9 图） |
| **链接** | [原文](https://arxiv.org/abs/2610.40976) |
| **DOI** | - |
| **代码** | 项目页 https://dynamicskinning.com |

---

## 核心贡献

> 用一组**以位置导数与时间为函数的变形器（deformer）**扩展传统绑定蒙皮（LBS），无需物理求解即可产生类似物理现象的**次级运动**（secondary motion），如受运动驱动的振荡与波传播。

1. **Dynamic Skinning 变形器族**：直接按顶点位置导数与时间偏移顶点位置，**不求解物理方程**。
2. **极高计算效率**：纯直接计算，每帧 O(N)，与蒙皮同量级开销，实时可行。
3. **高度可定制**：通过参数（幅度/频率/相位/衰减）调节，支持艺术家工作流与细粒度控制。
4. **产生卡通化物理外观**：运动响应振荡、波动沿表面传播等效果。

---

## 技术方案

### 核心思想

**"次级运动 ≠ 物理模拟"**。传统做法（弹簧骨骼、软体/布料模拟）需要物理求解器，代价高且难控制。Dynamic Skinning 换了个思路：把"次级运动"定义为**位置导数与时间的确定性函数**——这天然产生"跟着主运动延迟/振荡"的视觉效果。

### 关键技术

| 技术 | 说明 |
|------|------|
| 位置导数驱动的变形 | 偏移量是顶点位置导数（速度/加速度等）与时间的函数 |
| 振荡变形器 | 对运动输入产生衰减振荡响应 |
| 波传播变形器 | 沿骨架/表面弧长传播的行波 |
| 无物理求解 | 直接计算，速度极快 |
| 艺术家可控 | 通过参数调节幅度/频率/相位/阻尼 |

---

## 公式

### 通用变形器形式

```math
\Delta\mathbf{p}_i(t) = \mathcal{D}\!\left(\mathbf{p}_i,\ \frac{\partial \mathbf{p}_i}{\partial t},\ \frac{\partial^2 \mathbf{p}_i}{\partial t^2},\ t;\ \theta\right)
```

其中 $\theta$ 为变形器参数（幅度、频率、相位、衰减）。

### 振荡型变形器（阻尼谐振子响应）

```math
\Delta\mathbf{p}_i(t)=A\,e^{-\zeta\omega_0 t}\sin\!\big(\omega_d t+\phi\big)\,
\frac{\partial \mathbf{p}_i}{\partial t},
\qquad
\omega_d=\omega_0\sqrt{1-\zeta^2}
```

- $A$：幅度；$\zeta$：阻尼比；$\omega_0$：固有频率；$\phi$：相位
- 结构上等价于二阶阻尼系统对输入速度的响应

### 传播型变形器（沿弧长 $s$ 的行波叠加）

```math
\Delta\mathbf{p}_i(t)=\sum_{k=1}^{K}A_k\,\sin\!\big(\omega_k t - \beta_k s_i + \phi_k\big)\,\mathbf{n}_i
```

其中 $s_i$ 为顶点沿传播方向的弧长坐标，$\mathbf{n}_i$ 为传播方向法向。

### 变形后顶点位置

```math
\mathbf{p}'_i = \mathbf{p}^{\text{LBS}}_i + \Delta\mathbf{p}_i(t)
```

---

## 代码片段

```cpp
// 振荡变形器：位置导数驱动的阻尼响应
struct OscillationDeformer {
    float amplitude;      // A
    float damping;        // zeta
    float freq0;          // omega_0
    float phase;          // phi
    glm::vec3 normal;     // 传播/偏移方向

    glm::vec3 offset(const glm::vec3& velocity, float t) const {
        const float wd = freq0 * std::sqrt(1.0f - damping * damping);
        const float env = amplitude * std::exp(-damping * freq0 * t);
        return normal * (env * std::sin(wd * t + phase) * velocity);
    }
};

// 传播型变形器：沿弧长的行波叠加
glm::vec3 waveOffset(float s, float t, const std::vector<WaveTerm>& terms) {
    glm::vec3 acc{0.0f};
    for (const auto& k : terms) {
        acc += k.amplitude * std::sin(k.omega * t - k.beta * s + k.phase) * k.dir;
    }
    return acc;
}

// 应用到绑定蒙皮结果之上
void applyDynamicSkinning(Mesh& mesh, const SkinningResult& lbs,
                           const std::vector<Deformer>& deformers, float t) {
    for (size_t i = 0; i < mesh.vertices.size(); ++i) {
        glm::vec3 p = lbs.positions[i];
        glm::vec3 v = lbs.velocities[i];        // 位置导数
        glm::vec3 d{0.0f};
        for (const auto& def : deformers)
            d += def.offset(mesh.vertices[i], v, t);
        mesh.vertices[i].position = p + d;      // 直接偏移，无物理求解
    }
}
```

---

## 实验结论

- **发表**：IEEE TVCG 2026（vol. 32, no. 3, pp. 2684–2694），arXiv 作者接收版，10 页 9 图
- **方法**：在多个场景中展示，并与 SOTA 对比
- **关键结论**：变形器直接计算、不解物理方程，因此**计算极快**，同时支持细粒度艺术控制
- 与动画学界主流的弹簧骨骼 / 软体模拟形成对照：牺牲物理精确性换取速度与可控性

---

## 局限性

- 不求解物理方程，因此**不是物理正确模拟**；不可用于需要真实动力学（惯性/能量守恒）验证的场景
- "卡通化"定位明确，面向风格化动画而非写实渲染
- 位置导数的数值稳定性依赖上游蒙皮 / 动画求解器提供可靠的速度信息
- 论文以 TVCG 期刊形式发表（2026 年 3 月），arXiv 版本为作者接收版（2026-10-29 才出现，属"期刊回补"而非新投稿）

---

## 相关工作

- [[2026-05-23-Symbolic-High-Performance-IPC-Simulation]]
- [[2026-08-16-WildFireGS-Wildfire-Simulation]]

---

## 实现建议

- **实现难度**：**低**（纯顶点级数学函数，无求解器）
- **预期性能**：实时；每帧 O(N)，与蒙皮同量级开销
- **适用场景**：
  - ✅ 风格化角色动画的次级运动（卡通、毛发、布料感）
  - ✅ 需要美术可精细调节的实时角色管线
  - ✅ 无法承担物理模拟成本的实时渲染
  - ❌ 物理精确性要求高的仿真
- **给 @墨鱼丸 的落地建议**：
  1. 这属于"动画层"而非"渲染层"技术，与我方渲染职责边界较远，但**位置导数驱动的变形是通用的**（可迁移到流体/软体顶点动画的次级扰动）
  2. 阻尼谐振子响应公式是最小可用模板，可作为"卡通化抖动/回弹"效果的默认实现
  3. 若做角色渲染管线集成，优先关注"变形器可编程接口"的设计，方便美术调参
