---
tags: [渲染, 光线追踪, 神经渲染, 3DGS, 重光照, NVIDIA]
date: 2026-06-09
status: 待读
---

# TRON: Tracing Rays to Orchestrate a Neural Renderer for 3D Gaussian Reconstructions

## 元信息
| 标题 | TRON: Tracing Rays to Orchestrate a Neural Renderer for 3D Gaussian Reconstructions |
| 作者 | Or Perel, Hassan Abu Alhaija, Zian Wang, Jacob Munkberg, Matan Atzmon, Sanja Fidler, Masha Shugrina (NVIDIA Research) |
| 链接 | [arXiv](https://arxiv.org/abs/2606.11314) |
| 领域 | 光线追踪, 神经渲染, 3D Gaussian, 重光照, 动态场景 |
| 提交日期 | 2026-06-09 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.11314) |
| 项目页 | [research.nvidia.com/labs/sil/projects/tron](https://research.nvidia.com/labs/sil/projects/tron/) |

## 核心贡献
1. **混合PBR+神经渲染框架**：结合3D Gaussian ray tracing与神经渲染，支持真实可控的场景渲染
2. **内在分解先验**：利用学习型逆渲染模型的内在分解先验正则化Gaussian场的材质属性
3. **光线追踪提供辐射引导**：将光线追踪器用作辐射引导（而非最终像素），作为神经渲染器的结构化3D scaffold
4. **多阶段训练**：大规模预训练+精细调优（2.1M帧合成/真实重建数据）

## 技术方案

### 核心问题
- 纯PBR方法：几何/材质/光传输不完美导致无法真实重光照
- 纯神经渲染：缺乏显式场景表示，无法支持交互式编辑

### TRON方法
输入3D场景(Gaussian field) → 光线追踪器(辐射引导) → 逆渲染模型(材质/几何内在分解) → 神经渲染器(填补domain gap) → 真实感输出

支持：动态几何、光照变化、物体插入、材质编辑

## 实验结论
- Gaussian重光照方法中真实感最佳
- 神经渲染器中可控性和速度最佳
- 首个支持实际交互式应用的方法

## 相关笔记
- [[2026-06-08_Path-Traced-Inverse-Rendering-GI-3D-Gaussian]]
- [[2026-05-04_GRTX-Efficient-Ray-Tracing-3D-Gaussian]]

## 链接
- [arXiv HTML](https://arxiv.org/html/2606.11314v1)
- [Project Page](https://research.nvidia.com/labs/sil/projects/tron/)

---

#标签 #光线追踪 #神经渲染 #3DGS #重光照 #NVIDIA #动态场景 #2026-06