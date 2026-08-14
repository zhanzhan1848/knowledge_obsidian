---
title: HoloPathTracer - Fast and Accurate Wave Path Tracing for Holography
authors: Wenbin Zhou, Xiangyu Meng, Jiankai Xing et al. (The University of Hong Kong, Tsinghua)
date: 2026
source: SIGGRAPH 2026 / ACM TOG
url: https://doi.org/10.1145/3811351
project: https://zhou-wb.github.io/holopathtracer/
tags: [rendering, path tracing, wave optics, holography, ray tracing, SIGGRAPH, 2026]
status: unread
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography |
| 作者 | Wenbin Zhou, Xiangyu Meng, Jiankai Xing et al. |
| 来源 | SIGGRAPH 2026 / ACM TOG |
| 年份 | 2026 |
| 链接 | [DOI](https://doi.org/10.1145/3811351) |
| 项目页 | [zhou-wb.github.io/holopathtracer](https://zhou-wb.github.io/holopathtracer/) |

## 核心贡献
1. **波路径追踪框架**: 物理准确且计算高效，结合路径追踪编码全 3D 视觉提示到相位全息图
2. **蒙特卡洛方法**: 同时求解渲染方程和瑞利-萨默菲尔德积分
3. **路径复用**: 通过路径复用以最小额外成本生成多个时间复用随机全息图
4. **环境辐射缓存**: 加速收敛的环境辐射缓存

## 技术方案

**光路采样**:
- 从 SLM（记录平面）每个像素采样 Rayholo，随机初始方向
- 使用角谱法分解波传播为不同方向传播的相干平面波束
- delta 散射事件：沿出射方向继续追踪，累积光程长度
- 非 delta 散射：采样随机相位近似不相干叠加

**波刻面 (Wave Facets)**:
- 编码来自路径追踪的视图相关振幅和射线追踪 OPL 的相位
- 变量帧复用逐步逼近由材质 BSDF 决定的地真角振幅

**随机相位采样**:
- 预计算全息图空间的有限带宽高斯随机场
- 保持采样密度与有效相位带宽绑定到 SLM 记录平面

**快速变体**:
- 环境光缓存 + 两阶段波记录平面传播
- 同一射线路径、几何、振幅、OPL 项可复用

## 实验结论
- 逼真的全息重建，自然 3D 提示和复杂材质
- 再现焦散模糊、视图相关效果、高光和反射
- 匹敌 Mitsuba 渲染器参考

## 局限性
- 计算复杂度高
- 需要高刷新率 SLM 才能有效时间复用

## 可行性分析
- 实现难度：高（波光学 + 路径追踪 + 全息显示）
- 性能预期：适合离线预计算
- 适用场景：VR/AR 全息显示

## 相关工作
- Mitsuba renderer
- CGH (Computer-Generated Holography)
- Light field displays

## 笔记
**🥩 重要论文**: HoloPathTracer 将路径追踪扩展到波光学领域，是全息显示渲染的重大突破。路径复用技术对实时应用很有价值。
