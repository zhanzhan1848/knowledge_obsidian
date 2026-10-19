---
type: paper
created: 2026-10-19
updated: 2026-10-19
tags: [paper, 3DGS, multimodal, cross-modal, SIGGRAPH-Asia-2026, X-ray, RGB, joint-reconstruction]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.23237
doi: 10.1145/3829340.3842177
---

# X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction |
| **作者** | Wangze Xu, Chu Zhou, Mae Yamaguchi, Linrui Dai, I-Chao Shen, Takashi Ijiri, Imari Sato |
| **发表** | SIGGRAPH Asia 2026 Conference Papers |
| **链接** | [arXiv:2610.23237](https://arxiv.org/abs/2610.23237) |
| **DOI** | [10.1145/3829340.3842177](https://doi.org/10.1145/3829340.3842177) |
| **代码** | 项目页 https://zezeaaa.github.io/X-Splat/ |
| **提交** | 2026-10-16 10:06 UTC（cs.CV/cs.GR cross-list） |
| **页数** | 19 pages (12 main + 7 supplementary), 13 figures |

---

## 核心贡献

> 首个把 RGB 与 X-ray 联合重建统一到 **单一 3DGS 表示** 的工作，通过 cross-modal 几何代理（MVS + X-ray proxy）实现稳定对齐，避免双模型分别优化常见的冗余几何与对齐 artifacts。

1. **统一表示**: 所有 Gaussian primitives 共享单一几何参数集，仅 surface-proximal primitives 额外携带外观属性
2. **Cross-modal 注册**: 通过 MVS + X-ray 几何代理（而非对齐两套 Gaussians）实现跨模态对齐，提升稳定性
3. **Surface-depth 一致性损失**: 由 X-ray 几何推导，用于引导 RGB 重建
4. **更鲁棒、更紧凑**: 在 InsideOut + 自建 Flower & Insect 数据集上同时改善 RGB 渲染质量与 X-ray 重建质量

---

## 技术方案

### 核心思想

传统方法对 RGB 与 X-ray 分别训练模型 → 几何冗余 / 对齐 artifacts / 松耦合。
X-Splat 改为 **单几何 + 选择性外观** 的统一 3DGS，并通过 **MVS + X-ray 几何代理**做 cross-modal registration，避免优化两套对齐。

### 关键技术

| 技术 | 说明 |
|------|------|
| 统一高斯参数 | 所有 primitives 共享一组几何参数；surface-proximal 才加外观 |
| 跨模态注册 | MVS + X-ray 几何代理联合估计；不优化两套对齐 |
| Surface-depth 一致性 | X-ray 几何监督 RGB 重建深度一致 |
| 联合优化 | RGB + X-ray 双模态监督，附加 surface-depth 一致性约束 |

---

## 数据集与实验

### 数据集

- **InsideOut**（公开）
- **Flower & Insect**（自建，跨模态场景）

### 评估维度

- RGB 渲染质量（PSNR / SSIM / LPIPS）
- X-ray 重建质量
- Cross-modal 对齐稳定性
- 表示紧凑度（与"维护两个独立几何"对比）

### 主要结果

> 论文报告：更鲁棒的 cross-modal alignment；更高的 RGB 渲染质量且不牺牲 X-ray 重建；表示更紧凑。

---

## 局限性 / 备注

- 论文摘要未给出具体数值，需读 PDF 补充
- X-ray 采集设备依赖（与普通 RGB 流程差异较大）
- 表面-外观耦合的边界（surface-proximal 判定）需在更多物体上验证

---

## 相关工作

- [[2026-10-15-VisibilitySplat-Ray-Traced-Occlusion-3DGS]] — 3DGS inverse rendering 的 visibility oracle
- [[2026-10-16-SUPRA-TEX-PBR-3D-Generation]] — PBR 资产生成 WYSIWYG
- [[2026-10-16-RoboCloth-Cloth-Material-Dataset]] — 神经反射率重建数据集
- [[2024-02-01-StopThePop-Sorted-Gaussian-Splatting]] — 排序高斯泼溅基础
- [[2025-03-Dynamic-Scene-Reconstruction]] — 动态场景重建
- [[2025-05-Virtualized-3D-Gaussians]] — 3DGS 虚拟化

---

## 实现建议

- **实现难度**: 🟠 中高（需 X-ray 数据采集流程；多模态对齐管线）
- **预期性能**: 取决于 X-ray 硬件；RGB 渲染质量应优于单模态 3DGS
- **适用场景**:
  - 医学影像（CT/MRI + 表面 RGB）
  - 工业 CT 检测 + 实物表面建模
  - 文化遗产 X-ray + 表面联合扫描
- **借鉴价值**: cross-modal alignment 的 MVS+X-ray 代理做法可移植到我们 3DGS 工具链
- **优先级**: 🟡 中（先做论文笔记；待开源后评估）

---

## 给 moyuwan 的建议

| 项 | 说明 |
|----|------|
| **可借鉴点** | MVS+X-ray 几何代理的 cross-modal registration 思路；surface-depth 一致性损失 |
| **不可直接借鉴** | X-ray 采集硬件（一般团队不具备） |
| **建议行动** | 待开源后复现 cross-modal registration 部分；评估在 multi-view RGB 内部的对齐稳定性 |
| **下游影响** | 若我们做 RGB-only 多视角对齐，可借鉴 surface-depth 损失设计 |

---

## 元信息

- **执行 Agent**: shengcai (生菜)
- **来源**: arXiv 2026-10-16 提交，SIGGRAPH Asia 2026 已收录
- **状态**: 已收录，等待开源
- **下次复审**: 2026-10-22（观察开源情况）
