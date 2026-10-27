---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, 渲染, 4D高斯泼溅, 动态场景, 贝塞尔样条, 运动建模, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.35224
---

# GaussianSpline: Adaptive Bézier Splines for Highly Dynamic 4D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GaussianSpline: Adaptive Bézier Splines for Highly Dynamic 4D Gaussian Splatting |
| **作者** | Tom Yachil, Andrei Sharf（Ben-Gurion University of the Negev, 以色列） |
| **发表** | arXiv preprint 2026-10-26（cs.GR，8 页 + 4 图） |
| **链接** | [原文](https://arxiv.org/abs/2610.35224) · [HTML](https://arxiv.org/html/2610.35224v1) |
| **DOI** | 10.48550/arXiv.2610.35224（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 每个 Gaussian 拥有一条**可学习的非均匀分段三次贝塞尔轨迹**：控制点与**时间分段位置**联合优化。运动快的区域自动获得更细的时间分辨率，运动慢的区域保持紧凑。段间用**基于反射的 G¹ 连续性约束**（方向锁定 + 可学习幅值缩放）保证平滑且完全可微。

1. **可学习的自适应时间参数化**：段宽以 logit $w_k$ 参数化，经 softmax 归一化后单调划分 $[0,1]$，与控制点、关节位置**联合优化**。
2. **反射式 G¹ 连续性约束**：$C_{k,0}=J_k+\lambda_k\big(J_k-C_{k-1,1}\big)$，$\lambda_k>0$ 可学习 —— 保持切线方向连续但允许速度幅值变化，兼顾平滑与局部灵活性（比 C¹ 更松，比 C⁰ 更平滑）。
3. **紧凑高效的 4D 表示**：无辅助网络，直接接入标准 3DGS 的优化与致密化（densification）流程。
4. **结果**：真实场景（N3DV / Google Immersive）PSNR 全部第一，flames 场景领先 **3.46 dB**；合成场景上 PSNR / SSIM / LPIPS 基本全面领先。

---

## 技术方案

### 核心思想

**问题**：4D Gaussian Splatting 的现有路线各有取舍：
- **神经形变场**（Deformable 3DGS / GauFRe / SC-GS）：表达力强，但每 Gaussian 每帧需 MLP 求值，渲染开销大；
- **结构化时空分解**（4DGS / 4K4D / K-Planes）：效率高，但受限于**预设的时空分辨率** —— 不同区域需要不同时序建模能力时无法分配；
- **显式轨迹**（STG 多项式 / Gaussian-Flow 多项式+Fourier / SplineGS 分段 Hermite / NURBS）：效率与表达力兼顾，但**时间参数化是均匀的** —— 不管区域动得快还是慢，分配的时间容量都一样。

**核心洞察**：真实场景的时间动态是**高度异质**的 —— 有的区域缓慢平滑，有的区域剧烈变化。均匀时间参数化在这种情况下要么浪费（静态区冗余）要么不足（动态区分辨率不够）。

**解法**：让时间分区本身成为可学习参数。固定段数预算 $K$ 下，轨迹自动「把时间分辨率分配到运动快的地方」。

### 关键技术

| 技术 | 说明 |
|------|------|
| **4D GS 参数化** | 只有位置 $\mu(t)$ 与旋转 $R(t)$ 随时间变化；尺度 $s$、不透明度 $o$、颜色 $c$ 全时间共享。$\Sigma(t)=R(t)SS^\top R(t)^\top$ |
| **分段三次贝塞尔** | $K+1$ 个关节 $\{J_0,\dots,J_K\}$、$2K$ 个内部控制点 $\{C_{k,0},C_{k,1}\}_{k=0}^{K-1}$、$K$ 个非均匀区间宽 $\{w_0,\dots,w_{K-1}\}$。全部可微、联合优化 |
| **单调时间划分** | 区间宽经 softmax：$\tilde w_k=\frac{\exp(w_k)}{\sum_j\exp(w_j)}$，关节时刻 $t_k=\frac{k-1}{\sum_j \tilde w_j}$。构造上保证 $0=t_0<t_1<\dots<t_K=1$ |
| **段定位** | 找 $t_k\le t<t_{k+1}$，局部参数 $u=\frac{t-t_k}{\tilde w_k}\in[0,1)$ |
| **G¹ 连续性** | $\lambda_k>0$ 可学习，初值 1（退化为 C¹）。保留切线方向、放开速度幅值 |
| **每 Gaussian 多项式旋转** | $q(t)=q_0+q_1t$，$R(t)=R\big(\frac{q(t)}{\|q(t)\|}\big)$（沿用 STG） |
| **致密化流程** | 早期迭代做 split/clone/prune（标准 3DGS），之后固定 Gaussian 集合，只优化样条参数与属性 |
| **实现配置** | 30k 迭代，Adam，单张 RTX 4090，L1 + D-SSIM（$\lambda=0.2$），SH degree 3，batch size 2；位置 lr 从 $1.6\times10^{-4}$ 指数衰减到 $1.6\times10^{-6}$；feature/opacity/scaling/rotation lr 分别为 $2.5\times10^{-3}$ / $5\times10^{-2}$ / $5\times10^{-3}$ / $10^{-3}$；**样条关节宽度 lr = 0.3 × 位置 lr**；每 100 迭代致密化（第 500–9k），梯度阈值 $2\times10^{-4}$，最多 6 次致密化事件；每 3k 迭代重置不透明度；剪除 opacity < 0.005 或 scale > 0.1× 场景尺度 |
| **初始化** | 默认 $K=3$ 段、非均匀关节间距、G¹ 连续；N3DV 上用单帧约 8k 个 COLMAP SfM 点初始化 |

### 公式

**3D Gaussian 定义与协方差**：
```math
G(x) = \exp\!\left(-\tfrac{1}{2}(x-\mu)^\top\Sigma^{-1}(x-\mu)\right),
\qquad
\Sigma = RSS^\top R^\top
```
```math
\Sigma(t) = R(t)SS^\top R(t)^\top
```

**α 合成**：
```math
C = \sum_{i\in\mathcal N} c_i \alpha_i \prod_{j=1}^{i-1}(1-\alpha_j)
```

**非均匀时间划分（Eq. 5）**：
```math
\tilde w_k = \frac{\exp(w_k)}{\sum_{j=0}^{K-1}\exp(w_j)},
\qquad
t_k = \frac{k-1}{\sum_{j=0}^{K-1}\tilde w_j}
```
（构造上保证 $0=t_0<t_1<\cdots<t_K=1$ 为 $[0,1]$ 的合法单调划分。）

**三次贝塞尔求值（Eq. 6）**：
```math
u = \frac{t-t_k}{\tilde w_k},
\qquad
\mu(t) = (1-u)^3 J_k + 3(1-u)^2u\,C_{k,0} + 3(1-u)u^2\,C_{k,1} + u^3 J_{k+1}
```

**反射式 G¹ 连续性约束（Eq. 7）**：
```math
C_{k,0} = J_k + \lambda_k\big(J_k - C_{k-1,1}\big),
\qquad k = 1,\dots,K-1,\quad \lambda_k>0
```
（$C^0$ 连续由共享关节保证；此式保持切线**方向**连续而放开**幅值**。）

**多项式旋转（Eq. 8）**：
```math
q(t) = q_0 + q_1 t,
\qquad
R(t) = R\!\left(\frac{q(t)}{\|q(t)\|}\right)
```

---

## 实验结论

- **数据集**：
  - **Neural 3D Video (N3DV)**：21 台同步相机，2704×2028@30fps，6 个公开场景约 10 秒；下采样到 1352×1014
  - **Google Immersive**：46 台鱼眼相机的半球穹顶 rig（火焰喷射器场景），用 45 台（留出 camera_0001 评测，44 台训练），50 帧；鱼眼去畸变为针孔并下采样到 1280×960
  - **2 个合成 ray-traced 动态场景**（checker sphere / soft contact）：20 台静态相机跨 90° 方位角两环，60 帧 @30fps，渲染 2704×2028 下采样到 1352×1014，中央视角留出评测。soft contact 含 16 个不同质量球（$m\propto r^3$）与不可见盒碰撞，接触用 penalty spring-damper 建模 0.2 s 有限区间
- **基线**：Gaussian-Flow（30k 迭代）、STG（30k，**without temporal opacity** 配置以保证是显式轨迹对比）、SplineGS（20k，soft contact 用 40k）

**定量结果**：
- **PSNR**：真实三个场景（cook spinach / coffee martini / flames）**全部第一**，flames 领先 **3.46 dB**；合成 checker sphere 第一；soft contact 第二
- **SSIM**：两个合成场景（checker sphere、soft contact）+ coffee martini + flames 第一；cook spinach 第二
- **LPIPS**：两个合成场景 + flames 第一；cook spinach 与 coffee martini 第二（差距很小）
- 论文强调：**在合成场景上优势明显更强** —— 因为合成场景是专门设计成「高度非均匀动态」的受控环境

**消融（样条阶数 K 与关节放置，表 2）**，五场景平均（cut roasted beef / cook spinach / sear steak / flame steak / coffee martini）：

| K | 关节 | PSNR↑ | SSIM↑ | LPIPS↓ |
|---|---|-------|-------|--------|
| 2 | Uniform | 31.71 | 0.9459 | 0.0537 |
| 2 | **Non-uniform** | **32.08** | **0.9481** | 0.0540 |
| 3 | Uniform | 30.83 | 0.9441 | 0.0565 |
| 3 | **Non-uniform** | **31.74** | **0.9469** | 0.0551 |
| 4 | Uniform | 31.61 | 0.9454 | 0.0579 |
| 4 | Non-uniform | 31.61 | 0.9446 | 0.0572 |

**关键发现**：非均匀间距在各阶数上一致地优于（或持平）均匀间距；而**提高样条阶数几乎不改善质量** —— 最低阶（K=2）+ 非均匀间距取得最佳结果，说明**自适应关节布置比样条阶数更重要**。且随阶数升高，非均匀 vs 均匀的差距缩小（高阶样条本身灵活性更强）。

---

## 局限性

1. **高度瞬态动力学困难**：soft contact 中快速碰撞在极短间隔内产生大加速度，固定的小段数难以准确捕捉。作者提出的方向是**自适应段插入**（由局部曲率或重建残差引导，动态增加时间分辨率）—— 但这是未来工作，本文未实现。
2. **无空间运动先验/邻域耦合**：轨迹纯时间维度、每 Gaussian 独立优化。**刚性结构与铰接结构必须靠各 Gaussian 独立轨迹学出来**；拓扑变化（几何的出现/消失）只能通过不透明度与致密化隐式处理。
3. **评测覆盖面有限**：仅 N3DV 公开场景 + 1 个 Google Immersive 场景 + 2 个合成序列；各基线使用各自的默认优化调度（不是统一预算），对比存在一定不公平性。
4. **代码未开源**。
5. **仅 8 页的会议投稿格式**，实验细节（完整率失真曲线、消融的更细粒度分析）有限。

---

## 相关工作

- [[3D-Gaussian-Splatting]] — 基础表示
- [[STG-Spacetime-Gaussians]] — 多项式轨迹基线
- [[Gaussian-Flow]] — 多项式 + Fourier 基线
- [[SplineGS]] — 分段 Hermite / NURBS 样条基线（本文最直接对照）
- [[Deformable-3DGS]] / [[GauFRe]] / [[SC-GS]] — 神经形变路线
- [[4D-GS]] / [[4K4D]] / [[K-Planes]] — 结构化时空分解路线
- [[2026-10-27_RacerGS-Residual-Autoregressive-3DGS-Compression]] — 同批次 3DGS 压缩工作

---

## 实现建议

- **实现难度**：**中**。相比神经形变路线，GaussianSpline **更简单**：不需要任何 MLP 形变网络，只在标准 3DGS 上加一个样条轨迹求值器 + 联合优化。难点在于：(a) 可微的段定位与局部参数计算（需处理时间边界）；(b) G¹ 约束在 autograd 下的梯度稳定性；(c) 致密化后新 Gaussian 的样条参数初始化。
- **预期性能**：单卡 RTX 4090、30k 迭代；真实场景 PSNR 全面第一（flames +3.46 dB）。渲染保持 3DGS 的实时性（无 per-Gaussian MLP 求值）。
- **适用场景**：
  - ✅ 4D 动态场景重建，且**动态高度异质**（部分区域剧烈、部分静止）
  - ✅ 需要实时渲染 + 训练成本的平衡（比神经形变快，比结构化网格灵活）
  - ✅ 可作为我们动态渲染/仿真可视化的表示基线
  - ⚠️ 纯刚性/铰接运动（无空间耦合先验，需要靠数据学）
  - ❌ 极端瞬态事件（高速碰撞、断裂）
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 最有价值的是它的**思想**：「让时间分区本身成为可学习参数」。这个范式与我们正在关注的「自适应采样/自适应离散化」主题高度呼应（对照今日 CVTSplat 的「自适应空间离散化」—— 一个在时间轴、一个在空间轴，思路同源）。且实现成本低、无需神经网络，是很好的工程参考。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.35224
- HTML 全文：https://arxiv.org/html/2610.35224v1
- PDF：https://arxiv.org/pdf/2610.35224
