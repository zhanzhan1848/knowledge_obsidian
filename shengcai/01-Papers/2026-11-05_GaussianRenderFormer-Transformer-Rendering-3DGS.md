---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 3D高斯泼溅, Transformer, 神经渲染, 无光栅化, 可学习渲染器, 光线追踪, TMLR, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.05593
---

# GaussianRenderFormer: 用 Transformer 替代光栅器渲染 3D 高斯

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GaussianRenderFormer: Transformer-based Rendering of 3D Gaussian Splats |
| **作者** | Shahaf Valencia Levy, Sagie Benaim（Technion / Hebrew University of Jerusalem） |
| **发表** | arXiv 2026-11-03（cs.CV / cs.GR），**TMLR 审稿中**，32 页 |
| **链接** | [原文](https://arxiv.org/abs/2611.05593) · [HTML](https://arxiv.org/html/2611.05593v1) · [项目页](https://svlwoof.github.io/gaussianrenderformer) |
| **DOI** | — |
| **代码** | ✅ 已公开：代码、训练模型、视频均在项目页 |

---

## 核心贡献

> **可行性研究**：一个 Transformer 能否在**完全没有光栅化器**的情况下直接渲染 3D 高斯？结论是「可以，但还差好几个 dB 且慢几百倍」——并且作者用扎实的诊断实验精确定位了瓶颈在**视图解码器**。

1. **高斯即 token**：每个 3D 高斯（14 个参数）嵌入为一个 token；**视图无关的场景编码器**让高斯之间交换信息（用其中心的 3D 旋转位置编码）。
2. **视图相关解码器**：图像切成 $4\times4$ 像素 patch，每个 patch 由相机射线方向构成 token，通过 cross-attention 关注场景 token，再由 DPT head 输出像素。
3. **投影足迹（projected footprint）显式告知解码器**：把每个高斯在图像中的 2×2 协方差（4 个数）通过零初始化线性层加到 cross-attention 的 **key** 上——**这是消融中贡献最大的一项（+1.4 dB @ 全尺度）**。
4. **详尽的瓶颈诊断**：证明差距**不是泛化问题**（训练集上同样差 5.9 dB），**不是剪枝造成的信息损失**（对自己的输入重打分仅高 0.3 dB），**不是欠训练被排除**（训练仍在改善，每翻倍步数 +0.9 dB），而是**视图解码器的表达瓶颈**。

---

## 技术方案

### 核心思想

沿用 **RenderFormer**（网格 → 图像的两阶段 Transformer）架构，改动两处：
1. **第一阶段**：token 从「三角形」变成「高斯」，输入层换成高斯参数嵌入
2. **第二阶段**：改变解码器「看场景」的方式，使其能处理**数万个半透明高斯**

**关键设计判断**：不告诉网络「哪些高斯覆盖了哪些像素、哪些可见、如何混合、结果颜色是什么」——这些**全部留给网络自己学**。论文明确写道："Nothing is computed per pixel."

### 关键技术

| 技术 | 说明 |
|------|------|
| **高斯 token 嵌入** | $\mathbf{g}_i=[\boldsymbol{\mu}_i(3),\mathbf{s}_i(3),\mathbf{q}_i(4),\mathbf{c}_i(3),o_i(1)]\in\mathbb{R}^{14}$；$\mathbf{t}_i=\mathbf{e}+\mathrm{RMSNorm}(\mathbf{A}\mathbf{g}_i+\mathbf{b})$，$\mathbf{A}\in\mathbb{R}^{768\times14}$ |
| **3D 旋转位置编码** | 场景编码器的自注意力用高斯**中心**的 3D RoPE（RenderFormer 用三角形顶点）；16 个 register token 放在高斯中心均值处 |
| **2D 旋转位置编码（投影位置）** | 把高斯中心投影到视图得到 $(u_i,v_i)$（以 patch 为单位），**keys 端**按 $(u_i,v_i)$ 做 2D RoPE，**query 端**按 patch 中心做同一编码 → patch-Gaussian 注意力取决于图像空间距离。每个注意力头每轴旋转 8 对通道，8 个频率 0.25–1.75 rad/patch，保留预训练 3D 编码不动 |
| **更小的 patch** | 从 RenderFormer 的 $8\times8$ 改为 $4\times4$（token 数 ×4，分辨细节更好）；为复用预训练射线嵌入，把 $4\times4$ 的 64 个射线方向用**最近邻插值**上采样到 $8\times8$ |
| **投影足迹（关键）** | $\bm{\Sigma}'_i=\mathbf{J}_i\bm{\Sigma}_i\mathbf{J}_i^\top+\frac{0.3}{p^2}\mathbf{I}$，$\mathbf{J}_i=\frac{f}{p z_i}\begin{pmatrix}1&0&-x_i/z_i\\0&-1&y_i/z_i\end{pmatrix}$（与 3DGS 光栅化前同一投影）；用 4 个数描述（两个标准差的对数 + $(\cos2\theta,\sin2\theta)$，各裁剪到 $[-6,6]$） |
| **足迹注入位置** | 每层解码器中一个**线性层**把 4 个数映射成向量，**加到高斯的 key** 上 → 只影响「关注哪些高斯」，不影响「从高斯读什么」。同时加到 values 上可再得 +0.7 dB，但**作者保留 key-only**（values 版对超出训练密度的输入更敏感） |
| **零初始化** | 足迹线性层零初始化 → 模型起始时与没有它**完全等价**；参数仅 23,040 |
| **四阶段训练** | ① 只训新输入层（RenderFormer 冻结）② 全模型 @256² ③ 开启三项改动，256² 短恢复 ④ 512² + LPIPS。AdamW，weight decay 0.01，batch 8 views × 8 GPU，lr $5\times10^{-5}$（阶段① $10^{-3}$），warmup 后余弦衰减 |
| **损失** | $\mathcal{L}=(1-\lambda)\mathcal{L}_1^w(\hat{\mathbf{I}},\log_{10}(1+\mathbf{I}))+\lambda\mathcal{L}_{\mathrm{LPIPS}}(10^{\hat{\mathbf{I}}}-1,\mathbf{I})$，$\lambda=0.5$；$\mathcal{L}_1^w$ 对物体像素权重 1、背景 0.05（物体只占画面几个百分点） |
| **数据增强** | 每个训练样本对物体与相机施加**同一随机旋转**（图像不变，但防止模型依赖固定朝向） |

---

## 公式

**高斯 token**：

```math
\mathbf{g}_{i}=\bigl[\,\bm{\mu}_{i},\;\mathbf{s}_{i},\;\mathbf{q}_{i},\;\mathbf{c}_{i},\;o_{i}\,\bigr]\in\mathbb{R}^{14},
\qquad
\mathbf{t}_{i}=\mathbf{e}+\mathrm{RMSNorm}(\mathbf{A}\mathbf{g}_{i}+\mathbf{b})
```

**投影位置（以 patch 为单位）**：

```math
u_{i}=\frac{1}{p}\Bigl(\frac{W}{2}+f\frac{x_{i}}{z_{i}}\Bigr),\qquad
v_{i}=\frac{1}{p}\Bigl(\frac{H}{2}-f\frac{y_{i}}{z_{i}}\Bigr)
```

**投影足迹（2×2 协方差）**：

```math
\bm{\Sigma}^{\prime}_{i}=\mathbf{J}_{i}\bm{\Sigma}_{i}\mathbf{J}_{i}^{\top}+\frac{0.3}{p^{2}}\mathbf{I},\qquad
\mathbf{J}_{i}=\frac{f}{p\,z_{i}}\begin{pmatrix}1&0&-x_{i}/z_{i}\\0&-1&y_{i}/z_{i}\end{pmatrix}
```

其中 $\bm{\Sigma}_i=\mathbf{R}_i\operatorname{diag}(\mathbf{s}_i)^2\mathbf{R}_i^\top$。

**训练损失**：

```math
\mathcal{L}=(1-\lambda)\,\mathcal{L}_{1}^{w}\bigl(\hat{\mathbf{I}},\log_{10}(1+\mathbf{I})\bigr)
+\lambda\,\mathcal{L}_{\mathrm{LPIPS}}\bigl(10^{\hat{\mathbf{I}}}-1,\mathbf{I}\bigr),\qquad\lambda=0.5
```

---

## 代码片段

```python
# 训练阶段（论文 Table 1）
Stage 1: 只训新的输入层（RenderFormer 其余冻结），lr = 1e-3
Stage 2: 全模型训练 @ 256×256
Stage 3: 开启 2D RoPE / 4×4 patch / 投影足迹，@ 256×256 短恢复
Stage 4: @ 512×512 + LPIPS 损失

# 优化器
AdamW(weight_decay=0.01), lr = 5e-5 (stage1: 1e-3)
batch = 8 views on 8 GPUs, warmup 后 cosine decay

# 评测协议
512×512, FOV 45°, 相机距离 1.15 / 1.7 / 2.45
指标在 evaluation crop 上计算（参考图中最亮 >0.02 的区域方框 + 12 px margin，resize 到 512×512）
另报 masked PSNR（full splat 不透明度 >0.5 的像素）
LPIPS 用 AlexNet backbone（训练损失用 VGG）
```

---

## 实验结论

- **数据集**: **Objaverse_Splats**（ShapeSplats 子集，每个对象一个训练好的 3DGS splat）
  - 筛选条件：ShapeSplat 元数据判定拟合良好，**PSNR ≥ 32 dB 且 LPIPS ≤ 0.06**，恰有 50,000 高斯；剔除退化/近透明对象（最大不透明度 < 0.4）
  - 最终：**26,820 训练 / 1,806 验证 / 300 测试（从未用于开发）**
  - 每对象剪枝到 **20,000 高斯**作为模型输入
- **基线**:
  - **gsplat 光栅化完整未剪枝 splat**（模型要复现的目标）
  - **gsplat 光栅化剪枝后的 20K 输入**（模型输入的「真值」）
  - 参照：LVSM 32.36 dB、GS-LRM 30.52 dB（Google Scanned Objects，512 px，4 输入图，非直接可比）
- **关键结果**:
  - **主结果**：300 个全新留出对象，28 个视角 → **GaussianRenderFormer 38.08 dB**，光栅化同一剪枝输入 **44.02 dB** → **差距 5.94 dB**
  - 差距随相机距离变化：**1.15 处 3.9 dB，1.7 处 6.8 dB**
  - Masked PSNR：两者均低约 5 dB，差距相当
  - **不是泛化问题**：开发留出集同样 38.02 dB；300 个训练对象上仅高 0.17 dB
  - **不是剪枝的信息损失**：对自己的输入重打分仅高 0.3 dB → **错误在于渲染它已有的输入**
  - **不是欠训练（未排除）**：训练仍在改善，每翻倍步数 +0.9 dB（94K→375K），最终训练结束时仍在提升
  - **速度**：单张 L40S 上单视角 **275 ms**（场景编码器 151 ms + 视图解码器 124 ms）；编码器**每对象只跑一次**，后续每视角约 +135 ms；gsplat **< 1 ms**
  - **显存/参数**：195M 参数（编码器 113M + 解码器 82M）
- **消融**（1,000 对象 harness；同配方换种子差 0.02–0.10 dB，故几十分之一 dB 的差异有意义）:
  - **去掉投影足迹：−1.7 dB**（300 个对象中 299 个变差）
  - **去掉 2D 嵌入：−5.2 dB**
  - **用 8×8 而非 4×4 patch：−3.0 dB**
  - 足迹同时加到 values：harness 上再 **+0.7 dB**（但作者保留 key-only，因其对超密度输入更稳）
  - 去掉 gsplat 的 0.3 像素各向同性项：仅 **−0.08 dB** → 收益不来自光栅化约定
  - 按 tile 分箱限制 cross-attention：仅 +0.2 dB 且省不了多少时间 → 保留密集注意力
  - **第一阶段只训输入层比从头训全模型高 3.1 dB**；提高输入层 lr 不能解释（反而差 0.55 dB）；从随机权重重训**未找到可行配方**（塌缩成全黑）
- **超出训练设置**（30 个留出对象）:
  - 256 / 1024 分辨率 → 降到约 33 dB（光栅化也掉约 4 dB，模型掉约 6）
  - 相机距离远于训练 → 崩坏，**24.09 dB**
  - 视场角 35° → −1.1 dB，60° → −1.2 dB（光栅化不受影响）
  - 输入 40,000 高斯 → **模型 −3.1 dB**（光栅化 +4.6 dB）
- **相机路径**：沿 96 帧平滑轨道渲染，**38.52 dB/帧**，30 个留出对象平均，**视频无闪烁**
- **真实采集**：Mip-NeRF 360 的 4 个真实场景区域，最多 160,000 高斯；20,000 高斯时比光栅化低 **1.6–4.7 dB**；高斯更多时光栅化更好、模型更差

---

## 局限性

- **质量与速度都不够**：比光栅化低数个 dB，**慢数百倍**，显存占用大得多；时间与内存随输入快速增长
- **过拟合训练相机配置**：单一配置（512×512、45° FOV、距离 1.15–2.45）训练 → 换分辨率/FOV/距离即掉 1–6 dB
- **对输入密度敏感**：40K 高斯（训练只见 20K）时反而变差
- **误差集中在边缘与高频**：参考图中最强边缘的 10% 像素占了模型 71% 的平方误差；高频段既模糊又添加参考图中没有的细节（>1/4 cycles/px 复现参考内容 85% vs 光栅化 93%）
- **混合像素处差距最大**：单个像素需混合 32 个以上高斯处差距最大
- **尚不支持材质参数与光源** → 无法学习重光照与全局光照（论文明确列为未来工作）
- **对象级可行性研究**：真实场景只做到「区域」而非全场景

---

## 相关工作

- [[RenderFormer]]
- [[Gaussian-Splatting]] — Kerbl et al. 2023（投影与低通滤波约定）
- [[gsplat]] — Ye et al. 2025（0.3 像素低通滤波）
- [[LVSM]] — Jin et al. 2025
- [[GS-LRM]] — Zhang et al. 2024
- [[NeRF]]
- [[Gaussian-Light-Transport-13D-Gaussian-GI]]

---

## 实现建议

- **实现难度**: **高**（需要 Transformer 渲染框架、3D/2D 旋转位置编码的改造、四阶段训练流程、1327 GPU-hours 的训练成本）
- **预期性能**: 质量比光栅化低 ~6 dB，慢 ~275×/视角（L40S），195M 参数
- **适用场景**:
  - ✅ **学习式渲染器的可行性研究与基线**（论文自述定位）
  - ✅ 无光栅化可微渲染的研究价值（如需对渲染器本身求导）
  - ✅ 可作为「学习渲染器」路线的**量化基线**：本文提供了非常诚实的评估协议与诊断方法
  - ❌ 生产级实时渲染（慢数百倍）
  - ❌ 需要全局光照/重光照
- **落地建议（可借鉴的通用技巧）**:
  1. **显式告知几何足迹**是本文最大工程洞察：仅 23,040 个参数、零初始化，就换来 +1.4~1.7 dB。**任何「让网络自己推断几何量」的场景都值得试这一招**——把本可解析计算的低阶量直接喂给网络，是极高性价比的优化
  2. **2D 投影位置 RoPE**（−5.2 dB 去掉它）比 3D 位置编码更关键：**注意力必须感知「在图像中的位置」**而非仅「在空间中的位置」
  3. **先只训新输入层再训全模型**（+3.1 dB）——迁移学习时的分阶段训练是必要步骤，不是可有可无
  4. **更小的 patch**（8×8→4×4，+3.0 dB）在渲染任务中非常关键，且可用最近邻上采样射线方向低成本复用预训练嵌入
  5. **诚实的诊断框架值得抄**：分别排除「泛化」「输入信息损失」「欠训练」三种解释，用「对自己的输入重打分」这一招把「学习渲染失败」与「输入不足」彻底分开
