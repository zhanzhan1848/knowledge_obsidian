---
tags: [每日报告, 论文搜索, 几何处理]
date: 2026-03-22
---

# 每日几何处理论文搜索报告

## 搜索范围

- **时间**: 2026-03-21 ~ 2026-03-22 (最近24小时)
- **来源**: arXiv cs.GR
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

## 搜索结果概览

### arXiv cs.GR 最近提交 (共30篇)

- Fri, 20 Mar 2026: 5篇 (全部为跨领域)
- Thu, 19 Mar 2026: 3篇 (1篇纯cs.GR)
- Wed, 18 Mar 2026: 15篇 (7篇纯cs.GR)
- Tue, 17 Mar 2026: 6篇 (3篇纯cs.GR)
- Mon, 16 Mar 2026: 1篇 (1篇纯cs.GR)

## 重点论文分析

### 🥬 高度相关 (几何处理核心)

#### 1. Masked BRep Autoencoder via Hierarchical Graph Transformer
- **arXiv**: [2603.14927](https://arxiv.org/abs/2603.14927)
- **核心**: CAD BRep表示的自监督学习框架
- **创新**: Masked Graph Autoencoder + Hierarchical Graph Transformer
- **应用**: 零件分类、建模分割、加工特征识别
- **推荐**: ✅ 强烈推荐关注

#### 2. A Texture Lookup Approach to Bézier Curve Evaluation on the GPU
- **arXiv**: [2603.15447](https://arxiv.org/abs/2603.15447)
- **核心**: 利用GPU纹理硬件加速贝塞尔曲线求值
- **创新**: 固定功能线性纹理插值硬件
- **扩展**: B-splines, NURBS, 有理多项式
- **推荐**: ✅ 强烈推荐实现

### 🥬 中度相关 (几何+应用)

#### 3. Retrieval-Augmented Sketch-Guided 3D Building Generation
- **arXiv**: [2603.16612](https://arxiv.org/abs/2603.16612)
- **会议**: CAADRIA 2026
- **核心**: 草图到3D建筑的多阶段生成框架
- **创新**: 生成式+检索式混合，组件级编辑
- **推荐**: ✅ 推荐关注

#### 4. Fast and Reliable Gradients for Deformables Across Frictional Contact Regimes
- **arXiv**: [2603.16478](https://arxiv.org/abs/2603.16478)
- **核心**: 可变形体摩擦接触的可微分仿真
- **创新**: GPU加速，严格马尔可夫动力学
- **推荐**: ⚠️ 谨慎评估（物理仿真向）

### 🥬 参考关注

#### 5. DancingBox: Lightweight MoCap for Character Animation
- **arXiv**: [2603.17704](https://arxiv.org/abs/2603.17704)
- **会议**: CHI 2026
- **核心**: 轻量级动作捕捉，数字木偶
- **推荐**: ⚠️ 参考关注（角色动画向）

## 知识库更新

本次创建笔记：
- `2026-03-22-Masked-BRep-Autoencoder-Hierarchical-Graph-Transformer.md`
- `2026-03-22-Texture-Lookup-Bezier-Curve-GPU.md`
- `2026-03-22-Retrieval-Augmented-Sketch-Guided-3D-Building-Generation.md`
- `2026-03-22-Fast-Reliable-Gradients-Deformables-Frictional-Contact.md`
- `2026-03-22-DancingBox-Lightweight-MoCap-Character-Animation.md`

## 传递给 @墨鱼丸

### 优先级推荐

| 优先级 | 论文 | 技术 | 建议动作 |
|--------|------|------|----------|
| P0 | BRep Autoencoder | CAD几何深度学习 | 评估集成可行性 |
| P1 | GPU Bézier Texture | 曲线求值加速 | 考虑渲染管线优化 |
| P2 | Sketch-to-3D | 组件化生成 | 借鉴分割思路 |

## 备注

- Web Search API遇到限流，改用直接抓取arXiv页面
- 最近24小时无纯cs.GR新论文，最新为3月19日
- 建议关注BRep表示学习和GPU曲线求值技术

---
*生成时间: 2026-03-22 14:06 UTC*
*Agent: wawaicai 🥬*
