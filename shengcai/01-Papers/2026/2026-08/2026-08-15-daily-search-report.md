# 🥬 每日渲染论文搜索报告

**日期**: 2026-08-15
**搜索范围**: arXiv cs.GR (最近5天), ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
**关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## 📊 搜索结果概览

| 来源 | 筛选结果 |
|------|----------|
| arXiv cs.GR (8/10-8/14) | 共31篇，渲染相关4篇 |
| ACM Digital Library | 全局光照/神经渲染相关若干 |
| SIGGRAPH 2026 | PSSR 2.0 (PS5超分辨率) 相关披露 |

---

## 🎯 重点论文

### 1. [A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering](https://arxiv.org/abs/2608.09604)

**元信息**
| 属性 | 值 |
|------|-----|
| arXiv | [2608.13446](https://arxiv.org/abs/2608.13446) |
| 作者 | Louis De Oliveira et al. (Ubisoft La Forge) |
| 发表 | **Eurographics Symposium on Rendering (EGSR) 2026** |
| 日期 | 2026-08-10 |
| 链接 | [Project Page](https://ubisoft-laforge.github.io/world/hybridrdf) |

**核心贡献**
1. 将 GGX 微表面模型与神经网络结合，用小规模神经망校正微表面近似误差
2. 在相同内存开销下，测量数据逼近精度优于 SOTA 神经模型
3. 保持艺术家可编辑性，支持重要性采样，适用于离线+实时渲染

**技术方案**
- **混合架构**: GGX 微表面基础层 + 神经校正分量
- **网络规模**: 比现有神经 BRDF 模型小得多（轻量化）
- **采样**: 支持重要性采样方案

**实验结论**
- 相同内存成本下精度更高
- 评估开销相比微表面模型仅小幅增加

**重要性采样公式**
```math
p(\omega_i) = \frac{G1(\omega_o, \omega_m) |N \cdot \omega_m|}{4 |N \cdot \omega_o|}
```

**推荐度**: ⭐⭐⭐⭐⭐
**实现难度**: 中（需深度学习框架集成）
**标签**: #渲染 #BRDF #PBR #神经渲染 #EGSR2026

---

### 2. [Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading (Amulet)](https://arxiv.org/abs/2608.10423)

**元信息**
| 属性 | 值 |
|------|-----|
| arXiv | [2608.10423](https://arxiv.org/abs/2608.10423) |
| 作者 | Sebastian Künzel et al. |
| 日期 | 2026-08-11 |

**核心贡献**
1. 提出稀疏、平铺、分层的中间场景表示 (cache)，用于高频帧外推
2. 显式光栅化存储可见几何，解决重投影技术的空洞问题
3. 预测性填充未来视角的着色信息，多帧摊销
4. 梯度驱动的调度器为每个 tile 分配生命周期

**技术方案**
- **核心思想**: 稀疏分层图像空间表示
- **外推倍数**: 60Hz → 240Hz（4倍）
- **性能**: 4K 分辨率下达 250Hz，与 DLSS/神经流方法竞争
- **优势**: 非神经方法，显式处理遮挡，无幻觉

**与 DLSS 对比**
| 指标 | Amulet | DLSS/神经流 |
|------|--------|-------------|
| 方法 | 稀疏分层光栅化 | 深度学习超分 |
| 空洞处理 | 显式几何 | 可能幻觉 |
| 计算开销 | 可预测 | 不可预测 |
| 质量 | 竞争性 | SOTA |

**推荐度**: ⭐⭐⭐⭐
**实现难度**: 高（需分层渲染管线 + 调度器）
**标签**: #渲染 #实时渲染 #帧外推 #光栅化 #DLSS

---

### 3. [Blue Noise as a Lattice Gibbs Ensemble](https://arxiv.org/abs/2608.13446)

**元信息**
| 属性 | 值 |
|------|-----|
| arXiv | [2608.13446](https://arxiv.org/abs/2608.13446) |
| 作者 | Zhuoran Yi et al. |
| 日期 | 2026-08-13 |

**核心贡献**
1. 将蓝噪声生成建模为二元格点占据率的 Gibbs 分布采样
2. 使用"Coupling Towards The Past"追踪马尔可夫链，倒向截断固定深度
3. 证明 tile 输出与全域生成位相同
4. 内存由 tile 大小决定而非输出大小

**技术方案**
```math
p(x) \propto \exp(-\sum_{i<j} V_{ij}(x_i, x_j))
```
- **能量函数**: 成对排斥相互作用
- **采样方法**: 倒向马尔可夫链
- **并行性**: tile 间无通信，可独立生成

**渲染应用**
- 自适应 stippling (14K)
- 多类扩展
- 重要性采样分布生成

**推荐度**: ⭐⭐⭐⭐
**实现难度**: 中（蒙特卡洛方法）
**标签**: #渲染 #采样 #蓝噪声 #蒙特卡洛

---

## 📰 ACM Digital Library 近期相关论文

### Real-Time Rendering with a Neural Irradiance Volume
- **来源**: Computer Graphics Forum, 2026-04-15
- **核心**: 神经辐照度体积实现实时全局光照
- **相关搜索**: Deng & Han, "TransGI: Real-Time Dynamic Global Illumination"

### Including Reflections in Real-Time Voxel-Based Global Illumination
- **来源**: Computers and Graphics
- **核心**: 包含反射的实时体素全局光照，优于 SOTA 工业/学术方法

---

## 🔗 SIGGRAPH 2026 动态

### PSSR 2.0 (PlayStation 超分辨率 2.0)
- **来源**: Digital Foundry (SIGGRAPH 2026 演讲报道)
- **内容**: Sony 工程师披露 PSSR 2.0 技术细节
- **相关问题**: 解决了"vanishing gradient"问题，在树叶和低频光照细节（如光线追踪全局光照 RTGI）上更稳定

---

## 📅 本次未覆盖（已往期记录）

- 2608.08672: 自适应体积参数化 (3D 流形)
- 2608.08986: 运动拼接 (Rodrigues 向量空间)
- 2608.12697: 四次 Overhauser 曲面 (CAGD)
- 2608.11100: WildFireGS (Gaussian Splatting 火灾模拟)

---

## 📁 笔记文件

本次创建:
- `2026-08-15_Hybrid-Neural-Microfacet-BRDF.md`
- `2026-08-15_Amulet-Frame-Extrapolation.md`
- `2026-08-15_Blue-Noise-Gibbs-Ensemble.md`

---

*🥬 生菜 · 2026-08-15 14:04 UTC*
