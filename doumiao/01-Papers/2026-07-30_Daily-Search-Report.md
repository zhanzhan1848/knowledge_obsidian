# 每日论文搜索报告 - 流体渲染

**日期**: 2026-07-30
**Agent**: 豆苗 (Doumiao)
**时间**: 14:11 UTC

---

## 搜索范围

- **arXiv cs.GR**: 最近 7 天提交
- **SIGGRAPH 2026**: 技术论文
- **SIGGRAPH Asia 2026**: 征稿中

---

## 搜索关键词

```
fluid rendering, water rendering, smoke rendering, fire simulation, 
ocean rendering, particle system, volume rendering
```

---

## 发现的相关论文

### 🏆 重点论文

#### 1. ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering
- **arXiv**: [2607.22956](https://arxiv.org/abs/2607.22956)
- **作者**: Bo Jiang et al.
- **会议**: SC26
- **领域**: 粒子系统渲染 / 体积渲染
- **核心创新**:
  - 基于 3D Gaussian Splatting 的可视化感知压缩框架
  - 多阶段多轨道训练管道
  - VizMapper 网络适配可视化参数
  - 281M 粒子 HACC 宇宙模拟达到 30.03 dB PSNR (65x 压缩)
  - 单 GPU 662 FPS 渲染速度
- **渲染方法**: 粒子渲染 + 3DGS
- **视觉质量**: ⭐⭐⭐⭐⭐
- **性能**: 实时 (662 FPS)
- **推荐度**: ✅ 强烈推荐

#### 2. GauSmoke: Hybrid Sparse Smoke Reconstruction
- **会议**: SIGGRAPH 2026
- **领域**: 烟雾渲染 / 体积渲染
- **状态**: 已接受 (Technical Paper)

#### 3. Neural Particle Automata: Learning Self-Organizing Particle Dynamics
- **会议**: SIGGRAPH 2026
- **领域**: 粒子系统
- **核心创新**: 神经网络驱动的自组织粒子动力学

#### 4. Neural Cellular Automata: From Cells to Pixels
- **会议**: SIGGRAPH 2026
- **领域**: 神经渲染 / 粒子系统

---

## arXiv cs.GR 最新提交 (2026-07-24 ~ 2026-07-30)

| arXiv ID | 标题 | 领域 | 推荐度 |
|----------|------|------|--------|
| 2607.22956 | ParticleGS (粒子渲染) | 粒子/体积 | ✅ |
| 2607.23122 | Occlusion-Point Reuse (AO/Shadow) | 渲染技术 | ✅ |
| 2607.22103 | Curly Hair Simulation | 粒子/毛发 | ✅ |
| 2607.26901 | Convex Collision-Free Regions | 碰撞处理 | ⚠️ |
| 2607.26889 | Structure-aware Gaussian Splatting | 3DGS | ⚠️ |
| 2607.26525 | AtlasLC (3DGS 压缩) | 3DGS | ⚠️ |
| 2607.25326 | Functionally Grading Slicing | 制造 | ❌ |
| 2607.25121 | Line Ensembles Visualization | 可视化 | ❌ |
| 2607.24954 | Intrinsic Attention for Meshes | 几何 | ❌ |
| 2607.24596 | 2D Scalar Field Contour Ensembles | 可视化 | ❌ |
| 2607.24509 | Elastoplastic-Damage Update | 物理模拟 | ⚠️ |
| 2607.24261 | TexSketch (Sketch Colorization) | 风格化 | ❌ |
| 2607.23437 | Neural Representation of Minimal Surfaces | 几何 | ❌ |
| 2607.22890 | Meshless Domain Randomization | 3DGS | ⚠️ |
| 2607.22780 | Inter-Reflective Gaussian Splatting | 逆渲染 | ⚠️ |
| 2607.22741 | Design-Intent Compilation | 制造 | ❌ |
| 2607.22738 | Code-Native 3D Assets | 程序化生成 | ⚠️ |
| 2607.22674 | Tactile Graphics Generation | 无障碍 | ❌ |

---

## SIGGRAPH 2026 流体相关论文

从官方议程序列中识别出以下相关论文：

1. **GauSmoke: Hybrid Sparse Smoke Reconstruction** - 烟雾重建
2. **Neural Particle Automata: Learning Self-Organizing Particle Dynamics** - 粒子动力学
3. **Neural Cellular Automata: From Cells to Pixels** - 细胞自动机
4. **Efficient Fur and Hair Multiple Scattering Using Volumetric Approximation** - 体积近似散射
5. **HairLRM: Strand-based Hair Modeling** - 毛发建模

---

## 论文笔记创建

已为以下论文创建结构化笔记：
- `2026-07-30-ParticleGS-3DGS-Particle-Rendering.md`

---

## 后续行动

1. [ ] 抓取 GauSmoke 论文全文
2. [ ] 分析 ParticleGS 代码仓库
3. [ ] 更新流体渲染技术分类

---

## 参考链接

- [arXiv cs.GR Recent](https://arxiv.org/list/cs.GR/recent)
- [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/program/technical-papers/)
- [Paper Digest SIGGRAPH 2026](https://www.paperdigest.org/2026/07/siggraph-2026-papers-highlights/)
