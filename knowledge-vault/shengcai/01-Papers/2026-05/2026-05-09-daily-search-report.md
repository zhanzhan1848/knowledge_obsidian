# 每日渲染领域论文搜索报告

**日期**: 2026-05-09
**时间**: 14:00 UTC
**搜索范围**: 最近 24 小时（2026-05-08 ~ 2026-05-09）

---

## 搜索配置

- **搜索源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## 搜索结果摘要

| # | 论文标题 | 来源 | 领域 | 可行性评估 |
|---|---------|------|------|-----------|
| 1 | 3DSS: 3D Surface Splatting for Inverse Rendering | arXiv 2605.05876 | 可微渲染/逆向渲染/PBR | ⭐⭐⭐⭐⭐ 高 |
| 2 | The Frame-Level Leakage Trap: Rethinking Evaluation Protocols | arXiv 2605.06359 | 评估协议/内在图像分解/全局光照 | ⭐⭐⭐ 中 |

---

## 论文详情

### 1. 3DSS: 3D Surface Splatting for Inverse Rendering
- **作者**: Adnane Boukhayma (INRIA, University of Rennes)
- **领域**: 可微渲染, 逆向渲染, 表面点渲染, PBR
- **核心创新**: 首个可微表面点渲染器，提出多层表面分离算法（区间合并），覆盖率不透明度模型
- **创新性**: ⭐⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐⭐
- **难度**: 中（需要理解 EWA 表面点渲染 + 可微渲染基础）
- **推荐度**: ✅ 强烈推荐

### 2. The Frame-Level Leakage Trap: Rethinking Evaluation Protocols for Intrinsic Image Decomposition
- **作者**: Jihwan Woo (Amazon Web Services)
- **领域**: 评估协议, 数据泄露, 内在图像分解
- **核心创新**: 首次定量证明 MPI Sintel 评估协议的数据泄露问题，提出 scene-level splits 标准
- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐（方法论层面的贡献，对实际渲染算法影响间接）
- **难度**: 低（主要是对评估协议的分析）
- **推荐度**: ⚠️ 谨慎推荐（方法论贡献，非直接渲染技术）

---

## 本日结论

今日找到 2 篇相关论文，其中 **3DSS** 与渲染领域高度相关，值得深入分析和传递给墨鱼丸进行算法评估。

**已保存至**:
- `shengcai/01-Papers/2026-05/2026-05-09_3DSS-Inverse-Rendering.md`
- `shengcai/01-Papers/2026-05/2026-05-09_Frame-Level-Leakage-Trap.md`

---

*生成时间: 2026-05-09 14:00 UTC*
