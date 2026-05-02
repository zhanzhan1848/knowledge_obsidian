---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, BRDF, material-acquisition, sparse-sampling, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.26740
---

# Learning Sparse BRDF Measurement Samples from Image

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Learning Sparse BRDF Measurement Samples from Image |
| **作者** | Wen Cao, et al. |
| **发表** | arXiv cs.CV (cross-list cs.GR), April 29, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.26740) |
| **DOI** | 10.48550/arXiv.2604.26740 |

---

## 核心贡献

> 研究如何选择少量最有价值的BRDF测量点，通过学习先验从稀疏坐标-值观测重建材料外观，实现低预算采集。

1. **稀疏测量选择**：选择少量最有价值的BRDF测量点
2. **超网络BRDF重建器**：预训练超网络基础BRDF重建器
3. **可微渲染器**：联合优化测量位置
4. **分离样本选择与先验拟合**：鼓励选择对学习材料分布有信息量的方向

---

## 技术方案

### 核心思想

精确的BRDF获取对真实感渲染很重要，但密集测角仪测量缓慢且昂贵。

**方法**：结合：
- 稀疏坐标-值观测的集合编码器
- 预训练超网络基础BRDF重建器
- 可微渲染器

训练期间：重建器固定，从BRDF空间和渲染图像损失反向传播优化测量位置。

### 关键技术

| 技术 | 说明 |
|------|------|
| 集合编码器 | set encoder for sparse observations |
| 超网络重建器 | hypernetwork-based BRDF reconstructor |
| 可微渲染器 | differentiable renderer |
| BRDF空间损失 | BRDF-space loss |
| 渲染图像损失 | rendered-image loss |
| 图像空间监督 | image-space supervision |

---

## 实验结论

- **MERL数据集**: 8和16测量下优于神经重建基线
- **低预算优势**: 低预算重建质量显著提升
- **PCA比较**: 大预算下PCA方法仍然强劲
- **分析**: 图像空间监督、共同优化、纯图像潜在拟合的效果

---

## 实现建议

- **实现难度**: 中（需超网络和可微渲染器）
- **预期性能**: 8-16测量即可获得良好BRDF重建
- **适用场景**: 材质采集、PBR材质库构建、实际应用

---

## 标签

#BRDF #材质采集 #PBR #渲染 #稀疏采样
