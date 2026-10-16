---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, PBR, material-generation, texturing, relighting, 3D-generation, MLLM]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.22352
venue: arXiv preprint (cs.GR)
year: 2026
---

# SUPRA-TEX: 3D Generation with Super-Aligned Texture

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SUPRA-TEX: 3D Generation with Super-Aligned Texture |
| **作者** | Chen Yang, Jiemin Fang, Fanpeng Meng, Zihao Huang, Jichen Pang, Guanjun Wu, Zhikuan Bao, Qi Tian |
| **发表** | arXiv preprint (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.22352) |
| **项目页** | https://supra-3d.github.io/supratex/ |
| **代码** | 未在摘要中声明 |

---

## 核心贡献

> 单图 3D 资产生成中，针对多视角 PBR 预测一致性与高频细节保留的难题，提出**"解耦可见材质估计 / 表面对齐 / 观测引导 3D 补全"** 的流水线，使可见区域达到 WYSIWYG 级别保真 + 未观测表面连贯补全。

1. **解耦三任务**：可见材质估计 / 表面对齐 / 观测引导 3D 补全 — 3D 生成器专注未观测区域
2. **PBR-aware 编辑器**：MLLM-based image editor 先预测"光分离 PBR 图"
3. **观测 latent 锚点**：将 PBR 投影到可见面并编码为生成目标的 latent space 锚点（read-only）
4. **交错流 transformer**：交替 unobserved-region 与 full-surface update，锚点保证 WYSIWYG
5. **SOTA on geometry-conditioned texturing & end-to-end asset generation**

---

## 技术方案

### 问题

单图 → PBR 贴图 3D 资产生成的两大痛点：
- 多视角预测不一致 → 拼接可见瑕疵
- 隐式 image-feature conditioning 在 3D 一致化时**丢失高频细节**

### 流水线

```
Input: 单图 + 网格
   ↓
[1] MLLM Editing Model  →  light-separated PBR maps（参考视角）
   ↓
[2] Project PBR 到可见面 → 编码为 Material VAE latent（生成目标的 latent 空间）
   ↓
[3] Interleaved Flow Transformer:
      alt( unobserved region update ↔ full-surface update )
      with read-only anchors from step 2
   ↓
Output: complete material latents → 解码为 PBR 贴图
```

### 关键技术

| 技术 | 说明 |
|------|------|
| MLLM editing | 用多模态大模型从单图推理光照 + 材质 → PBR |
| Material VAE | 在 VAE latent 空间操作，保持与生成器一致 |
| Interleaved flow | 局部 / 全局交替更新，避免单步失衡 |
| Read-only anchors | 可见区域 latent 不被改写 = WYSIWYG |
| Training on public data only | 无 private 数据，仍 SOTA |

---

## 相关工作 / 适用领域

- 主要面向**离线 PBR 资产生成**管线（CGI、产品级 3D）
- 与实时渲染管线结合点：可直接喂入 PBR 引擎（glTF/USD）
- 与 Shading 更相关（材质 stage），不直接涉及 ray tracer/rasterizer

---

## 实现建议

- **实现难度**: 高（MLLM + 3D VAE + flow transformer，工程链长）
- **应用场景**: 离线 3D 资产生成、产品级可视化
- **给渲染管道的接口**: 输出 glTF-compatible PBR maps 即可
- **创新点**: WYSIWYG 的 latent-anchor 思路对 inverse rendering 也有借鉴价值

---

## 备注

- 渲染相关性边缘（资产 pipeline 起点，但材质生成是 PBR 渲染的前置）
- 列入 2026-10-16 daily report 作为「PBR / 材质」邻域观察
- 在 10/15 VisibilitySplat 报告中的"relighting"主题上形成另一线索
