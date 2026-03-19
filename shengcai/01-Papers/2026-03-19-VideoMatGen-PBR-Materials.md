---
type: paper
created: 2026-03-19
updated: 2026-03-19
tags: [paper, PBR, material-generation, diffusion, neural-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.16566
---

# VideoMatGen: PBR Materials through Joint Generative Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VideoMatGen: PBR Materials through Joint Generative Modeling |
| **作者** | Jon Hasselgren, Zheng Zeng, Milos Hasan, Jacob Munkberg |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.16566) |
| **DOI** | 10.48550/arXiv.2603.16566 |
| **代码** | N/A |

---

## 核心贡献

> 基于视频扩散 Transformer 架构生成物理真实材质，联合建模多种材质属性

1. **视频扩散 Transformer**：使用视频 DiT 架构生成 PBR 材质
2. **多模态联合建模**：同时生成 base color、roughness、metallicity、height map
3. **紧凑潜在空间**：自定义 VAE 将多材质模态编码到紧凑潜在空间

---

## 技术方案

### 核心思想

VideoMatGen 将 PBR 材质生成建模为多模态联合生成问题。通过视频扩散 Transformer，基于输入几何体和文本描述，生成完整的物理材质属性集。

### 关键技术

| 技术 | 说明 |
|------|------|
| Video DiT | 视频扩散 Transformer 作为核心生成器 |
| 多模态 VAE | 将多种材质属性编码到统一潜在空间 |
| 文本条件 | 支持文本描述控制材质生成 |
| 几何条件 | 以输入几何体为条件 |

### 材质属性

- **Base Color**：基础颜色贴图
- **Roughness**：粗糙度贴图
- **Metallicity**：金属度贴图
- **Height Map**：高度/法线贴图

---

## 公式

```math
p(M|G, T) = \prod_{i=1}^{N} p(m_i|G, T)
```

其中 M 为材质属性集，G 为几何输入，T 为文本条件。

---

## 实验结论

- **兼容性**：生成结果兼容常见内容创建工具
- **质量**：高物理真实感的材质生成
- **效率**：紧凑潜在空间减少 token 数量

---

## 局限性

- 需要文本和几何条件输入
- 多模态联合生成的复杂性

---

## 相关工作

- [[PBR材质]]
- [[扩散模型]]
- [[神经材质]]

---

## 实现建议

- **实现难度**：中高（需要 DiT 架构和多模态 VAE）
- **预期性能**：高质量材质生成，支持实时渲染
- **适用场景**：3D 内容创作、游戏材质生成、虚拟制片
