---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, fluid-rendering, video-generation, physics-simulation, training-free, diffusion-model, particle-system]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.10984
---

# Fluid-Gen-Zero: Grounding Pretrained Video Generators in Physics without Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fluid-Gen-Zero: Grounding Pretrained Video Generators in Physics without Training |
| **作者** | Hong Huang, Yuqiu Liu, Chenyu You, Daniel Martin, Chuhang Zou, Wuyang Chen |
| **机构** | Simon Fraser University; Stony Brook University; Lawrence Berkeley National Laboratory |
| **发表** | arXiv preprint, 2026-10-07 (v1) |
| **链接** | [arXiv:2610.10984](https://arxiv.org/abs/2610.10984) |
| **DOI** | 10.48550/arXiv.2610.10984 |
| **分类** | cs.CV (primary), cs.GR (cross-list) |
| **代码** | Code and data will be released upon acceptance |

---

## 核心贡献

> 一种无需训练的、物理感知的流体-物体交互视频生成框架，将物理推理与外观合成解耦。

1. **Training-Free 框架**：Fluid-Gen-Zero 是首个无需后训练即可为视频生成器注入物理感知能力的训练免费框架，提供即插即用的兼容性。
2. **两层级智能体工作流**：
   - **生成时规划** (Generation-Time Planning): VLM 智能体解析意图与仿真输出，组织生成片段。
   - **潜空间引导** (Latent-Space Guidance): 通过区域感知 latent wrapping，将仿真信号注入去噪过程。
3. **新基准**：贡献了 43 个流体-物体交互样本的基准数据集（含 401 帧仿真回放、3D 粒子轨迹、物体/流体掩码、投影光流），覆盖 10 个主要流体类别。

---

## 技术方案

### 核心思想

将运动动力学委托给物理仿真器，将外观建模能力留给预训练的视频生成器。通过两个通用接入点（生成时间线 + 内部去噪轨迹）将两者桥接：
- **生成时规划**：将仿真回放转换为片段计划（保护事件区间 + 片段级 prompt）。
- **潜空间引导**：在去噪过程中注入仿真信号。

### 关键技术

| 技术 | 说明 |
|------|------|
| **训练免费的物理注入** | 完全在推理阶段引入物理感知，避免昂贵的重新训练 |
| **生成时规划 (VLM agent)** | VLM 解析意图记录 ℐ 和仿真回放 𝒮，生成片段计划 Π={(sᵢ,eᵢ,pᵢ)} |
| **混合时间复杂度评分** | C_t = w_phys·C_t^phys + w_vis·C_t^vis + w_sem·C_t^sem，用于定位安全片段边界 |
| **区域感知 Latent Wrapping** | 将仿真信号（掩码、光流）注入到预训练视频生成器的去噪轨迹中 |
| **3D 仿真重建** | 从输入图像分割物体/流体/背景，单目点云恢复几何，3D 重建物体并精修姿态 |
| **物理仿真器 Φ_Θsim** | 耦合的物体-流体状态递推：(X_{τ+1}^o, X_{τ+1}^f) = Φ(X_τ^o, X_τ^f) |
| **仿真回放 𝒮** | 输出 3D 粒子轨迹、物体/流体掩码、光流、仿真预览、外观保持的 warp 参考视频 |

### 三阶段流水线

1. **场景重建与物理仿真**：解析输入图像和 prompt → 重建 3D 仿真就绪场景 → 滚动流体-物体动力学。
2. **生成时规划**：将长回放划分为多个生成片段，边界放在稳定区间，每片段分配 prompt。
3. **潜空间引导**：将 𝒮 的信号注入去噪过程，引导每片段的运动，保留外观先验。

### 边界风险感知规划

- **物理复杂度 C_t^phys**：检测快速变化（接触、飞溅、遮挡）
- **视觉复杂度 C_t^vis**：检测视觉信号突变
- **语义复杂度 C_t^sem**：检测语义事件突变
- **安全边界**：位于时间稳定区；**风险边界**：落在重要物理事件内或附近（不应切开）

---

## 公式

### 仿真递推
```math
(X_{\tau+1}^o, X_{\tau+1}^f) = \Phi_{\Theta_{\mathrm{sim}}}(X_{\tau}^o, X_{\tau}^f), \quad \tau = 0, \ldots, T_{\mathrm{sim}}-1
```

### 仿真回放记录
```math
\mathcal{S} = \{X_{1:T}^o, X_{1:T}^f, M_{1:T}^o, M_{1:T}^f, F_{1:T-1}, R_{1:T}^{\mathrm{sim}}, V_{1:T}^{\mathrm{sim}}\}
```

### 混合时间复杂度
```math
C_t = w_{\mathrm{phys}} C_t^{\mathrm{phys}} + w_{\mathrm{vis}} C_t^{\mathrm{vis}} + w_{\mathrm{sem}} C_t^{\mathrm{sem}}
```

### 片段计划
```math
\Pi = \{(s_i, e_i, p_i)\}_{i=1}^{N_{\mathrm{clip}}}
```

---

## 实验结论

### 跨 backbone 改进

| Backbone | 类型 | 物体轨迹误差降低 | 流体 fEPE 降低 |
|----------|------|------------------|----------------|
| Tora | CogVideoX-based | 26.7%–81.5% | 67.9%–84.0% |
| VACE | Wan-based | 26.7%–81.5% | 67.9%–84.0% |
| WanMove | Wan-based | 26.7%–81.5% | 67.9%–84.0% |

### 人类偏好研究

- 同 backbone 对比：55.1%–74.4% 偏好 Fluid-Gen-Zero
- 对比基于仿真的方法：90.4%–94.2% 偏好 Fluid-Gen-Zero

### 新基准
- 43 个精选流体-物体交互样本
- 401 帧仿真回放
- 10 个主要流体类别
- 提供 3D 粒子轨迹、物体/流体掩码、投影光流

---

## 局限性

- 依赖外部物理仿真器提供信号，需要 3D 重建质量
- 对单目点云恢复的几何精度敏感（物体姿态需精修到与流体水面吻合）
- 即插即用但需要 prompt 解析规则覆盖常见运动/材质词
- 仿真器与生成器之间的表示 gap 仍需手工弥合

---

## 相关工作

- **物理仿真器**：SPH/PBF, MPM solvers; MuJoCo, Taichi, Warp, Genesis
- **视频基础模型**：CogVideoX, Wan 系列
- **可控视频生成**：MotionCtrl, Tora, MagicMotion, WanMove, ATI
- **免训练调度**：MotionCraft, Time-to-Move
- **物理感知生成**：WonderPlay, PSIVG, RealWonder, PerpetualWonder, PhysGen3D, PhysAnimator

---

## 实现建议

- **实现难度**: 中（依赖多个组件：仿真器、VLM、视频生成器；pipeline 较复杂）
- **预期性能**: 推理时运行，依赖 backbone（视频生成器 + 仿真器）
- **适用场景**: 流体-物体交互视频合成、视觉特效、游戏过场动画、虚拟试穿/产品演示、物理一致性数字内容生成
- **对流体渲染的启示**:
  - 将物理仿真与神经渲染解耦是趋势，可避开端到端训练的高成本
  - **潜空间 wrapping** 思路可应用于体积流体渲染：将仿真粒子数据注入神经体渲染的去噪/解码阶段
  - 边界风险评分（物理+视觉+语义）可启发流体动画自动分段/预览系统

---

## 🔗 资源追踪

- **代码**: 待发表后开放
- **数据集**: 43 样本基准，待发表后开放
- **arXiv 链接**: https://arxiv.org/abs/2610.10984
- **HTML 预览**: https://arxiv.org/html/2610.10984v1

---

*🌱 豆苗 | 流体渲染知识管理系统 | 2026-10-09*
