---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, 3dgs, compression, gaussian-splatting, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.26799
---

# MesonGS++: Post-training Compression of 3D Gaussian Splatting with Hyperparameter Searching

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MesonGS++: Post-training Compression of 3D Gaussian Splatting with Hyperparameter Searching |
| **作者** | Shuzhao Xie, Junchen Ge, et al. (MMLab) |
| **发表** | arXiv cs.CV (cross-list cs.GR), April 29, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.26799) |
| **DOI** | 10.48550/arXiv.2604.26799 |
| **代码** | https://github.com/mmlab-sigs/mesongs_plus |

---

## 核心贡献

> 提出尺寸感知的3DGS后训练编解码器，通过联合重要性剪枝、八叉树几何编码、选择性矢量量化等技术和0-1整数线性规划实现精确控制压缩率。

1. **联合重要性剪枝**：基于重要性的剪枝
2. **八叉树几何编码**：高效几何编码
3. **选择性矢量量化**：针对高阶球谐函数
4. **混合精度量化**：group-wise位宽分配
5. **0-1整数线性规划**：在目标存储预算下优化率-失真权衡

---

## 技术方案

### 核心思想

现有后训练压缩方法依赖多个耦合超参数（剪枝、变换、量化、熵编码），难以控制最终压缩大小和充分利用率-失真权衡。

**本文方法**：将reserve ratio和bit-width allocation作为主导的率-失真旋钮，通过离散采样和0-1整数线性规划联合优化。

### 关键技术

| 技术 | 说明 |
|------|------|
| 联合重要性剪枝 | joint importance-based pruning |
| 八叉树几何编码 | octree geometry coding |
| 属性变换 | attribute transformation |
| 选择性矢量量化 | selective vector quantization for higher-degree SH |
| 混合精度量化 | group-wise mixed-precision quantization |
| 熵编码 | entropy coding |
| 线性大小估计器 | 加速超参数搜索 |
| CUDA并行量化算子 | 加速搜索过程 |

---

## 实验结论

- **压缩率**: 34× compression while preserving rendering fidelity
- **超越原始3DGS**: 在20×压缩率下PSNR甚至可超越vanilla 3DGS (Stump scene)
- **目标尺寸预算**: 准确满足目标尺寸预算
- **优于SOTA**: 超越现有后训练方法

---

## 实现建议

- **实现难度**: 中（需CUDA实现）
- **预期性能**: 34×压缩率，渲染质量保持
- **适用场景**: 移动端渲染、AR/VR、Web渲染

---

## 标签

#3DGS #压缩 #高斯泼溅 #渲染 #实时渲染
