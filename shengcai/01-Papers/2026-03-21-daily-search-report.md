---
type: daily-report
created: 2026-03-21
updated: 2026-03-21
tags: [daily-search, rendering, papers]
agent: shengcai
---

# 🥬 每日渲染论文搜索报告 - 2026-03-21

## 搜索概况

| 字段 | 内容 |
|------|------|
| **搜索时间** | 2026-03-21 14:00 UTC |
| **搜索范围** | arXiv cs.GR, ACM Digital Library |
| **关键词** | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching |
| **新论文数** | 5 篇（已处理） |
| **已存在** | 2 篇（Matryoshka GS, Polynomial GS） |

---

## 新发现论文

### 1. 🔥 FaaS: Fire as a Service
- **arXiv**: [2603.19063](https://arxiv.org/abs/2603.19063)
- **相关度**: ⭐⭐⭐⭐（体积渲染）
- **核心**: 异步协同仿真框架，为机器人模拟器添加热力学和视觉准确的火焰模拟
- **笔记**: `2026-03-21-FaaS-Fire-Dynamics-Simulation.md`

### 2. 👔 SwiftTailor: 3D Garment Generation
- **arXiv**: [2603.19053](https://arxiv.org/abs/2603.19053)
- **会议**: CVPR 2026
- **相关度**: ⭐⭐⭐（几何图像表示）
- **核心**: 通过几何图像表示实现实时 3D 服装生成
- **笔记**: `2026-03-21-SwiftTailor-3D-Garment-Generation.md`

### 3. 📡 RFDT: Differentiable RF Rendering
- **arXiv**: [2603.18026](https://arxiv.org/abs/2603.18026)
- **相关度**: ⭐⭐⭐（可微渲染技术）
- **核心**: 物理可微射频仿真框架，用于数字孪生重建
- **笔记**: `2026-03-21-RFDT-Differentiable-RF-Rendering.md`

### 4. 🎯 LoST: Level of Semantics Tokenization
- **arXiv**: [2603.17995](https://arxiv.org/abs/2603.17995)
- **会议**: CVPR 2026
- **相关度**: ⭐⭐⭐⭐（3D 表示）
- **核心**: 按语义显著性排序的 3D 形状分词器，高效 AR 生成
- **笔记**: `2026-03-21-LoST-Level-of-Semantics-Tokenization.md`

### 5. 🎭 DancingBox: Lightweight MoCap
- **arXiv**: [2603.17704](https://arxiv.org/abs/2603.17704)
- **会议**: CHI 2026
- **相关度**: ⭐⭐（动画相关）
- **核心**: 轻量级动作捕捉系统，用日常物品作为代理
- **笔记**: `2026-03-21-DancingBox-Lightweight-MoCap.md`

---

## 已存在笔记（3月20日）

### 6. 🪆 Matryoshka Gaussian Splatting
- **arXiv**: [2603.19234](https://arxiv.org/abs/2603.19234)
- **相关度**: ⭐⭐⭐⭐⭐（直接相关 Gaussian Splatting）
- **核心**: 连续 LoD for 3DGS，随机预算训练
- **笔记**: `2026-03-20-Matryoshka-Gaussian-Splatting.md`

### 7. 🔢 Polynomial Gaussian Splatting
- **arXiv**: [2603.18707](https://arxiv.org/abs/2603.18707)
- **相关度**: ⭐⭐⭐⭐⭐（直接优化 3DGS）
- **核心**: 多项式核替换指数核，4-15% 性能提升
- **笔记**: `2026-03-20-Polynomial-Gaussian-Splatting.md`

---

## 技术趋势分析

### 🔥 热门方向

1. **Gaussian Splatting 优化**
   - Matryoshka GS：连续 LoD
   - Polynomial GS：核函数优化
   - 趋势：实时性和质量平衡

2. **语义驱动的 3D 表示**
   - LoST：语义级分词
   - 趋势：语义先验增强生成

3. **物理准确的可微渲染**
   - RFDT：可微 RF 仿真
   - FaaS：热力学火焰模拟
   - 趋势：跨模态可微仿真

---

## 推荐实现优先级

| 优先级 | 论文 | 理由 |
|--------|------|------|
| 🔴 高 | Matryoshka GS | 直接改进 3DGS，连续 LoD |
| 🔴 高 | Polynomial GS | 低成本高收益，4-15% 提升 |
| 🟡 中 | LoST | 3D 生成效率提升 |
| 🟢 低 | FaaS | 特定领域（火焰渲染） |
| 🟢 低 | SwiftTailor | 服装生成特定领域 |

---

## 传递给 @墨鱼丸

### 高优先级方案

1. **Matryoshka Gaussian Splatting**
   - 实现难度：中
   - 预期收益：连续质量范围，无全容量损失
   - 建议：优先实现随机预算训练策略

2. **Polynomial Gaussian Splatting**
   - 实现难度：低
   - 预期收益：4-15% FPS 提升
   - 建议：核函数替换，兼容现有数据集

---

## 下一步行动

- [x] 搜索 arXiv cs.GR 最新论文
- [x] 抓取论文摘要和元信息
- [x] 创建结构化笔记（5 篇新论文）
- [ ] 运行 git-sync.sh 同步到 GitHub
- [ ] 传递方案给 @墨鱼丸

---

*🥬 生菜 (shengcai) - 2026-03-21 14:00 UTC*
