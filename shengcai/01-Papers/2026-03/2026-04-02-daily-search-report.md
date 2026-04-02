---
tags: [渲染, 论文, 每日搜索, 2026]
date: 2026-04-02
status: 已分析
---

# 🥬 每日渲染论文搜索报告 — 2026-04-02

## 搜索范围
- **来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, neural rendering
- **时间**: 最近1个月

---

## 📄 Generalized Non-Exponential Gaussian Splatting

| 属性 | 值 |
|------|-----|
| **标题** | Generalized non-exponential Gaussian splatting |
| **作者** | Adrian Jarabo et al. |
| **会议** | arXiv:2603.02887 [cs.GR] |
| **链接** | [arXiv:2603.02887](https://arxiv.org/abs/2603.02887) |

### 核心贡献
1. **非指数透射率模型**：将 3DGS 泛化到非指数 alpha-blending 算子家族，支持亚线性/线性/超线性透射率变体
2. **减少 Overdraw**：通过非指数透射率，远处基元贡献衰减更快，**在光线追踪渲染器上实现 4× 加速**
3. **保持质量**：新变体与原始 3DGS 质量相近

### 技术方案
传统 3DGS 基于指数透射率 $T(t) = e^{-\int_0^t \sigma(s)ds}$。本文推广到二次透射率形式：
```math
T(t) = e^{-at - \frac{1}{2}bt^2}
```
- $b < 0$（亚线性）：快于指数衰减
- $b > 0$（超线性）：慢于指数衰减

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（透明度模型泛化概念新颖）
- **实用性**: ⭐⭐⭐⭐⭐（4× 加速直接提升渲染效率）
- **难度**: 中（基于 3DGS 框架扩展）

### 标签
#3DGS #光线追踪 #透明度模型 #加速渲染 #非指数

---

## 📄 Ref-DGS: Reflective Dual Gaussian Splatting

| 属性 | 值 |
|------|-----|
| **标题** | Ref-DGS: Reflective Dual Gaussian Splatting |
| **作者** | Ningjing Fan et al. |
| **会议** | arXiv:2603.07664 [cs.CV/cs.GR] |
| **链接** | [arXiv:2603.07664](https://arxiv.org/abs/2603.07664) |
| **项目页** | [Ref-DGS](https://straybirdflower.github.io/Ref-DGS/) |

### 核心贡献
1. **双 Gaussian 场景表示**：几何 Gaussians（曲面重建）+ 局部反射 Gaussians（近场镜面交互），**无需显式光线追踪**
2. **全局环境反射场**：建模远场镜面反射
3. **物理感知自适应混合着色器**：融合全局/局部反射特征
4. **训练速度远快于 ray-based Gaussian 方法**

### 技术方案
- 几何 Gaussians：用于表面重建
- 局部反射 Gaussians：捕获近场高光，无需 ray tracing
- 着色器融合两类特征预测镜面辐射

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（双 Gaussian 解耦思路新颖）
- **实用性**: ⭐⭐⭐⭐（避免 ray tracing 计算开销）
- **难度**: 中高

### 标签
#镜面反射 #3DGS #光线追踪替代 #曲面重建 #PBR

---

## 📄 PolGS++: Physically-Guided Polarimetric Gaussian Splatting

| 属性 | 值 |
|------|-----|
| **标题** | PolGS++: Physically-Guided Polarimetric Gaussian Splatting for Fast Reflective Surface Reconstruction |
| **作者** | Yufei Han et al. |
| **会议** | arXiv:2603.10801 [cs.CV] |
| **链接** | [arXiv:2603.10801](https://arxiv.org/abs/2603.10801) |

### 核心贡献
1. **偏振 BRDF (pBRDF) 整合**：显式解耦漫反射/镜面分量，物理基础反射建模
2. **深度引导可见性掩码**：无需 ray-tracing intersections，实现 AoP-based tangent-space consistency constraints
3. **训练仅需约 10 分钟**

### 技术方案
- pBRDF 模型提供物理约束
- 深度引导可见性掩码避免光线追踪开销
- 偏振线索增强几何恢复

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（偏振 + 3DGS 融合）
- **实用性**: ⭐⭐⭐⭐⭐（10 分钟训练，SOTA 效果）
- **难度**: 中高

### 标签
#偏振 #3DGS #PBR #镜面反射 #曲面重建

---

## 📄 CoMe: Confidence-Based Mesh Extraction from 3D Gaussians

| 属性 | 值 |
|------|-----|
| **标题** | Confidence-Based Mesh Extraction from 3D Gaussians |
| **作者** | Lukas Radl et al. |
| **会议** | arXiv:2603.24725 [cs.CV/cs.GR] |
| **链接** | [arXiv:2603.24725](https://arxiv.org/abs/2603.24725) |
| **项目页** | [CoMe](https://r4dl.github.io/CoMe/) |

### 核心贡献
1. **自监督置信度框架**：可学习置信度值动态平衡光度学和几何监督
2. **颜色/法线方差损失**：惩罚每基元视角间颜色和法线差异，改善曲面提取
3. **D-SSIM 解耦**：改进去外观模型
4. **无界网格上 SOTA**，保持 3DGS 效率

### 技术方案
```math
\mathcal{L}_{confidence} = \sum_i c_i \cdot \mathcal{L}_{geo}(i)
```
可学习置信度 $c_i$ 动态调整几何监督权重。

### 创新性评估
- **创新性**: ⭐⭐⭐⭐（置信度框架自监督思路新颖）
- **实用性**: ⭐⭐⭐⭐⭐（mesh extraction 实用价值高）
- **难度**: 中

### 标签
#3DGS #网格提取 #自监督 #曲面重建

---

## 📄 R-PGA: Robust Physical Adversarial Camouflage via Relightable 3D Gaussian Splatting

| 属性 | 值 |
|------|-----|
| **标题** | Robust Physical Adversarial Camouflage Generation via Relightable 3D Gaussian Splatting |
| **作者** | Tianrui Lou et al. |
| **会议** | arXiv:2603.26067 [cs.CV/cs.AI]（Under review） |
| **链接** | [arXiv:2603.26067](https://arxiv.org/abs/2603.26067) |

### 核心贡献
1. **Relightable 3DGS 前向渲染**：photo-realistic 重建 + 物理解耦属性（材质/光照分离）
2. **混合渲染管线**：3DGS 前向渲染主体 + 预训练图像翻译模型合成背景
3. **HPCM 模块**：主动挖掘最差物理配置，扁平化 loss landscape
4. **鲁棒性**：在多样化几何和辐射配置下有效

### 技术方案
- 3DGS 解耦材质固有属性和光照
- Hard Physical Configuration Mining 提升鲁棒性
- 在 CARLA 上验证泛化到真实场景

### 创新性评估
- **创新性**: ⭐⭐⭐（应用导向）
- **实用性**: ⭐⭐⭐⭐（自动驾驶安全评估）
- **难度**: 中

### 标签
#3DGS #重光照 #PBR #对抗攻击 #自动驾驶

---

## 本次发现技术总结

### 3D Gaussian Splatting 仍是渲染领域绝对主角
本次检索到的论文几乎全部围绕 3DGS 展开，说明该技术仍处于快速发展期：

| 论文 | 核心问题 | 解决方案 | 关键性能 |
|------|---------|---------|---------|
| **Non-Exponential GS** | overdraw 过多 | 非指数透射率模型 | **4× 加速** |
| **Ref-DGS** | 镜面反射难建模 | 双 Gaussian + 无 ray tracing | 训练快 |
| **PolGS++** | 反射曲面重建 | 偏振 BRDF + 深度引导掩码 | 10min 训练 |
| **CoMe** | mesh 提取不精确 | 自监督置信度框架 | SOTA 精度 |
| **RadioGS** | 间接光照监督缺失 | 辐射一致性约束 | <10ms 渲染 |
| **3DGEER** | 大 FoV 精度差 | 闭合形式积分 + PBF/BEAP | **5× 加速** |

### 重要趋势
1. **光线追踪替代方案**：多个工作试图用 rasterization-based 方法（而非 ray tracing）处理镜面反射、全局光照等问题
2. **偏振线索**：PolGS++ 和 PhyGaP（上次报告）都利用偏振信息增强曲面/材质重建
3. **非指数透明度模型**：对 3DGS 核心 alpha-blending 的数学推广，4× 加速潜力大

### 推荐关注
- **Non-Exponential GS**：4× 渲染加速，适用于需要高帧率的实时渲染场景
- **3DGEER**：精确数学推导 + 无 BVH 高效关联，学术价值高
- **CoMe**：mesh extraction 精确化对游戏/影视管线有直接价值

### 已同步至知识库
- `2026-03/2026-04-02-Generalized-Non-Exponential-Gaussian-Splatting.md`
- `2026-03/2026-04-02-RadioGS-Radiometrically-Consistent-Gaussian-Surfels.md`
- `2026-03/2026-04-02-3DGEER-Exact-Efficient-Gaussian-Rendering.md`
- `2026-03/2026-04-02-Ref-DGS-Reflective-Dual-Gaussian-Splatting.md`
- `2026-03/2026-04-02-PolGS-Physically-Guided-Polarimetric-Gaussian-Splatting.md`
- `2026-03/2026-04-02-CoMe-Confidence-Based-Mesh-Extraction.md`
- `2026-03/2026-04-02-daily-search-report.md`

---
*🥬 生菜 · 每日论文搜索 · 2026-04-02 14:00 UTC*
