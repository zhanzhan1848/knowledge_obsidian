---
type: paper
created: 2026-04-10
updated: 2026-04-10
tags: [paper, volume-rendering, neural-rendering, six-way-lightmaps, smoke-rendering, ray-marching, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.03748
---

# Real-time Neural Six-way Lightmaps

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-time Neural Six-way Lightmaps |
| **作者** | Tao Huang 等 |
| **发表** | arXiv cs.GR (TOG), 2026-04-04 |
| **链接** | [原文](https://arxiv.org/abs/2604.03748) |
| **DOI** | 10.48550/arXiv.2604.03748 |
| **代码** | - |

---

## 核心贡献

> 将传统六方向光图（six-way lightmaps）与神经网络结合，从屏幕空间引导图预测六方向光图，支持动态烟雾的实时渲染（<4ms/帧），同时支持相机运动、光照变化和烟雾-障碍物交互。

1. **神经六方向光图**：从 2D 屏幕空间引导图（而非 3D 空间）预测光图，显著降低计算复杂度
2. **全流程 <4ms**：比传统蒙特卡洛或学习型 3D 体积渲染快一个数量级
3. **支持动态交互**：相机运动、光照变化、烟雾-障碍物交互

---

## 技术方案

### 核心思想

传统六方向光图 technique 预先从固定视角计算烟雾的透明度和六个方向的光照交互，但仅限于预模拟序列且无法响应相机移动。本文通过神经网络从屏幕空间引导图学习预测六方向光图，将 3D 体积渲染问题降维到 2D 屏幕空间。

### 关键技术

| 技术 | 说明 |
|------|------|
| 体积渲染方程 | $L(\mathbf{x},\omega) = \int_0^z T(\mathbf{x}\leftrightarrow\mathbf{y})[\sigma_a(\mathbf{y})L_e(\mathbf{y},\omega)+\sigma_s(\mathbf{y})L_s(\mathbf{y},\omega)]dy + T(\mathbf{x}\leftrightarrow\mathbf{z})L_o(\mathbf{z},\omega)$ |
| Ray Marching | 大采样步长沿相机方向生成引导图（透明度 $T$、深度 $D$、散射辐射 $\tilde{L}_{scattering}$） |
| U-Net + Channel Adapters | 共享特征提取 + 四个专用通道适配器分别预测 ±X, ±Y, ±Z, 透明度/自发光 |
| 屏幕空间烟雾深度图 | 与物体阴影图比较实现烟雾投射阴影 |

### 引导图生成

从物理流体模拟器输出的 3D 密度场出发：
1. 沿相机方向 ray marching（大采样步长）
2. 提取三通道引导图：$\tilde{L}_{scattering}$（散射辐射）、$T$（透明度）、$D$（深度）

### 神经光图预测

```
3D 密度场 → 流体模拟器
                    ↓
         Ray Marching（大步长）
                    ↓
           引导图 (3通道)
                    ↓
    ┌──────────────────────────┐
    │  共享特征提取 (U-Net)     │
    └──────────────────────────┘
                    ↓
    ┌──────────────────────────────────────┐
    │  Channel Adapters (×4)               │
    │  ±X 方向光图 | ±Y 方向光图 |          │
    │  ±Z 方向光图 | 透明度+自发光           │
    └──────────────────────────────────────┘
                    ↓
          六方向光图 + 透明度贴图
                    ↓
          与物体阴影图合成 → 最终渲染
```

### 任意光照方向散射插值

```math
L_{scattering}(\mathbf{x}, \omega_l) \approx \sum_{p \in \{x,y,z\}} |\omega_{l,p}| L_p^{sign(\omega_{l,p})}(\mathbf{x})
```

---

## 实验结论

- **渲染速度**：全流程 < 4ms/帧（一个数量级加速 vs 传统 MC/学习型 3D 体积渲染）
- **视觉效果**：支持真实多次散射效果、相机旋转、烟雾-障碍物交互
- **集成方式**：可无缝接入现有游戏引擎（如 Unreal Engine）管线
- **应用场景**：游戏、VR/AR 的烟雾/体积效果

---

## 局限性

- 依赖物理流体模拟器提供 3D 密度场
- 引导图生成仍需 ray marching（但大步长降低开销）
- 无法处理半透明物体间的交互

---

## 实现建议

- **实现难度**：中（需实现 ray marching 引导图生成 + U-Net 训练）
- **预期性能**：<4ms/帧，适合实时应用
- **适用场景**：AAA 游戏烟雾/尘埃特效、VR/AR 体积效果、云渲染

---

## 相关工作

- [[Volume Rendering Equation]] - 体积渲染方程
- [[Ray Marching]] - 光线步进
- [[Six-way Lightmaps]] - 六方向光图技术
- [[Neural Rendering]] - 神经渲染
- [[Participating Media]] - 参与介质（烟雾/雾/云）
- [[Unreal Engine Niagara]] - UE 粒子系统
