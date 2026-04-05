---
type: paper
created: 2026-04-05
updated: 2026-04-05
tags: [rendering, 3DGS, ray-tracing, reflection, transmittance, specular]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.00509
---

# Gaussian Splatting with Reflection and Transmittance Primitives

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gaussian Splatting with Reflection and Transmittance Primitives |
| **作者** | Kunnong Zeng 等 |
| **发表** | arXiv cs.GR 2026-04-01 |
| **链接** | [原文](https://arxiv.org/abs/2604.00509) |
| **DOI** | 10.48550/arXiv.2604.00509 |
| **代码** | - |

---

## 核心贡献

> 提出 RT-GS 统一框架，将微表面材质模型和光线追踪集成到 3D Gaussian Splatting 中，联合建模镜面反射和透射

1. 提出使用分离的高斯图元分别处理反射和透射，同时建模远处反射和透明表面后的物体重建
2. 利用可微分光线追踪框架获取镜面反射和透射外观
3. 在复杂环境中成功生成反射并恢复透明表面后的物体，实现显著的质量提升

---

## 技术方案

### 核心思想

3D Gaussian Splatting 在重建漫射场景方面表现强大，但难以同时建模镜面反射和半透明表面的透射。现有方法没有正确结合底层物理过程来模拟这些效果。

RT-GS 通过整合微表面材质模型和光线追踪，统一建模镜面反射和透射。

### 关键技术

| 技术 | 说明 |
|------|------|
| 微表面材质模型 | 物理基础的材质表示 |
| 光线追踪 | 可微分光线追踪框架获取镜面反射和透射 |
| 分离高斯图元 | 反射和透射使用独立的高斯图元 |
| 联合优化 | 反射和透射的联合建模 |

---

## 实验结论

- **数据集**: 复杂环境场景
- **基线**: 现有 3DGS 方法
- **结果**: 在存在镜面光相互作用的场景中取得显著定性改进

---

## 局限性

- 计算开销可能较大（光线追踪）
- 对透明表面重建的精度依赖光线追踪质量

---

## 实现建议

- **实现难度**: 高（需集成光线追踪）
- **预期性能**: 质量显著提升，计算成本增加
- **适用场景**: 包含反射和透明物体的场景重建

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[光线追踪]]
- [[神经渲染]]
- [[镜面反射建模]]
