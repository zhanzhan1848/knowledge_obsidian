---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, navigation-mesh, SE2, robotics, path-planning, cs.RO]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.01454
---

# SE(2) Navigation Mesh

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SE(2) Navigation Mesh |
| **作者** | Kaixian Qu et al. |
| **发表** | arXiv cs.RO (2026-07-01) |
| **链接** | [原文](https://arxiv.org/abs/2607.01454) |
| **DOI** | 10.48550/arXiv.2607.01454 |
| **项目主页** | https://se2-navmesh.github.io/ |

---

## 核心贡献

> 提出编码偏航相关可通行性的多边形表示，通过足迹掩码评估可通行性，支持在线增量更新

1. **偏航相关可通行性编码**：超越传统yaw不变NavMesh，适用于非圆形机器人在受限空间导航
2. **足迹掩码评估**：评估可通行性的新方法
3. **A*-String Pulling-A* (ASA) 路径规划**：分层优化机器人位置和航向
4. **在线增量更新**：从流式点云实时更新NavMesh

---

## 技术方案

### 核心思想

当前方法存在关键局限：
- 点云和体素占用图缺乏用于可通行性估计的显式表面结构
- 密集三角形网格直接路径规划计算成本过高
- 传统NavMesh假设yaw不变可通行性，不适合受限空间中的非圆形机器人

SE(2) NavMesh提出编码偏航相关可通行性的多边形表示，在yaw特定层上构建图，具有显式的平移和旋转连接性。

### 关键技术

| 技术 | 说明 |
|------|------|
| 偏航特定层 | 编码不同航向的可通行区域 |
| 足迹掩码 | 用于评估可通行性的形状表示 |
| ASA路径规划 | A*-String Pulling-A* 分层优化 |
| 在线增量更新 | 从流式点云实时几何重建 |

---

## 实验结论

- 比经典NavMesh捕获超过50%的更多可通行区域
- SE(2) NavMesh + ASA在受限环境始终优于采样基线
- 物理机器人实时在线生成和导航验证

---

## 局限性

- 主要针对地面机器人
- 需要预先获取环境点云

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 机器人导航、自动驾驶、游戏AI寻路
- **参考库**: Open3D (点云), CGAL (计算几何), OR-Tools (路径规划)

---

## 相关工作

- [[Navigation Mesh]]
- [[Point Cloud Processing]]
- [[Path Planning]]
