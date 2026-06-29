# 每日论文搜索报告 - 流体渲染领域

**日期**: 2026-06-29
**Agent**: 豆苗 (Doumiao)
**时间**: 14:12 UTC

---

## 搜索摘要

### 搜索范围
- **arXiv cs.GR**: 最近 7 天提交 (2026-06-23 ~ 2026-06-29)
- **SIGGRAPH 2026**: 已接收论文
- **SIGGRAPH Asia 2026**: 征稿中 (2026-12-01~04, Kuala Lumpur)

### 关键词
`fluid rendering`, `water rendering`, `smoke rendering`, `fire simulation`, `ocean rendering`, `particle system`, `volume rendering`

### 搜索结果

本次搜索共发现 **41 篇** arXiv cs.GR 论文。经过筛选，与流体渲染直接或间接相关的论文如下：

---

## 流体渲染相关论文

### 1. Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.27604](https://arxiv.org/abs/2606.27604) |
| **日期** | 2026-06-25 |
| **会议** | Eurographics Symposium on Rendering (EGSR) 2026 |
| **作者** | Carlos Aliaga et al. |

**摘要**:
提出一种皮肤光谱光学反演方法，用于路径追踪渲染中的次表面散射。传统方法依赖介质均匀化，通过反照率反演获得光学参数存在不准确问题。本方法提出 **mixture-of-media representation**，将多层皮肤外观近似为三种不相关介质的混合散射。通过链式神经解码器从单一 RGB 漫反射反照率预测完整光谱皮肤散射参数。

**关键技术**:
- 光谱光学反演
- Mixture-of-media representation
- 链式神经解码器
- 随机游走路径追踪器

**与流体渲染关系**: ⭐⭐⭐
次表面散射技术可应用于半透明流体（如牛奶、水果汁）的渲染

**URL**: https://arxiv.org/abs/2606.27604

---

### 2. Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.21753](https://arxiv.org/abs/2606.21753) |
| **日期** | 2026-06-20 |
| **会议** | CVPR 2026 Findings |
| **作者** | - |

**摘要**:
3D Gaussian Splatting (3DGS) 已达到最先进的照片级真实感渲染，但表示差距阻止了这些资产在物理上交互。本工作提出 **Representation Abstraction Framework**，将 3DGS、虚拟网格和流体转换为统一物理粒子集，实现场景级异构多求解器物理模拟。

**关键技术**:
- Representation Abstraction Framework
- 统一物理粒子集
- 求解器无关物理内核
- 3DGS 资产非刚性变形

**与流体渲染关系**: ⭐⭐⭐⭐
首次实现 3DGS 资产与流体、网格的复杂双向交互

**URL**: https://arxiv.org/abs/2606.21753

---

### 3. Extracting Neural Materials from Multi-view Images

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.26715](https://arxiv.org/abs/2606.26715) |
| **日期** | 2026-06-25 (v2) |
| **会议** | CVPR 2026 |
| **作者** | Jon Hasselgren et al. |

**摘要**:
神经材质可以表示复杂镜面反射和散射效果，但获取和创作此类材质仍然困难。提出 **NeuMatEx**，一种可微分逆渲染方法，从图像中提取空间变化的神经材质。训练 Large Material Reconstruction Model (LMRM) 直接从图像预测基础颜色、神经材质潜在向量和不确定性引导。

**关键技术**:
- 可微分逆渲染
- Large Material Reconstruction Model (LMRM)
- 神经材质提取
- 路径追踪优化

**与流体渲染关系**: ⭐⭐⭐
神经材质技术可应用于复杂流体材质的提取与渲染

**URL**: https://arxiv.org/abs/2606.26715

---

### 4. Hierarchical Progressive Rendering for Immediate Feedback

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.26612](https://arxiv.org/abs/2606.26612) |
| **日期** | 2026-06-25 |
| **作者** | Rafael Padilla et al. |

**摘要**:
**Hierarchical Progressive Rendering (HiPR)** 是一种动态渲染调度算法，使交互式路径追踪终于有实时感。与大多数渲染器在场景更改后重新计算整个帧不同，HiPR 根据从更改元素向外扩展的光路依赖层次结构更新部分像素，基于感知影响优先排序。

**关键技术**:
- 层次化渐进渲染
- 光路依赖层次结构
- 感知影响优先排序
- 无偏结果收敛

**与流体渲染关系**: ⭐⭐⭐
渲染加速技术，可应用于复杂流体场景的实时预览

**URL**: https://arxiv.org/abs/2606.26612

---

## 其他相关论文（3DGS/渲染方向）

### 5. MeshFlow: Mesh Generation with Equivariant Flow Matching

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.23489](https://arxiv.org/abs/2606.23489) |
| **日期** | 2026-06-22 |
| **会议** | SIGGRAPH 2026 |
| **作者** | Qi Sun et al. |

**摘要**:
MeshFlow 使用等变最优传输流匹配模型直接生成三角形网格作为三角汤，避免将网格序列化为长的自回归序列。18倍加速比。

---

### 6. Compact Base Meshes for Displacement Mapping using Triangle Jacobians

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.22880](https://arxiv.org/abs/2606.22880) |
| **日期** | 2026-06-22 |
| **会议** | SIGGRAPH 2026 |
| **作者** | Congyi Zhang et al. |

**摘要**:
提出 DJM (Displacement Jacobian Metric) 方法构建位移映射的紧凑基础网格，使用 Jacobian 引导基础网格计算。

---

### 7. White-Box 3DGS Construction via Plenoptic Sampling

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.21898](https://arxiv.org/abs/2606.21898) |
| **日期** | 2026-06-21 |

**摘要**:
提出 Mesh2GS 框架，基于 plenoptic sampling 理论从网格直接构建 3DGS，实现 Nyquist 级全局光照渲染质量。

---

## SIGGRAPH/SIGGRAPH Asia 动态

### SIGGRAPH 2026
- 会议已结束（2026年8月）
- 论文列表: https://kesen.realtimerendering.com/sig2026.html

### SIGGRAPH Asia 2026
- **时间**: 2026-12-01 ~ 04
- **地点**: Kuala Lumpur, Malaysia
- **状态**: 征稿中
- 官网: https://asia.siggraph.org/2026/

---

## 本次搜索未发现直接相关的论文

本次搜索期间 (2026-06-23 ~ 2026-06-29)，arXiv cs.GR 类别中未发现直接关于以下主题的论文：
- `fluid rendering` 精确匹配
- `water rendering` 精确匹配
- `smoke rendering` 精确匹配
- `fire simulation` 精确匹配
- `ocean rendering` 精确匹配

现有论文主要集中在：
- 3D Gaussian Splatting (3DGS) 相关
- 网格生成和处理
- 材质/纹理相关
- 渲染加速技术
- 人体/化身模拟

---

## 技术趋势分析

### 1. 3DGS + 物理模拟 持续火热
Scene-Level Heterogeneous Physics Simulation 论文延续了 3DGS 物理交互的研究方向，预计会成为未来流体渲染的重要技术路径。

### 2. 神经材质兴起
NeuMatEx 等工作表明神经材质提取是一个活跃的研究方向，对流体材质的自动获取有潜在价值。

### 3. 渲染加速
HiPR 等渐进式渲染方法对复杂流体场景的实时预览有重要意义。

---

## 下一步建议

1. 持续关注 CVPR 2026 的后续论文
2. 跟踪 3DGS + 物理模拟方向
3. 关注 Eurographics/EGSR 2026 的渲染论文
4. 为 SIGGRAPH Asia 2026 准备投稿

---

## 参考链接

- [arXiv cs.GR recent](https://arxiv.org/list/cs.GR/recent)
- [SIGGRAPH 2026 Papers](https://kesen.realtimerendering.com/sig2026.html)
- [SIGGRAPH Asia 2026](https://asia.siggraph.org/2026/)

---

*由 Doumiao (豆苗) 自动生成于 2026-06-29 14:12 UTC*