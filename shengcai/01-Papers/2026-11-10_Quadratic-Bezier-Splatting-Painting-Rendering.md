---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 绘画渲染, 笔刷, 可微渲染, 矢量光栅化, 二次贝塞尔, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.10713
arxiv_id: 2611.10713
---

# Quadratic Bezier Splatting with Structural Initialization for Efficient Painting Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Quadratic Bezier Splatting with Structural Initialization for Efficient Painting Rendering |
| **作者** | Jinfan Liu, Xuhan Zhan, Mengqin Zhao, Guangyi Deng, Wuze Zhang, Bingbing Ni |
| **发表** | arXiv cs.GR, 2026-11-07（本轮 10-10 批次一并收录） |
| **链接** | [原文](https://arxiv.org/abs/2611.10713) / [HTML 全文](https://arxiv.org/html/2611.10713v1) |
| **DOI** | —（arXiv 预印本） |
| **代码** | 论文未在摘要中给出 |

---

## 核心贡献

> **把「笔画渲染」从纯像素级重建任务改造为「结构化 + 逐笔审计」的任务**：用二次贝塞尔光栅化提供可微的曲线笔画表示，前馈模型只负责**结构化初始化**，测试时优化负责**高保真重建**，并用**单笔画审计**机制阻止有缺陷的笔画被后续图层掩盖。

1. **诊断**：过度依赖全局误差最小化会导致两个问题——(a) 因缺乏结构化规划，笔画退化为**碎片化曲线**；(b) **局部有缺陷的笔画会被重叠的后续图层掩盖**，逃过检测。
2. **二次贝塞尔泼溅渲染器**：解析式计算像素到二次贝塞尔曲线的最短距离（**解一元三次方程，常数时间**），配合 sigmoid 核得到平滑抗锯齿边界与连续梯度。
3. **前馈多尺度笔画解码器**：ViT-small 块编码器 + 多尺度笔画查询（粗/中/细，比例 2:3:5）+ 级联 Transformer 解码器 → 提供**带学习到的笔画尺度分配**的结构化初始化（约 28M 参数）。
4. **单笔画审计机制**：在光栅化时在线累积 $\Delta_i^+$ / $\Delta_i^-$ / $R_i^{supp}$，导出**纯度 $\rho_i$、净收益 $\eta_i$、未满足需求 $\delta_i$** 三个指标，驱动**剪枝 / 拆分 / 重生**三种自适应调度。
5. **结果**：PSNR 最高 **+5.46 dB**，表示更紧凑 **16%**，渲染器前向+反向计算加速 **220.3×**。

---

## 技术方案

### 核心思想

**分工明确的三组件框架**：
1. **可微二次贝塞尔泼溅渲染器** → 支持自由形状笔画
2. **前馈多尺度笔画解码器** → 生成**结构化初始化**（不是最终画作）
3. **测试时自适应优化 + 单笔画审计** → 提供高保真精修的重建能力

**关键机制（审计）**：在前后向合成中，定义笔画 $S_i$ 在像素 $\bm{p}$ 的有效可见贡献为「该笔画的 alpha × 它前面所有笔画透射率的乘积」。这样，一笔画带来的误差改善/恶化可以被**逐笔**归因，而不需要 leave-one-out 重渲染（代价太高）。

### 关键技术

| 技术 | 说明 |
|------|------|
| 笔画参数化 | $S_i=(P_0^i,P_1^i,P_2^i,\bm{c}_i,w_i,\alpha_i)$，其中控制点 $\in\mathbb{R}^2$、RGB $\in[0,1]^3$、半宽 $w_i\in\mathbb{R}^+$、不透明度 $\alpha_i\in[0,1]$ |
| 曲线 | $\bm{B}_i(t)=(1-t)^2P_0^i+2(1-t)tP_1^i+t^2P_2^i$，$t\in[0,1]$ |
| 光栅化 | 仿 3DGS 的**逐像素 $\alpha$ 合成**；sigmoid 核 $\sigma$ 把距离映射为不透明度（$\tau$ 控制边缘柔和度）；只对局部支撑内的重叠笔画 $\mathcal{N}(\bm{p})$ **由前到后排序**累积 |
| 距离计算 | 像素到二次贝塞尔曲线的最短距离 $D_i(\bm{p})$ **解析精确**求解，**常数时间**（解一元三次方程） |
| 多尺度笔画查询 | $N$ 个可学习查询分为粗/中/细三组 $N_c:N_m:N_f=2:3:5$，各配**有界尺寸的几何先验模板**（分别针对大色块区域、边界过渡、局部残差提示） |
| 查询初始化 | $\mathcal{Q}_0=(E^c+\mathrm{PE}^c,\ E^m+\mathrm{PE}^m,\ E^f+\mathrm{PE}^f)$，共享正弦位置编码 |
| 级联解码 | 逐级 cross-attention + self-attention，粗→中→细逐级注入已解码的粗尺度信息 |
| 残差细化 | $S_i=\mathrm{clamp}(S_i^0+\mathrm{Head}(\tilde{q}_i),0,1)$，$\mathrm{Head}(\cdot)=\gamma\tanh(\mathrm{MLP}(\cdot))$ 保证有界 |
| 模型损失 | $L_{model}=\|\hat I-I_{gt}\|_1+\lambda_{l_2}\|\hat I-I_{gt}\|_2^2+\lambda_{edge}\|\Delta\hat I-\Delta I_{gt}\|_1$（含 Laplacian 边缘项） |
| 审计指标 | 纯度 $\rho_i$、净收益 $\eta_i$、未满足需求 $\delta_i$（见公式） |
| 自适应调度 | 每 $T$ 步（预热后）：**剪枝**（$\eta_i\le 0$ 且纯度低/支撑不足，或近零不透明/半径过大）→ **拆分**（$\eta_i>0$、支撑足、纯度高但未饱和、几何有效，按 $\delta_i$ 优先，**de Casteljau 参数中点拆分**）→ **重生**（在残差图局部极大值处，NMS 非极大抑制，采样目标颜色与局部对齐方向，不可靠则随机朝向） |
| 优化损失 | $L_{opt}=\|\hat I-I_{gt}\|_2^2+\lambda_{dir}L_{dir}$，$L_{dir}$ 鼓励笔画切向与图像方向场对齐（预热后激活、周期性施加） |

---

## 公式

```math
// 二次贝塞尔曲线（式 1）
\mathbf{B}_{i}(t)=(1-t)^{2}P_{0}^{i}+2(1-t)tP_{1}^{i}+t^{2}P_{2}^{i},\quad t\in[0,1]

// 逐像素 α 合成（式 2，from-to-back）
I(\mathbf{p})=\sum_{i\in\mathcal{N}(\mathbf{p})}\left(\prod_{j<i} \cdots\right)

// 笔画有效可见贡献（式 6）
\tilde{\phi}_{i}(\mathbf{p})=a_{i}(\mathbf{p})\prod_{j<i}(\text{前面笔画的透射率})

// 在线累积的误差归因（式 7-9）—— 避免 leave-one-out 重渲染
\Delta_{i}^{+}=\sum_{\mathbf{p}}\max\!\Big(0,\;\|\hat{I}^{(i-1)}(\mathbf{p})-I_{gt}(\mathbf{p})\|_{2}^{2}
                                  -\|\hat{I}^{(i)}(\mathbf{p})-I_{gt}(\mathbf{p})\|_{2}^{2}\Big)

\Delta_{i}^{-}=\sum_{\mathbf{p}}\max\!\Big(0,\;\|\hat{I}^{(i)}(\mathbf{p})-I_{gt}(\mathbf{p})\|_{2}^{2}
                                  -\|\hat{I}^{(i-1)}(\mathbf{p})-I_{gt}(\mathbf{p})\|_{2}^{2}\Big)

R_{i}^{\text{supp}}=\sum_{\mathbf{p}}\tilde{\phi}_{i}(\mathbf{p})\,\|I_{gt}(\mathbf{p})-\hat{I}(\mathbf{p})\|_{1}

// 三个审计指标（式 10）
\rho_{i}=\frac{\Delta_{i}^{+}}{\Delta_{i}^{+}+\Delta_{i}^{-}+\epsilon},\quad
\eta_{i}=\frac{\Delta_{i}^{+}-\lambda_{\text{bad}}\Delta_{i}^{-}}{\tilde{A}_{i}+\epsilon},\quad
\delta_{i}=\frac{R_{i}^{\text{supp}}}{\tilde{A}_{i}+\epsilon}

// 优化目标（式 11）
\mathcal{L}_{\text{opt}}=\|\hat{I}-I_{gt}\|_{2}^{2}+\lambda_{\text{dir}}\mathcal{L}_{\text{dir}}
```

---

## 代码片段

```python
# 二次贝塞尔泼溅光栅化核心（论文 3.1）
def render_stroke(pixel_p, stroke):
    P0, P1, P2 = stroke.ctrl          # (3, 2)
    # 像素到二次贝塞尔曲线的最短距离：解一元三次方程，常数时间
    D = min_distance_point_to_quad_bezier(pixel_p, P0, P1, P2)   # 解析精确
    # sigmoid 核把距离映射为不透明度，tau 控制边缘柔和度
    a = stroke.alpha * sigmoid((stroke.width - D) / tau)
    return a

def composite(pixel_p, strokes):
    # 只取局部支撑内的重叠笔画 N(p)，由前到后排序累积 alpha
    near = [s for s in strokes if s.bbox_contains(pixel_p)]
    near.sort(key=lambda s: s.depth)
    C, T = 0.0, 1.0
    for s in near:
        a = render_stroke(pixel_p, s)
        C += T * a * s.color
        T *= (1 - a)
    return C

# 单笔画审计（论文 3.3）—— 直接在渲染器内累积，无需 leave-one-out 重渲染
for i, s in enumerate(strokes):
    err_before = ||I_before(p) - I_gt(p)||^2
    err_after  = ||I_after(p)  - I_gt(p)||^2
    delta_pos[i] += max(0, err_before - err_after)      # 该笔画的贡献
    delta_neg[i] += max(0, err_after  - err_before)     # 该笔画的伤害
    R_supp[i]     += phi_tilde[i](p) * ||I_gt(p) - I_final(p)||_1

# 自适应调度（每 T 步）
# 1) 剪枝: eta_i <= 0 且 (rho_i 低 或 有效支撑 A_i 不足) → 删除
# 2) 拆分: eta_i > 0, A_i 足, rho_i 高但未饱和, 几何有效
#         按 delta_i 排序, 用 de Casteljau 参数中点拆分
# 3) 重生: 在残差图局部极大值处 NMS, 采样目标颜色 + 局部对齐方向
```

---

## 实验结论

- **数据集**：DIV2K 验证集（自然图像重建，600×600，5K 笔画）、Im2Oil Gallery（艺术油画渲染，600×800，6K 笔画）。
- **基线**：Im2Oil（DPR 前的 SBR 代表）、DPR（Hu et al. 2023）、PT（L2P/Liu et al. 2021）、L2P（Huang et al. 2019）、SNP（Zou et al. 2021）、DP（Liu et al. 2026）——覆盖搜索型、前馈型、优化型、混合型四类范式。
- **训练配置**：前馈初始化器用 ViT-small 块编码器 + 多尺度笔画查询 + 级联 Transformer 解码器 + MLP 头，**约 28M 参数**；在 **Flickr2K** 上训 200 epoch，AdamW，lr 1e-4，weight decay 1e-4，batch 32，**4× RTX 4090**。推理时按不重叠 256×256 块处理，每块至多 250 笔画；测试时优化用 5000 步 Adam 精修（初始 lr 0.02，cosine 衰减）补足笔画预算。所有计时在**单张 RTX 4090** 上测。
- **结果**：
  - **PSNR 最高提升 5.46 dB**
  - **表示更紧凑 16%**
  - **渲染器前向 + 反向计算加速 220.3×**
  - 定性上相比现有方法产生**更连贯的结构布局**、**更有组织的笔画流动**，且保持**更干净的局部细节**；基线方法在笔画预算受限时常出现**碎片化笔画、不稳定边界、纹理驱动的伪影**。
  - 消融额外报告三个笔画审计指标（纯度 $\rho_i$、收益密度 $\eta_i$、残差密度 $\delta_i$），用于验证笔画是**有意义的绘画单元**而非仅仅全局匹配像素。

---

## 局限性

- 论文未在摘要中明确列出局限性；正文可见的约束：
  - **审计指标依赖前向合成顺序**（$\Delta_i$ 的定义用到 $\hat I^{(i-1)}$ 与 $\hat I^{(i)}$），故笔画顺序会影响指标数值。
  - 前馈初始化器需要**在 Flickr2K 上预训练 200 epoch**（4× RTX 4090），再对每个目标做 5000 步测试时优化——**推理成本高**。
  - 测试时优化需针对每个目标图像重跑，属 per-image 优化范式。
  - $L_{dir}$ 方向场对齐项的精确形式在补充材料中，依赖图像方向场估计的质量。
- 论文明确指出 **DP（Liu et al. 2026）** 为同期工作，存在对比公平性依赖。

---

## 相关工作

- [[2026-11-10_Quadratic-Bezier-Splatting-Painting-Rendering]]
- 绘画渲染：[[笔刷渲染]] [[矢量化]] [[可微光栅化]]
- 几何：[[二次贝塞尔曲线]] [[de Casteljau 分割]] [[距离场]]
- 关键引文：Im2Oil（Tong et al. 2022）、DPR（Hu et al. 2023）、PT（Liu et al. 2021）、L2P（Huang et al. 2019）、SNP（Zou et al. 2021）、DP（Liu et al. 2026）、3DGS 泼溅机制、DIV2K（Agustsson & Timofte 2017）

---

## 实现建议

- **实现难度**：**中高**（可微贝塞尔距离需解三次方程；光栅化器需同时支持前向与反向；审计调度是较复杂的系统工程）
- **预期性能**：RTX 4090 单卡；渲染器前反向 220× 加速（相对其基线实现）；PSNR +5.46 dB
- **适用场景**：
  - ✅ **绘画风格图像的结构化矢量化**（需要「笔画」作为语义单元而非像素匹配）
  - ✅ 需要**可编辑**的矢量表示（笔画是天然的编辑单元）
  - ✅ 笔画预算受限的场景（审计机制能主动剪掉无贡献笔画）
  - ❌ 追求单次快速推理（前馈初始化器 + 5000 步测试时优化是 per-image 成本）
- **落地建议**：
  1. **审计机制的在线累积是关键工程点**——必须做到 leave-one-out 归因但**不做 leave-one-out 重渲染**，否则开销爆炸；论文的 $\Delta_i^\pm$ 累积方式可直接照搬
  2. de Casteljau 参数中点拆分实现简单且精确，优先实现
  3. 三种调度操作（剪枝/拆分/重生）中，**拆分是提升质量的**（细化过于粗糙但有益的笔画），剪枝主要提升紧凑性，重生补细节
  4. 若算力受限，可只保留前馈初始化器 + 少步数精修，放弃审计调度
  5. 像素到二次贝塞尔距离务必用**解析三次方程解**（常数时间），不要用数值优化或采样
- **优先级**：**中**——与主渲染域（路径追踪/全局光照）关联较弱，但对「矢量/可编辑渲染」方向有独特价值
