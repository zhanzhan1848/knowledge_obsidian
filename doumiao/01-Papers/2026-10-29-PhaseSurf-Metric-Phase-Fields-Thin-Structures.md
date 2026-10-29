---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, fluid-rendering, volume-rendering, neural-field, implicit-surface, thin-structure, ucf]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.13088
---

# Volume Rendering with Metric–Phase Fields for Thin Structures and Sign-Ambiguous Geometry

## 📋 基本信息

| 字段 | 内容 |
|------|------|
| **标题** | Volume Rendering with Metric–Phase Fields for Thin Structures and Sign-Ambiguous Geometry |
| **方法名** | **PhaseSurf** |
| **arXiv** | [2610.13088](https://arxiv.org/abs/2610.13088) |
| **提交日期** | 2026-10-09 |
| **作者** | Junkai Deng, Jiayi Kong, Xuhui Chen, Guanli Hou, Fei Hou, Junhui Hou, Wenping Wang, Ying He |
| **机构** | 南京大学 (Nanjing University) 等 |
| **领域** | cs.GR |

---

## 📝 摘要

将体渲染与**有符号距离场 (SDF)** 耦合的神经隐式曲面方法（如 VolSDF、NeuS）能对**水密 (watertight)** 物体实现高质量多视图重建。但它们依赖**全局一致的内外划分 (inside-outside partition)**。

这一假设对**薄结构**（如薄片、管、薄壁）变得脆弱，对**符号模糊几何**（如带边界的曲面、非流形连接、间距很近的曲面分量）则直接崩溃，常导致虚假封闭或细节丢失。

**无符号距离场 (UDF)** 放宽了全局符号要求，更能支持非水密几何，但**优化难度大幅增加**。

本文提出 **PhaseSurf**：基于 **Metric-Phase Fields (MPFs)** 的神经体渲染框架。

---

## 🔑 核心贡献

1. **MPF 分解**：将几何分解为
   - **非负度量场 (nonnegative metric field)**：捕捉无符号邻近关系
   - **连续相位场 (continuous phase field)**：提供软符号线索
2. **残差相位注入 (residual phase injection)**：耦合两个场，得到有符号复合隐函数
3. **稳定近表面梯度 + 保留 UDF 式符号模糊区鲁棒性**：这是 MPF 的核心设计目标
4. **可直接用标准 Marching Cubes 提取等值面**
5. **避免 SDF 与 UDF 两类方法的失败模式**
6. **MPF 专属训练损失**：度量一致性损失、相位过渡稳定化、自由空间虚假几何抑制

---

## 🧪 技术方案

### 核心思想

```
传统 SDF:  f(x) = signed distance        → 需全局内外一致，薄结构崩溃
传统 UDF:  f(x) = |distance|              → 无符号，但优化困难

MPF 分解:
   m(x) ≥ 0   度量场     ──► 捕捉"距离有多近"（无符号，稳定）
   φ(x) ∈ ℝ   相位场     ──► 捕捉"在内还是在外"（软符号线索）

   残差相位注入:
   f(x) = m(x) + inject(φ(x))   → 有符号复合隐函数
                    │
   特性：近表面梯度稳定（来自 m）+ 符号模糊区鲁棒（来自 φ）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Metric-Phase Field (MPF)** | 度量场 + 相位场的双场表示，解耦"距离"与"符号" |
| **残差相位注入** | 把相位信息以残差形式注入度量场，避免符号主导优化 |
| **Marching Cubes 兼容** | 输出仍是标准有符号隐函数，可直接标准 MC 提取 |
| **度量一致性损失** | 强制度量场与真实(无符号)距离一致 |
| **相位过渡稳定化** | 稳定界面附近的相位跳变，防止优化震荡 |
| **自由空间抑制** | 惩罚自由空间中产生的虚假几何（薄结构常见伪影） |

---

## 📊 渲染方法分类

- **类型**：体积渲染（神经隐式）+ 表面重建
- **技术**：Metric-Phase Fields、Marching Cubes、SDF/UDF 混合

## 🎯 视觉质量

- **逼真度**：⭐⭐⭐⭐（几何质量高，渲染为标准体渲染）
- **风格化支持**：是
- **物理准确性**：不适用（几何表示）

## ⚡ 性能预期

- **训练**：需数十分钟到数小时（NeRF 级）
- **推理**：体渲染为标准 MLP + MC 提取，可实时
- **GPU 需求**：中
- **内存占用**：中

## 🔧 实现建议

- **着色器复杂度**：低（标准体渲染着色器）
- **管线要求**：
  - 体渲染渲染循环（可复用 NeRF 管线）
  - 双场 MLP 或多头输出
  - Marching Cubes 提取
  - 三项定制损失
- **推荐度**：✅ **强烈推荐用于薄结构 / 水体表面 / 泡沫 / 浪花重建**——这正是流体渲染中的高频细节载体（薄飞溅片、泡沫层、水膜）

## ⚠️ 局限性

- 需要多视图数据 + 逐场景优化（无法免训练）
- 相位场带来额外网络容量与训练开销
- 对完全无先验拓扑的复杂液体自由表面仍需谨慎

## 🔗 相关工作

- [[VolSDF]] · [[NeuS]] · [[UDF-NeRF]]
- [[Appearance-Compensation-in-Volume-Rendering]]
- [[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]]
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]]
- [[2026-03-16-Gaussian-Fluids-SIGGRAPH2025]]

## 📚 引用

```bibtex
@article{deng2026phasesurf,
  title={Volume Rendering with Metric--Phase Fields for Thin Structures and Sign-Ambiguous Geometry},
  author={Deng, Junkai and Kong, Jiayi and Chen, Xuhui and Hou, Guanli and Hou, Fei and
          Hou, Junhui and Wang, Wenping and He, Ying},
  journal={arXiv preprint arXiv:2610.13088},
  year={2026}
}
```

---
*创建日期: 2026-10-29*
*来源: arXiv cs.GR 每日论文搜索*
*标签: #volume-rendering #neural-field #implicit-surface #thin-structure #marchingr-cubes #nerf*
