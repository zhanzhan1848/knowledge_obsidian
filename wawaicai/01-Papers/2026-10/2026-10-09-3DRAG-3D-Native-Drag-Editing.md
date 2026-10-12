---
type: paper
created: 2026-10-12
updated: 2026-10-12
tags: [paper, geometry, mesh-deformation, 3d-editing, drag-editing, generative-models, training-free, cs.GR]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: http://arxiv.org/abs/2610.13216v1
---

# 3DRAG: 3D-Native Object Drag Editing with Generative Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 3DRAG: 3D-Native Object Drag Editing with Generative Models |
| **作者** | Kuixiang Shao, Yuyang Jiao, Chenghao Zhang, Wenbo Zhao et al. |
| **发表** | arXiv preprint (cs.GR) 2026-10-09（Mon 2026-10-12 cs.GR 公告） |
| **链接** | [原文](http://arxiv.org/abs/2610.13216v1) |
| **DOI** | — |
| **代码** | — |
| **关键词** | 3D drag editing, point-based deformation, generative models, training-free |

---

## 核心贡献

> 在大模型 3D 隐空间内做原生 drag 编辑的训练免费框架，避免 SDS 优化 / 迭代点追踪；提出 3D 位移场 + OA-WTA 策略。

1. **3D 位移场扩展**: 把 2D 拖拽位移显式延伸到 3D 空间。
2. **OA-WTA (Occupancy-Aware Winner-Takes-All)**: 处理稀疏几何的鲁棒性策略。
3. **Generative Editing Pipeline**: 通过 3D 位移场变换隐表示，平滑几何形变同时保持物体 identity。
4. **Logits-Level Token Fusion**: 高保真迁移源几何和纹理到目标区域。
5. **新基准**: 多资产 + 复杂多点 drag 指令数据集。

---

## 技术方案

### 核心思想

既有 3D drag 方法要么走 2D diffusion + SDS（慢、迭代优化），要么直接 warp 几何（导致多视角不一致 / 拓扑伪影）。3DRAG 完全在 generative 模型的 3D latent 内操作：先用 3D 位移场 + OA-WTA 决定哪些 voxel / point 该被"拖"，然后在 latent 层做 token-level 融合。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Displacement Field | 把 2D drag 显式投射到 3D |
| OA-WTA | occupancy-aware 处理稀疏几何 |
| Generative Latent Editing | latent 内转换，不改显式几何 |
| Logits-Level Token Fusion | 高保真源信息迁移到目标区 |

---

## 实验结论

- **数据集**: 自构多资产 + 多点 drag 指令数据集
- **基线**: SDS-based 3D editing, 2D-lifted drag methods
- **结果**:
  - 训练免费（training-free）
  - 多视角一致（无拓扑伪影）
  - 几何 / 纹理身份保持
  - 复杂多点 drag 指令可执行

---

## 局限性

- 仅适用于 generative 模型的 3D 隐空间覆盖的范围
- 多点 drag 的交互逻辑依赖指令解析（可能出错）
- 极端大形变仍可能失败

---

## 相关工作

- [[2026-10-08-SubDGuide-Agentic-Mesh-to-SubD]]（同期 mesh 处理）
- 经典：DragGAN, DragDiffusion, Instruct-NeRF2NeRF
- 相关：3D-native editing (NeuralEditor, Vox-E)

---

## 实现建议

- **实现难度**: 中（基于现有 3D generative 模型）
- **预期性能**: 实时（无需 SDS 优化）
- **适用场景**: 3D 资产生成后编辑、AR/VR 实时交互、3D 角色姿态编辑
- **依赖**: PyTorch, 预训练 3D generative model (e.g. TripoSR, CRM), 可选 LLM
- **可行性** ✅ 推荐——3D-native + training-free 对实用工具类应用非常友好