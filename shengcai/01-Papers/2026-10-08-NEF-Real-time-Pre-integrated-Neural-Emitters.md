---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, real-time-rendering, neural-fields, pre-integration, direct-illumination, area-light, PBR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.06762
venue: arXiv preprint
year: 2026
---

# Neural Emission Fields (NEF): Real-time Rendering of Pre-integrated Neural Emitters

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-time Rendering of Pre-integrated Neural Emitters |
| **作者** | Arno Coomans |
| **发表** | arXiv preprint (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2610.06762) |
| **代码** | 未公开 |

---

## 核心贡献

> **Neural Emission Fields (NEF)** —— 一种用神经网络预积分面光源周围体积照明的表示：在**光源本地坐标系**训练，**单个网络评估**就能在着色点得到**无噪非遮挡直接光照**；自遮挡、内部互反射、空间变化发光、形变全部吸收进学到的表示，**零运行时开销**。

1. 端到端可学习的面光源预积分表示
2. **双头（diffuse + glossy）架构** 在单次推理中覆盖两种 BRDF
3. **光源局部坐标系训练** → 模型可作为可移植"灯光资产"跨场景重用
4. 支持高多边形发光网格、空间变化发光、形变、自遮挡、内部互反射
5. 每个着色点单次网络评估，无噪（noise-free）输出

---

## 技术方案

### 核心思想

传统实时面光源方法三类：
- **解析表示**（polygon / sphere）：几何受限
- **纯采样估计器**：高样本下才无噪
- **代理表示（proxy）**：仍需运行时积分

**NEF 的关键洞察**：把"对发光源出射方向的积分"**离线预计算进一个 MLP**，由位置、法线、视方向、材质参数查询。运行时单次评估 = 整个积分的结果。

### 架构

```
输入：(position, normal, view_dir, material_params)
       │
       ▼
   ┌───────┴───────┐
   ▼               ▼
Diffuse Head   Glossy Head
   │               │
   ▼               ▼
 L_diffuse     L_glossy
   └───────┬───────┘
           ▼
     L_unoccluded (noise-free)
```

### 关键技术

| 技术 | 说明 |
|------|------|
| 局部坐标系训练 | 在光源本体坐标系训练 → 平移/旋转直接复用 |
| 双头 MLP | 单独学习漫反射与光泽反射积分 |
| 预积分（pre-integration） | 离线训练时积分整个出射方向域 |
| 跨场景重用 | 训练一次，跨场景使用，仅需刚性变换 |

---

## 公式

```math
L_{\text{direct}}(\mathbf{x}, \omega_o, \mathbf{m}) = 
\int_{\Omega^+} L_e(\mathbf{y}, -\omega_i) \, V(\mathbf{x}, \mathbf{y}) \,
f_r(\omega_i, \omega_o, \mathbf{m}) \, (\omega_i \cdot \mathbf{n}) \, d\omega_i
```

NEF 学会这个积分：
```math
L_{\text{direct}}(\mathbf{x}, \omega_o, \mathbf{m}) \approx 
\text{NEF}_\theta(\mathbf{x}, \mathbf{n}_x, \omega_o, \mathbf{m})
```

注：遮挡 $V(\mathbf{x}, \mathbf{y})$ 仅针对**外部几何**（外部遮挡仍需运行时处理）；**光源内部**的自遮挡和互反射已经"吸收"进网络。

---

## 实验结论

- **数据集**：未在论文中明确列出，但报告了多个非平凡面光源（带外壳遮挡的灯、可变形发光网格）
- **基线**：解析光源、纯采样、代理表示
- **结果**：
  - 单次评估替代完整积分
  - 完全无噪
  - 可在 GPU 实时渲染管线中替换现有面光源评估

---

## 局限性

1. **外部遮挡**仍需运行时处理（射线测试）——NEF 不处理外部阴影
2. **训练成本**：每个新光源需要离线训练（小时级）
4. **形变支持**：通过在形变空间内采样训练（需要形变描述）
5. 论文未给出详细超参数和定量对比

---

## 相关工作

- [[Light Probes]] - 早期预积分环境光
- Neural Radiance Fields (NeRF, Mildenhall 2020)
- [[Real-time Neural Radiance Caching]]
- Pre-filtered environment maps (Heitz 2014)
- Area light sampling (Peters 2019)

---

## 实现建议

- **实现难度**：中-高（需要构造训练数据 pipeline，MLP 实现不难，难在训练数据生成）
- **预期性能**：运行时单次 MLP 推理 ≈ 几十 FLOPs，完全实时
- **适用场景**：
  - 游戏/影视复杂面光源（霓虹灯、汽车尾灯、屏幕、复杂灯罩）
  - 室内光照资产
  - VR/AR 中的动态发光物体
- **对 moyuwan 的建议**：
  - 可以作为**离线预积分** 模块集成到现有 PBR 引擎（UE/Unity/Pathfinder）
  - 实际场景中**外部遮挡需结合传统阴影方案**
  - 推荐作为**重点可行性评估候选**（⭐⭐⭐⭐⭐）