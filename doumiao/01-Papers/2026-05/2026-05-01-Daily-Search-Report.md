# Daily Paper Search Report — 2026-05-01

## 搜索概况
- **搜索时间**: 2026-05-01 14:18 UTC
- **搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH/SIGGRAPH Asia 会议论文
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## arXiv cs.GR 新论文 (2026-05-01)

今日 cs.GR 新提交共 **12 篇**（含 4 篇交叉提交、4 篇替换更新），经筛选无直接流体渲染相关论文。

### 新增论文摘要

| ID | 标题 | 领域 |
|---|---|---|
| 2604.27871 | Diffusion Rendering for Relightable Expressive Avatars | 虚拟化身/光照 |
| 2604.27701 | Line Segment Clipping using Quadrilateral Concavity and Convexity | 几何算法 |
| 2604.27572 | Curve-Guided Gaussian Splatting for Reconstructing Sand Painting Processes | 3DGS/艺术渲染 |
| 2604.27329 | Generating Simple Quad Layouts via Chart Distance Fields | 网格重化 |

### 交叉提交 (相关领域)

| ID | 来源 | 领域 |
|---|---|---|
| 2604.28016 | cs.CV | Neural Rendering |
| 2604.27996 | cs.AI | — |
| 2604.27367 | cs.RO | Robotics |
| 2604.27361 | cs.CV | — |

---

## 重要论文深入分析

### 1. 3D Gaussian Rendering Made Exact and Efficient for Generic Cameras (3DGEER)

- **ID**: arXiv:2505.24053 (v3, 2026-03-12)
- **会议**: ICLR 2026
- **领域**: 3DGS / 粒子渲染

**核心创新**:
- 提出 3DGEER：几何精确高效的 Gaussian 渲染框架
- 从第一性原理推导出 ray-Gaussian 密度积分的闭式表达式
- 实现任意相机模型下的精确前向渲染和可微分优化

**技术亮点**:
1. **Particle Bounding Frustum (PBF)**: 无 BVH 遍历的紧凑 ray-Gaussian 关联
2. **Bipolar Equiangular Projection (BEAP)**: 统一 FoV 表示，加速关联，改善重建质量

**性能指标**:
- 比现有射影精确 ray-based 基线快 **5x**
- 在针孔和鱼眼数据集上所有指标优于先前方法
- 泛化到训练中未见过的更宽 FoV

> 🔗 PDF: https://arxiv.org/pdf/2505.24053
> 🔗 代码: https://github.com/boschresearch/3dgeer

**引用**:
```bibtex
@article{huang20253dgeer,
  title={3D Gaussian Rendering Made Exact and Efficient for Generic Cameras},
  author={Zixun Huang},
  year={2026},
  eprint={2505.24053},
  archivePrefix={arXiv},
  note={ICLR 2026}
}
```

---

### 2. Physics-Informed Temporal U-Net for High-Fidelity Fluid Interpolation

- **ID**: arXiv:2604.23372
- **发表**: 2026-04-25
- **领域**: 流体模拟 / 深度学习
- **交叉**: cs.CV, physics.flu-dyn, cs.LG

**核心创新**:
- Temporal U-Net 架构解决稀疏时序观测的高保真流体重建
- 集成 VGG-based perceptual loss + Physics-Informed Bridge 模块
- 引入 time-weighted feature blending 和 t(1-t) 抛物线边界条件
- 解决标准深度学习插值的空间模糊和时间跳变问题

**性能指标**:
- MAE: **0.015** vs L1 baseline **0.085** (提升 5.7x)
- 成功保留高频率湍流细节
- PSD 分析验证结构保真度

**技术亮点**:
> 通过物理信息桥接机制和端点一致性约束，确保观察锚点间的平滑过渡

---

### 3. Real-time Neural Six-way Lightmaps (回顾)

- **ID**: arXiv:2604.03748
- **发表**: 2026-04-04
- **领域**: 烟雾渲染 / 实时参与介质

**核心创新**:
- 神经六向光贴图方法，平衡动态效果和视觉真实感
- 从相机视角生成引导图 (ray marching，大采样距离)
- 给定引导图，训练神经网络预测对应六向光贴图
- 可无缝集成到现有游戏引擎管线

**性能指标**:
- 整体 pipeline: **10 ms/帧** (7ms 模拟 + 3ms 渲染)
- 支持烟雾-障碍物交互、相机移动、光照变化

**引用**:
```bibtex
@article{huang2026realtimeneural,
  title={Real-time Neural Six-way Lightmaps},
  author={Tao Huang},
  year={2026},
  eprint={2604.03748},
  archivePrefix={arXiv}
}
```

---

## SIGGRAPH / SIGGRAPH Asia 最新动态

### SIGGRAPH Asia 2025 流体相关论文

从 DBLP 检索到以下流体/渲染相关论文:

1. **Implicit Position-Based Fluids** — Elie Diaz, Jerry Hsu 等
   - 隐式位置流体方法
   - 来源: SIGGRAPH Asia 2025

2. **Stroke-based Painterly Rendering of Participating Media** (SIGGRAPH 2025)
   - 支持 smoke, fire, clouds 风格化渲染
   - 笔画属性转移：颜色、宽度、长度、方向

3. **NeLiF: Neural Lighting Function Generation for Real-Time Indoor Rendering**
   - 神经光照函数生成 (SIGGRAPH Asia 2025)

### 历史亮点

- **UC San Diego 团队** (SIGGRAPH Asia 2024)
  - 高保真流体动力学计算机生成图像方法
  - 获 Best Paper Honorable Mention

---

## Gaussian Splatting + Fluid 前沿论文

### 3D Dynamic Fluid Assets from Single-View Videos

- **ID**: arXiv:2503.00868 (v2, 2025-10)
- **方法**: 生成式 Gaussian Splatting 从单目视频重建动态流体

**技术要点**:
- 生成方法以低分辨率产生 Gaussian，可能限制谐波特征应用
- 直接 splatting 渲染最适合**粘性流体或外观均匀的流体**

### Gaussian Splashing (2024)

- **ID**: arXiv:2401.15318
- **方法**: Gaussian Splatting + Position-Based Dynamics (PBD) 统一粒子系统
- 固流体一致渲染、视图合成、动力学

---

## 本日结论

**搜索结果**: 最近24小时 arXiv cs.GR 无新增直接流体渲染论文。Physics-Informed Temporal U-Net (2604.23372) 属流体相关但主要发表在 physics.flu-dyn 分类。

**重要发现**:
- 3DGEER (2505.24053) 提出精确的 Gaussian 渲染方法，与流体粒子渲染高度相关
- Temporal U-Net (2604.23372) 在流体插值中展示深度学习+物理的结合潜力

**下周关注方向**:
- SIGGRAPH 2026 论文征集 (关注截稿日期)
- Neural Lightmaps 方向 (2604.03748) 的后续研究
- 3DGS + Fluid 的交叉应用

---

## 知识库同步状态

- ✅ 笔记保存: `~/knowledge-vault/doumiao/01-Papers/2026-05/2026-05-01-Daily-Search-Report.md`
- ▶️ 执行 git-sync: 待运行 `.scripts/git-sync.sh`

---
*🌱 鸭血 — 流体渲染研究助手 | 每日 02:00 自动执行*