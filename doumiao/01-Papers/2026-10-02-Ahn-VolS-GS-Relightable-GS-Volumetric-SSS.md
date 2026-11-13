---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, volume-rendering, subsurface-scattering, relighting, finite-volume, gaussian-splatting, cs.CV]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.04007
---

# VolS-GS: Relightable Gaussian Splatting with Volumetric Subsurface Scattering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VolS-GS: Relightable Gaussian Splatting with Volumetric Subsurface Scattering |
| **作者** | Junyeong Ahn |
| **发表** | arXiv 2026-10-02（v2 2026-10-06），23 页，cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2610.04007) |
| **DOI** | [10.48550/arXiv.2610.04007](https://doi.org/10.48550/arXiv.2610.04007) |
| **代码** | 未公开 |

---

## 核心贡献

> 不在每个高斯基元上用神经网络或局部核近似次表面散射，而是**把高斯场景的空间支撑本身当作可微有限体积输运求解器的定义域**，让光可以在物体内部传播。

1. **几何即求解域**：用可微有限体积（finite-volume）输运求解器替代"每基元独立外观"建模。
2. **逐高斯散射/吸收系数**：小网络为每个高斯预测散射与吸收系数，求解器在由此形成的场中重分配入射光。
3. **阴影项一致性设计**：阴影项由可见性、透射率与求解产生的散射共同预测；正则项抑制阴影项预测为未照亮区域中的高光——防止学习到的阴影/高光项"抢走"其他分量的贡献。

---

## 技术方案

### 核心思想

可重光照的 Gaussian Splatting 方法通常在**每个基元上独立建模外观**，这使得**非局部效应**难以表达。次表面散射正是典型的非局部效应：光在物体一处进入，可能在另一处射出。

VolS-GS 的解法：
- 把**高斯场景的空间支撑**（Gaussian scene 的 spatial support）用作**可微有限体积输运求解器的定义域**；
- 小网络为每个高斯预测 `σ_s`（散射系数）与 `σ_a`（吸收系数）；
- 求解器在由这些系数形成的场中**重分配入射光**。

**重要澄清（论文自述）**：系数是**拟合图像得到的，不是测量的**。因此该求解器提供的是一条"**传输形状的路径**"（transport-shaped path）用于聚合逐基元外观，**不是对材料的真实测量**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **可微有限体积输运求解器** | 定义域 = 高斯场景空间支撑；支持光在内部传播（而非逐基元独立外观） |
| **逐高斯散射/吸收系数预测** | 小网络输出 `σ_s`, `σ_a`；求解器据此重分配入射光 |
| **OLAT 采集** | One-Light-At-a-Time 采集，支持新光照 + 新视角重光照 |
| **阴影项联合预测** | 由可见性 + 透射率 + 求解散射共同预测阴影项，而非独立学习 |
| **高光抑制正则** | 在阴影项预测为未照亮的区域抑制高光，避免阴影/高光项"劫持"输运求解器的贡献 |
| **输运形状 vs 材料测量** | 明确区分：拟合系数 ≠ 物理测量的材质参数 |

---

## 公式

```math
% 有限体积输运方程（可微形式，离散于高斯支撑）
\frac{\partial L(\mathbf{x})}{\partial s}
= -\left(\sigma_a(\mathbf{x})+\sigma_s(\mathbf{x})\right)L(\mathbf{x})
+ \sigma_s(\mathbf{x})\,\Phi(\mathbf{x})

% 散射源项来自求解器内部的多次散射重分配
\Phi(\mathbf{x})=\sum_{j} p_{ij}\,L_j

% 合成
\widehat{\mathbf{C}} = \mathbf{C}_{\text{base}} \cdot T_{\text{transport}} + \mathbf{C}_{\text{shadow}} + \mathbf{C}_{\text{spec}}
```

### 代码片段

```python
# 可微有限体积输运求解（概念伪代码）
def transport(incoming_L, sigma_s, sigma_a, gaussians):
    """sigma_s/sigma_a: 逐高斯网络预测；gaussians: 场景支撑"""
    # 沿视线步进，累积吸收与散射
    T = torch.ones_like(incoming_L)
    scattered = torch.zeros_like(incoming_L)
    for step in range(n_steps):
        ds = step_size
        atten = torch.exp(-(sigma_a + sigma_s) * ds)          # 吸收+散射衰减
        T = T * atten
        scattered = scattered + sigma_s * T * incoming_L * ds  # 单次散射近似
        incoming_L = incoming_L * atten
    return incoming_L, scattered, T
```

---

## 实验结论

- **数据集**: 三个 OLAT 基准（one-light-at-a-time 采集），带 held-out 光照与 held-out 视角
- **基线**: 传统可重光照 GS 方法（逐基元独立外观建模）
- **结果**: 在三个 OLAT 基准上，VolS-GS 在 **held-out 光照与视角**上的重光照质量**一致提升**（consistent improvement）

---

## 局限性

- **散射/吸收系数是拟合值而非测量值**：求解器提供的是"传输形状的路径"，不是材质测量
- 依赖 OLAT 采集协议（需要逐光源采集），采集成本高
- 仅针对**静态物体**的可重光照，未涉及动态/流体
- 未公开代码
- 求解域被限制在高斯场景支撑内，支撑稀疏时输运可能不完整

---

## 相关工作

- [[2026-11-13-Sancho-Rath-Manzi-Chang-Bermano-Nowrouzezahrai-Gross-Papas-Neural-Render-Proxies]]
- [[2026-04-08-Real-time-Neural-Six-way-Lightmaps]]
- [[2026-10-02-Ahn-VolS-GS-Relightable-GS-Volumetric-SSS]]
- [[Volume-Rendering]]
- [[Subsurface-Scattering]]
- [[Finite-Volume-Method]]

---

## 实现建议

- **实现难度**: 高（需实现可微有限体积输运求解器 + 网络预测系数 + 多项一致性正则）
- **预期性能**: 未给出具体帧率；求解开销与高斯数、步进数相关
- **适用场景**: 需要**物理合理性更强的次表面散射**的可重光照场景（蜡质、皮肤、大理石、玉石、半透明果冻）
- **对流体渲染的启示**:
  - **有限体积输运求解器 + 可微** 的组合，正是**参与介质（体积渲染）**的经典框架，但本文把"体积"锚定在**高斯支撑**上，而非传统均匀网格
  - 这提供了一条**在 3DGS 中实现真实体积光/半透明流体**的路径：把高斯场当作输运网格，σ_s/σ_a 逐基元学习 → 光在高斯之间散射 → 得到**带自阴影与内散射的烟雾/牛奶/果冻**
  - 与 [[2026-11-13-Sancho-Rath-Manzi-Chang-Bermano-Nowrouzezahrai-Gross-Papas-Neural-Render-Proxies]] 互补：NRP 解决"光照迭代慢"，VolS-GS 解决"非局部散射表达难"
