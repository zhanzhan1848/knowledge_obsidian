# 每日流体渲染论文追踪 — 2026-05-17

> 🌱 豆苗 · 计算机图形学流体渲染专家  
> 搜索时间: 2026-05-17 14:15 UTC  
> 搜索范围: arXiv cs.GR (最近24h) + SIGGRAPH 2026 / SIGGRAPH Asia 2026  
> 关键词: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📋 搜索结果概览

最近24小时内，arXiv cs.GR 分类下无直接匹配流体渲染/烟雾/火焰/水面/粒子/体积渲染的论文。
间接相关论文 2 篇，流体/物理模拟背景论文 1 篇。

---

## 📄 相关论文

### 1. Smoke-GS: 3D Smoke Scene Reconstruction (间接相关)

- **arXiv**: [2604.05687](https://arxiv.org/abs/2604.05687)
- **类别**: cs.CV (cross-list to cs.GR via NTIRE 2026 Challenge)
- **作者**: Xinye Zheng, Fei Wang, Yiqi Nie, Kun Li, Junjie Chen 等 (Hefei University of Technology, etc.)
- **发布日期**: 2026-04 (Submitted)
- **URL**: https://arxiv.org/html/2604.05687

#### 摘要
烟雾场景的3D重建是一个难点，因为烟雾引入强散射、视角相关外观变化和严重的跨视图一致性退化。论文提出 **Smoke-GS**，一个结合视觉先验与高效3D场景建模的框架：
- 使用 **Nano-Banana-Pro** 增强烟雾退化图像
- 开发 **Smoke-GS**，一种**介质感知的3D Gaussian Splatting框架**
- 引入**轻量级视角相关介质分支**（lightweight view-dependent medium branch）捕捉烟雾引起的视角相关外观变化
- 在3D Gaussian Splatting渲染效率基础上提升了对烟雾诱导退化的鲁棒性

#### 核心技术
| 技术点 | 说明 |
|--------|------|
| 介质感知3DGS | 在Gaussian Splatting基础上加入烟雾介质建模 |
| 视角相关外观分支 | 编码像素射线方向，预测介质参数 |
| 图像增强 | 使用Nano-Banana-Pro对烟雾图像去噪增强 |

#### 创新点
- 将烟雾散射物理模型与3DGS渲染管线结合
- 联合建模直接场景辐射与散射分量
- 用于NTIRE 2026 3D烟雾重建挑战赛Track 2

#### 流体渲染关联度: ⭐⭐⭐⭐
> 烟雾渲染直接相关，涉及体积散射介质建模、Ray Marching式介质渲染

---

### 2. BlitzGS: City-Scale Gaussian Splatting (背景相关)

- **arXiv**: [2605.13794](https://arxiv.org/abs/2605.13794)
- **类别**: cs.GR
- **作者**: Zhongtao Wang 等
- **发布日期**: 2026-05-13 (May)
- **URL**: https://github.com/AkierRaee/BlitzGS

#### 摘要
**BlitzGS** 是一个分布式3DGS框架，通过三层耦合策略减少城市级重建的高斯工作量：
- **系统层**: 按索引奇偶分片而非空间块，避免跨块可见性冗余
- **模型层**: 调度重要性评分传递，收缩全局高斯种群
- **视图层**: 距离LOD门控 + 重要性剔除

大规模基准测试中达到 **数量级加速**，城市级场景在数十分钟内完成训练。

#### 核心贡献
- 分布式并行渲染管线
- 重要性驱动的LOD细节层次
- 跨GPU路由优化

#### 流体渲染关联度: ⭐⭐
> 非直接流体渲染，但Gaussian Splatting在大规模场景重建中与体积渲染有间接关联

---

### 3. Hierarchical Transformer Preconditioner for Physics Simulation (背景相关)

- **arXiv**: [2605.13343](https://arxiv.org/abs/2605.13343)
- **类别**: cs.GR (Physics Simulation)
- **作者**: (多机构联合)
- **发布日期**: 2026-05 (Updated v2)
- **URL**: https://arxiv.org/html/2605.13343v2

#### 摘要
神经预条件子用于实时物理模拟，但往往无法高效捕捉长程耦合。提出**Hierarchical Transformer Preconditioner**：
- 锚定于弱容许性 **H-matrix 分区**
- 多尺度结构先验（稠密对角叶 + 粗化非对角块）
- 低秩远场因子 + highway connections 跨 transformer 深度传播上下文
- **cosine-Hutchinson探针目标** 优化MA与收敛关键谱子空间的角度对齐

在刚性多相Poisson系统（密度对比高达100:1）上达到 **~143-21 fps** (N=1024-16384)，N=8192时 **17.9ms/帧**。

#### 物理仿真关联度: ⭐⭐⭐⭐
> 神经预条件子加速流体模拟求解器，直接影响流体模拟效率

---

## 🔍 SIGGRAPH 2026 动态

### 发现的流体渲染相关论文
- **GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction** — SIGGRAPH 2026 Technical Paper
  - 来源: s2026.conference-schedule.org 贡献者页面
  - 混合物理-光学3DGS烟雾重建，直接关联烟雾渲染

- **Feature-Driven Water Motion Recovery** — SIGGRAPH 2026 (Wētā FX)
  - 作者: Sam Cole, Nicholas Illingworth, Alexey Stomakhin, Sean Flynn
  - 特色驱动的时序一致水流恢复，用于稳定参数化建模与模拟耦合
  - 来源: beforesandafters.com 2026-05-14

> ⚠️ SIGGRAPH 2026完整论文列表尚未公开释出，以上为搜索发现的预告信息

---

## 📝 下一步行动

1. 持续监控SIGGRAPH 2026论文列表正式发布
2. 追踪 GauSmoke 和 Water Motion Recovery 论文正式发表
3. 关注NTIRE 2026烟雾挑战赛后继研究

---

## 📁 知识库结构

```
~/knowledge-vault/doumiao/
├── 01-Papers/
│   └── 2026-05-17/
│       └── daily-paper-log-2026-05-17.md  (本文档)
├── 02-Tech/
│   ├── 体积渲染/
│   ├── 烟雾渲染/
│   └── 粒子系统/
├── 03-Reports/
└── .scripts/git-sync.sh
```

---

*🌱 豆苗 · 流体渲染知识管理系统 · 2026-05-17*