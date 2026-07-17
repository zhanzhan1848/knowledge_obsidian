---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, ray-tracing, real-time, variable-rate, rendering, production]
status: processed
domain: rendering
agent: shengcai
source: https://advances.realtimerendering.com/s2026/index.html
---

# Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4 |
| **作者** | Michał Olejnik (Activision Infinity Ward) |
| **发表** | SIGGRAPH 2026 - Advances in Real-Time Rendering in Games |
| **链接** | [课程页面](https://advances.realtimerendering.com/s2026/index.html) |

---

## 核心贡献

> 生产验证的VRRT系统，提供一致质量而不牺牲确定性性能

1. **动态光线预算分配**: 支持亚像素采样 (<1 spp) 和选择性超采样 (>1 spp)
2. **时空梯度预pass**: 主动识别不稳定像素
3. **GPU驱动帧级调度器**: 空间光线重分配，保持恒定总光线数

---

## 技术方案

### 核心问题

快节奏多人射击游戏中：
- 图像质量必须在快速相机运动和动态物体移动下保持稳定
- 帧时间预算严格
- 传统固定速率RT + 屏幕空间去噪不足：去遮挡伪影和时间滞后在竞技游戏中过于干扰

### 解决方案

| 技术 | 说明 |
|------|------|
| 动态预算分配 | <1 spp 空间欠采样 + 时序重建, >1 spp 选择性超采样 |
| 时空梯度预pass | 显式去遮挡检测 |
| GPU调度器 | 帧级恒定光线成本 |

### VRRT 架构

```
预pass: 时空梯度计算
     ↓
不稳定像素识别
     ↓
自适应采样分配
     ↓
GPU驱动光线调度
     ↓
帧级恒定成本RT
```

---

## 实验结论

- 竞技游戏中稳定质量
- 消除性能峰值
- 即使在大相机运动或大型动态事件下

---

## 实现建议

- **实现难度**: 高 (生产系统)
- **适用场景**: AAA游戏RT、高要求实时渲染
- **推荐度**: ⭐⭐⭐⭐⭐
