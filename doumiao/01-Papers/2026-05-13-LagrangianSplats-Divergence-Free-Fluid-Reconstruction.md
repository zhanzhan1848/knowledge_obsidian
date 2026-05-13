# LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction

**日期**: 2026-05-10
**arXiv**: [2605.09299](https://arxiv.org/abs/2605.09299)
**标签**: `fluid-reconstruction` `gaussian-splatting` `divergence-free` `velocity-field`
**领域**: 流体重建 / 体积渲染

---

## 核心问题

从稀疏 2D 视频观测重建 3D 流体速度场是一个严重不适定的逆问题，需要同时满足：
1. **传输一致性**: 与观测到的运动一致
2. **物理有效性**: 满足流体物理定律

现有方法通常通过软惩罚施加这些约束，导致精度和收敛性问题。

---

## 核心创新

### 1. Divergence-Free Kernel 表示
- 使用**连续无散核 (Divergence-Free Kernel)** 参数化速度场
- 由无散核驱动 **Lagrangian 3D Gaussian Splatting** 表示的对流
- **内在保证** 流动不可压缩性和长时间传输一致性

### 2. Sliding Window 机制
- 在有意义的时间范围内传播梯度
- 保持可处理的训练成本

---

## 技术细节

### 方法流程
```
稀疏 2D 视频 → Divergence-Free 速度场参数化 → Lagrangian 3DGS 对流
                                                    ↓
                                              重建 3D 流体速度场
```

### 无散核表示
- 速度场由无散基函数线性组合
- 保证 ∇·v = 0 对所有空间点成立

### Lagrangian 3DGS
- 3D 高斯作为拉格朗日粒子
- 通过速度场对流更新位置
- 保持渲染可微性

---

## 实验结果

- 在合成和真实数据集上优于 SOTA 基线
- **传输一致性** 和 **物理准确性** 均优于现有方法
- 支持高质量再模拟和流动分析应用

---

## 领域关联

### 与流体渲染的关系
| 方面 | 说明 |
|------|------|
| 体积渲染 | ✅ 3DGS 本身是体积/半透明渲染技术 |
| 粒子渲染 | ✅ Lagrangian 粒子系统 + 高斯 |
| 流体模拟 | ✅ 速度场重建 + 不可压缩约束 |
| 传输一致性 | ✅ 对流传输保证长期稳定 |

### 可应用于
- 烟雾/火焰体积渲染（从视频重建）
- 复杂流体场景的快速预览
- 数据驱动的流体效果生成

---

## 参考链接

- **arXiv**: https://arxiv.org/abs/2605.09299
- **PDF**: https://arxiv.org/pdf/2605.09299

---

*笔记由豆苗 (doumiao) 自动生成于 2026-05-13*