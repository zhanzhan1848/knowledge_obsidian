---
type: paper
created: 2026-10-18
updated: 2026-10-18
tags: [paper, geometry-aware-diffusion, depth-prediction, world-model, geometry-appearance-decoupling]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2610.20625
---

# Decoupling Appearance and Geometry in Diffusion World Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Decoupling Appearance and Geometry in Diffusion World Models |
| **作者** | Rajit Rajpal 等 |
| **发表** | arXiv 2610.20625 (cs.GR), 2026-09-28 (v1, refreshed in cs.GR list 2026-10-15) |
| **链接** | [原文](https://arxiv.org/abs/2610.20625) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.20625 |
| **代码** | 待论文接收后开源 |

---

## 核心贡献

> 提出 **staggered RGB-depth**：两阶段扩散世界模型——先 action-conditioned depth(t+1)，再 RGB(t+1) condition on depth。几何与外观解耦、可独立训练 / 微调
- 在 CS:GO Dust 2 上 depth accuracy 与 RGB fidelity 双双优于 fully joint 与 RGB-only baseline
- Stage 2 可在无需 action 标签的 RGB-D 数据上扩展

---

## 技术方案

### 核心思想

Joint RGBD diffusion 模型需要 action 监督，限制在大量无标注视频上的扩展。Staggered RGB-D 允许 stage-2 用无 action 的 RGB-D 数据继续训练，stage-1 用 action-conditioned depth diffusion。

### 关键技术

| 技术 | 说明 |
|------|------|
| Staggered RGB-depth | 时间上分阶段生成；depth 先，RGB 后 |
| Action-conditioned depth DiT | stage-1 给定 action 预测 depth |
| RGB conditioned on depth | stage-2 利用 depth latents + diffusion |
| Approximation of joint RGBD | 理论 + 实验同时成立 |
| Geometry-guided world modeling | 提供可扩展训练范式 |

---

## 公式

```
p(d_{t+1} | a, s_t) ≈ DiT_action(s_t)              // stage-1 depth
p(r_{t+1} | d_{t+1}, s_t) ≈ DiT_rgb(d_{t+1}, s_t)  // stage-2 RGB
joint   ≈ p(d) p(r | d)                            // 近似
```

---

## 代码片段

```text
// 概念伪代码：staggered two-stage diffusion world model
depth_next = depth_diffusion.sample(
    conditioning = action + state_now
)
rgb_next = rgb_diffusion.sample(
    conditioning = depth_next + state_now
)
return (depth_next, rgb_next)
```

---

## 实验结论

- **数据集**: CS:GO Dust 2 first-person video
- **基线**: fully joint RGBD diffusion、RGB-only diffusion、diffusion forcing
- **结果**: depth accuracy + RGB fidelity 同时优于 baselines；可扩展到无 action 标签数据

---

## 局限性

- 假设 depth 先于 RGB 是合理时序；其他时序结构可能效果不同
- 主要在游戏场景评估，真实世界域尚未验证
- 没有开源代码

---

## 相关工作

- 相关概念：world model、diffusion forcing、geometry-aware diffusion、RGB-D fusion
- 相关：[[PCAsplat]] (几何正则化方向接近)

---

## 实现建议

- **实现难度**: 高。需要完整 diffusion transformer + 跨模态 conditioning
- **预期性能**: 训练阶段比 joint 灵活；推理速度受两阶段叠加影响
- **适用场景**: first-person video prediction、embodied AI 模拟器、scene-level video generation
- **推荐依赖**: PyTorch + DiT / Stable Diffusion v3 backbone，深度估计 foundation model
- **数值稳定性**: 中。条件化跨阶段需要稳定 tokenization
- **推荐度**: ⚠️ 谨慎评估（场景专用；几何处理方向意义在于 geometry-appearance 解耦思想可借鉴）

---

## 传递给 @墨鱼丸

🥢 **可行性分析：Decoupled RGB-D Diffusion World Model**

**算法复杂度**
- 训练：两阶段独立训练
- 推理：两次 diffusion forward pass

**实现难度**：高（双 diffusion transformer）

**依赖项**：PyTorch + DiT 类 backbone

**推荐结论**：⚠️ 谨慎评估（几何/外观解耦思想可借鉴到 neural geometry processing；具体落地场景有限）

已传递给 @墨鱼丸。