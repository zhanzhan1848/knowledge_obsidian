---
date: 2026-03-13
search_scope: arXiv cs.GR, 最近24小时
keywords: [mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification]
papers_found: 8
relevant_papers: 2
---

# 每日几何处理论文搜索报告 - 2026年3月13日

## 📊 搜索统计

- **搜索时间**：2026-03-13 14:06 UTC
- **搜索范围**：arXiv cs.GR (最近24小时)
- **发现论文**：8篇
- **相关论文**：2篇 (与关键词高度匹配)

## 🎯 重点论文

### 1. TreeON: Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps
- **arXiv**: [2603.10996](https://arxiv.org/abs/2603.10996)
- **分类**: cs.GR (Graphics)
- **关键词匹配**: ✅ point cloud, reconstruction
- **开源**: ✅ 代码、数据集、预训练模型公开
- **推荐度**: ⭐⭐⭐⭐⭐

**核心贡献**：
- 从正射影像 + DSM 重建3D树木点云
- 无需物种标签、程序规则、激光扫描数据
- 强泛化能力（合成训练 → 真实应用）

**应用价值**：城市规划、数字地图、景观设计

---

### 2. TopGen: Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation
- **arXiv**: [2603.10606](https://arxiv.org/abs/2603.10606)
- **分类**: cs.GR (Graphics)
- **关键词匹配**: ✅ mesh processing, remeshing
- **开源**: ⚠️ 待确认（数据集 TopGen-220K 可用）
- **推荐度**: ⭐⭐⭐⭐⭐

**核心贡献**：
- 同时预测结构布局和交叉场
- 双查询解码器架构
- 对非流形几何和低质量拓扑鲁棒
- 发布 TopGen-220K 大规模数据集

**应用价值**：CAD/CAE 前处理、游戏资产管线、有限元分析

## 📚 其他论文

### 今天 (2026-03-13)

1. **High-Contrast Projection Mapping** (arXiv:2603.11573)
   - 分类: cs.HC/cs.GR
   - 主题: 投影映射、光照控制
   - 相关性: 低（非几何处理核心）

2. **Shadowless Projection Mapping** (arXiv:2603.11551)
   - 分类: cs.HC/cs.CV/cs.GR
   - 主题: 无阴影投影映射
   - 相关性: 低

3. **Physics-Grounded Human-Human Control** (arXiv:2603.11346)
   - 分类: cs.CV/cs.GR/cs.RO
   - 会议: CVPR 2026
   - 主题: 人物动画、物理模拟
   - 相关性: 中（人物几何）

### 昨天 (2026-03-12)

4. **Clough-Tocher vs Multiquadric RBF** (arXiv:2603.10590)
   - 分类: cs.GR
   - 主题: 曲面插值
   - 相关性: 中（曲面重建）

5. **Landmark Guided 4D Facial Expression** (arXiv:2603.10337)
   - 分类: cs.GR
   - 主题: 4D面部表情生成
   - 相关性: 低

6. **Frequency-controlled 4D Facial Expression** (arXiv:2603.10326)
   - 分类: cs.GR
   - 主题: 4D面部表情合成
   - 相关性: 低

## 🔍 关键词匹配分析

| 关键词 | 匹配论文 |
|--------|----------|
| **point cloud** | TreeON ✅ |
| **mesh processing** | TopGen ✅ |
| **remeshing** | TopGen ✅ |
| **geometry processing** | 全部 (cs.GR) |
| **subdivision surface** | 无 |
| **parametrization** | 无（交叉场相关） |
| **simplification** | 无 |

## 📋 可行性分析

### 高优先级
1. **TopGen** - 四边形网格生成
   - ✅ 解决核心几何处理问题
   - ✅ SOTA 性能
   - ✅ 大规模数据集可用
   - 📌 建议：等待代码发布，优先集成

2. **TreeON** - 点云重建
   - ✅ 开源完整（代码+数据+模型）
   - ✅ 实际应用价值高
   - ✅ 无需昂贵采集设备
   - 📌 建议：可直接使用预训练模型

### 中等优先级
3. **Clough-Tocher vs RBF** - 曲面插值
   - 📊 可复现的比较研究
   - 🔧 环境工程应用背景

## 🚀 下一步行动

1. **立即行动**：
   - ✅ 创建 TopGen 和 TreeON 详细笔记
   - ⏳ 运行 git-sync.sh 同步到 GitHub

2. **等待跟进**：
   - 关注 TopGen 代码发布
   - 测试 TreeON 预训练模型

3. **传递给墨鱼丸**：
   - TopGen: 四边形网格生成方案
   - TreeON: 点云重建方案

## 📎 笔记位置

- `/01-Papers/2026-03/2026-03-12_TreeON-Point-Cloud-Reconstruction.md`
- `/01-Papers/2026-03/2026-03-12_TopGen-Quad-Mesh-Generation.md`

---

🥬 **娃娃菜** - 计算机图形学几何专家
