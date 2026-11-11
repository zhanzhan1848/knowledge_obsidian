---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, neural-texturing, real-time-rendering, material, PBR, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13677
arxiv_id: 2611.13677
---

# Deformable Texture Maps: Compiling Dynamic Microgeometry into Neural Textures

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Deformable Texture Maps: Compiling Dynamic Microgeometry into Neural Textures |
| **作者** | Antonio Arian Silaghi (URJC), Zhen Chen, Danny Kaufman, Élie Michel, Jean-Marc Thiery (Adobe), Jorge Lopez-Moreno (URJC), Elena Garces (Adobe) |
| **发表** | Computer Graphics Forum (Proc. Eurographics) Vol.46 Issue 2, 2027 · arXiv 2026-11-10 |
| **链接** | [原文](https://arxiv.org/abs/2611.13677) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 把"形变驱动的微几何"编译进一张紧凑的神经纹理，运行时直接在粗粒度形变表面上求值，无需实例化细节几何。

1. **DTM 表示**：映射 (纹理坐标, 局部形变) → 内在贴图（opacity / normal / depth / material ID），捕获形变造成的遮挡与可见性变化。
2. **几何属性而非辐射度**：表示编码的是几何量而非辐照度，因此**光照与材质响应与学习模型解耦**——可重新打光、修改着色与材质而**无需重训**。
3. **持久化纹理空间渲染策略**：缓存内在贴图，仅在形变变化时选择性更新，把神经网络求值与逐帧渲染解耦，跨帧复用。
4. **数据驱动构建流程**：将可平铺纱线块扫过形变空间 → 把细节几何渲染到规范纹理空间 → 压缩为单一神经表示。

---

## 技术方案

### 核心思想

布料等可形变材质的外观来自细尺度几何（纱线几何、间距、遮挡）。粗粒度仿真虽能恢复这些微结构，但显式实例化并渲染代价高昂。

DTM 的关键设计选择：**编码内在几何属性（法线/深度/不透明度/材质 ID），而非辐射度**。这样：
- 着色模型（Phong / PBR / 任意）可以照常作用于 DTM 输出的法线与深度
- 重新打光不需要重新采集或重训
- 形变状态只需查询神经网络，不需重新光栅化细节几何

### 关键技术

| 技术 | 说明 |
|------|------|
| **Fourier-SIREN 骨干** | 宽度 128 的 Fourier 特征 + SIREN，逐结构独立训练 30,000 步 |
| **形变描述子** | 面内拉伸 $s_x, s_y \in [-0.2, 1.0]$ 与剪切 $s_a \in [-0.7, 0.7]$ |
| **形变状态晶格** | $8\times 8\times 8 = 512$ 个离散形变状态采样 |
| **持久化纹理空间缓存** | 内在贴图缓存 + 形变变化时选择性失效更新 |
| **内在贴图集** | opacity、surface normal、depth、material identity |
| **纹理构建流程** | sweep tileable yarn patches → 渲染到 canonical texture space → 压缩为单一神经表示 |

### 公式

```math
// DTM 映射（论文表述的语义形式）
\mathrm{DTM}:\ (u,v,\ \mathbf{s}_{\mathrm{local}}) \ \mapsto\
\Big(\alpha,\ \mathbf{n},\ d,\ \mathrm{id}_{\mathrm{material}}\Big)

// 形变局部描述子
\mathbf{s}_{\mathrm{local}} = (s_x, s_y, s_a)
```

---

## 代码片段

```cpp
// 运行时采样语义（伪代码）
// 1) 查询持久化纹理空间缓存
TextureMapCache cache;                    // key: (deformed mesh id, deformation state id)

// 2) 形变变化时选择性更新（而非每帧全量重算）
if (deformationChanged(mesh, prevDeformation)) {
    cache.invalidate(mesh.id, changedRegion);
}

// 3) 在粗粒度形变表面上求值内在贴图
IntrinsicMaps im = dtmNet.query(
        uv,                      // 纹理坐标
        localDeformation(mesh)   // 局部拉伸/剪切描述子
);
// im.opacity, im.normal, im.depth, im.materialId

// 4) 用常规着色管线响应光照（无需重训）
vec3 color = shadePBR(im.normal, im.depth, materialId, lights);
```

---

## 实验结论

- **数据集**: 5 种纱线结构（woven + knitted）：rib、basket、stockinette、honeycomb、satin
- **基线**: 显式几何渲染 @2k、插值 GT 纹理 @128px
- **结果**:
  - 神经预测保留整体纱线布局，误差集中在边界与开口处
  - **在分布外的形变状态上，神经预测 @128px 相比插值 GT 纹理显著减少 ghosting**（运动纱线边界的重影），代价是平滑掉细节
  - alpha / normals / depth 用 PSNR(dB) 评测，material ID 用分类准确率(%)
  - 法线还额外用 Lambertian 渲染 + FLIP 指标评测
- **可编辑性**: 因为表示与光照解耦，支持不重训的重打光与材质编辑

---

## 局限性

- **源保真度与材质范围**：DTM 继承训练所用微几何的局限。纺织实例使用 MADYPG 中心线 + 固定半径圆柱几何，**未包含**横截面压扁、多股重排、接触压缩等效应。表示本身不绑定该几何模型——只要能生成形变条件化训练映射，也可换用更丰富的微几何
- **泛化性**：每个 DTM 针对单一微结构 + 有界形变域训练。展示了采样状态间的插值，但**未验证域外外推**，也未做跨纱线结构迁移。形变描述子只捕获面内拉伸与剪切，**不含弯曲与局部压缩**
- **表面表示**：以紧凑的表面附着表示换取显式 3D 微几何的通用性。预测的 opacity/normal/depth/material-ID 只刻画局部纱线结构与浮雕，**未完整描述底层微几何的几何与光学行为**，因此无法复现某些光学效应
- 仅在 yarn-based 纺织品上评测；作者指出同样适用于皮肤等其他可由局部形变参数化的微几何材质

---

## 相关工作

- [[2026-04-01_Neural-Harmonic-Textures]]
- [[2026-06-25-Neural-Texture-Compression-Hypernetworks]]
- [[2026-08-13-Hybrid-Neural-Microfacet-BRDF-Real-Time-Rendering]]
- 概念：[[神经纹理]], [[PBR]], [[布料渲染]], [[形变材质]]

---

## 实现建议

- **实现难度**: 中（需训练 SIREN 变体网络 + 构建形变扫掠离线流程 + 实现持久化缓存）
- **预期性能**: 网络推理是主要成本，但通过持久化缓存跨帧复用后开销可控
- **适用场景**: 实时布料/织物渲染、角色服装生产管线（Adobe 背景，工程可落地性强）
- **与团队的关系**: 思路可迁移到**角色服装与皮肤的细节层次**。建议 @墨鱼丸 评估"用形变条件化神经纹理替换角色服装的高模细节渲染"这条路线
- **优先级**: 中（工程价值明确，但依赖特定微几何参数化管线）
