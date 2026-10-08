---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, differentiable-rendering, ray-tracing, path-tracing, ultrasound, mitsuba, SIGGRAPH-Asia-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.07941
venue: SIGGRAPH Asia 2026 Technical Communications
year: 2026
---

# UltraDiff: Differentiable Ray Tracing in Ultrasound for Shape Optimization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Ray Tracing in Ultrasound for Shape Optimization |
| **作者** | Felix Duelmer et al. |
| **发表** | SIGGRAPH Asia 2026 Technical Communications |
| **链接** | [原文](https://arxiv.org/abs/2610.07941) |
| **DOI** | [10.1145/3829339.3847840](https://doi.org/10.1145/3829339.3847840) |
| **代码** | 基于 Mitsuba 3 |

---

## 核心贡献

> 将物理可微渲染范式从光传输扩展到医学超声：将超声图像形成建模为 **path-space 积分**（由换能器-组织界面的传播时间门控），推导正向模型和梯度的 Monte Carlo 估计器，并在 SDF 形状优化中实现端到端逆向重建。

1. **UltraDiff 框架**：将超声成像视为 *transient rendering*，按飞行时间（time-of-flight）分箱回波，而非投影到图像平面
2. **Path-space 积分建模**：超声图像形成 ≈ 受传播时间门控的路径积分
3. **梯度 Monte Carlo 估计**：同时估计正向模型和场景参数梯度
4. **无监督逆向几何重建**：从球面 SDF 起步，直接在 B-mode 图像上做 analysis-by-synthesis
5. **基于 Mitsuba 3**：将可微路径追踪扩展到新的传感模态

---

## 技术方案

### 核心思想

把医学超声成像类比为瞬态渲染（transient rendering）：光子在介质中传播，记录的不是屏幕上的位置，而是回到接收器的飞行时间。**每个超声回波 ≈ 一条由传播时间门控的路径贡献**。因此可以复用可微光传输渲染的全部数学工具（path integral + 伴随方法）。

### 与传统可微渲染的差异

| 维度 | 传统可微渲染 | UltraDiff |
|------|------------|-----------|
| 输出维度 | 2D 像素 | 1D 飞行时间直方图（B-mode 由其合成） |
| 几何投影 | 透视投影 | 球面波传播 + 时间门控 |
| 介质 | 真空或参与介质 | 声学介质（已知声速） |
| 梯度来源 | 像素误差 | B-mode 图像像素误差 |

### 关键技术

| 技术 | 说明 |
|------|------|
| Path-space integral | 超声图像形成写为路径积分 |
| Time-of-flight gating | 按传播时间分箱回波 |
| Monte Carlo gradient estimator | 路径积分对场景参数的导数 |
| Mitsuba 3 backend | 复用现有可微渲染器 |
| SDF inverse geometry | SDF 参数化为优化变量 |

---

## 公式

```math
I_{\text{US}}(\mathbf{x}_r) = \int_{\mathcal{P}} f(\mathbf{p}) \, T(\tau(\mathbf{p}) - t) \, d\mu(\mathbf{p})
```

其中 $\mathcal{P}$ 是路径空间，$\tau(\mathbf{p})$ 是路径 $\mathbf{p}$ 的总飞行时间，$T$ 是时间门（DFT 窗口）。

对场景参数（如 SDF）的梯度通过路径积分的伴随（adjoint）/重新参数化方法得到。

---

## 实验结果

- **数据集**：模拟 B-mode 扫描 + 真实机器人采集的脊柱体模
- **基线**：依赖预分割图像的超声形状重建方法
- **结果**：
  - 从球面初始 SDF 收敛到椎体表面
  - 无监督运行（不需要预分割）
  - 几何精度与依赖预分割的方法**相当**，但无需 segmentation pipeline

---

## 局限性

1. 介质声速分布假设均匀（实际人体组织非均匀）
2. 仅处理几何重建，未涉及组织属性（衰减、散射）反演
3. 4 页短文（TC track），细节有限
4. 超声换能器模型固定（未优化换能器参数）

---

## 相关工作

- [[Mitsuba 3]] - 物理可微渲染框架
- Differentiable Monte Carlo rendering (Zeltner et al., 2021)
- Neural radiance fields for medical imaging
- Acoustic inverse problems

---

## 实现建议

- **实现难度**：高（需要复现 Mitsuba 3 的 transient 模式 + 超声物理）
- **预期性能**：在合成 B-mode 上接近 SOTA，在真实数据上需要换能器建模
- **适用场景**：
  - 医学超声引导手术的形状重建
  - 工业无损检测
  - 任何类似 transient imaging 的传感模态（ToF 摄像头、GPR、声呐）
- **对 moyuwan 的建议**：如果团队做医学/科学可视化，可作为参考案例；若做实时图形渲染，无需直接实现。