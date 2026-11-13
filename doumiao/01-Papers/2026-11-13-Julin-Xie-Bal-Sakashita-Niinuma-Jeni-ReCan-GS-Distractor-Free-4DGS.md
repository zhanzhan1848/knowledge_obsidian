---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, smoke-removal, volume-rendering, gaussian-splatting, 4D-reconstruction, cs.CV]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.16259
---

# Reconstruct What You Can: Distractor-free 4D Gaussian Splatting (ReCan-GS)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Reconstruct What You Can: Distractor-free 4D Gaussian Splatting |
| **作者** | Joel Julin, Liuyue Xie, Ananya Bal, Mose Sakashita, Koichiro Niinuma, Laszlo A. Jeni (CMU / Fujitsu Research of America) |
| **发表** | arXiv 2026-11-12，Accepted at **WACV 2027** |
| **链接** | [原文](https://arxiv.org/abs/2611.16259) |
| **DOI** | [10.48550/arXiv.2611.16259](https://doi.org/10.48550/arXiv.2611.16259) |
| **项目主页** | https://recan-gs.github.io |
| **代码** | 未公开（主页待发布） |

---

## 核心贡献

> 用变形场 Jacobian 导出的"运动不确定度"作为路由信号，把 4DGS 场景中的**一致内容**（Core Gaussians）与**不一致观测**（Per-View Distractor Gaussians）分离，从而在**完全动态场景**中去除烟雾/雾等体积干扰物，且无需掩码、预训练分割器或介质专用监督。

1. **Jacobian 运动不确定度指标**：从学到的 4D 变形场的 Jacobian 中提取，对"几何重建歧义"给出可解析的度量，区别于基于速度/外观/语义的启发式。
2. **统一干扰物移除框架**：同一套判据覆盖空间遮挡物、光度伪影、以及**演化中的烟雾/雾**（体积干扰物），不需要针对烟雾单独设计。
3. **实验验证**：合成 + 真实动态场景（带干扰物）+ 带无雾真值的合成烟雾场景。

---

## 技术方案

### 核心思想

标准 4DGS 假设一个共享的 canonical 空间能解释所有观测。当场景中出现瞬态干扰物（手、影子、烟雾），它们会在 canonical 空间中引入**互相矛盾的几何约束**，导致 ghosting 与不稳定几何。

ReCan-GS 的洞察：**不用"什么东西在动"来定义干扰物，而用"变形空间是否稳定"来定义**。
- 遮挡物虽然在快速运动，但其 Jacobian 不确定度高 → 被路由到 distractor 层。
- 烟雾/雾虽然**光度上稳定、速度很慢**，但其拓扑持续演化导致变形约束不一致 → 不确定度同样高 → 被移除。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Core Gaussians** | 规范空间（canonical）中的 3D 高斯，由 8 层 × 256 宽 MLP 变形场驱动：`N(μ_i, t) = (Δμ_i, Δq_i, Δs_i)`，输出位置/旋转/尺度偏移 |
| **Per-View Distractor Gaussians** | 沿用 DeSplat 的逐视图瞬态层。初始化在相机对齐的浅平面上：`μ_d = t_n − R_nᵀ[u]`，`u = [ρu, ρv, ρ]`；按视图独立做 ADC 加密 |
| **Jacobian 不确定度** | 对变形偏移求 Jacobian `J_{Δμ} = ∂Δμ/∂(μ, t)`，取行梯度协方差的迹 `U_{Δμ}(g_i) = Tr(Cov(J_{Δμ}))`；总分为 `U(g_i) = U_{Δμ} + U_{Δq} + U_{Δs}`。用随机扰动时间 `t' = t + ε` 做稳健局部估计 |
| **Variant 1：损失正则** | `L_unc = Σ_{g_i ∈ G_core} U(g_i) · α_core,i`——惩罚"既不确定又不透明"的核心高斯，把不确定区域逼向 distractor 层。总损失 `L = L_photo + L_α + λ_unc·L_unc` |
| **Variant 2：事后剪枝** | 训练中用 EMA 累积不确定度 `U_t = β·U_{t−1} + (1−β)·U_inst`，收敛后剪掉累计不确定度 top-r% 的核心高斯（实验中用 0%/5%/7%/15% 分层阈值） |
| **双层合成** | `c_comp = c_dist + (1 − α_dist)·c_core`，使干扰物能正确遮挡核心 |

### 公式

```math
J_{\Delta\mu}=\frac{\partial\Delta\mu}{\partial(\mu,t)},\qquad
U_{\Delta\mu}(g_i)=\mathrm{Tr}\!\left(\mathrm{Cov}(J_{\Delta\mu})\right)

U(g_i)=U_{\Delta\mu}(g_i)+U_{\Delta q}(g_i)+U_{\Delta s}(g_i)

\mathcal{L}_{\mathrm{unc}}=\sum_{g_i\in G_{\mathrm{core}}}U(g_i)\cdot\alpha_{\mathrm{core},i}

\mathcal{L}_{\mathrm{total}}=\mathcal{L}_{\mathrm{photo}}+\mathcal{L}_{\alpha}+\lambda_{\mathrm{unc}}\mathcal{L}_{\mathrm{unc}}

U_t(g_i)=\beta\,U_{t-1}(g_i)+(1-\beta)\,U_{\mathrm{inst}}(g_i)
```

### 代码片段

```python
# Jacobian 不确定度核心计算（伪代码）
def jacobian_uncertainty(model, mu, t, eps=1e-3):
    """对变形场 N 输出偏移求 Jacobian 行协方差的迹。"""
    t_pert = t + eps
    J = torch.autograd.functional.jacobian(
        lambda tt: model(mu, tt), t_pert, vectorize=True
    )                                   # shape: [out_dim, 4]  (dx,dy,dz,dt)
    return torch.trace(torch.cov(J.T))  # Tr(Cov(rows of J))

def uncertainty_regularizer(core_gaussians, model, t):
    """L_unc = sum U(g_i) * alpha_core,i"""
    U = sum(jacobian_uncertainty(model, g.mu, t) for g in core_gaussians)
    alpha = sum(g.alpha for g in core_gaussians)
    return (U * alpha).sum()
```

---

## 实验结论

- **数据集**:
  - 动态场景 + 干扰物：合成 *Bouncing Balls*（Blender，三个球被跑者遮挡）、*Squatting*（Unity）；真实 *Jeep* / *Bottle*（iPhone 15 Pro 拍摄，含手部遮挡与移动投影）
  - 烟雾场景：SmokeSeer 的 4 个合成场景（Muscle Car / Chair / Hotdog / Lego），Blender Mantaflow 模拟，带**无烟真值**
  - 静态干扰物基准：NeRF On-the-go（Mountain / Fountain / Corner / Patio）
- **基线**: DeformableGS、4DGS（动态重建）；DeSplat、SpotLessSplats(SLS-MLP)、WildGaussians、Robust3DGS、AsymGS、NeRF On-the-go（静态干扰物移除）
- **结果**:
  - 动态干扰物：Bouncing Balls **29.4 dB 领先所有方法**；Bottle 取得最佳动态方法结果 23.0 dB；相对 DeformableGS 在 Squatting/Jeep 分别低 2.2 dB / 1.9 dB，在 Bouncing Balls/Bottle 分别高 1.6 dB / 1.4 dB
  - **烟雾移除**：在 Muscle Car 与 Hotdog 上分别比最强基线高 **5.7 dB 和 6.2 dB**（外观类方法把半透明烟当作稳定背景保留）
  - 干扰物残留率（人类 + VLM 评委）：Jeep 上 DeformableGS 73–83%、4DGS 77–88% 的帧仍可见遮挡物，而 ReCan-GS 仅 0–11%；**无任何人类标注者**把 ReCan-GS 任何一帧评为出现遮挡物
  - 定位能力：Jacobian 不确定度对 Bottle 的聚合 IoU **0.532**（中位 0.483），而运动幅度仅 0.284 / 0.071
  - 代价：训练 16.23 min vs DeformableGS 9.22 min；峰值显存 14.0 GB vs 2.8 GB；参数 9.70M vs 3.62M；**推理零开销**，14 GB 消费级 GPU 即可
  - 覆盖率消融：固定速度下，相机视角从 1 增至 3，不确定度一致下降 → 证实其衡量的是"可重建性"而非原始运动幅度

---

## 局限性

- **静态干扰物场景较弱**：在 NeRF On-the-go 上比 SLS-MLP 低 2.6 dB PSNR、0.15 SSIM、0.18 LPIPS；SSIM/LPIPS 为该对比中最弱
- 不确定度**不是校准的概率不确定度**：复杂但正确的变形同样可能得到高分
- 判据不负责确定"谁是目标物体"：观察良好的干扰物可以有稳定变形，观察不佳的目标反而可能得高分 → 分离依赖观测覆盖度
- 未与**专用烟雾移除方法**对比（仅与通用干扰物移除方法比较）
- 真实场景的干扰物残留评分不能验证遮挡期间目标内容的完整性——移除有效目标内容同样会降低表观干扰物
- 训练开销接近 2 倍（Jacobian 计算）

---

## 相关工作

- [[2026-11-11-Shramko-Govindarajan-Spaghetti-Splatting]]
- [[2026-11-05-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]]
- [[2025-09-14-WildSmoke-3D-Smoke-from-Video]]
- [[2026-03-16-Gaussian-Fluids-SIGGRAPH2025]]
- [[Volume-Rendering]]
- [[Gaussian-Splatting]]
- [[Smoke-Removal]]

---

## 实现建议

- **实现难度**: 中（需实现变形场 Jacobian 的批量自动微分 + 双层高斯合成 + ADC）
- **预期性能**: 训练约 16 min / 14 GB 显存；推理与标准 4DGS 相同帧率
- **适用场景**: 动态场景重建中的烟雾/雾/遮挡物剔除；无需任何标注的免监督清理流水线
- **可迁移性**: 该"变形敏感度"判据可推广到任意 4D/动态表示（4DGS、DeformableGS、动态 NeRF），用于判别"几何一致性"而非"运动量"
