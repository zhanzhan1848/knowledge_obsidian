---
created: 2026-07-28
tags: [daily-summary, geometry, arxiv]
---

# 每日几何处理论文总结 - 2026-07-28

## 📊 搜索概况

- **搜索时间**: 2026-07-28 14:10 UTC
- **搜索范围**: arXiv cs.GR 最近一周 + cross-list papers
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

## 📄 本次发现论文

### 几何处理相关 (4篇)

| 论文 | 领域 | 会议 | 亮点 |
|------|------|------|------|
| Neural Representation of Minimal Surfaces (2607.23437) | 曲面表示 | arXiv | Weierstrass-Enneper 精确神经参数化 |
| URHead (2607.22673) | UV参数化+3DGS | ECCV 2026 | Mesh-3DGS 在统一 UV 空间联合优化 |
| Curly Hair Simulation using Curly Finite Elements (2607.22103) | 网格变形 | arXiv | 卷发有限元模拟，弯曲/扭转能量分裂 |
| Deformable Triangle Splatting (2607.22446) | 辐射场 | arXiv | 可变形三角形支持非凸形状 |

### 其他相关 (渲染/仿真)

| 论文 | 领域 | 会议 | 亮点 |
|------|------|------|------|
| ParticleGS (2607.22956) | 点云压缩 | SC26 | 281M 粒子 65x 压缩，3DGS 可视化 |
| Meshless DR via 3DGS (2607.22890) | 域随机化 | arXiv | 无网格参数扰动替代多边形网格 |
| IRGS++ (2607.22780) | 逆渲染 | arXiv | 高斯 inverse rendering with inter-reflection |
| Design-Intent Compilation (2607.22741) | 制造 | arXiv | 异质制造的设计意图编译器 |
| Curly Hair FEM (2607.22103) | 毛发仿真 | arXiv | Curly finite elements |

## 🔍 arXiv cs.GR 本周概览

本周共 33 篇 cs.GR 论文，主要集中在：
- 3D Gaussian Splatting (新视图合成、avatar、渲染)
- 逆渲染 (inverse rendering)
- 物理仿真 (毛发、摩擦、弹性)
- 神经隐式表示

## 📁 已创建笔记

```
wawaicai/01-Papers/2026-07/
├── 2026-07-28-Neural-Representation-Minimal-Surfaces.md
├── 2026-07-28-URHead-Unified-UV-Mesh-3DGS.md
├── 2026-07-28-Curly-Hair-Curly-Finite-Elements.md
└── 2026-07-28-Deformable-Triangle-Splatting.md
```

## ⏭️ 后续行动

- [ ] 分析 URHead 的 UV 参数化方法，可能与墨鱼丸协作
- [ ] 关注 Neural Minimal Surfaces 的 libigl/CGAL 对应实现
- [ ] 追踪 Deformable Triangle Splatting 的开源代码

## 📝 备注

本轮搜索未发现 point cloud、subdivision surface、simplification 方向的最新论文。
