---
tags: [渲染, 全局光照, 路径追踪, 逆渲染, 3DGS, 神经渲染]
date: 2026-06-08
status: 待读
---

# Path-Traced Inverse Rendering with Global Illumination in 3D Gaussian Fields

## 元信息
| 标题 | Path-Traced Inverse Rendering with Global Illumination in 3D Gaussian Fields |
| 作者 | Junke Zhu, Hao Zhang, Yutian Zhu, Ang Li, Chenxiao Hu, Meng Gai, Fei Zhu, Zhangjin Huang, Sheng Li |
| 链接 | [arXiv](https://arxiv.org/abs/2606.09606) |
| 领域 | 全局光照, 路径追踪, 逆渲染, 3D Gaussian Splatting |
| 提交日期 | 2026-06-08 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.09606) |

## 核心贡献
1. **无splatting的路径追踪逆渲染框架**：首个针对3D Gaussian fields的splatting-free路径追踪逆渲染框架，前向光传输和反向梯度传播在统一光线追踪管线中定义
2. **路径空间等效交互模型**：为重叠Gaussian primitives定义路径空间等效交互模型，使Monte Carlo路径追踪对诱导光传输积分无偏
3. **全渲染方程优化**：在完整渲染方程（ray-traced visibility + multi-bounce light transport）下优化材质和紧凑Spherical-Gaussian环境光

## 技术方案

### 核心问题
现有逆渲染方法通过splatting估计G-buffers并在屏幕空间优化材质，存在pipeline不匹配和简化渲染方程忽略间接光照的问题。

### 核心思想
前向光传输 + 反向梯度传播 → 统一光线追踪管线

### 关键技术点
- **Splatting-free**：完全避免splatting操作，直接在光线追踪框架中处理Gaussian primitives
- **Ray-traced visibility**：光线追踪可见性计算
- **Multi-bounce light transport**：多次反弹光传输，支持间接光照
- **Spherical-Gaussian环境光**：紧凑环境光照表示

## 实验结论
- 竞争性的材质反演效果
- 全局光照下更合理的阴影、反射和重光照结果

## 相关笔记
- [[2026-05-04_GRTX-Efficient-Ray-Tracing-3D-Gaussian]]
- [[2026-05-04_RealTime-GI-Dynamic-3D-Gaussian-Scenes]]
- [[2026-06-14_TRON-Ray-Tracing-Neural-Renderer]]

## 链接
- [arXiv HTML](https://arxiv.org/html/2606.09606v1)

---

#标签 #全局光照 #路径追踪 #逆渲染 #3DGS #神经渲染 #PBR #2026-06