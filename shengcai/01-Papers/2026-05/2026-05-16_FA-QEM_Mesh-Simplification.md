---
tags: [渲染, 网格简化, QEM, 3D资产生成, AI生成, 2026]
date: [[2026-05-16]]
status: 待读
---

# FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 基本信息

| 属性 | 值 |
|------|-----|
| 作者 | - |
| 发表 | IEEE/CVF CVPRW 3D4S 2026 (**Best Paper Award Runner-up**) |
| 链接 | [arXiv:2605.14029](https://arxiv.org/abs/2605.14029) |

## 核心贡献

1. 提出 **Feature-Aware Quadric Error Metric (FA-QEM)**，为现代 3D 资产生设计的网格简化流程
2. 新型多分量 quadric 误差公式，联合编码：
   - 几何偏差
   - 边界曲率
   - 表面法线一致性
3. 实现最佳顶点放置，即使在激进简化时也能保留锐利特征
4. 高保真几何简化显著改善下游外观传输

## 技术方案

### 核心问题
现代重建和生成管道（神经渲染、大规模 3D 资产生成）产生的网格通常密集、有噪声且常为非流形。

### FA-QEM 方法
- 新的多分量 quadric 误差公式
- 联合优化几何偏差、边界曲率和法线一致性
- 支持激进简化的同时保留锐利特征
- 作为纹理映射的优越前端

### 实验
- 在 AI 生成网格和大规模真实数据集（Thingi10K、Real-World Textured Things）上评估
- 更低的几何误差、更好视觉保真度、更快运行时间
- 在多样化输入上保持鲁棒性

## 可行性分析

- **实现难度**：中
- **实用价值**：高（3D资产生成管道重要组件）
- **渲染相关度**：中（下游渲染管线相关）

## 相关链接

- [PDF](https://arxiv.org/pdf/2605.14029)
- [HTML](https://arxiv.org/html/2605.14029v1)