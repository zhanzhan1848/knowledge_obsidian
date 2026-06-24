---
tags: [渲染, 全局光照, 神经渲染, SIGGRAPH2026]
date: 2026-06-24
status: 已分析
publish: SIGGRAPH 2026
---

# A Generalizable Light Transport 3D Embedding for Global Illumination

## 元信息

| 标题 | A Generalizable Light Transport 3D Embedding for Global Illumination |
|------|-----|
| 作者 | Bing Xu et al. |
| 发表 | SIGGRAPH Conference Papers '26, July 19-23, 2026, Los Angeles, CA, USA |
| 链接 | [arXiv:2510.18189](https://arxiv.org/abs/2510.18189) |
| DOI | 10.1145/3799902.3811095 |
| 主题 | 全局光照, 可泛化神经网络, 3D嵌入 |

## 核心贡献

1. **可扩展的3D嵌入**: 使用点云表示和线性复杂度Transformer，克服二次方内存瓶颈，实现百万三角形级复杂场景的全局光传输建模
2. **分辨率无关解码**: 局部解码机制确保每像素常数复杂度，通过3D监督保证视图一致性和可泛化GI
3. **大规模数据集**: 发布约14k复杂室内场景数据集，包含多样化布局、几何体和纹理
4. **架构多功能性**: 可迁移编码器，支持 glossy 材质的空间-方向辐射场预测

## 技术方案

### 核心思想

将光传输算子类比为 Transformer 中的注意力机制：
- 光传输展开为 Neumann 级数，模拟光线在表面点间的递归能量传播
- 堆叠的自注意力层"烘焙"多弹跳模拟结果到逐点嵌入
- 解码器简化为局部检索任务，避免先前工作的全局注意力开销

### 架构三阶段

1. **场景离散化 (Scene Discretization)**
   - 使用点云作为中间表示 (IR)
   - 点密度可根据重要性调整
   - 解耦于原始几何拓扑

2. **全局光传输编码 (Global Light Transport Encoding)**
   - 采用 PointTransformerV3 (PTV3) 作为编码器骨干
   - 线性复杂度 Transformer 编码长程光传输
   - 点-based 表示统一光源和几何

3. **局部查询解码 (Local Query Decoding)**
   - 通过 kNN 固定局部邻域检索特征
   - 交叉注意力聚合预测渲染量
   - 每像素复杂度与场景大小无关

### 关键公式

光传输的 Neumann 级数展开:
```math
L = \sum_{n=0}^{\infty} T^n L_e
```

注意力机制模拟光反弹:
```math
F_{out} = \text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
```

## 实验结论

- 在包含数百万三角形的复杂室内场景上验证
- 首次实现复杂高保真室内场景的可泛化GI学习
- 参考分辨率 2688×1152
- 相比 RenderFormer 显著降低 VRAM 需求

## 局限性

- 目前主要验证漫反射 GI
-  glossy 材质为初步结果
- 需进一步扩展渲染参数以捕获完整光传输效果

## 可行性评估

- **实现难度**: 高（需大规模点云处理和Transformer训练）
- **性能预期**: 优秀（线性复杂度支持大场景）
- **适用场景**: 实时渲染预计算、不可见场景泛化
- **推荐度**: ⭐⭐⭐⭐⭐

## 相关工作

- RenderFormer (Zeng et al., 2025) - 受 quadratic attention 限制
- Precomputed Radiance Transfer (PRT)
- Neural denoisers

## 标签

#全局光照 #可泛化学习 #点云 #Transformer #SIGGRAPH2026
