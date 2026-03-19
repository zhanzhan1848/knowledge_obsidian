---
type: paper
created: 2026-03-19
updated: 2026-03-19
tags: [paper, gaussian-splatting, avatar, real-time, progressive, CVPR2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.16447
---

# ProgressiveAvatars: Progressive Animatable 3D Gaussian Avatars

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ProgressiveAvatars: Progressive Animatable 3D Gaussian Avatars |
| **作者** | Kaiwen Song, Jinkai Cui, Juyong Zhang |
| **发表** | CVPR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.16447) |
| **DOI** | 10.48550/arXiv.2603.16447 |
| **代码** | https://ustc3dv.github.io/ProgressiveAvatars/ |

---

## 核心贡献

> 渐进式可动画 3D Gaussian Avatar，支持波动带宽下的增量加载和渲染

1. **渐进式表示**：基于 3D Gaussian 层次的渐进式 Avatar
2. **自适应细分**：模板网格上的自适应隐式细分
3. **增量加载**：支持渐进式交付和渲染

---

## 技术方案

### 核心思想

XR 和远程呈现应用中，网络和计算资源频繁波动。ProgressiveAvatars 通过层次化 3D Gaussian 表示，在波动带宽下实现平滑质量提升。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gaussian 层次 | 自适应隐式细分生成 |
| 面局部坐标 | 保持动画能力 |
| 屏幕空间信号 | 检测细节不足 |
| 重要性排序 | 支持增量加载 |

### 动画支持

- **表情变化**：面局部坐标保持动画能力
- **头部运动**：跨细节级别保持一致
- **实时渲染**：支持 XR 应用

---

## 公式

层次扩展条件：
```math
\text{expand} = \begin{cases}
\text{true} & \text{if } S_{screen} < \theta \\
\text{false} & \text{otherwise}
\end{cases}
```

---

## 实验结论

- **渐进加载**：波动带宽下平滑质量提升
- **实时性能**：支持 XR 和远程呈现
- **动画质量**：保持多细节级别的动画一致性

---

## 局限性

- 依赖模板网格
- 细分策略的复杂性

---

## 相关工作

- [[3D-Gaussian-Splatting]]
- [[数字人]]
- [[实时渲染]]

---

## 实现建议

- **实现难度**：中（需要层次管理和动画系统）
- **预期性能**：实时 XR 应用，波动带宽适应
- **适用场景**：远程呈现、虚拟会议、XR 应用
