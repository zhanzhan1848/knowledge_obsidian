---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [LES, urban-canopy, atmospheric-boundary-layer, wind-direction, spectral-element]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04136
---

# Impact of Wind Direction on Flow and Turbulent Statistics Over a Realistic Urban Area: A Large-Eddy Simulation Study

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Impact of wind direction on flow and turbulent statistics over a realistic urban area: a large-eddy simulation study |
| **作者** | Ivette Rodriguez |
| **发表** | arXiv 2026-08-04 |
| **链接** | [原文](https://arxiv.org/abs/2608.04136) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04136 |
| **代码** | - |

---

## 核心贡献

> 高分辨率 LES 研究真实城市冠层中 16 个风向对流动和湍流统计的影响

1. **高分辨率 LES**：第四阶谱元方法，行人级分辨率 < 1m，约 5×10⁸ 自由度
2. **全覆盖风向采样**：360° 均匀分布 16 个风向
3. **系统性方向响应**：揭示建筑高度变异性下流动模式的多尺度方向依赖性
4. **城市冠层特征**：识别行人级湍流特征与风向的关联

---

## 技术方案

### 数值配置

| 参数 | 值 |
|------|---|
| 求解器 | 谱元 LES |
| 网格分辨率 | < 1m（行人级）|
| 自由度 | ~5×10⁸ |
| 风向数 | 16（均匀分布）|
| 研究区域 | Barcelona Zona Universitaria |

### 方法

- 大涡模拟（LES）
- 过滤的 NS 方程
- 壁模型

---

## 关键发现

- **方向敏感性**：不同风向下的流动模式和湍流结构差异显著
- **建筑高度变异性**：影响局部流动模式和湍流统计
- **多尺度响应**：从建筑周围小尺度到城市冠层大尺度的系统性影响

---

## 局限性

- 单个城市区域，通用性待验证
- 计算成本高（5×10⁸ DOF）

---

## 实现建议

- **实现难度**: ★★★★★
- **预期性能**: 高保真城市气象模拟
- **适用场景**: 城市微气候、通风设计、污染物扩散、风能评估
