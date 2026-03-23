---
type: paper
created: 2026-03-23
updated: 2026-03-23
tags: [paper, 3d-reconstruction, pbr, illumination, neural-rendering, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.19753
---

# ReLi3D: Relightable Multi-view 3D Reconstruction with Disentangled Illumination

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ReLi3D: Relightable Multi-view 3D Reconstruction with Disentangled Illumination |
| **作者** | Jan-Niklas Dihlmann, Mark Boss, Simon Donne, Andreas Engelhardt, Hendrik P. A. Lensch, Varun Jampani |
| **发表** | ICLR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.19753) |
| **项目页** | [https://reli3d.jdihlmann.com/](https://reli3d.jdihlmann.com/) |

---

## 核心贡献

> 首个端到端统一流水线，从稀疏多视角图像同时重建3D几何、PBR材质和环境光照，耗时小于1秒

1. **统一重建流水线**：首次将几何重建、材质估计和光照恢复统一到单一前馈网络中
2. **多视角约束解耦**：利用多视角约束显著改善材质与光照的解耦（单视角方法本质不适定）
3. **双路径预测策略**：结构/外观路径 + 环境光照路径，结合可微分MC-MIS渲染器
4. **混合域训练协议**：合成PBR数据集 + 真实RGB捕获，实现泛化性

---

## 技术方案

### 核心思想

通过Transformer跨条件架构融合多视角输入，采用双路径预测：
- **路径1**：预测物体结构和外观（几何 + PBR材质）
- **路径2**：从图像背景或物体反射预测环境光照

结合可微分Monte Carlo多重重要性采样(MC-MIS)渲染器，实现端到端训练。

### 关键技术

| 技术 | 说明 |
|------|------|
| Transformer Cross-Conditioning | 多视角特征融合与跨视角约束 |
| Two-Path Prediction | 分离物体属性和环境光照预测 |
| Differentiable MC-MIS Renderer | 可微分蒙特卡洛MIS渲染器，支持梯度反传 |
| Mixed Domain Training | 合成PBR + 真实RGB混合训练 |

---

## 实验结论

- **速度**: 完整重建 < 1秒
- **输出**: 完整3D几何 + 空间变化PBR材质 + 环境光照
- **特性**: 支持重光照(relightable)的3D资产生成

---

## 局限性

- 稀疏视角数量对解耦质量的影响待研究
- 极端材质（如镜面反射、次表面散射）的处理能力待验证
- 真实场景的泛化性依赖混合训练策略

---

## 相关工作

- [[NeRF]] - 神经辐射场
- [[3D Gaussian Splatting]] - 3D高斯泼溅
- [[PBR Material Estimation]] - 基于物理的材质估计
- [[Differentiable Rendering]] - 可微分渲染

---

## 实现建议

- **实现难度**: 高 - 需要可微分渲染器和多视角Transformer架构
- **预期性能**: <1秒完成重建，支持实时重光照
- **适用场景**: 3D资产生成、虚拟制作、AR/VR内容创作、电商产品3D化
- **推荐度**: ⭐⭐⭐⭐⭐ ICLR 2026，工业价值高
