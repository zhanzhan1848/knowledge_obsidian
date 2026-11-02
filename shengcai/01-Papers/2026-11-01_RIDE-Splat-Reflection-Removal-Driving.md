---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 神经渲染, Gaussian-Splatting, 反射去除, 自动驾驶, 光传输, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.34632
---

# RIDE-Splat: Reflection Removal for In-the-Wild Driving Environments

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RIDE-Splat: Reflection Removal for In-the-Wild Driving Environments |
| **作者** | Kevin David Hayes, Alex Hanson, Allen Tu, Pranav Asthana, Matthias Zwicker, Tom Goldstein（NVIDIA 等） |
| **发表** | arXiv preprint 2026-10-25（cs.CV / cs.AI） |
| **链接** | [原文](https://arxiv.org/abs/2610.34632) · [HTML](https://arxiv.org/html/2610.34632v1) |
| **DOI** | 10.48550/arXiv.2610.34632（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 挡风玻璃后拍摄的驾驶视频**违反了 3DGS 假设的世界空间一致性**：路面场景有视差，而**座舱反射始终附着在相机上**。标准 3DGS 会把反射内容**烘焙进重建的场景**里。RIDE-Splat 在**无干净图像、无反射掩码、无预训练网络**的条件下，完成反射无关的 3D 重建。

1. **物理化的场景分解**：把挡风玻璃的**世界一致透射**分配给 3DGS 场景，把**相机附着的反射**分配给**一张共享的、带符号（signed）的 RGB 图像**。这个建模是关键——它把「反射」与「透射」分给了两个符合其几何本质的载体。
2. **两遍式重建（two-pass）**：
   - 第一遍：同时学习 3D 几何 **和** 带符号反射图（同时表示「附加辐射」与「透射衰减」）
   - 第二遍：用**去反射后的训练图像**拟合一个**纯净的 3DGS 模型**
3. **推理期零开销**：推理时**丢弃反射图**，保留标准 3DGS 渲染路径 → 不改变部署管线。
4. **新数据集 RIDE-Splat Dataset**：**首个**面向驾驶视频反射去除的 3D 重建基准 —— 包含真实驾驶场景、训练视图中的**物理挡风玻璃反射**，以及**单独采集的非反射评测图像**。
5. **结果**：在 RIDE-Splat Dataset、XLD、Wayve 上，**九项聚合指标全面超越** 3DGS、DC-Gaussian、RobustSplat；PSNR 最高提升 **3.59 dB**，LPIPS 最多降低 **0.0876**；42 组逐场景对比中 **38 组**取得最高指标。

---

## 技术方案

### 核心思想

这是**「图像形成模型」驱动**的重建方法，而不是「用网络去学」。核心观察是反射的**几何归属**：

| 成分 | 几何属性 | 应归属的载体 |
|------|---------|------------|
| 路面 / 场景内容 | **世界一致**（有视差，随相机位姿变化） | 3DGS 场景（3D 高斯） |
| 座舱 / 挡风玻璃反射 | **相机附着**（随相机平移，无视差） | 单张共享 2D 图像 |

观测图像的成像模型（结构化形式化）：

```math
I_v(x) = \underbrace{T(x)\cdot C_v(x)}_{\text{透射的场景内容}}
\;+\; \underbrace{R(x)}_{\text{相机附着的反射}}
```

- $C_v(x)$：第 $v$ 视图经 3DGS 渲染的场景内容
- $T(x)$：挡风玻璃的**透射率**（标量或逐通道），作用于场景内容
- $R(x)$：**共享的**带符号 RGB 图像，**与视图无关**（因为反射来自相机本身）

「带符号」（signed）的含义：$R$ 可以取负值 —— 反射可能是**扣除**了本应出现在场景中的内容（镜面反射处看到的其实是座舱，而不是透过玻璃看到的）。用带符号表示比用 `[0,1]` 的普通图像更精确。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Signed shared reflection image** | 共享的、可负的 2D 图像，承载相机附着反射 |
| **透射率 $T$** | 作用于场景内容的逐像素衰减项 |
| **两遍重建** | 遍一：几何 + 反射图联合学习；遍二：用去反射图像拟合纯净 3DGS |
| **去反射训练图像** | 遍一输出后渲染出「去除反射」的图像，作为遍二的训练目标 |
| **推理期丢弃反射图** | 保持标准 3DGS 渲染路径，零部署成本 |
| **RIDE-Splat Dataset** | 首个驾驶视频反射去除的 3D 重建基准 |
| **免预训练网络** | 不依赖 Clean-Whip / CleanWarp 等反射去除预训练模型 |

### 公式

观测成像模型：

```math
I_v(x) = T(x)\odot C_v(x) + R(x)
```

其中 $\odot$ 为逐元素（Hadamard）乘。**共享**是关键：$R(x)$ 不依赖 $v$。

透射率的建模（基于 3DGS 的渲染深度/不透明度一致性）：反射区域的特征不随视差变化，因此可以从「跨视图不一致性」中分离出 $T$ 与 $R$。

两遍优化的目标（遍一，联合学习几何与反射）：

```math
\min_{\theta_{\mathrm{GS}},\, R,\, T}\;
\sum_{v} \Big\| I_v - \big(T \odot \mathcal{R}(\mathcal{G}_{\theta_{\mathrm{GS}}}, v) + R\big) \Big\|_2^2
\;+\; \lambda_{\mathrm{reg}} \big\|R\big\|_1
```

$\lambda_{\mathrm{reg}}\|R\|_1$ 是反射图的稀疏正则 —— 反射在空间上稀疏（只有玻璃上反射到的区域才有反射）。

遍二（用去反射图像拟合纯净 3DGS）：

```math
I^{\mathrm{clean}}_v(x) = I_v(x) - R(x),
\qquad
\min_{\tilde\theta_{\mathrm{GS}}}\;
\sum_v \Big\| I^{\mathrm{clean}}_v - \mathcal{R}(\mathcal{G}_{\tilde\theta_{\mathrm{GS}}}, v) \Big\|_2^2
```

### 代码片段

```python
# 概念级伪代码：带符号共享反射图的两遍重建
def ride_splat_pass1(images, poses):
    """遍一：联合学习 3DGS 几何 + 共享带符号反射图 + 透射率"""
    gaussians = init_gaussians(images, poses)
    R = torch.zeros(H, W, 3, requires_grad=True)   # 共享的带符号反射图（可负）
    T = torch.ones(H, W, 3, requires_grad=True)    # 挡风玻璃透射率

    for it in range(N1):
        C = render(gaussians, poses)                # 世界一致的场景内容
        recon = T * C + R                          # 成像模型：透射 + 反射
        loss = photometric(recon, images)
        loss += lam_reg * R.abs().sum()            # 反射稀疏正则
        # + 跨视图一致性正则：R 不应随视图变化
        loss += lam_cons * multiview_inconsistency(R, images)
        step(loss, [gaussians, R, T])
    return gaussians, R, T

def ride_splat_pass2(images, poses, R):
    """遍二：用去反射图像拟合纯净 3DGS（保持标准渲染路径）"""
    clean = images - R.unsqueeze(0)                # 去除反射（带符号减法）
    gaussians = train_3dgs(clean, poses)          # 标准 3DGS 训练流程
    return gaussians                                # 推理时无需 R
```

---

## 实验结论

- **数据集**：
  - **RIDE-Splat Dataset**（本文提出，首个驾驶视频反射去除 3D 重建基准）：真实驾驶场景、训练视图含物理挡风玻璃反射、**单独采集的非反射评测图像**
  - **XLD**、**Wayve**（公开驾驶数据集）
- **基线**：**3DGS**、**DC-Gaussian**、**RobustSplat**
- **结果**：
  - 在 **9 项聚合指标上全部超越**三个基线
  - **PSNR 最高提升 3.59 dB**
  - **LPIPS 最多降低 0.0876**
  - **42 组逐场景对比中 38 组**取得最高指标
  - 成功去除基线中**依然可见**的挡风玻璃反射，同时保留透过玻璃的场景内容

---

## 局限性

1. **假设反射为「相机附着」**：只处理相机刚性附着反射（座舱、挡风玻璃）。**动态反射**（其他车辆、行人的反射）、**非刚性变形**的反射不适用
2. **需要相机位姿（posed video）**：论文明确说明输入是 **posed** 驾驶视频 —— 不适用于无位姿的场景
3. **反射图是单一共享 2D 图像**：意味着反射被假设为**不随视角变化**。若相机有变焦或位姿显著变化（基线变化），单张反射图可能不足
4. **两遍训练的开销**：需要跑两遍优化，总训练时间高于标准 3DGS（摘要未给出训练时间）
5. **「共享反射」的潜在退化**：优化中 $R$ 可能吸收部分**世界一致**的场景内容（两者在数学上部分可互换），论文依赖正则与多视图一致性抑制，但摘要未给出消融分析
6. **对挡风玻璃的特定假设**：透射率 $T$ 是逐像素的 2D 场，未建模玻璃的曲面折射/色散

---

## 相关工作

- [[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]] — 同样是「驾驶/机器人场景 + 3DGS + 相机物理效应」方向
- [[2026-11-01_RxGS-Relightable-Gaussian-Stylization]] — 反射相关（2026-10-26 已收录）
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] — 显式处理 3DGS 场景中的物理光传输
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 全局光照前馈
- [[DC-Gaussian]] / [[RobustSplat]] — 直接对比的基线
- [[Gaussian-Splatting]] / [[Image-Formation-Model]] — 基础技术

---

## 实现建议

- **实现难度**：**中**。不需要新算子，主要是**重建管线的重构**：(a) 在 3DGS 训练循环中加入共享反射图 $R$ 与透射率 $T$ 两个参数组；(b) 跨视图一致性正则；(c) 两遍训练的调度；(d) 数据集构造（物理挡风玻璃反射 + 单独采集的无反射图像）。
- **预期性能**：PSNR +3.59 dB（最高）、LPIPS -0.0876（最多），9 项聚合指标全胜。
- **适用场景**：
  - ✅ **自动驾驶 / 机器人**的真实数据采集场景（挡风玻璃反射是常态）
  - ✅ 任何「相机存在固定光学污染物/反射面」的采集链路
  - ✅ 需要零推理开销的场景（反射图只在训练期存在）
  - ❌ 不适用于动态反射、无位姿输入、有变焦/基线变化的采集
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 虽然问题域窄（驾驶场景），但方法论非常干净：**用「几何归属」来分解成像模型**（世界一致的 → 3D，相机附着的 → 2D）。这个思路可以直接迁移到：镜头畸变、镜头污渍、挡风玻璃雨滴、传感器卷帘快门等一切「相机侧效应」。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.34632
- HTML 全文：https://arxiv.org/html/2610.34632v1
- PDF：https://arxiv.org/pdf/2610.34632
