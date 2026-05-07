# 每日流体渲染论文搜索报告

**日期**: 2026-05-07
**时间**: 14:13 UTC
**Agent**: 豆苗 (doumiao)
**搜索范围**: arXiv cs.GR + SIGGRAPH/SIGGRAPH Asia

---

## 📊 搜索结果概览

| 来源 | 论文数 | 最近24h |
|------|--------|---------|
| arXiv cs.GR (fluid/smoke/fire/water/ocean) | 274 | 0 |
| arXiv cs.GR (扩展关键词) | 1031 | 0 |
| SIGGRAPH 2026 | 无数据 | - |

**结论**: 过去24小时内 (2026-05-06 ~ 2026-05-07 14:13 UTC)，arXiv cs.GR 分类下无新的流体渲染相关论文发表。

---

## 📚 最近一周相关论文 (2026-05-01 ~ 2026-05-07)

### 2026-05-04 (2篇)

#### 1. Orbit-Space Particle Flow Matching
- **arXiv ID**: 2605.02222
- **类别**: cs.GR (primary), cs.CV
- **发表**: 2026-05-04
- **作者**: Sinan Wang, Jinjin He, Shenyifan Lu, Ruicheng Wang, Greg Turk, Bo Zhu
- **关键词**: PARTICLE SYSTEM, GENERATIVE MODELING, FLOW MATCHING
- **摘要**: 提出 OGPP (Orbit-Space Geometric Probability Paths)，一个粒子原生 flow-matching 生成框架。核心洞察：(i) 粒子定义在排列对称性下不变，匿名索引会膨胀 per-index 目标方差；(ii) 粒子生活在物理空间中，flow 终端速度具有物理意义，可编码几何属性（如表面法线）。
- **创新点**: 
  - Orbit-space canonicalization of probability-path terminal endpoint
  - Particle index embeddings for role specialization
  - Arc-length-aware terminal velocities 生成法线
- **评估**: 在 minimal-surface benchmarks 上单步推理误差降低两个数量级；ShapeNet 上以 5x 更少步数达到 SOTA；法线和重建效果与 6D 生成器相当
- **URL**: https://arxiv.org/abs/2605.02222v1

#### 2. Manifold k-NN: Accelerated k-NN Queries for Manifold Point Clouds
- **arXiv ID**: 2605.02224
- **类别**: cs.CG (primary), cs.GR
- **发表**: 2026-05-04
- **作者**: Pengfei Wang, Qinghao Guo, Haisen Zhao, Shiqing Xin, Shuangmin Chen, Changhe Tu, Wenping Wang
- **关键词**: k-NN, POINT CLOUD, GEOMETRY PROCESSING
- **摘要**: 将 DP-NNS 框架推广到任意 k-NN 查询，用于流形对齐数据。在 volume-to-surface 查询场景下实现 1x-10x 加速
- **URL**: https://arxiv.org/abs/2605.02224v1

### 2026-05-03 (1篇)

#### 3. GETA-3DGS: Automatic Joint Structured Pruning and Quantization for 3D Gaussian Splatting
- **arXiv ID**: 2605.02086
- **类别**: cs.LG (primary), cs.AI, cs.GR, eess.IV
- **发表**: 2026-05-03
- **作者**: Baobing Zhang, Wanxin Sui
- **关键词**: 3DGS, COMPRESSION, PRUNING, QUANTIZATION
- **备注**: 与流体渲染间接相关，3DGS 可用于流体场景建模和渲染
- **URL**: https://arxiv.org/abs/2605.02086v1

---

## 🔥 重点论文详解

### FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

| 属性 | 值 |
|------|-----|
| **arXiv ID** | 2605.00177v1 |
| **发表** | 2026-04-30 |
| **会议** | ICLR 2026 |
| **类别** | cs.GR, cs.CV |
| **作者** | Qianfan Shen, Ningxiao Tao, Qiyu Dai, Tianle Chen, Minghan Qin, Yongjie Zhang, Mengyu Chu, Wenzheng Chen, Baoquan Chen |

#### 核心问题
传统 CFD 和图形管线能产生逼真火焰效果，但依赖手工几何、专家调参和劳动密集型工作流，难以扩展到真实场景。3DGS 能重建高质量真实场景，但缺乏燃烧的物理基础。

#### 解决方案：FieryGS
将物理精确且用户可控的燃烧模拟和渲染与 3DGS 管线集成，实现真实场景的火 Synthesis。

#### 三大模块
1. **多模态 LLM-based 物理材质推理** - 自动推断场景中材质的燃烧属性
2. **高效体积燃烧模拟** - 体积燃烧模拟器
3. **统一渲染器** - 火焰与 3DGS 的统一渲染器

#### 支持现象
- 火焰传播 (flame propagation)
- 烟雾扩散 (smoke dispersion)
- 表面碳化 (surface carbonization)
- 用户可控制：火强度、气流、点火位置等燃烧参数

#### 实验结果
在室内外多样场景中，在视觉真实度、物理保真度和可控性上均优于所有基线方法。

#### 项目主页
https://pku-vcl-geometry.github.io/FieryGS/

---

## 📈 趋势分析

### 本周发现
1. **粒子系统生成模型兴起**: Orbit-Space Particle Flow Matching 表明粒子系统的生成模型（flow matching）成为新热点，可用于流体模拟数据生成
2. **3DGS + 物理模拟融合**: FieryGS 代表了 3DGS 与物理模拟融合的趋势，3DGS 不仅用于场景重建，也可用于流体渲染
3. **神经渲染管线整合**: 多篇论文尝试将神经渲染与体积效应（烟雾、火）结合

---

## 📋 后续行动
- [ ] 继续监控每日 arXiv cs.GR 更新
- [ ] 抓取 FieryGS 论文全文进行深度分析
- [ ] 追踪 ICLR 2026 流体渲染相关论文

---

*报告生成时间: 2026-05-07 14:13 UTC*