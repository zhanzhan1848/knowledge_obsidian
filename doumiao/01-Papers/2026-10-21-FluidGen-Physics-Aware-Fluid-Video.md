---
type: paper
created: 2026-10-21
updated: 2026-10-21
tags: [paper, fluid-rendering, smoke, fire, video-generation, velocity-field, DPO, diffusion]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.25660
---

# FluidGen: Physics-Aware Fluid Video Generation via Motion-Guided Post-Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FluidGen: Physics-Aware Fluid Video Generation via Motion-Guided Post-Training |
| **arXiv ID** | 2610.25660v1 |
| **作者** | Yang Zheng\*, Zizhang Li\*, Boyang Deng, Jan Ackermann, Lei Shu, Yinghao Xu, Jiajun Wu, Gordon Wetzstein, Leonidas Guibas（\* 共同一作） |
| **机构** | Stanford University |
| **分类** | cs.CV, cs.GR |
| **发表** | 2026-10-19（本周新论文，距本次检索 ≤48h） |
| **链接** | [arXiv](https://arxiv.org/abs/2610.25660) · [PDF](https://arxiv.org/pdf/2610.25660v1) · [Project Page](https://y-zheng18.github.io/FluidGen/) |

---

## 核心贡献

> 把「速度场」当作可预测、可监督、可当奖励的物理量注入预训练视频扩散模型，在无需 3D 场景和调参的前提下生成物理可信的烟雾/火焰/爆炸流体视频。

1. **速度场即视频**：将逐像素 3D 速度用**球面坐标编码为颜色**，从而复用预训练视频模型的 VAE，零额外编码器成本。
2. **双流（Dual-head）联合扩散**：共享一个 **Wan2.1** 去噪器同时预测 RGB 与速度流，速度通道**零初始化**，不破坏预训练权重。
3. **两阶段后训练**：先在高保真 Houdini 仿真数据 + 真实野外流体视频上联合微调（运动引导微调），再用**速度感知的 DPO**（以预测速度场构造物理奖励）做偏好对齐。
4. 附带两个实用能力：从真实视频反演 3D 速度场；生成的速度场可直接导入 Houdini 驱动新流体仿真。

---

## 技术方案

### 核心思想

现有视频生成模型在流体现象（烟雾、火焰、爆炸碎片）上会**系统性地失败**——输出缺乏连贯涡旋结构，退化为平淡运动，违背真实流体物理。经典求解器物理保真度高，但需要精细 3D 场景和大量调参，在野外图像/视频生成场景中不可行。

FluidGen 取中间路线：不要求场景几何输入，直接在**图像/视频域**注入数据驱动的流体先验（data-driven fluid prior），并把速度场作为**一等公民**的中间表征来监督与奖励。

### 关键技术

| 技术 | 说明 |
|------|------|
| 速度场球面坐标着色 | 3D 速度向量 → (θ, φ) 球面坐标 → RGB 三通道；可直接复用 Wan2.1 的 3D 因果 VAE 编解码，无需新 tokenizer |
| 共享去噪器双头输出 | 一个 Wan2.1 denoiser 同时输出 RGB latent + velocity latent；velocity 分支通道 **zero-init**，训练初期等价于基座模型 |
| 混合数据配比 | 高保真 Houdini 仿真数据（含配对速度场真值）+ 精选野外流体视频（保证外观多样性），解决 sim2real 外观差距 |
| 速度感知 DPO | 在预测速度场上计算物理一致性奖励 r_phys（如涡旋结构、散度/平滑度、与 RGB 流的一致性），构造偏好对做直接偏好优化 |
| RePaint 式条件采样 | 给出真实视频作为 RGB 流约束，反推匹配的 3D 速度场（速度估计任务） |
| Houdini 桥接 | 生成速度场导出为求解器可接受的格式，作为新流体源的驱动场 |

### 速度场与奖励的数学形式

速度编码（示意）：

```math
v = (v_x, v_y, v_z),\quad \|v\| \to \hat v \in S^2
\qquad
c_{vel} = \left(
  \tfrac{1+\hat v_x}{2},\;
  \tfrac{1+\hat v_y}{2},\;
  \tfrac{1+\hat v_z}{2}
\right)
```

物理奖励（一致性项，示意）：

```math
r_{\text{phys}} =
  \lambda_{\text{vort}}\; \big\|\omega_{\text{gen}} - \omega_{\text{rgb-flow}}\big\|_1
+ \lambda_{\text{div}}\big\|\nabla\!\cdot\!\mathbf{v}_{\text{gen}}\big\|_1
+ \lambda_{\text{tv}}   \big\|\mathbf{v}_{t+1} - \mathbf{v}_t\big\|_2^2
```

其中 $\omega = \nabla \times \mathbf{v}$ 为涡量，用以鼓励真实流体特征（涡旋脱落、浮升羽流）；散度项惩罚非物理压缩；时间平滑项抑制逐帧抖动。$\mathbf{v}_{\text{rgb-flow}}$ 为从 RGB 光流/生成运动估计得到的伪真值，构成自监督一致性锚点。

---

## 实验结论

- **基座模型**：Wan2.1-I2V-14B（14B 参数的图像转视频扩散模型）
- **训练数据**：Houdini 高保真仿真（含速度场 GT）+ 野外真实流体视频混合
- **消融**：
  - Wan2.1-I2V-14B（基座）→ 流体运动不自然、外观漂移（appearance drift）
  - FluidGen w/o DPO（仅联合微调）→ 动力学变连贯
  - FluidGen（完整，含速度感知 DPO）→ 细节更丰富、火焰/烟雾运动更生动
- **定性应用**：形状过渡（Smoke→Horse→Cat→Winged Dragon）在保持运动物理可信的同时完成语义编辑
- **结论**：相比强视频基线与基于优化的方法，生成序列的流体动力学真实度显著提升

---

## 局限性

1. **仍是 2D 域方法**：速度场是逐像素（per-pixel）的 2D 流场投影，而非真正的 3D 速度体；导出到 Houdini 时需要额外的 3D 重建/提升步骤。
2. **依赖 Houdini 数据**：物理先验的来源是仿真数据，无法覆盖数据稀缺的复杂现象（湍流破碎、真实尺度火焰）。
3. **扩散模型推理成本**：14B 双流扩散模型远慢于实时，**不可用于实时渲染管线**，属于离线/近线内容生成。
4. **物理保真 ≠ 可求解**：生成的速度场虽然「看起来物理一致」，但未必严格满足质量守恒/不可压缩条件，直接驱动求解器可能需要投影修正。
5. **形状编辑与物理的折中**：在强语义引导下的形状过渡仍可能出现局部非物理形变。

---

## 相关工作

- [[2026-10-20-FluidGen-Physics-Aware-Fluid-Video]]（同主题首次记录，2026-10-20 cron）
- [[2607-17725 Fast VEM Fluid Simulation]]
- [[2508.01537 FluidFormer — Transformer 连续卷积粒子流体]]
- [[2610.10984 Fluid-Gen-Zero — 无训练物理接地]]
- [[2605.00177 FieryGS — 3DGS 火灾合成]]
- [[2608.11100 WildFireGS — 3DGS 森林火灾物理仿真]]
- 概念：[[速度场监督]]、[[物理奖励函数]]、[[DPO 对齐]]、[[扩散模型物理先验]]

---

## 实现建议

🩸 可行性分析：速度场作为生成模型的辅助监督 + 奖励信号

### 渲染方法
- 类型：**生成式（离线）**，非传统 Ray Marching / 粒子渲染
- 技术：视频扩散模型双流架构 + 物理一致性偏好优化

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（外观层）；物理一致性 ⭐⭐⭐⭐（涡旋结构明显改善）
- 风格化支持：是（形状过渡演示证明可控性强）

### 性能预期
- 帧率：不适用于实时（离线生成，单序列分钟级）
- GPU 需求：需 ≥80GB 显存（A100/H100 级）训练与推理
- 内存占用：14B 权重 bf16 ≈ 28GB + 激活/VAE 缓存

### 实现建议
- 着色器复杂度：**不适用**（非传统光栅化管线）
- 管线要求：预训练 I2V 扩散模型 + 速度场渲染管线（Houdini/自研）+ 仿真数据生成算力
- 推荐度：✅ **作为离线资产生成与流体先验提取工具强烈推荐**；⚠️ 若目标是实时流体渲染，应借鉴其「速度场辅助监督」思路，而非直接部署

**对实时管线的可迁移洞见**：把速度/散度/涡量作为**可微中间量**参与训练或作为一致性约束，可以低成本地抑制退化解，这是无需完整物理求解器的实用折中。

已传递给 @墨鱼丸。