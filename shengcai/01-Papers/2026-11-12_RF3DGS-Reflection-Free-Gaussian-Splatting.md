---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 3DGS, 反射去除, 自监督, 多视角, Unity基准]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13772
---

# RF3DGS: Reflection-Free 3D Gaussian Splatting with Self-Priors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RF3DGS: Reflection-Free 3D Gaussian Splatting with Self-Priors |
| **作者** | Qiang Wen*, Guotao Meng*, Junhong Ruan*, Hongyu Liu, Chenyang Lei, Qifeng Chen |
| **单位** | 香港科技大学 / 华为研究院 |
| **发表** | arXiv preprint (cs.CV), 2026-11-10（10 页, 7 图, 5 表） |
| **链接** | [原文](https://arxiv.org/abs/2611.13772) · [HTML全文](https://arxiv.org/html/2611.13772v1) |
| **DOI** | arXiv:2611.13772 |
| **代码** | 论文未给出链接 |

---

## 核心贡献

> **反射去除的经典先验是"多视图中同一 3D 点的最低像素强度 ≈ 无反射信息"——把它推广到 3DGS 的难点在于：这个"最低强度"必须在 3D 空间里取，而不是在 2D 图像里取。RF3DGS 用几何先验 + 3D 扭曲把它做成了自监督信号。**

1. **3D 自先验构造无反射伪标签**：先用几何先验优化 vanilla 3DGS 得到**粗略无反射深度图**，再结合光度先验，通过 **3D 扭曲（3D warping）**从辅助视角聚合无反射信息，为参考视角构造**干净的透射伪标签（transmission pseudo-label）**。
2. **Adaptive Twin Rendering (ATR) 损失**：协同利用伪标签（低频/结构正确）与原始退化图像（高频细节保留）——两者互补而非二选一。
3. **首个 3D 反射去除基准**：基于 **Unity 渲染引擎**构建，支持严格的定量评测。

---

## 技术方案

### 核心思想

**2D 反射去除的老先验**：对同一 3D 点的多视图观测，取**最低像素强度**——因为反射是叠加的"加性"干扰，最暗的那次观测最接近真实透射信号。

**推广到 3DGS 的非平凡之处**：
- 3DGS 没有显式的多视图对应关系
- 需要先确定"同一 3D 点"在哪些视角、哪些像素上可见
- 需要**无反射的深度**才能做扭曲对齐

**RF3DGS 的三步**：
1. **几何先验 → 粗无反射深度**：用几何先验优化 vanilla 3DGS，逐视角估计粗略的无反射深度图
2. **3D 扭曲 → 伪标签**：用这些深度图 + 光度先验，把辅助视角中的无反射信息扭曲（warp）到参考视角，构造透射伪标签
3. **ATR 损失**：伪标签提供自监督信号（结构/低频正确），原始退化图提供高频细节 → 两者协同

### 关键技术表

| 技术 | 说明 |
|------|------|
| **几何先验初始化** | 用几何一致性先验优化 vanilla 3DGS → 得逐视角粗无反射深度图 |
| **光度先验** | "同一 3D 点跨视图的最低像素强度与无反射信息强相关" |
| **3D 扭曲聚合** | 用深度图把辅助视角的像素扭曲到参考视角，跨视角聚合无反射信息 |
| **透射伪标签** | 扭曲聚合的结果 → 自监督信号（无需人工标注） |
| **ATR 损失（Adaptive Twin Rendering）** | 伪标签（保结构/低频）+ 原图（保高频细节）协同优化 |
| **Unity 反射基准** | 首个 3D 反射去除基准，基于 Unity 渲染引擎，可控地合成有/无反射对照 |

---

## 公式

```math
% 光度先验（2D 反射去除的经典原则，推广到 3D）
% 对同一 3D 点 p 在多视图中的观测，取最低强度者作为"无反射"估计
I_{ref}(p)=\min_{v\in\mathcal{V}(p)} I_v(\pi_v(p))
```

```math
% 3D 扭曲：用深度图把辅助视角 v 的像素投到参考视角 r
\mathbf{x}_r \leftarrow \pi_r\!\left(\pi_v^{-1}(\mathbf{x}_v,\ D_v(\mathbf{x}_v))\right)
```

```math
% 无反射伪标签构造（跨视角聚合）
\hat{L}_{ref}(\mathbf{x}_r)
=\frac{\sum_{v\in\mathcal{V}} w_v(\mathbf{x}_r)\cdot \mathbb{1}\!\big[I_v(\pi_v^{-1}(\mathbf{x}_r)) \le I_{ref}\big]\cdot I_v(\pi_v^{-1}(\mathbf{x}_r))}
       {\sum_{v\in\mathcal{V}} w_v(\mathbf{x}_r)\cdot \mathbb{1}\!\big[I_v(\pi_v^{-1}(\mathbf{x}_r)) \le I_{ref}\big] + \varepsilon}
% w_v: 由扭曲后的可见性/距离/角度置信度加权
```

```math
% ATR 损失：伪标签（结构）+ 原图（高频）双分支
\mathcal{L}_{ATR}
=\underbrace{\lambda_{p}\,\big\|M(\mathbf{x})\odot\big(\hat{C}-\hat{L}\big)\big\|_1}_{\text{伪标签分支：结构 / 低频}}
+\underbrace{\lambda_{h}\,\big\|\big(1-M(\mathbf{x})\big)\odot\big(\hat{C}-I\big)\big\|_1}_{\text{原图分支：高频细节}}
% M(x): 平滑遮罩，控制两分支的空间分工
```

```math
% 深度先验约束（几何先验阶段）
\mathcal{L}_{geo}=\sum_{v}\big\|D_v-\hat{D}^{prior}_v\big\|_1
% 用于在有反射干扰下稳定估计"粗略无反射深度"
```

---

## 代码片段

```python
# 步骤 1：几何先验 → 粗无反射深度
def estimate_coarse_reflection_free_depth(scene, images, geo_prior):
    """
    用几何先验优化 vanilla 3DGS，得到逐视角粗略无反射深度图。
    这是后续 3D 扭曲对齐的前提。
    """
    opt = Adam(scene.optimizer_params(), lr=1e-3)
    for it in range(num_iters):
        for v in views:
            img, depth, normal = render(scene, v)
            loss_geo = F.l1_loss(depth, geo_prior.depth[v]) \
                     + F.l1_loss(normal, geo_prior.normal[v])
            loss_rgb = F.l1_loss(img, images[v])     # 弱 RGB 监督
            loss = loss_geo + 0.1 * loss_rgb
            opt.zero_grad(); loss.backward(); opt.step()
    return {v: render(scene, v).depth for v in views}
```

```python
# 步骤 2：3D 扭曲聚合 → 无反射透射伪标签
def build_transmission_pseudo_label(ref_view, aux_views, images, depths):
    """
    对参考视角每个像素 x_r：
      - 把辅助视角像素按深度扭曲到参考视角
      - 用光度先验（最低强度 ≈ 无反射）筛选
      - 加权聚合得到伪标签
    """
    H, W = images[ref_view].shape[:2]
    pseudo = torch.zeros(H, W, 3)
    weight = torch.zeros(H, W, 1)
    for v in aux_views:
        # 辅助视角像素 → 世界坐标 → 参考视角像素
        x_world = backproject(depths[v], images[v], K_v, pose_v)
        x_r, z = project(x_world, K_ref, pose_ref)
        valid = in_bounds(x_r, z)
        # 扭曲采样辅助视角的颜色
        c_v = sample(images[v], x_r)
        # 光度先验：强度最低者最接近无反射
        w = valid.float() * visibility_conf(x_r, z)
        pseudo = scatter_add(pseudo, x_r, c_v * w)
        weight = scatter_add(weight, x_r, w)
    pseudo = pseudo / (weight + 1e-8)
    return pseudo, weight
```

```python
# 步骤 3：ATR 损失 —— 伪标签与原图协同
def atr_loss(render_img, pseudo_label, raw_img, mask, lam_p=1.0, lam_h=1.0):
    """
    伪标签分支：保结构 / 低频正确
    原图分支：保高频细节（伪标签在高频不可靠）
    M: 平滑遮罩，控制两分支的空间分工
    """
    # 低通提取：伪标签只用于低频/结构
    low_render = gaussian_blur(render_img, sigma=2.0)
    low_pseudo = gaussian_blur(pseudo_label, sigma=2.0)
    loss_p = (mask * (low_render - low_pseudo).abs()).mean()

    # 高频：伪标签不提供，用原图
    high_render = render_img - gaussian_blur(render_img, sigma=1.0)
    high_raw = raw_img - gaussian_blur(raw_img, sigma=1.0)
    loss_h = ((1 - mask) * (high_render - high_raw).abs()).mean()

    return lam_p * loss_p + lam_h * loss_h
```

```python
# Unity 基准：可控地生成有/无反射对照
# 同一场景、同一相机位姿，仅切换反射层开关 → 严格配对的 ground truth
def make_benchmark_pair(scene_path, cam_pose):
    clean = render_unity(scene_path, cam_pose, reflections=False)
    dirty = render_unity(scene_path, cam_pose, reflections=True)
    return clean, dirty     # 逐像素严格配对
```

---

## 实验结论

- **数据集**: 合成场景 + 真实场景；**新建首个 3D 反射去除基准（基于 Unity 引擎）**
- **基线**: 未在摘要层列出具体对比方法
- **结果**:
  - **在合成与真实场景上均达到 SOTA 的 3D 反射去除性能**
  - 基准本身是重要产出：Unity 引擎可逐像素严格配对地生成"有反射/无反射"对照，解决了该领域长期缺乏定量基准的问题
  - 论文 10 页 / 7 图 / 5 表，属于完整会议论文体量

---

## 局限性

- **依赖几何先验**——第一步要先优化出可靠的粗无反射深度，几何先验不准会传导到伪标签
- **伪标签是自监督的**，其质量上限受光度先验与可见性假设限制；镜面材质强反射面可能违反"最低强度 ≈ 透射"的假设
- **Unity 基准是合成域**——合成反射与真实相机反射（镜头flare、传感器bloom）不完全等价
- 未报告渲染性能（这是离线重建任务，非实时）
- 未覆盖**动态场景**与**非朗伯反射材质**（金属、镜面）
- 无代码公开

---

## 相关工作

- [[2026-11-01_RIDE-Splat-Reflection-Removal-Driving]] — 驾驶场景反射去除
- [[2026-11-10_HaloRT_Real-Time-Volumetric-Light-Transport-Inference-without-a-Path]] — 光传输推断
- [[2026-05-19_LumiTex-PBR-Diffusion]] — 材质
- [[2026-11-05_RelightFormer-Feedforward-Multiview-Relighting]] — 重光照
- [[2026-07-07_RawNeRF-Noisy-RAW-GT]] — RAW 域
- [[2026-10-27_GraftRay-Path-Tracing-Mesh-Insertion-GS]] — 路径追踪 + GS 融合

---

## 实现建议

- **实现难度**: **中-高**（几何先验优化 + 3D 扭曲 + 扭曲后可见性/置信度加权 + ATR 损失，设计链条长）
- **预期性能**: SOTA 级别 3D 反射去除（合成 + 真实）；离线重建，无实时要求
- **适用场景**:
  - ✅ **博物馆/展厅的数字孪生**（论文明确点出的应用动机）
  - ✅ **玻璃幕墙、镜面装饰的建筑/室内扫描**
  - ✅ **无人驾驶模拟器的传感器反射模拟**
  - ❌ 不适合实时渲染路径
- **对墨鱼丸的建议**: **Unity 基准的构造方式值得单独借鉴**——在同一场景、同一相机位姿下仅切换反射层开关，得到**逐像素严格配对**的有反射/无反射对照。这是构造任何"退化算子"基准（噪声、模糊、压缩、反射）的通用套路，工程成本低但价值高。

---

## 与团队协作

- **可传递给 @墨鱼丸**: 3D 扭曲聚合的可见性加权实现、ATR 双分支损失、Unity 配对基准构造
- **可反馈 @吊龙（后端）**: 伪标签生成的离线任务可作为资产预处理服务
