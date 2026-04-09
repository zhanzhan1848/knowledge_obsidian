---
tags: [网格处理, B-Rep, CAD, 拓扑, 重网格化]
---

# Topology-First B-Rep Meshing

## 论文信息

| 属性 | 值 |
|------|-----|
| arXiv | [2604.02141](https://arxiv.org/abs/2604.02141) |
| 分类 | cs.GR, cs.CG |
| 提交时间 | 2026-04-02 |
| 作者 | YunFan Zhou 等（ NYU, TU Berlin, U. Victoria） |
| 会议 | （预印本） |

## 核心方法

### 问题背景
B-Rep（边界表示）是 CAD/图形/机器人领域的事实标准。将 B-Rep 转换为网格的过程目前非常脆弱，核心困难在于：
1. 高阶参数曲面交线需要用低阶几何近似
2. 3D 曲线与参数域 2D trim curves 可能不一致（Fusion360 数据集中 14% 的 trims 存在自相交）
3. 传统方法用启发式特征合并和修复策略，无法保证拓扑正确性

### 核心创新
**将 B-Rep 拓扑作为 meshing 的不变量**，不再依赖有问题的 2D trimming curves。

### 算法流程（五阶段）

```
1. Geometry Sampling（几何采样）
   ↓
2. Curve Snapping（曲线吸附）
   ↓
3. Loop Embedding on each face（各面环路嵌入）
   ↓
4. Stitching across faces（跨面缝合）
   ↓
5. Geometry & Topology preserving isotropic remeshing
   （保拓扑等距重网格化）
```

**关键洞察**：直接用 3D 邻接曲线在 3D 空间裁剪参数面片，绕过了 2D 参数域的不一致问题。

### 拓扑保证性质
- **用户只控制一个参数**：几何容差 ε
- 容差只影响几何精度（网格与曲面的偏离），不影响拓扑正确性
- 拓扑正确性与几何精度解耦

## 复杂度分析

- **时间复杂度**：O(n log n) 基础操作，关键路径在曲线-曲面求交
- **空间复杂度**：O(n) 其中 n 为 B-Rep 元素数量
- 在 10,000+ ABC 和 Fusion360 模型上验证

## 开源实现

| 库 | 函数/模块 |
|----|-----------|
| libigl | `remesh_along_line_set`, `trim_mesh_by_curves`（需扩展） |
| CGAL | `SMesh_3`, `Polygon_mesh_processing::remesh()` |
| OpenCascade | B-Rep kernel（底层支撑）|

## 可行性评估

✅ **强烈推荐实现**

### 推荐理由
1. 算法核心思想清晰：拓扑优先，几何精度作为可调参数
2. 已在大规模真实数据集（10,000+ 模型）验证鲁棒性
3. 解耦拓扑与几何的设计哲学可直接借鉴
4. CAD 网格管线直接可用

### 实现注意事项
- 曲线-曲面求交是数值稳定性关键点
- 多线程友好，各面可并行处理
- 等距 remeshing 阶段参考 CGAL 的 isotropic remeshing

## 相关论文

- [[2026-04-09-DAILY-SUMMARY]] — 每日摘要
- ABC Dataset (Koch et al., 2019)
- Fusion 360 Dataset (Willis et al., 2021)

## 待跟进

- [ ] 作者是否计划开源代码
- [ ] 与 libigl 的集成示例
- [ ] 处理非流形 B-Rep 的扩展
