---
type: paper
created: 2026-06-22
updated: 2026-06-22
tags: [paper, PBR, material-generation, neural-materials, procedural, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.14988
---

# Toward Richer Material Generation via Procedural Data Enhancement

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Toward Richer Material Generation via Procedural Data Enhancement |
| **作者** | Yunchen Yu et al. |
| **发表** | SIGGRAPH Conference Papers '26, July 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.14988) |
| **DOI** | 10.1145/3799902.3811210 |
| **代码** | 待发布 |

---

## 核心贡献

> 将简单PBR材质增强为多层神经材质，支持dust、clearcoat、layered scattering等效果

1. **程序化材质增强管道**：从简单PBR材质（diffuse + single GGX）构建多层BSDF表示
2. **8 lobe非漫反射模型**：包括core/haze lobes和decorator lobes，捕获dust、clearcoat、薄层散射等效果
3. **6D潜在空间神经材质编码**：共享解码器MLP，支持材质生成

---

## 技术方案

### 核心思想

生成模型的训练数据质量限制了材质创作的表现力。简单PBR材质（diffuse + single GGX specular）无法捕获真实材质的丰富视觉效果。本方法：

1. 使用物理先验引导的程序规则增强简单材质
2. 将增强材质编码为神经材质（6D潜在空间）
3. 用视频扩散模型微调生成神经材质纹理

### 多层BSDF结构

```
Non-Diffuse Component (8 lobes)
├── Conductive Branch (metallic)
│   ├── Core lobe (sharp highlight)
│   └── Haze lobe (rough specular)
├── Dielectric Branch (dielectric)
│   ├── Core lobe
│   ├── Haze lobe
│   └── Optional scattering lobes
└── Decorator Lobes (top-layer effects)
    ├── Dust
    ├── Clearcoat
    └── Other imperfections
```

### 核心公式

**Generalized Non-Diffuse Reflection:**
- 保留Lambertian漫反射分量
- 用多层GGX lobe替换单层GGX specular
- 通过coating和mixing组合各lobe

**Neural Material Encoding:**
- 潜在空间: 6D
- 表示: 两个潜在纹理 + 预训练通用MLP解码器
- 规则化: 支持材质生成

---

## 代码片段

```python
# 材质增强流程伪代码
def enhance_material(simple_pbr):
    # 创建8 lobe非漫反射组件
    non_diffuse = MultiLobeBSDF()
    non_diffuse.add_conductive_lobes(core_roughness, haze_roughness)
    non_diffuse.add_dielectric_lobes(core_roughness, haze_roughness)
    non_diffuse.add_decorator_lobes(dust=True, clearcoat=True)
    
    # 编码为神经材质
    latent = optimize_latent_texture(non_diffuse, universal_mlp)
    return NeuralMaterial(latent)
```

---

## 实验结论

- **数据集**: 简单PBR材质数据集
- **基线**: 简单PBR (diffuse + single GGX)
- **结果**:
  - 可生成dust、clearcoat、薄层透明度等效果
  - 潜在空间支持材质插值和生成
  - 视频扩散模型可生成一致的多视角材质

---

## 局限性

- 确定性增强（无随机性）
- 需要预定义的BSDF结构
- 材质复杂度受8 lobe限制

---

## 相关工作

- [[OpenPBR]] - 开放PBR材质模型
- [[Disney Principled BSDF]]
- [[Neural Materials (Kuznetsov 2021)]]
- [[MaterialX]]

---

## 实现建议

- **实现难度**: 高（需要BSDF建模和神经网络训练）
- **预期性能**: 离线材质生成
- **适用场景**: 电影/游戏材质资产创建、AI材质设计工具

---

## 标签

#渲染 #PBR #材质生成 #神经材质 #程序化建模 #SIGGRAPH2026
