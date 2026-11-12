---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 3DGS, 野外重建, 外观建模, 训练加速, PhotoTourism]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13808
---

# FastWild-GS: Minutes-Scale In-the-Wild Gaussian Splatting via Compact Per-Image Appearance Adaptation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FastWild-GS: Minutes-Scale In-the-Wild Gaussian Splatting via Compact Per-Image Appearance Adaptation |
| **作者** | Donghun Ryu*, Seokhyun Kim*, Minhyeok Lee |
| **单位** | Chung-Ang University, South Korea |
| **发表** | arXiv preprint (cs.CV), 2026-11-10（14 页, 6 图, 13 表） |
| **链接** | [原文](https://arxiv.org/abs/2611.13808) · [HTML全文](https://arxiv.org/html/2611.13808v1) |
| **DOI** | arXiv:2611.13808 |
| **代码** | 未在摘要页给出 |

---

## 核心贡献

> **野外 3DGS 慢的根因不是"外观建模难"，而是"外观差异被错误地算成了几何误差"——FastWild-GS 把每张图的外观压缩成 134 个参数，并让这个变换同时作用于训练损失和致密化评分。**

1. **紧凑逐图外观模块（134 参数/图）**：
   - **Photo Appearance Token (PAT)**：128 维可学习向量，吸收摄影者/时段特定外观
   - **逐通道变换**：对渲染图施加 log-scale + bias（6 参数），建模全局曝光/白平衡
   - **PAT Decoder**：小 MLP（2 隐层，宽 128，ReLU），从 [f_g, e_i, d_g,i] 预测 Gaussian 颜色，**替代球谐颜色**
2. **色彩匹配的致密化评分（Colour-Matched Densification Scoring）**：**把同一逐图变换应用到用于致密化/剪枝的评分渲染上**——不需要额外渲染，成本为零。这是本文最关键也最容易被忽视的工程洞见。
3. **与训练方法正交**：外观模块在**6 个公开 3DGS 骨干**上都提升 PSNR/SSIM/LPIPS（论文 Tab. 5）。

---

## 技术方案

### 核心思想

3DGS 用一份共享场景解释所有图像，野外场景中曝光/光照/瞬态物各不相同，标准做法是**平均掉**这些差异 → 几何与颜色互相污染。

FastWild-GS 的做法：
1. **外观进解码器**（PAT + per-Gaussian 特征 → MLP → 颜色）——处理**空间上不一致**的外观变化
2. **全局变换进图像**（exp(s)⊙R + b）——处理**全局一致**的曝光/白平衡，把它们移出解码器，让 PAT 只专注场景内差异

**关键洞察（致密化）**：FastGS 的致密化用"渲染与照片的误差"给 Gaussian 打分。但在照片集上，**误差在"只是曝光/颜色不同"的地方同样很高** → 会给已经重建好的表面**多加 Gaussian**。修正极简：把该视图的训练变换 `exp(s_j)⊙R_j + b_j` 施加到评分渲染上再算误差。**无梯度回流、不更新变换、不增加渲染次数。**

### 关键技术表

| 技术 | 说明 |
|------|------|
| **PAT（128 维）** | 零初始化，与 Gaussian 联合优化；外观只经 e_i 进入解码器 → 每图状态恒为 134 个数 |
| **PAT Decoder** | 2 隐层 × 宽 128 + ReLU + sigmoid；输入 [f_g(32维), e_i(128维), d_g,i]，方向**不做位置编码** |
| **逐通道变换** | `R̃_i = exp(s_i)⊙R_i + b_i`，s_i/b_i ∈ ℝ³；从恒等变换起步，每张训练渲染都用 Adam 优化 |
| **增长调度（Growth schedule）** | 只在致密化末期才降低阈值添加 Gaussian，使早期迭代成本低；另加 4 次剪枝步（6k/9k/12k 透明度重置前，以及 15k 致密化结束前） |
| **色彩匹配评分** | 评分渲染用**固定的 SfM 球谐颜色**（与照片外观无关），施加逐图变换后再算误差 |
| **深度先验正则** | Depth Anything 3 单目深度，对数域 smooth-L1 损失；对齐到 SfM 点尺度；权重早期 ramp-up、后半程降低 |
| **测试时适配** | 冻结 Gaussian/特征/MLP，仅拟合 e* + (s*, b*) + 径向增益 v（**共 137 参数**），512 步 Adam，在图像左半边拟合、右半边评测 |
| **径向增益（仅测试时）** | `G_c(x) = exp(tanh(v_c)·ρ̄(x))`，建模镜头暗角（vignetting）——全局变换表达不了的中心亮度衰减 |

---

## 公式

```math
% PAT Decoder 预测 Gaussian 在图像 i 中的颜色（替代球谐）
c_{g,i}=\sigma\big(\mathrm{MLP}([f_g,\,e_i,\,d_{g,i}])\big)
```

```math
% 逐通道变换（log-scale + bias），施加于光栅化之后
\tilde{R}_i=\exp(s_i)\odot R_i+b_i,\qquad s_i,b_i\in\mathbb{R}^3
```

```math
% 训练目标
\mathcal{L}
=0.6\,\mathcal{L}_{\text{photo}}(\tilde{R}_i,I_i)
+0.4\big(1-\mathrm{SSIM}(\tilde{R}_i,I_i)\big)
+\mathcal{L}_{\text{depth}}+10^{-4}\lVert e_i\rVert_2^2
```

```math
% 色彩匹配的致密化评分（本文核心修正）
\hat{R}_j=\exp(s_j)\odot R_j^{\text{SfM}}+b_j
% 误差在 \hat{R}_j 与照片 I_j 之间计算；
% 评分渲染不回传梯度、不更新 (s_j,b_j)、不增加渲染次数
```

```math
% 测试时径向增益（建模暗角）
\tilde{R}^{\ast}=\exp(s^{\ast})\odot\big(G\odot R^{\ast}\big)+b^{\ast},
\qquad
G_c(x)=\exp\big(\tanh(v_c)\,\bar{\rho}(x)\big)
% \bar{\rho}(x): 像素到图像中心的归一化平方距离（[-1,1] 坐标）减去其图内均值
```

---

## 代码片段

```python
# 外观模块：PAT + PAT Decoder + 逐通道变换
class PATDecoder(nn.Module):
    """从 [f_g, e_i, d_g] 预测 Gaussian 颜色，替代球谐。"""
    def __init__(self, feat_dim=32, pat_dim=128, hidden=128):
        super().__init__()
        self.mlp = nn.Sequential(
            nn.Linear(feat_dim + pat_dim + 3, hidden), nn.ReLU(),
            nn.Linear(hidden, hidden), nn.ReLU(),
            nn.Linear(hidden, 3), nn.Sigmoid(),   # 颜色在 [0,1]
        )
    def forward(self, f_g, e_i, d_g):
        return self.mlp(torch.cat([f_g, e_i, d_g], dim=-1))


def render_with_appearance(gaussians, pat_table, decoder, image_idx, view_dir):
    # e_i: 每图 128 维 PAT（零初始化）
    e_i = pat_table[image_idx]                       # (128,)
    # d_g: 从相机到 Gaussian 的单位方向（不做位置编码）
    d_g = (gaussians.xyz - camera_center)
    d_g = d_g / d_g.norm(dim=-1, keepdim=True)
    # 逐 Gaussian 颜色
    c_g = decoder(gaussians.feat, e_i[None, :].expand(gaussians.n, -1), d_g)
    # 光栅化后施加逐通道变换
    R = rasterize(gaussians, c_g)
    s, b = channel_transform[image_idx]              # 各 3 维
    return torch.exp(s) * R + b
```

```python
# 核心修正：色彩匹配的致密化评分
def score_for_densification(scene, train_views, channel_transform, sfm_colors):
    """
    用固定的 SfM 球谐颜色渲染（与照片外观无关），
    再施加该视图的逐图变换，使误差只反映几何差异。
    无梯度回流、不更新变换、不增加渲染次数。
    """
    scores = []
    for j in views:
        R_sfm = rasterize(scene, sfm_colors)          # 固定 SfM 颜色
        s_j, b_j = channel_transform[j]                # 复用训练时学到的变换
        R_hat = torch.exp(s_j) * R_sfm + b_j           # 施加变换
        scores.append(photometric_error(R_hat, photos[j]))
    return scores
    # 注意：这里的 s_j, b_j 是训练阶段优化出来的，直接复用，不重新拟合
```

```python
# 测试时适配：仅拟合 137 个参数
def test_time_adapt(scene, decoder, test_image, steps=512):
    """
    冻结 Gaussians / 特征 / MLP。
    在图像左半边拟合 e*, (s*, b*), 径向增益 v；右半边评测。
    """
    e_star   = torch.zeros(128, requires_grad=True)   # 128
    s_star   = torch.zeros(3,  requires_grad=True)   # 3
    b_star   = torch.zeros(3,  requires_grad=True)   # 3
    v_radial = torch.zeros(3,  requires_grad=True)   # 3  → 共 137
    opt = torch.optim.Adam([e_star, s_star, b_star, v_radial], lr=1e-2)

    for _ in range(steps):
        R = render(scene, decoder, e_star)
        # 径向增益建模暗角
        rho = normalized_sq_dist_from_center(test_image)      # 已减去图内均值
        G = torch.exp(torch.tanh(v_radial) * rho)
        R_tilde = torch.exp(s_star) * (G * R) + b_star
        loss = photometric_loss(R_tilde[..., :W//2], test_image[..., :W//2])  # 只用左半
        opt.zero_grad(); loss.backward(); opt.step()
    return e_star, (s_star, b_star), v_radial
```

```python
# 增长调度：让早期迭代便宜
def growth_schedule(step, densify_until=15000, opacity_reset_steps=(6000, 9000, 12000)):
    """只在致密化末期才降低阈值添加 Gaussian。"""
    lower_threshold_only_late = step > densify_until * 0.6
    # 4 次剪枝步：6k/9k/12k 透明度重置前 + 15k 致密化结束前
    prune = any(abs(step - s) < 100 for s in opacity_reset_steps) or step >= densify_until
    return lower_threshold_only_late, prune
```

---

## 实验结论

- **数据集**: PhotoTourism 三个标准场景（Brandenburg Gate / Sacré-Cœur / Trevi Fountain，官方测试 10/21/19 张）+ NeRF-OSR 四个场景（europa / lwp / st / stjohann）
- **协议**: NeRF-W **半图评测协议**——图像特定参数在左半边拟合，右半边算指标；NeRF-OSR 在官方 mask 内右半边计分
- **基线**: AsymGS、GS-W、K-Planes、gsplat、WildGaussians、RobustSplat/++、WilLaGS、Look at the Sky、3DGS-W、DAVIGS、MW-GS 等
- **结果**:
  - **PhotoTourism：8.8 分钟/场景训练**，LPIPS 为对比方法中最低
  - **比 LPIPS 次优的 AsymGS 快 23×**
  - **NeRF-OSR：9.7 分钟/场景**，平均 PSNR / SSIM / LPIPS **三项全部最优**
  - 训练硬件：**单张 NVIDIA RTX 5090**；30k 迭代，每迭代一张训练图
  - 最终模型用最后 100 个迭代的参数平均（28k→29,980，每 20 步取一次）
  - **Tab. 5：外观模块在 6 个公开 3DGS 骨干上都提升 PSNR/SSIM/LPIPS**——证明该模块与训练方法**正交**
  - 消融（Tab. 9）比较了"用 PAT Decoder 给评分渲染上色" vs "用 SfM 颜色 + 逐图变换"，后者更优

---

## 局限性

- **每图 134 参数**的存储在超大照片集上仍有开销（相对 SH 系数少，但不是零成本）
- **只建模全局外观**（PAT + 通道变换 + 暗角），对**局部**外观变化（同一图内不同区域的不同曝光、镜头 flare、局部阴影）表达有限
- **测试时需 512 步 Adam 适配**每张测试图——不是真正"零成本"推理
- 依赖 **Depth Anything 3** 单目深度先验
- 遵循 NeRF-W 半图协议，**PSNR 数值不能与全图评测方法直接比较**
- 依赖 FastGS 的光栅化器与致密化实现
- 未报告内存占用与超大场景（>1000 图）的扩展性

---

## 相关工作

- [[2026-11-01_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]] — 3DGS 排序优化
- [[2026-11-09_SM-Level-Load-Imbalance-3DGS-Persistent-Kernel-Scheduling]] — 3DGS GPU 调度
- [[2026-11-03_AbacusGS-Gaussian-Splatting-Without-Per-Splat-Sorting]] — 同上
- [[2026-11-11_FastGRT-Vulkan-Gaussian-Ray-Tracing]] — Vulkan 高斯光线追踪
- [[2026-11-05_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]] — 同上
- [[2026-07-07_NeRF-W-Per-Image-Appearance-Embedding]] — NeRF-W 半图协议与逐图外观

---

## 实现建议

- **实现难度**: **低-中**（核心只有三件事：PAT + 小 MLP + 6 参数变换；难点在于发现并修正致密化评分——这是 10 行代码但影响巨大）
- **预期性能**:
  - 训练：**8.8–9.7 分钟/场景**（RTX 5090），比 AsymGS 快 23×
  - 质量：PhotoTourism LPIPS 最优；NeRF-OSR 三项指标全优
  - 额外存储：134 参数/图
- **适用场景**:
  - ✅ **互联网照片集合的 3D 重建**（旅游地标、众包照片）
  - ✅ **需要分钟级而非小时级训练的生产管线**
  - ✅ **可即插即用到任何 3DGS 骨干**（已验证 6 个）
  - ❌ 不适合单视角/一致性光照的常规采集（那种情况用普通 3DGS 更快）
- **对墨鱼丸的建议**: **立即可摘的一条工程经验**——在野外场景的任何 3DGS 实现中，**致密化/剪枝的打分渲染必须先施加该图的全局外观变换**，否则几何会在错误的地方膨胀。这一条与 [[2026-11-09_SM-Level-Load-Imbalance-3DGS-Persistent-Kernel-Scheduling]] 一样属于"不改表示、不改 over 算子、零风险正交优化"。

---

## 与团队协作

- **可传递给 @墨鱼丸**: PAT Decoder 结构、色彩匹配致密化评分的具体做法、测试时 137 参数适配流程
- **可反馈 @吊龙（后端）**: 逐图外观状态（PAT + 变换）的存储与查询接口设计
