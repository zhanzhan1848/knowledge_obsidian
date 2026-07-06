---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, subsurface-scattering, skin-rendering, spectral-rendering, path-tracing]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.27604
---

# Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion |
| **作者** | Carlos Aliaga et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.27604) |
| **DOI** | 10.48550/arXiv.2606.27604 |

---

## 核心贡献

> 将单张 RGB 漫反射反照率反演为完整光谱皮肤散射参数（各向异性、散射半径、散射反照率），基于三层介质混合物表示

1. **混合介质表示**：将多层皮肤外观近似为三种不相关介质的散射混合物
2. **链式神经解码器**：从 RGB 漫反射反照率预测光学属性（各向异性、散射半径、散射反照率）
3. **随机游走路径追踪兼容**：在随机游走路径追踪器中使用，无需修改追踪器本身

---

## 技术方案

### 核心思想

现有皮肤渲染依赖均质化介质和手工调参。该方法用生物物理皮肤模型替代，从单 RGB 图像恢复完整光谱散射参数。

### 关键技术

| 技术 | 说明 |
|------|------|
| 混合物—介质表示 | 三种不相关介质模拟多层皮肤 |
| 光谱反演 | 从 RGB 到完整光谱参数的神经网络映射 |
| 随机游走兼容 | 追踪时随机选择遍历介质 |

---

## 实验结论

- **无需手工调参**：消除艺术家手工调参负担
- **准确散射轮廓**：相比均质化方法更准确的光谱散射
- **路径追踪兼容**：最小化修改集成到现有渲染器

---

## 局限性

- 依赖训练数据（皮肤样本）
- 对非皮肤材质泛化性未知

---

## 实现建议

- **实现难度**: 中高（需要神经网络训练）
- **预期性能**: 与标准路径追踪器集成良好
- **适用场景**: 角色渲染、皮肤/蜡/玉石等半透明材质
