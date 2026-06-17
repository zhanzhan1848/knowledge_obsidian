---
type: paper
created: 2026-06-17
updated: 2026-06-17
tags: [paper, rendering, holography, path-tracing, wave-optics, VR-AR, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.14173
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography |
| **作者** | Wenbin Zhou et al. |
| **发表** | ACM Trans. Graph. 45, 4, Article 39 (July 2026), SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.14173) |
| **DOI** | 10.1145/3811351 |
| **代码** | - |

---

## 核心贡献

> 将路径追踪与波动光学结合，在全息显示中编码完整的3D视觉线索，实现物理精确的复杂振幅波场渲染。

1. **波动路径追踪框架**：同时求解渲染方程和 Rayleigh-Sommerfeld 积分的蒙特卡罗方法
2. **Path Reuse 技术**：通过最小额外时间成本生成多个时域复用随机全息图
3. **环境辐射缓存加速**：实现数量级收敛速度提升
4. **复杂振幅监督的相全息图编码**：将波场转换为相-only 全息图
5. **亚线性复杂度**：随场景基元数量次线性扩展

---

## 技术方案

### 核心思想

传统 CGH 方法将辐射率估计与波动传播解耦，限制了可忠实再现的焦距线索和视觉效果范围。本方法将路径追踪与 RS 积分结合，同时求解渲染方程和 Rayleigh-Sommerfeld 积分，直接从3D场景渲染物理精确的复振幅波场。

### 关键技术

| 技术 | 说明 |
|------|------|
| 路径追踪 | 蒙特卡罗方法求解光传输 |
| Rayleigh-Sommerfeld 积分 | 波动传播的物理精确模型 |
| 环境辐射缓存 | 加速收敛，约10倍提升 |
| Path Reuse | 多帧时域复用，最小额外开销 |
| 复杂振幅监督 | 相位编码的监督信号 |

---

## 实验结论

- **数据集**: 含200万几何元素的高度复杂物理渲染场景
- **基线**: Mitsuba3 (作为 ground truth)
- **结果**: 
  - 亚线性复杂度扩展
  - 视觉保真度优于现有 CGH 方法
  - 支持视相关高光、镜面反射、透射材料和全局光照
  - 自然散焦和深度连续性

---

## 局限性

- 需要高采样率保持波场精度
- 复杂散射场景计算成本仍较高
- 与现有 CGH 硬件（SLM）配合需优化

---

## 实现建议

- **实现难度**: 高（需同时处理路径追踪和波动光学）
- **预期性能**: 亚线性扩展，适合复杂场景
- **适用场景**: VR/AR 全息显示、物理精确渲染、科学可视化

---

## 相关工作

- [[path-tracing]]
- [[global-illumination]]
- [[wave-optics-rendering]]
- [[holographic-display]]
- [[RS-integral]]
