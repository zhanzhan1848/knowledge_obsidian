---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, image-stylization, ControlNet, IP-Adapter, local-control, diffusion, SIGGRAPH-Asia-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.08704
venue: SIGGRAPH Asia 2026 Technical Communications
year: 2026
---

# Local Content-Style Control for Diffusion-based Image Stylization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Local Content-Style Control for Diffusion-based Image Stylization |
| **作者** | Amir Semmo et al. |
| **发表** | SIGGRAPH Asia 2026 Technical Communications |
| **链接** | [原文](https://arxiv.org/abs/2610.08704) |

---

## 核心贡献

> 将 ControlNet + IP-Adapter 风格化 pipeline 中已有的**两个全局标量条件权重**提升为**逐位置空间图**，在**单次生成中**实现**局部、逐轴的内容与风格控制**。无需重训。

1. 把全局 weight λ_content、λ_style 升级为 **per-pixel spatial map**
2. 2×2 retouching vocabulary：free regeneration ↔ identity preservation
3. 验证编辑严格限制在被编辑区域
4. 零训练成本，可即插即用到现有 pipeline

---

## 技术方案

### 核心思想

ControlNet 控制"画什么"，IP-Adapter 控制"画得像"。传统 pipeline 中这两个权重都是全局标量——专业修图需要**不同区域用不同设置**。

**关键洞察**：两个权重作用于**互不重叠的 pathway**，因此可以**独立**设为空间图，互不干扰。

### 2×2 Retouching Vocabulary

| λ_content \ λ_style | 低（保风格） | 高（变风格） |
|---------------------|------------|------------|
| **低**（重生成） | 完全重画 | 风格迁移重生成 |
| **高**（保内容） | 风格保留 | 风格迁移 |

### 关键技术

| 技术 | 说明 |
|------|------|
| Per-location spatial map | λ_content, λ_style 作为图像尺寸的空间图 |
| Disjoint pathway conditioning | 验证两权重互不干扰 |
| Zero retraining | 直接对现有 ControlNet/IP-Adapter 适配 |

---

## 公式

传统全局标量：
```math
\mathbf{x}_{cond} = \lambda_{content} \cdot \text{ControlNet}(c_{content}) + \lambda_{style} \cdot \text{IP-Adapter}(c_{style})
```

本文空间图：
```math
\mathbf{x}_{cond}(\mathbf{p}) = \lambda_{content}(\mathbf{p}) \cdot \text{ControlNet}(c_{content}) + \lambda_{style}(\mathbf{p}) \cdot \text{IP-Adapter}(c_{style})
```

其中 $\lambda_{content}(\mathbf{p}), \lambda_{style}(\mathbf{p})$ 是逐像素权重。

---

## 实验结论

- **基线**：传统 ControlNet + IP-Adapter（全局权重）
- **结果**：
  - 编辑严格限制在指定区域
  - 两权重各自主导自己的轴（验证独立性）
  - 4 页短文，含 4 图 1 表

---

## 局限性

1. 仅在 ControlNet + IP-Adapter pipeline 验证，其他组合未测
2. 4 页 TC 限制，定量分析有限
3. 空间图来源：用户绘制？还是自动分割？

---

## 相关工作

- [[ControlNet]]
- [[IP-Adapter]]
- Diffusion-based image editing (SDXL, etc.)
- Local editing with masks (DragDiffusion, etc.)

---

## 实现建议

- **实现难度**：低（几行代码改动 pipeline 即可）
- **预期性能**：实时（一帧推理）
- **适用场景**：
  - 创意图像编辑工具
  - AI 修图 app
  - 内容创作 pipeline
- **对 moyuwan 的建议**：
  - 与图形渲染关系较远，但与**前端可视化**相关
  - 若团队做图像/视频编辑工具，**立即可用**
  - 不需要 GPU 重训，是 pipeline 修改