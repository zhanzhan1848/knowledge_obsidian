---
type: paper
created: 2026-05-14
updated: 2026-05-14
tags: [paper, 3DGS, distributed, city-scale, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.13794
---

# BlitzGS: City-Scale Gaussian Splatting at Lightning Speed

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BlitzGS: City-Scale Gaussian Splatting at Lightning Speed |
| **作者** | Zhongtao Wang |
| **发表** | arXiv cs.GR, 2026-05-13 |
| **链接** | [原文](https://arxiv.org/abs/2605.13794) |
| **代码** | https://github.com/AkierRaee/BlitzGS |

---

## 核心贡献

> 一句话总结：分布式3DGS框架，通过GPU分片、重要性评分和LOD门控实现城市级场景数量级加速

1. **系统级GPU分片**: 按索引奇偶性分片Gaussians，避免空间分区固有的跨块可见性冗余
2. **模型级重要性评分**: scheduled importance-scoring passes收缩全局高斯数量
3. **视图级LOD门控**: 距离基础LOD + 重要性基础剔除

---

## 技术方案

### 核心思想

城市级3DGS渲染面临大量活跃高斯负载问题。BlitzGS通过三个耦合层级管理：系统级GPU分片、模型级重要性评分、视图级LOD门控。

### 关键技术

| 技术 | 说明 |
|------|------|
| GPU分片 | 索引奇偶性分片，单次跨GPU交换路由投影高斯到tile owner |
| 可见性权重 | 每高斯可见性权重，偏置密度控制更新 |
| 每视图重要性掩码 | 用于视图级渲染器 |
| 距离LOD门控 | 排除当前frustum过细原语 |
| 重要性基础剔除 | 跳过跨视图贡献可忽略的高斯 |

---

## 实验结论

- 匹配最新大规模基线渲染质量
- 训练城市级场景仅需数十分钟
- 数量级加速

---

## 实现建议

- **实现难度**: 高（分布式系统）
- **预期性能**: 数量级加速
- **适用场景**: 城市级3DGS、大规模场景重建

---