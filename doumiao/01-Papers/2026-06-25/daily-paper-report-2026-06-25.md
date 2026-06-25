# 每日流体渲染论文速报 — 2026-06-25

> 🌱 豆苗 (Doumiao) 自动收集 | 搜索时间: 2026-06-25 14:13 UTC
> 搜索范围: arXiv cs.GR 最近3天 + 相关交叉领域

---

## 📋 今日论文摘要

### 1. MeshFlow: Mesh Generation with Equivariant Flow Matching
- **arXiv**: [2606.23489](https://arxiv.org/abs/2606.23489)
- **会议**: SIGGRAPH 2026
- **作者**: Qi Sun et al.
- **分类**: 网格生成 / 3D表示
- **核心贡献**: 
  - 使用等变最优传输流匹配模型直接生成三角网格（作为 triangle soup）
  - 保持面对顶点、顶点顺序的置换不变性
  - 基于 Diffusion Transformer 架构修改，实现 18x 加速
- **技术亮点**: 
  - 等变最优传输训练目标
  - 避免将网格序列化为自回归序列
- **相关度**: ⭐⭐⭐ (网格生成与流体模拟的离散化表示相关)
- **URL**: https://qiisun.github.io/MeshFlow/

---

### 2. Self-supervised Garment Dynamics with Persistent Wrinkles
- **arXiv**: [2606.25065](https://arxiv.org/abs/2606.25065)
- **会议**: ECCV 2026
- **作者**: Xiaoyuan Yang et al.
- **分类**: 布料仿真 / 服装动画
- **核心贡献**: 
  - 首个自监督神经服装模拟器，显式建模持续性褶皱（persistent wrinkles）
  - 物理启发的损失函数，将学习转化为移动能量最小化问题
  - 课程学习策略，从纯弹性逐步过渡到弹塑性
- **技术亮点**: 
  - 塑性建模 → 褶皱持久性
  - 自监督学习，无需大规模标注数据
- **相关度**: ⭐⭐⭐⭐ (褶皱与流体表面的几何细节模拟相关)
- **备注**: 虽非流体渲染，但与流体-织物耦合有潜在联系

---

### 3. VolHuMe: High-Resolution Large Scale Dataset of Volumetric Human Meshes
- **arXiv**: [2606.23062](https://arxiv.org/abs/2606.23062)
- **作者**: Niccolò Bisagno et al.
- **分类**: 数据集 / 人体重建
- **核心贡献**: 
  - 高质量 4D 人体扫描数据集（64 RGB + 32 深度相机）
  - 104 subjects，包含 SMPL-X、高分辨率网格、多视角 RGB/Depth、 rigged meshes、点云、服装分割
- **相关度**: ⭐⭐ (可作为流体渲染中的人物遮挡/交互基准)
- **备注**: 几何重建数据集，非流体相关但可用于人体-流体交互场景

---

### 4. Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models
- **arXiv**: [2606.22945](https://arxiv.org/abs/2606.22945)
- **作者**: Junrong Huang et al.
- **分类**: 纹理合成 / 材质映射
- **核心贡献**: 
  - 基于 Diffusion Transformers 的可控纹理平铺
  - Coordinate-Transformed Rotary Embedding (CoT-RoPE)
  - Disjoint Attention Mask 保护参考特征
- **相关度**: ⭐⭐ (纹理映射可用于流体表面材质)
- **URL**: https://github.com/junrongh/ControlTile

---

### 5. GPU-Accelerated Simulations of Moving Boundary Problems and Fluid-Structure Interaction at Extreme Scales
- **arXiv**: [2605.04335v2](https://arxiv.org/abs/2605.04335)
- **作者**: Sushrut Kumar et al.
- **分类**: GPU并行计算 / 流固耦合
- **核心贡献**: 
  - GPU优化 immersed boundary method 实现
  - 网格规模 O(10M) → O(1B) 点
  - 多GPU实现 (CUDA streams + NCCL)，>90% 扩展效率
  - 20x CPU 加速比
  - Re=5000 湍流和蝙蝠翅膀流固耦合演示
- **相关度**: ⭐⭐⭐⭐ (大规模流体模拟基础设施)
- **备注**: 物理计算背景(cs.DC/physics.comp-ph)，但技术可迁移到图形学

---

### 6. VesNet: Neural Network Accelerated Solver for Stokesian Vesicle Suspensions
- **arXiv**: [2606.25569](https://arxiv.org/abs/2606.25569)
- **作者**: Shan Zhong, Gokberk Kabacaoglu, George Biros
- **分类**: 神经计算 / 悬浮颗粒
- **核心贡献**: 
  - 混合框架加速 2D vesicle 悬浮液模拟
  - IVNet 近似自相互作用算子
  - GPU 加速 >100x vs MATLAB CPU，>5x vs GPU baseline
  - 可模拟数千个 vesicle
- **相关度**: ⭐⭐⭐ (颗粒/液滴系统的神经网络加速)
- **备注**: 属于 physics.flu-dyn 领域，神经代理模型方法值得参考

---

## 🔍 观察与趋势

1. **SIGGRAPH 2026 论文陆续发布**: MeshFlow 为今年首篇确认的 SIGGRAPH 2026 图形学论文
2. **自监督学习渗透仿真**: 布料仿真+塑性褶皱的自监督方法可能启发流体表面的自监督训练
3. **神经流体加速**: VesNet 展示神经网络在 Stokes 流动中的 100x 加速，图形学流体模拟可能借鉴
4. **cs.GR 近3天无直接流体渲染论文**: 搜索的关键词(fluid rendering, water rendering, smoke rendering)在 cs.GR 最新列表中未命中

---

## 📊 搜索统计

| 指标 | 数值 |
|------|------|
| arXiv cs.GR 扫描范围 | 37篇 (3天) |
| 命中论文 | 6篇 |
| SIGGRAPH 2026 论文 | 1篇 |
| 直接相关流体渲染 | 0篇 |

---

## 🏷️ 标签

#fluid-rendering #water-rendering #mesh-generation #cloth-simulation #GPU-acceleration #neural-solver #SIGGRAPH2026 #arxiv-cs.GR

---

*由 豆苗 (Doumiao) 自动生成 | 下次扫描: 2026-06-26 02:00 UTC*