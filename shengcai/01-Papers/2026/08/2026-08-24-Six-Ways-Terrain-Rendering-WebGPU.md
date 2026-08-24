---
title: Six Ways to Draw Vangers with WebGPU - Real-Time Rendering of Editable Multi-Layer Height Fields
authors: D. Malyshau
date: 2026-08-17
source: arXiv cs.GR (Journal of Computer Graphics Techniques)
url: https://arxiv.org/abs/2608.17390
pdf: https://arxiv.org/pdf/2608.17390
tags: [rendering, terrain-rendering, ray-marching, webgpu, rasterization, real-time, 2026]
status: unread
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields |
| 作者 | D. Malyshau |
| 来源 | arXiv cs.GR (Journal of Computer Graphics Techniques) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17390) |
| PDF | [下载](https://arxiv.org/pdf/2608.17390) |

## 核心贡献
1. **六种方法的受控对比**：height-field ray marching、voxel-accelerated ray marching、sliced proxy geometry、per-sample bar rasterization、compute scattering、fitted triangle mesh，共享同一引擎同一数据路径同一相机
2. **评估方法**：以 CPU ray cast 为基准，从 coverage、geometric、coherence 三个维度分解误差，记录各方法 naive 版本的失败模式
3. **完整开源**：引擎、测试工具和测量协议全部开源（Apache-2.0）
4. **十世界调查**：隔离了真正影响 fit cost 的因素，以及 TIN 方法 fit cost 由第二层而非地面起伏决定的机制
5. **编辑路径审计**：哪些方法直接消费 live interval 场，哪些必须维护派生加速或网格数据

## 技术方案

### 场景约束
三个非协商系统约束：
1. **多垂直固体间隔**：保留每个地面采样的两个垂直固体间隔（包括上板底部）
2. **交互帧预算内渲染**：不产生离线转换
3. **有限编辑可见性**：高度和图层元数据的有限编辑必须在不重新加载关卡的情况下可见

### 六种方法
1. **Height-field ray marching**：线性搜索 + 细化，评估两个固体间隔
2. **Voxel-accelerated ray marching**：3D occupancy hierarchy，跳过空体素和洞穴
3. **Sliced proxy geometry**：水平切片 membership 测试，产生掠射角条带
4. **Per-sample bar rasterization**：每个 sample 写一个最近深度像素，产生空洞和时间散斑
5. **Compute scattering**：计算散射
6. **Fitted triangle mesh (greedy TIN)**：贪婪三角不规则网络，各设备平均帧时间最低，但 fit cost 由第二层决定，编辑版本保留 319 MiB GPU 几何 + 535 MiB CPU 三角化

### WebGPU 实现
- 全部使用原生 wgpu/WebGPU API 和规范 WGSL
- vange-rs 从 2016 年 6 月开始开发，已运行 10 年
- 同一源码可编译到 Web (wasm32-unknown-unknown)

## 实验结论
- 俯视图六种方法看起来无法区分
- **眼平高度地平线上**：point scattering 失去覆盖，slicing 产生条带，过简化网格可能漏掉墙壁
- greedy TIN 在选定质量设置下**每台设备平均帧时间最低**
- 五个设备跨 Vulkan 和 Metal 验证了可移植性

## 局限性
- greedy TIN fit cost 由第二层决定，编辑版本需要大量 GPU/CPU 内存
- 各方法在不同场景类型下各有优劣，没有全能最优解
- 多层高度场场景的选择仍需根据具体需求

## 可行性分析
- 实现难度：低-中（各方法均有成熟参考，开源引擎可直接复用）
- 性能预期：greedy TIN 总体帧时间最低，但内存开销大；ray marching 方法更通用
- 适用场景：游戏地形、可编辑地形、VR 地平线渲染、WebGPU 地形渲染

## 相关工作
- Relief mapping
- GPU landscape ray casting
- Maximum mipmaps
- Layered Depth Images
- QuadStack
- Triangulated Irregular Network (TIN)

## 笔记
这是难得一见的工程深度论文，10年WebGPU地形渲染实战经验的总结。核心价值不在于提出新算法，而在于用受控实验揭示了六种地形渲染方法在多约束场景下的实际表现差异，特别是俯视与眼平视角的巨大差异。开源代码和测量协议具有很高的工程参考价值。
