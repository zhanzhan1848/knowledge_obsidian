---
tags: [日报, 几何处理, 2026-08-25]
date: 2026-08-25
---

# 日报 | 2026-08-25 | 几何处理论文

## 搜索概况

- **搜索范围**: arXiv cs.GR (最近 7 天), ACM DL, SIGGRAPH/Eurographics
- **搜索关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **搜索时间**: 2026-08-25 14:02 UTC

## 发现的论文（共 3 篇几何处理相关）

### 🥬 Proximity-Preserving Neural Subdivision (PNS)
- **arXiv**: 2608.14704 | 2026-08-24
- **会议**: 预印本
- **核心**: 神经 Loop 细分，在架构级保证 SE(3) 等变性、$O(h^2)$ proximity、迭代稳定性
- **标签**: `网格细分` `神经几何处理` `等变性`
- **可行性**: ✅ 推荐实现
- **传递**: @墨鱼丸（特征敏感网格细分模块）

### 🥬 RADmesh: Remesh-Aware Mesh Deformation  
- **arXiv**: 2608.17182 | 2026-08-17
- **会议**: ECCV 2026 Oral
- **核心**: 将各向同性重网格化融入视觉损失监督的网格变形流程
- **标签**: `网格变形` `重网格化` `ECCV`
- **可行性**: ✅ 推荐关注
- **传递**: @墨鱼丸（text-to-mesh / shape editing 变形模块）

### 🥬 Decimation for Deformation Handles
- **arXiv**: 2608.17930 | 2026-08-18
- **会议**: 预印本
- **核心**: 基于网格简化的变形手柄计算，紧支撑低内存，用于实时 elastodynamics
- **标签**: `网格简化` `降阶模型` `变形控制`
- **可行性**: ✅ 推荐实现
- **传递**: @墨鱼丸（降阶变形模块）

## 其他相关论文（几何处理交叉领域）

| 论文 | arXiv | 领域 | 标签 |
|------|-------|------|------|
| FA-QEM: Fast and Robust Mesh Simplification | 2605.14029 | 网格简化 | `CVPRW 2026 Best Paper Runner-up` |
| TopoSurfel: Gaussian Surfels + Meshes | 2608.20687 | 表面重建 | `3DGS + Mesh 融合` |
| Meschers: Impossible Objects | 2605.14960 | 几何处理 | `非欧几何` |

## 搜索受限说明

- ACM Digital Library 和 SIGGRAPH 会议论文因 Brave Search API 限流未能搜索
- 限流恢复后建议补充搜索

## 明日关注

- [ ] 限流恢复后补充 ACM/SIGGRAPH 搜索
- [ ] PNS 论文代码是否开源
- [ ] RADmesh GitHub 链接确认
