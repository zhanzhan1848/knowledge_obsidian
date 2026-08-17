---
title: 每日渲染论文搜索报告 - 2026-08-17
date: 2026-08-17
tags: [日报, rendering, 2026]
source: arXiv cs.GR / SIGGRAPH 2026
status: daily-report
---

# 🥬 每日渲染论文搜索报告 - 2026-08-17

## 搜索概况

| 项目 | 内容 |
|------|------|
| 搜索时间 | 2026-08-17 14:00 UTC |
| 搜索范围 | arXiv cs.GR, SIGGRAPH 2026, ACM Digital Library |
| 关键词 | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching |
| 最近24小时新论文 | 0 篇 (arXiv cs.GR) |
| 最近一周相关论文 | 3 篇 |

## 📊 搜索结果统计

### arXiv cs.GR (最近24小时: 2026-08-16 ~ 2026-08-17)
**结果**: 无新发表的相关论文

最近一篇相关论文发表于 **2026-08-14**

### SIGGRAPH 2026 会议
**结果**: 发现多篇渲染相关论文和演讲

---

## 📄 最近一周渲染相关论文

### 1. RGBX-Next: Towards Realistic Generative Rendering from G-Buffers
- **作者**: Zheng Zeng, Marco Salvi, Lifan Wu, Jan Novák, Daqi Lin, Saeed Hadadan, Yichen Sheng, Robert Pottorff, Shiqiu Liu, Ravi Ramamoorthi, Ling-Qi Yan, Miloš Hašan
- **来源**: arXiv (cs.GR/cs.CV) | 2026-08-14
- **链接**: [arXiv:2608.13929](https://arxiv.org/abs/2608.13929)
- **核心贡献**: 
  - 提出 RGBX-Next，统一的前向和逆向渲染生成框架
  - 使用扩散变换器 (DiT) 模型进行生成式渲染
  - 支持从 G-Buffer 生成逼真图像/视频
- **标签**: #生成渲染 #扩散模型 #G-Buffer #逆向渲染

### 2. A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering
- **作者**: Louis De Oliveira, Anastasia Karpova, Georges Nader, Antoine Houdard, Pierre Mezieres, Damien Rioux-Lavoie, Romain Pacanowski
- **来源**: Eurographics Symposium on Rendering (EGSR) 2026 | arXiv:2608.09604 | 2026-08-10
- **链接**: [arXiv:2608.09604](https://arxiv.org/abs/2608.09604)
- **核心贡献**:
  - 结合 GGX 微表面模型和神经模型
  - 神经组件修正微表面近似的外观
  - 比现有神经模型更小的网络，更适合实时渲染
- **标签**: #BRDF #PBR #实时渲染 #神经渲染

### 3. Amulet: Frame Extrapolation Through Sparse Layered Scene Representation
- **作者**: Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg
- **来源**: arXiv (cs.GR) | 2026-08-11
- **链接**: [arXiv:2608.10423](https://arxiv.org/abs/2608.10423)
- **核心贡献**:
  - 稀疏分层场景表示的帧外推方法
  - 可将 60Hz 着色率外推到 240Hz 显示器
  - 4K 分辨率下可达 250Hz
- **标签**: #帧外推 #实时渲染 #DLSS #可变着色率

---

## 🎮 SIGGRAPH 2026 实时渲染进展

### Advances in Real-Time Rendering in Games 课程

#### 1. ORCA: Speeding up Path Tracing via Online Radiance Cache Acceleration
- **机构**: EA SEED
- **演讲者**: Jon Greenberg
- **摘要**: 通过自定义辐射缓存加速路径追踪，专为实时渲染设计，不依赖时序历史
- **链接**: [PPT (436MB)](https://advances.realtimerendering.com/s2026/content/ORCA%20Siggraph%20r3.4_%20Advances.pptx)

#### 2. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4
- **机构**: Activision Infinity Ward
- **演讲者**: Michał Olejnik
- **摘要**: 
  - 动态分配每像素光线预算
  - 支持亚采样 (<1 spp) 和选择性超采样 (>1 spp)
  - GPU 驱动的帧级调度器保证稳定性能
- **链接**: [PPT (387MB)](https://advances.realtimerendering.com/s2026/content/SIGGRAPH2026%20-%20Michał%20Olejnik%20-%20Variable%20Rate%20Ray%20Tracing%20in%20COD%20MW4.pptx)

#### 3. Smolder — Real-Time Volumetric Effect Rendering
- **机构**: IO Interactive (Glacier Engine)
- **演讲者**: Alexander Mueller
- **摘要**: 集成式实时体积效果渲染框架，支持与所有照明系统联动
- **链接**: [PPT (265MB)](https://advances.realtimerendering.com/s2026/content/AlexanderMueller_Smolder_Siggraph26.pptx)

#### 4. Upgrading PSSR on PlayStation 5 Pro
- **机构**: Sony Interactive Entertainment
- **演讲者**: Daniel Craig
- **摘要**: 
  - 重新设计重建管道，从单一颜色预测网络改为显式闭合解
  - 减少模型需要处理的问题，专注于模式识别
  - 改善视觉质量、时序稳定性，降低运行时/内存/训练成本
- **链接**: [PPT (54MB)](https://advances.realtimerendering.com/s2026/content/siggraph2026_advances_dcraig_v1_0_publish.pptx)

---

## 🔬 技术趋势分析

### 实时渲染方向
1. **可变光线追踪率 (VRRT)** - 动态分配光线预算成为 AAA 游戏新趋势
2. **神经辐射缓存** - ORCA 展示不依赖时序历史的即时辐射缓存方案
3. **帧外推技术** - Amulet 和 PSSR 代表未来高刷新率显示解决方案

### 离线渲染方向
1. **生成式渲染** - RGBX-Next 将扩散模型作为可学习渲染器
2. **混合 BRDF 模型** - 结合物理和神经方法的优势

---

## 📅 下一步关注

- [ ] 深入分析 RGBX-Next 框架的生成式渲染方法
- [ ] 跟踪 ORCA radiance cache 开源进展
- [ ] 评估 VRRT 在自研引擎中的可行性

---

## 附录：搜索关键词配置

```json
{
  "keywords": [
    "ray tracing", "path tracing", "real-time rendering",
    "global illumination", "PBR", "rasterization",
    "BVH", "ray marching", "Gaussian splatting",
    "neural rendering", "BRDF", "shading"
  ],
  "sources": ["arxiv", "acm", "siggraph"],
  "schedule": "0 22 * * *"
}
```

---
*报告生成时间: 2026-08-17 14:00 UTC*
*🥬 生菜 (shengcai) - 计算机图形学渲染专家*
