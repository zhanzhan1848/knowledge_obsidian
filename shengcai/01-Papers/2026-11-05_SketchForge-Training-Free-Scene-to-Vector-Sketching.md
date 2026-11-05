---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 可微矢量图形, DiffVG, SVG矢量化, 轮廓描摹, 免训练, 测试时优化, 风格迁移, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.00253
---

# SketchForge: 免训练的场景到矢量素描（结构与纹理解耦优化）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SketchForge: Training-Free Scene-to-Vector Sketching via Decoupled Structure and Texture Optimization |
| **作者** | Quang-Thinh Nguyen, Duy-Khang Do, Hien Trinh, Tam V. Nguyen, Minh-Triet Tran, Trung-Nghia Le（**VNU-HCM, 越南国家大学胡志明市分校**） |
| **发表** | arXiv 2026-10-30（cs.GR），**SIGGRAPH Asia 2026**（ISBC 2026 项目页） |
| **链接** | [原文](https://arxiv.org/abs/2611.00253) · [HTML](https://arxiv.org/html/2611.00253v1) · [项目页](https://khangcntn123.github.io/SketchForge) |
| **DOI** | — |
| **代码** | 项目页提供（论文未直接给出仓库地址） |

---

## 核心贡献

> **免训练、免扩散骨干**：把光栅图转成分辨率无关、可编辑的 SVG，靠**逐实例测试时优化贝塞尔曲线**，并把「结构轮廓」与「色调纹理」两类**互相冲突的目标彻底解耦**成两个分支，最后用 multiply 混合合成。

1. **结构/纹理解耦**：轮廓需要**精确几何对齐**，纹理需要**灵活笔画承载色调**——统一目标会互相牵制。→ 两个独立分支 + 各自专属目标。
2. **轮廓 + 注意力引导初始化**：$\rho$ 比例的笔画按轮廓放置（2/3 直接落在检测到的轮廓上，1/3 在相邻放置间插值），其余由 **DINO 注意力**引导到未被强边缘解释的显著区域。
3. **矢量化原生可微管线**：基于 **DiffVG**，不是光栅空间管线 → 笔画级可编辑。
4. **逐层 multiply 融合**：$c^*_{xy}=c^s_{xy}\odot c^t_{xy}$，暗色轮廓强化局部结构、白色区域保留纹理。

---

## 技术方案

### 核心思想

**问题**：光栅空间渲染管线难以在笔画级编辑；从零生成的矢量化方法又难以忠实于任意输入图。

**关键洞察**：把笔画集合**分成两组**，分别用「结构目标」与「纹理目标」优化，最后再融合：

- **结构层 $\mathcal{V}_{\text{struct}}$**：固定宽度与颜色，只优化控制点 → 对齐边缘图
- **纹理层 $\mathcal{V}_{\text{tex}}$**：控制点、宽度、不透明度、颜色全部自由 → 全局重建色调

### 关键技术

| 技术 | 说明 |
|------|------|
| **预处理** | 提取边缘图作为结构目标 $I_{\text{edge}}$；生成纹理目标 $I_{\text{tex}}$ |
| **风格迁移** | 免训练的 style injection 方案（参考 Chung et al. 2024 CVPR + AdaIN，Huang & Belongie 2017） |
| **轮廓引导初始化** | 比例 $\rho$ 的笔画：2/3 直接置于检测轮廓上，1/3 在相邻放置间插值 |
| **注意力引导放置** | 其余笔画由 **DINO 注意力**引导，覆盖强边缘未解释的显著区域 |
| **结构优化目标** | $G\times G$ 网格上的**多尺度 patch 损失**：fine 项在锐利边缘过渡附近提供稳定梯度；coarse 项（平均池化 $r=4$）在前景像素很少的 patch 中锚定低频笔画质量。$G=4$ |
| **纹理优化目标** | 全画布 L2 重建 $I_{\text{tex}}$ → 捕捉色调变化而不强行把纹理塞进稀疏边缘 patch |
| **优化器** | 两分支均用 **Adam**，但**控制点 / 颜色-不透明度 / 宽度**分属不同参数组；结构分支固定外观，纹理分支优化全部属性 |
| **逐层 multiply 融合** | 最终 SVG 中 $\mathcal{V}_{\text{tex}}$ 在下、$\mathcal{V}_{\text{struct}}$ 在上，结构层用 `mix-blend-mode: multiply` |

---

## 公式

**结构多尺度损失**：

```math
\mathcal{L}_{\text{struct}}=\frac{1}{G^{2}}\sum_{i,j}\left[
\mathcal{L}_{\text{fine}}(\hat{I}_{ij},I^{e}_{ij})
+\mathcal{L}_{\text{coarse}}(\downarrow_{r}\hat{I}_{ij},\downarrow_{r}I^{e}_{ij})\right]
```

其中 $G=4$，$\downarrow_r$ 是平均池化，$r=4$。

**纹理全画布损失**：

```math
\mathcal{L}_{\text{tex}}=\|\mathcal{R}(\{s_{i}\})-I_{\text{tex}}\|_{2}^{2}
```

**Multiply 融合**：

```math
c^{*}_{xy}=c^{s}_{xy}\odot c^{t}_{xy}
```

---

## 代码片段

```text
// 初始化策略
N strokes 总数
ρ 比例 contour-guided:
   2/3  → 直接放在检测到的轮廓上
   1/3  → 在相邻轮廓放置之间插值
其余 (1-ρ) → attention-guided（DINO 注意力）覆盖未被强边缘解释的显著区域

// 优化（两分支独立，Adam，参数组分离）
branch structure: params = [control_points]            # 宽度、颜色固定
branch texture  : params = [control_points, width, opacity, color]

// 融合
SVG layers:  V_tex (bottom)
              V_struct (top, mix-blend-mode: multiply)
```

---

## 实验结论

- **数据集**: 64 张内容图（论文 Table 1）
- **基线**:
  - **CLIPasso**（Vinker et al. 2022）—— 笔画更密但空间无序
  - **CLIPascene**（Vinker et al. 2023）—— 过度抽象、丢失细节
  - **SwiftSketch** / **ControlSketch**（Arar et al. 2025）—— 稀疏、抽象的笔画
  - **DiffSketcher 改编版**（Xing et al. 2023）—— 局部纹理表现不足
- **评价指标**（四个维度）:
  - **感知质量**：Aesthetic Score、LPIPS、DreamSim
  - **语义保真**：DINO 相似度
  - **结构保真**：SSIM、MAE、Edge F1
  - **几何精度**：Chamfer 距离（骨架化笔画路径上采样点集）
- **关键结果**:
  - **Aesthetic Score 4.8407（最佳）**
  - **DINO 相似度 0.4507（最佳）**
  - **Edge F1 0.9780（最佳）**
  - **DreamSim 0.5552（有竞争力）**
- **消融**:
  - **初始化引导**（结构分支）：Edge F1 **0.7731 → 0.8841**，SSIM **0.1120 → 0.8068**
  - **初始化引导**（纹理分支）：DINO **0.6378 → 0.7328**，DreamSim 与 LPIPS 同时改善
  - **层级融合**：仅纹理 → 丢失结构连贯性；仅结构 → 保留边缘但缺色调丰富度；**融合在 DINO / DreamSim / Aesthetic 上最佳**，同时保持强 Edge F1 → 验证解耦公式化设计

---

## 局限性

- **逐实例测试时优化**：每张图都要跑优化，**推理慢**（论文明确把「更高效的优化」列为未来工作）
- **笔画级精细控制缺失**：论文把「对单个笔画与语义区域的更精细用户控制」列为未来工作
- **DiffVG 依赖**：矢量化原生可微渲染的能力上限受 DiffVG 约束
- **风格迁移模块**依赖免训练 style injection 方案，效果受参考图质量影响
- **依赖 DINO 注意力**做显著区域引导 → 需加载自监督 ViT，增加前置成本
- **结构/纹理手工解耦**：并非所有内容都能干净地二分（如本身就是纹理化的轮廓）

---

## 相关工作

- [[DiffVG]] — Li et al. 2020（可微矢量光栅化，基础组件）
- [[CLIPasso]] — Vinker et al. 2022
- [[CLIPascene]] — Vinker et al. 2023
- [[SwiftSketch]] / [[ControlSketch]] — Arar et al. 2025
- [[DiffSketcher]] — Xing et al. 2023
- [[VectorFusion]] — Jain et al. 2023
- [[SVGDreamer]] — Xing et al. 2024
- [[DINO]] — Caron et al. 2021
- [[Style-Transfer-AdaIN]] — Huang & Belongie 2017

---

## 实现建议

- **实现难度**: **低-中**（免训练、逐实例优化，无训练成本；但 DiffVG + 多分支 + 多次迭代仍需工程量）
- **预期性能**: 逐实例优化（分钟级/图量级，论文未给具体时间）；输出为可编辑 SVG
- **适用场景**:
  - ✅ 需要**矢量级可编辑**的插画/素描（设计师后续手工调整笔画）
  - ✅ 保留参考图**色调纹理**同时强调**结构轮廓**的转换任务
  - ✅ 免训练需求（不能收集成对数据、无 GPU 训练预算）
  - ✅ **保色矢量化**与参考引导的风格迁移（论文额外能力）
  - ❌ 大批量/实时矢量化
  - ❌ 需要语义级编辑（分割、部件选择）的任务
- **落地建议**:
  1. **「结构/纹理解耦」是本文最可迁移的思想**：任何「既要几何精确、又要外观丰富」的图像域优化任务都可套用——用两组参数 + 两个专属损失 + multiply 类合成
  2. **引导初始化收益极大且成本低**：结构分支 SSIM 从 0.112 → 0.807，说明**初始化位置比优化器选择更决定成败**。在类似笔画/图元放置问题上优先投入初始化设计
  3. **多尺度损失（fine + coarse）**是稀疏目标（边缘）的通用解法：单独用 fine 项会在前景稀疏的 patch 失去梯度，coarse 项负责锚定
  4. 参数组分离（控制点 / 颜色-不透明度 / 宽度）便于分阶段调参，是易忽视的工程细节
  5. 论文由 VNU-HCM 完成，**方法完全开源友好**（DiffVG + DINO + 免训练 style injection 均为成熟组件），适合快速复现
