---
tags: [几何, 部件分解, 网格生成, 几何重建, 神经隐式, Transformer, 结构先验, NeurIPS2026]
date: 2026-10-16
source: arXiv
arxiv_id: 2610.21850
venue: cs.CV (cross-list cs.GR, NeurIPS 2026)
status: new
authors: Yiqun Zhao, Binbin Huang, Haobin Duan, Zibo Zhao, Shenghua Gao
project: https://zhao-yiqun.github.io/structparts/
---

# STRUCTPARTS: Seeing Both the Forest and the Trees — Reusing Holistic 3D Priors for Part-Decomposed Generation

## 核心问题
3D 资产生成需要两难平衡：
- **部件内（intra-part）几何细节**：每个 part 内部的精细几何
- **部件间（inter-part）结构连贯性**：整个对象的结构一致性

现有方法的局限：
- **图像条件 3D 生成模型**：用结构化 3D 表示（tokens 锚定到空间位置）已能同时建模二者，但**输出仍是单一融合 mesh**
- **部件分解生成模型**：能输出 part-decomposed mesh，但难以继承 holistic 模型的细节与连贯性

**核心问题**：如何让 part-decomposed generation 模型同时继承 holistic priors 的几何细节（part scale）和结构连贯性（object scale）？

## 方法概述

### 核心创新：**Dual-Frame Coordinate Interleaving Mechanism**

每个 shape latent 同时在**两个坐标系**下解释：
1. **Part-local frame**（部件局部参考系）：负责部件内细节
2. **Object-global frame**（对象全局参考系）：负责部件间连贯性

通过 **global-local inter-leaved transformer** 交替处理两种 frame 的 latent。

### 结构输入：**Segmented Mesh Scaffold**

- 粗 mesh + face-level segmentation mask
- **完全保持在 prior 的原生 3D 表示内**
- 不引入新的表示形式（避免跨表示 gap）

### 训练策略：**轻量级 finetuning**

- 仅轻量 finetune，无需从零训练
- 同一组预训练权重即可涌现"部件内细节"和"部件间连贯性"
- 训练成本仅是现有 part-decomposed 模型的小部分

## 实验结果

| 数据集 | 评估 | 结果 |
|--------|------|------|
| **PartObjaverse-Tiny** | 匹配/超越 SOTA part-decomposed 模型 | ✅ |
| | 训练成本 | 一小部分 |
| **Part-mesh refinement** | 自然支持 | ✅ |
| **Part-level editing** | 自然支持 | ✅ |

## 复杂度分析

### 训练
- **轻量 finetuning**：相比从头训练 part-decomposed 模型，**训练成本 ↓ 1-2 个数量级**
- **复杂度**：标准 Transformer 训练，O(L² · D)，L 为 latent 长度，D 为 hidden dim

### 推理
- **复杂度**：O(L · D) per shape latent
- 支持 part-level editing：增量更新部分 latent，无需重新生成

## 实现难度

- **算法复杂度**：**高**
  - 需要复现 holistic 3D prior 模型（如基于 structured latent 的图像到 3D 模型）
  - 双 frame 切换需要 careful engineering，避免 latent 错位
  - Segmented mesh scaffold 的构建需要 segment 算法（如 SAM / 视觉分割模型）
- **数值稳定性**：
  - 双 frame 转换需保持 latent 几何一致性，避免 frame 切换导致 jump
  - Interleaved attention 需要相对位置编码校准
- **依赖项**：
  - PyTorch + Transformer
  - 复现 holistic 3D prior（可能需要 Diffusion/3DGS 类模型）
  - 分割算法（SAM, Mask3D 等）

## 推荐结论
✅ **推荐跟踪**（不立即实现）

### 推荐理由
1. **NeurIPS 2026 接收**：质量有保障，方法新
2. **思想普适**：dual-frame 思路可推广到其他"局部-全局"耦合问题（如 texture-mesh、skeleton-skin）
3. **下游价值高**：part-level editing 是工业界长期需求

### 实现注意
- 不建议立刻复现全流程（依赖 holistic prior），但**dual-frame 思想可独立移植**
- 适合做小型 PoC：先在简单数据集（如 PartNet）上验证 dual-frame 收益

## 开源参考

- **作者主页**：https://zhao-yiqun.github.io/structparts/
- **基础 prior**：Holistic 3D prior 多用 Diffusion 或 3DGS 类表示
- **Segmentation**：SAM (Meta) / Mask3D 用于 scaffold 构造

## 与 wawaicai 研究方向的连接

### 关键交叉点

| wawaicai 主题 | STRUCTPARTS 连接 |
|--------------|------------------|
| **网格生成** | 输出的 part-decomposed mesh 是高质量 mesh |
| **部件分割** | scaffold 用 face-level segmentation mask |
| **几何重建** | 从图像到 3D 资产生成 |
| **几何深度学习** | 神经网络 + 几何结构协同 |

### 与已有工作的协同

- **与 [[PartMat-Material-Aware-3D-Part-Decomposition]]**：本文是几何连贯性方向，PartMat 是材料感知方向，二者互补
- **与 [[SubDGuide-Agentic-Mesh-to-SubD]]**：SubDGuide 关注 mesh→SubD 转换，本文明示 part-level editing 是其下游应用
- **与 [[Hi-TOPS-3D-Part-Decomposition]]**：Hi-TOPS 是拓扑感知分解，本文明示 dual-frame 是新的几何解耦维度

## 应用场景

- **3D 资产生成**：游戏 / VR / AR 工业级资产生成
- **Part-level editing**：用户可单独编辑某个部件
- **3D 内容创作**：与 Blender / Maya 集成的工作流
- **逆向工程**：从图像到可编辑 3D 模型

## 备注

- **核心思想**："part-local + object-global" dual-frame 思维可推广到：
  - 几何 + 物理属性（如 displacement + material）
  - 静态 + 动态（如 rigid + non-rigid）
  - 局部 + 全局纹理
- **行业意义**：NeurIPS 2026 + 项目页开源，工业界可能短期内跟进
- **建议关注**：作者后续工作 —— 双 frame 思想可能延伸到更多 3D 生成场景

---
相关主题：[[部件分解]] [[网格生成]] [[几何重建]] [[神经隐式表示]] [[3D 生成]] [[NeurIPS 2026]] [[Transformer]] [[结构先验]]
