---
tags: [渲染, 实时渲染, WebGPU, ray-marching, height-field, terrain-rendering, 2026]
date: [[2026-08-19]]
status: 待读
source: arXiv cs.GR
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Dzmitry Malyshau |
| 发表 | Journal of Computer Graphics Techniques (JCGT) |
| 年份 | 2026 |
| 链接 | https://arxiv.org/abs/2608.17390 |
| PDF | https://arxiv.org/pdf/2608.17390 |

## 核心贡献

对游戏地形渲染的六种方法进行系统比较：

1. **Height-field ray marching** - 传统高度场光线步进
2. **Voxel-accelerated ray marching** - 体素加速的光线步进
3. **Sliced proxy geometry** - 切片代理几何体
4. **Per-sample bar rasterization** - 每样本条带光栅化
5. **Compute scattering** - 计算散布
6. **Fitted triangle mesh** - 拟合三角形网格

## 技术方案

核心挑战：
- 游戏地形不同于 DEM（数字高程模型）：非平滑、多层、包含洞穴等复杂结构
- 需保留两层实心间隔（two solid intervals）
- 需支持地形破坏的实时更新（无需重新加载关卡）

约束条件：
- 所有方法使用相同引擎和数据路径
- 基准：CPU ray cast

六种实现统一使用 **WebGPU API** 和 **WGSL** 着色器语言。

## 实验结论

- **俯视角**：六种方法视觉差异不大
- **Eye-level 视角**：差异显著：
  - Point scattering 丢失覆盖
  - Slicing 产生条带
  - 简化 mesh 可能漏墙
- **最佳性价比**：Greedy TIN（三角不规则网络）在所有测试设备上帧时间最低
- 但 fit 成本由第二层决定，且可编辑 mesh 需要 319 MiB GPU 几何 + 535 MiB CPU 三角化

## 创新性

- ⭐⭐⭐⭐ 实用性强，是工程导向的系统性对比研究

## 实用性

- ⭐⭐⭐⭐⭐ 高度实用，为 WebGPU 地形渲染提供直接参考

## 实现难度

- **算法复杂度**：中等（各方法均有成熟实现）
- **代码工作量**：高（需实现六种方法 + 统一引擎）
- **难度**：中

## 推荐度

**✅ 推荐实现**

WebGPU 平台的地形渲染参考价值高，ray marching 和 voxel 加速方案可直接借鉴。

## 相关工作

- 相关概念：Ray Marching, Voxel Acceleration, Terrain LOD, WebGPU, WGSL
