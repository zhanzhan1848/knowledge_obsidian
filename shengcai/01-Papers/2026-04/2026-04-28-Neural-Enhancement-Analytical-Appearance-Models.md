---
type: paper
created: 2026-04-28
updated: 2026-04-28
tags: [paper, PBR, BRDF, neural-appearance, Zhejiang-University]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.24081
---

# Neural Enhancement of Analytical Appearance Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Enhancement of Analytical Appearance Models |
| **作者** | Xuanzhe Shen, Xiaohe Ma, Kun Zhou, Hongzhi Wu |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.24081) |
| **DOI** | 10.48550/arXiv.2604.24081 |
| **代码** | - |
| **机构** | 浙江大学 CAD&CG 国家重点实验室 |

---

## 核心贡献

> 将传统解析 BRDF 模型与神经网络结合，通过自动识别和替换瓶颈计算节点来增强表达能力

1. 提出 **neural enhancement** 框架：自动识别并用小规模 MLP 替换分析模型的瓶颈节点/算子
2. 提出 **hypercube-based search** 高效自动定位最佳替换节点组合
3. 增强后的模型兼顾准确、紧凑和高效，兼容标准光栅化和光线追踪管线

---

## 技术方案

### 核心思想

混合分析-神经外观模型：
- 保留解析模型的结构可解释性和编辑便捷性
- 用小规模 MLP 增强瓶颈环节的表达能力
- 利用 hypercube 搜索高效定位最优替换方案

### 关键技术

| 技术 | 说明 |
|------|------|
| Computational Graph | 将解析 BRDF 转为计算图节点/算子图 |
| Neural Replacement | 用 MLP 替换选定节点，保持整体结构 |
| Hypercube Search | 在超立方体空间高效搜索最优替换组合 |
| Uncertainty-weighted Loss | 多任务学习的损失平衡 |

### Enhanced GGX 模型

原始 GGX BRDF (参数 12) → 增强后 (参数 39)：
- 保持 Cook-Torrance 微表面框架
- 增强镜面反射分布

### 兼容性

增强模型可直接翻译为 shader 代码，兼容：
- 标准光栅化管线 (rasterization pipeline)
- 光线追踪管线 (ray-tracing pipeline)

---

## 公式

### Cook-Torrance BRDF

```math
f_r(\mathbf{l}, \mathbf{v}) = \frac{\mathcal{D}(\theta_h) \mathcal{F}(\theta_h) \mathcal{G}(\theta_l, \theta_v)}{4\cos\theta_l \cos\theta_v}
```

增强后：
- $\mathcal{E} \rightarrow \hat{\mathcal{E}}$ (MLP 增强)
- $\mathcal{G} \rightarrow \hat{\mathcal{G}}$ (MLP 增强)

---

## 实验结论

- 在 MERL BRDF 数据集上达到 SOTA 拟合精度
- 增强 GGX 模型显著改善掠射角各向异性反射
- 未优化实现性能与最小网络 SOTA 神经方法相当
- 可应用于其他解析模型（Ashikhmin-Shirley, Ward 等）

---

## 局限性

- 限于 BRDF 单点外观，不利用空间一致性
- MLP 替换需要预训练和搜索

---

## 相关工作

- 解析 BRDF 模型：GGX, Ward, Ashikhmin-Shirley
- 神经外观模型：BRDFNet, neural BRDF encoding
- 微表面理论：Cook-Torrance, Walter et al.

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 实时渲染可用，需 shader 代码生成
- **适用场景**: PBR 材质增强、复杂材质编辑、实时光照

---

## 标签

#渲染 #PBR #BRDF #外观建模 #神经渲染 #浙江大学
