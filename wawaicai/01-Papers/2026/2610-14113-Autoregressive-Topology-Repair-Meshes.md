---
title: "Autoregressive Topology Repair for Generated Artisan Meshes"
arxiv_id: "2610.14113"
date: 2026-10-09
venue: arXiv preprint
tags: [几何, 网格修复, 拓扑修复, Autoregressive, Artisan Mesh, Prefix-LM]
authors:
  - Yufei Wang
url: "https://arxiv.org/abs/2610.14113"
---

# Autoregressive Topology Repair for Generated Artisan Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Autoregressive Topology Repair for Generated Artisan Meshes |
| **作者** | Yufei Wang (et al.) |
| **发表** | arXiv preprint |
| **链接** | [arXiv:2610.14113](https://arxiv.org/abs/2610.14113) |
| **DOI** | 10.48550/arXiv.2610.14113 |
| **代码** | TBD |

---

## 核心贡献

> 提出基于 prefix-LM 的面级编辑序列，对生成网格的拓扑进行原位修复，无需重生成整张网格。

1. **Face-Level Prefix-LM 网络**: 双向读取网格，自回归输出删除-添加编辑序列
2. **新型 deletion head**: 自回归选择要删除的面
3. **新型 addition head**: 选择顶点构成新面，必要时新增顶点
4. **保留草稿布局**: untouched faces 透传，仅编辑需要修复的区域

---

## 技术方案

### 核心思想

修复任务 = 对生成的网格（draft）进行原位拓扑修正，使其接近艺术家偏好。流程：

1. **输入**: 草稿网格（可能含洞、游离面、重复面）
2. **双向编码**: 通过 prefix-LM 读取整个网格
3. **两阶段编辑**:
   - 删除阶段：autoregressive 标记需删除的面
   - 添加阶段：autoregressive 添加新面（必要时增加顶点）
4. **输出**: 校正网格（保留草稿顶点布局）

### 关键技术

| 技术 | 说明 |
|------|------|
| Prefix-LM | 双向编码 + 自回归生成 |
| 编辑序列 | 删除 + 添加两阶段组合 |
| Deletion head | 自回归面选择 |
| Addition head | 顶点选择，必要时新增 |
| 草稿 prefix | 编辑次数 << 重新生成面数 |

---

## 算法复杂度

- **解码步数**: 仅编辑次数（远小于重新生成所有面）
- **推理时间**: 取决于编辑复杂度（典型 < 全网格生成）
- **输出**: 校正后网格，保持原始顶点和布局

---

## 实验结论

- **数据集**: 自建脚本缺陷 + 两个 mesh 生成器的 held-out drafts
- **基线**: 现有修复工具
- **结果**:
  - F1 改善（quad-equivalent face）
  - 去除 non-manifold 面
  - 优化整体拓扑

---

## 局限性

- 依赖前序 mesh 生成器的质量
- 编辑序列长度需控制（否则失去 prefix 优势）
- 训练数据多样性依赖 mesh generator 候选

---

## 相关工作

- [[Mesh-Repair]]
- [[Topology-Correction]]
- [[Manifold-Meshes]]
- [[Neural-Mesh-Editing]]
- [[Autoregressive-Mesh-Generation]]

---

## 实现建议

- **实现难度**: 高（依赖大规模训练数据 + prefix-LM 架构）
- **预期性能**: 编辑序列短时推理快
- **适用场景**: 自动网格生成后处理、艺术家辅助修复、AI 生成网格 QA
- **依赖项**: PyTorch + 自定义 transformer
- **开源参考**:
  - OpenMesh: 拓扑修复工具 (`OpenMesh::remove_non_manifold_edges`)
  - libigl: `remove_duplicate_vertices`, `is_edge_manifold`
  - PyTorch3D: mesh 算子
  - trimesh: Python 端 mesh 修复

---

## 论文元数据

- **arXiv 提交**: 2026-10-09 06:33 UTC
- **归属主题**: 网格修复、生成式建模、AI 辅助几何处理
- **预期应用**: CAD 辅助、艺术资产生成管线
