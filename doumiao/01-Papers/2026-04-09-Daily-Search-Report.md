# 每日论文搜索报告
**日期**: 2026-04-09
**时间**: 14:14 UTC
**搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH/SIGGRAPH Asia

## 搜索结果摘要

### arXiv cs.GR 新论文 (2026-04-09)
共 **2** 篇新投稿，**3** 篇交叉投稿，**4** 篇替换更新

### 相关论文发现

#### 🎯 直接相关: 烟雾渲染

**arXiv:2604.03748** | **Real-time Neural Six-way Lightmaps**
- **作者**: Tao Huang et al.
- **分类**: cs.GR, cs.CV
- **提交**: 2026-04-04
- **链接**: https://arxiv.org/abs/2604.03748

**核心创新**:
- 提出神经六向光照图方法，在动态性和视觉真实感之间取得平衡
- 首先生成引导图(guiding map)使用大采样距离的ray marching近似烟雾散射和轮廓
- 然后训练神经网络预测对应的六向光照图
- 支持烟雾-障碍物交互、相机移动、光照变化等实时交互

**技术要点**:
- 参与介质(participating media)渲染
- Ray marching with large sampling distance
- 神经网络预测光照图
- 游戏引擎管线集成

---

#### 🔬 间接相关: 科学可视化

**arXiv:2604.06358** | **Deformable Gaussian Splatting for Parameter Space Exploration of Ensemble Simulations**
- **作者**: Ziwei Li et al.
- **分类**: cs.GR, cs.AI
- **提交**: 2026-04-07
- **链接**: https://arxiv.org/abs/2604.06358

**核心创新**:
- GS-Surrogate: 基于可变形高斯散点的可视化代理模型
- 构建规范高斯场作为基础3D表示
- 通过参数条件化变形进行适配
- 支持等值面提取、传递函数编辑等可视化任务
- 可用于流体模拟ensemble数据的实时探索

---

### 其他 cs.GR 新论文 (不直接相关)

| ID | 标题 | 领域 |
|---|---|---|
| 2604.07177 | Real-time 3DGS under Constrained GPU Budgets | 3DGS性能优化 |
| 2604.05525 | CrowdVLA: Embodied Vision-Language-Action Agents | 人群模拟 |
| 2604.04244 | VisACD: GPU-Accelerated Approvex Decomposition | 碰撞检测 |
| 2604.03748 | Real-time Neural Six-way Lightmaps | **烟雾渲染** |
| 2604.03406 | SASAV: Self-Directed Agent for Scientific Viz | 科学可视化 |
| 2604.02141 | Topology-First B-Rep Meshing | 网格生成 |
| 2604.01551 | Palette-Based Color Grading for 3DGS | 3DGS颜色编辑 |

---

## 结论

最近24小时在 arXiv cs.GR 中发现 **1篇直接相关** 的流体渲染论文:

🩸 **Real-time Neural Six-way Lightmaps** — 烟雾渲染领域的实时神经渲染方法

GS-Surrogate 论文虽非直接流体渲染，但可作为流体ensemble可视化的参考技术。

---
*由 豆苗 (Doumiao) 自动生成 | 2026-04-09*
