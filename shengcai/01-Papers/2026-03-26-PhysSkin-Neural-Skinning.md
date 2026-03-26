---
title: Real-Time Physics-Based Animation via Self-Supervised Neural Skinning
authors: Yuanhang Lei et al.
date: 2026-03-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2603.23194
pdf: https://arxiv.org/pdf/2603.23194
tags: [rendering, paper, 2026, animation, skinning, physics-based, neural-fields]
status: unread
---

# PhysSkin: Real-Time Physics-Based Animation via Self-Supervised Neural Skinning

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-Time and Generalizable Physics-Based Animation via Self-Supervised Neural Skinning |
| 作者 | Yuanhang Lei et al. |
| 来源 | arXiv:2603.23192 [cs.GR] |
| 年份 | 2026 |
| 会议 | CVPR 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.23194) |
| PDF | [下载](https://arxiv.org/pdf/2603.23194) |
| 项目页 | [GitHub](https://zju3dv.github.io/PhysSkin/) |

## 核心贡献
1. **物理信息神经网络蒙皮**：学习连续蒙皮场作为基函数，将运动子空间坐标提升为全空间变形
2. **离散化无关泛化**：无网格、跨不同3D形状和离散化方法的泛化能力
3. **自监督学习策略**：即时蒙皮场归一化和冲突感知梯度校正

## 技术方案
- 基于Linear Blend Skinning思想，但使用神经蒙皮场
- Transformer编码器 + 交叉注意力解码器的自动编码器架构
- 平衡能量最小化、空间平滑性和正交性约束
- 实时物理动画生成

## 公式
```math
# Linear Blend Skinning (LBS)
v' = Σ_i w_i(v) * T_i * v

# Neural Skinning Field
w_i(x) = NeuralField(x; θ)

# 物理约束
L_total = L_energy + λ_s * L_smoothness + λ_o * L_orthogonality
```

## 代码
```cpp
// 伪代码：神经蒙皮场
class NeuralSkinningField {
    TransformerEncoder encoder;
    CrossAttentionDecoder decoder;
    
    SkinningWeights query(Vector3 position) {
        auto latent = encoder.encode(position);
        return decoder.decode(latent);
    }
    
    Vector3 deform(Vector3 v, vector<Transform> handles) {
        auto weights = query(v);
        Vector3 result = Vector3::Zero();
        for (int i = 0; i < handles.size(); i++) {
            result += weights[i] * handles[i].transform(v);
        }
        return result;
    }
};
```

## 实验结论
- 在可泛化神经蒙皮上表现优异
- 实时物理动画生成
- 跨形状和离散化方法的良好泛化

## 局限性
- 依赖handle变换定义
- 复杂变形可能需要更多基函数

## 可行性分析
- 实现难度：中等（需要训练神经网络）
- 性能预期：高（实时）
- 适用场景：角色动画、物理仿真、游戏引擎

## 相关工作
- [[Linear Blend Skinning]]
- [[Neural Animation]]
- [[Physics-Based Simulation]]

## 笔记
PhysSkin将传统LBS扩展到神经网络领域，实现了离散化无关的泛化。对于实时渲染和游戏应用非常有价值，可以处理不同网格分辨率的角色动画。
