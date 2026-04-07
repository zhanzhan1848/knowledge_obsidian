---
type: paper
created: 2026-04-07
updated: 2026-04-07
tags: [ray-marching, real-time-rendering, global-illumination, participating-media, neural-rendering, lightmaps]
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
| **作者** | Tao Huang |
| **发表** | arXiv 2026-04-04 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2604.03748) |
| **DOI** | 10.48550/arXiv.2604.03748 |
| **代码** | 待补充 |
| **页数** | 11 pages, 16 figures |

---

## 核心贡献

> 通过神经网络预测六方向光贴图，实现参与介质（烟雾）的实时渲染，支持相机移动和光照变化

1. **神经六方向光贴图方法**：训练神经网络从相机视角引导图预测六方向光贴图
2. **大步长Ray Marching引导图**：使用大步长 ray marching 近似烟雾散射和轮廓
3. **游戏引擎兼容**：结果可直接集成到现有游戏引擎管线
4. **交互式动态效果**：支持烟雾-障碍物交互、相机移动、光照变化

---

## 技术方案

### 核心思想

六方向光贴图技术（Six-way Lightmaps）已在游戏行业广泛用于烟雾渲染，但传统方法：
- 仅限于预计算的动画序列
- 对相机移动不敏感
- 无法处理动态光照

本文提出**神经六方向光贴图**，核心流程：
1. 从相机视角使用大步长 ray marching 生成引导图
2. 训练神经网络从引导图预测对应的六方向光贴图
3. 预测的光贴图可直接用于游戏引擎

### 关键技术

| 技术 | 说明 |
|------|------|
| Ray Marching | 大步长采样近似烟雾散射和轮廓 |
| Six-way Lightmaps | 六个预计算方向的光照贴图 |
| 神经网络预测 | 从引导图预测光贴图 |
| 体积渲染方程 | 参与介质的渲染计算 |

### 渲染方程（体积）

```math
L(x, \omega) = L_0(x, \omega) e^{-\int_0^s \sigma_t dt} + \int_0^s \sigma_s G(t) e^{-\int_t^s \sigma_t du} dt
```

其中：
- $L(x, \omega)$：观察方向的辐射率
- $L_0$：发射辐射率
- $\sigma_t, \sigma_s$：衰减和散射系数
- $G(t)$：内散射积分

---

## 实验结论

- **应用场景**：游戏、VR/AR
- **性能**：支持实时应用
- **视觉效果**：支持烟雾-障碍物交互、相机自由移动、动态光照变化
- **集成方式**：无缝集成到现有游戏引擎管线

---

## 局限性

- 需要预训练神经网络
- 对复杂光照场景的泛化能力待验证

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 实时 (< 10ms per frame)
- **适用场景**: 游戏烟雾渲染、VR/AR 体积效果
- **可参考项目**: 传统六方向光贴图实现、神经渲染相关工作

---

## 相关论文

- [[参与介质渲染]]
- [[Ray Marching]]
- [[六方向光贴图]]
- [[神经渲染]]

---

## 标签

#渲染 #实时渲染 #参与介质 #Ray-Marching #全局光照 #神经渲染
