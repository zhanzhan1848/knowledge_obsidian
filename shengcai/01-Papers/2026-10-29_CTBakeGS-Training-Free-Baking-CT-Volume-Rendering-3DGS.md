---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, 渲染, 体渲染, 光栅化, Gaussian-Splatting, 训练无关, 医学影像, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37406
---

# CTBakeGS: Training-free Baking of Photorealistic CT Volume Renderings into 3D Gaussian Splats

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CTBakeGS: training-free baking of photorealistic CT volume renderings into 3D Gaussian splats |
| **作者** | Haruki Fukuda, Constantin Lux, Wolf Schweitzer, Tadashi Hosoya, Lars Ebert（群马大学 / 苏黎世大学 / 苏黎世法医科学研究所） |
| **发表** | arXiv 2026-10-27（cs.CV / cs.GR），Preprint |
| **链接** | [原文](https://arxiv.org/abs/2610.37406) |
| **DOI** | [10.48550/arXiv.2610.37406](https://doi.org/10.48550/arXiv.2610.37406) |
| **代码** | [BocchiSlice/CTBakeGS](https://github.com/BocchiSlice/CTBakeGS) — 单个 HTML 文件（JavaScript + WebGL 2），浏览器本地运行 |

---

## 核心贡献

> 论文的贡献**不是新的渲染模型，而是移除现有 3DGS 管线的前提条件**：不再需要渲染训练视图、不再需要专用 GPU、不再需要逐场景训练——直接把「已被照亮的 CT 体渲染」**烘焙**成标准 3DGS 文件（.ply / .spz）。

1. **五步训练无关转换**：① 预计算光照并烘焙进 splat 颜色 → ② 用**自适应八叉树**把体数据切成毫米级 cell 决定 splat 位置与尺寸 → ③ GPU 上分层采样 27 点得到颜色与不透明度 → ④ **解析式地把 cell 不透明度转换为 splat 不透明度**（保证叠加后光学厚度守恒）→ ⑤ **随机保留微弱 splat** 以绕过 1/255 光栅化下限。
2. **解析式不透明度映射（关键数学贡献）**：立方格上各向同性高斯的光学厚度可叠加，故 splat 不透明度由 cell 光学厚度解析给出：
   - `τ_cell = −ln(1−α_cell)`
   - `τ_splat = τ_cell · h²/(2πs²)`
   - 取 `s = 0.55h`（使沿格轴的光学厚度在 1% 内恒定的最窄宽度）→ `α_splat = 1 − exp(−0.526·τ_cell)`
3. **随机保留微弱 splat**：标准 3DGS 光栅器跳过 `α < 1/255` 的 splat，.spz 也只存 8 bit 不透明度，薄半透明层会整体消失。以概率 `τ_splat/τ₀` 保留该 splat 并赋予 `α₀ = 0.01`（≈2.5/255，抗锯齿补偿后仍高于下限），**期望光学厚度不变且 splat 数更少**；用 cell index 哈希保证确定性。
4. **抗锯齿补偿**：沿用 Mip-Splatting 的做法，绘制时把不透明度乘 `w = sqrt(det(Σ)/det(Σ+0.3I))`，抵消 0.3 像素²屏幕空间滤波带来的小 splat 变粗。

---

## 技术方案

### 核心思想

**一个体数据已经天然包含了高斯表示所需要的一切**：材质在哪（位置/尺寸）、多不透明（opacity）、被照亮后是什么颜色。传统 3DGS 医学方法要对着几十到上千张渲染视图迭代优化数分钟到一小时；CTBakeGS 干脆跳过优化——**把渲染结果直接"印"进 splat**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **光照预计算（Step 1）** | splat 颜色是**视角无关**的，因此光照和阴影必须在转换前算好并烘焙。使用自带体渲染器的光照模型：约 112 个 cell 的**光照体（light volume）**沿最长轴分布；每个 cell 投射射线求 24 个方向的天穹可见性与主光方向的透射率 → 得到**软阴影**；样本颜色 = 可见性加权天光 + 透射率加权主光，再 tone-map |
| **自适应八叉树 cell（Step 2）** | 从 4 voxel 宽的 cell 开始；当某 cell 在其 HU 区间上的最大传递函数不透明度 `α_max` 超过区间两端较小者达 `α_max/2`（且 `α_max > 0.01`）时，**分裂为 8 个**；判定范围外扩 1.5 个 cell 宽，避免大 splat 穿出邻近表面；cell 为**毫米立方体**（单位=最细 voxel 间距），保证厚层数据不产生拉长 cell；可细分至 sub-voxel 尺寸；最细尺寸按幂律调整以命中目标 splat 数，通常 2–3 轮转换后误差在 8% 内 |
| **颜色与不透明度采样（Step 3）** | 每 cell 在 GPU 上 27 个分层点（3×3×3）采样，传递函数给出消光系数，点颜色用实时视图的光照模型与光照体着色，按消光系数加权平均 |
| **不透明度映射（Step 4）** | 每个 cell 替换为各向同性高斯 splat，标准差 `s`；邻近 splat 需重叠以避免缝隙与波纹；用光学厚度叠加公式解析求解（见上） |
| **微弱 splat 保留（Step 5）** | 见上；随机性由 cell index 哈希决定 → 转换确定性可复现 |
| **实时视图 / 渐进视图** | 渲染器提供两档：实时（每帧一遍）用于转换取色；渐进（对抖动帧平均直至收敛）用于生成参考真值 |
| **输出格式** | 标准 3DGS `.ply` 或压缩 `.spz`，可直接用任意标准 3DGS 查看器播放（含 HMD） |

---

## 公式

```math
// Cell 光学深度
\tau_{\mathrm{cell}}=-\ln(1-\alpha_{\mathrm{cell}})

// 格上各向同性高斯的光学深度叠加 ⇒ 每 splat 承担的光学深度
\tau_{\mathrm{splat}}=\tau_{\mathrm{cell}}\frac{h^{2}}{2\pi s^{2}}

// 取 s = 0.55h（沿格轴光学厚度在 1% 内恒定的最窄宽度）
\alpha_{\mathrm{splat}}=1-\exp\!\left(-0.526\,\tau_{\mathrm{cell}}\right)

// 微弱 splat 保留：概率 τ_splat/τ₀，赋予 α₀ = 0.01，τ₀ = −ln(1−α₀)
\Pr[\text{保留}]=\frac{\tau_{\mathrm{splat}}}{\tau_0},\qquad \tau_0=-\ln(1-\alpha_0)

// 抗锯齿补偿（Mip-Splatting 风格）
w=\sqrt{\frac{\det(\Sigma)}{\det(\Sigma+0.3I)}}
```

---

## 代码片段

```javascript
// Step 4: 不透明度映射（JavaScript 概念伪码）
function splatOpacityFromCell(cellAlpha, h, s = 0.55 * h) {
  const tauCell = -Math.log(1 - cellAlpha);
  const tauSplat = tauCell * h * h / (2 * Math.PI * s * s);
  return 1 - Math.exp(-0.526 * tauCell);   // 注意：式(3)(4)化简后等价于 1−exp(−τ_splat)
}

// Step 5: 微弱 splat 的确定性随机保留
function keepFaintSplat(cellIndex, alphaSplat, alpha0 = 0.01) {
  if (alphaSplat >= alpha0) return true;
  const tau0 = -Math.log(1 - alpha0);
  const tauSplat = -Math.log(1 - alphaSplat);
  const h = hash32(cellIndex);            // 确定性哈希
  return h < tauSplat / tau0;             // 概率保留，赋 alpha0
}

// 抗锯齿补偿（绘制时）
const w = Math.sqrt(detSigma / detSigmaPlus03I);
alphaFinal = alphaSplat * w;
```

---

## 实验结论

- **数据集**: TotalSegmentator v2 的 6 个公开 CT 扫描（2 家厂商，1.5 mm 各向同性体素，215–519 层，4.9–5667 万体素）；每个扫描 3 种传递函数（bone / contrast-enhanced vessels / skin and bone）→ 18 个场景 + 3 个 5 mm 厚层场景。
- **基线/参考**: 参考图由渲染器的**渐进视图**渲染（128 帧抖动平均）；256 帧平均与 128 帧参考的 PSNR 为 54.7–58.7 dB（<0.5 个 8-bit 灰阶）→ 视为收敛。
- **结果**:
  - 200 万 splat 模型：bone **32.6 ± 0.9 dB**，contrast-enhanced vessels **30.1 ± 1.0 dB**，skin and bone **32.3 ± 1.5 dB**（PSNR）。
  - 转换耗时：MacBook Pro (M4 Max) **4–30 s**；Windows 台式机 (GTX 1050 Ti, 4 GB) **9–60 s**；每个模型通常需 2–3 轮转换。
  - 渲染帧率：笔记本上 **68 FPS @ 800×800**。
  - 消融：去掉不透明度映射 / 去掉抗锯齿补偿 / 去掉微弱 splat / 改用逐 voxel 均匀网格 / 用 voxel 单位而非毫米 cell —— 五项消融逐一验证各步骤必要性。
- **硬件与实现**: 全部实现为**单个 HTML 文件**（JavaScript, WebGL 2），浏览器本地跑；测量用 Chrome 155 / macOS 26.6 / Apple M4 Max / Chrome 137 (2017 MacBook Air)。

---

## 局限性

1. **只支持视角无关颜色**：splat 存单一颜色，光照必须提前烘焙 → 无法在 3DGS 场景里再交互式改光照或换传递函数（传统 3DGS 可以）。
2. **转换函数改变需重转**：论文明确指出多数已训练模型在传递函数变化时必须重建或扩展。
3. **依赖原渲染器的光照模型**：软阴影质量受限于光照体分辨率（约 112 cell）。
4. **精度天花板**：32 dB 约等于 2.5% 全量程 / 8-bit 下 6 个灰阶差，医学用途可能需要更高保真。
5. 场景局限于 CT 体积数据，方法论可推广但论文未验证其他体数据（如 MRI、光谱数据）。

---

## 相关工作

- 3DGS / 2DGS / EWA splatting / Mip-Splatting
- 医学 3DGS（多数需逐场景优化数十至上千渲染视图）
- 食物链前馈高斯预测器（需先在 100–1000 个体数据上训练）
- [[2026-10-29_Honeycomb-Surfels-Hexagonal-Primitive]] — 同样是 3DGS 图元效率主题
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] — 高斯场景上的路径追踪

---

## 实现建议

- **实现难度**: **低**。单个 HTML + WebGL 2，无训练、无深度学习模型依赖、无优化器。
- **预期性能**: 转换 4–60 s/模型，实时渲染 68 FPS @ 800×800，PSNR 30–33 dB。
- **适用场景**:
  - **医学影像交互式展示**（HMD / 普通 PC，无 CT 数据与专用渲染器即可）
  - 教学、手术规划沟通、患者沟通
  - 任何"体数据 → 实时可播放 3D"的场景（CT/MRI/科学体数据）
- **落地建议（给墨鱼丸）**:
  1. **不透明度映射公式是本文最可复用的资产**：`α_splat = 1 − exp(−0.526·τ_cell)`，`s = 0.55h`。任何"把体渲染烘焙成 splat"的场景都能直接套用，值得单独验证。
  2. **微弱 splat 随机保留**的技巧（用期望光学厚度守恒 + 哈希保证确定性）同样通用：解决"薄半透明层在 1/255 下限处整体消失"的经典问题。
  3. 论文的价值定位要把握准：**它的贡献是消除前提条件（训练/GPU/渲染视图），不是提出新渲染模型**——评估时不应以"渲染模型创新"打分。
  4. 若要做**可重光照**版本，需把光照体从"烘焙进颜色"改为"存为可查询的 3D 纹理/球谐"，这是最直接的扩展方向。
