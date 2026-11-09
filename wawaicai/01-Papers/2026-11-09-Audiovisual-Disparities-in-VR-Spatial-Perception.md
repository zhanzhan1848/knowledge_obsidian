---
tags: [几何处理, VR, 空间感知, 视听冲突, 沉浸感, ISMAR, 论文]
date: 2026-11-09
source: arXiv
arxiv_id: 2611.09238
venue: IEEE ISMAR 2025
status: processed
agent_id: wawaicai
authors: Edurne Bernal-Berdun, Mateo Vallejo, Qi Sun, Ana Serrano, Diego Gutierrez
url: https://arxiv.org/abs/2611.09238
doi: 10.1109/ISMAR67309.2025.00053
pdf: https://arxiv.org/pdf/2611.09238
---

# Audiovisual Disparities in VR: Impact on Spatial Perception

> **ISMAR 2025**。区分两类视听空间冲突：**真实冲突**（可测量的声源—视觉源空间偏移）与**知觉冲突**（两者同位但用户仍报告不对齐）。核心发现：真实冲突在受控环境中高度敏感，但**在复杂真实 VR 场景中，用户察觉能力显著下降**；而**自发的头部旋转是知觉冲突得以出现的关键因素** —— 缺少它，效应完全消失。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Audiovisual Disparities in VR: Impact on Spatial Perception |
| **作者** | Edurne Bernal-Berdun, Mateo Vallejo, Qi Sun, Ana Serrano, Diego Gutierrez |
| **发表** | arXiv 2611.09238, 2026-11-06，**IEEE ISMAR 2025**，DOI `10.1109/ISMAR67309.2025.00053` |
| **分类** | Graphics (cs.GR) |

---

## 摘要（原文）

> Virtual reality (VR) experiences often leverage rich and spatialized multimodal environments to increase immersion and engagement. This demands a consistent spatial perception of audiovisual stimuli, since perceived discrepancies can disrupt the sense of presence. In this work, we investigate the consequences of two types of spatial audiovisual disparities: **true disparity**, where there is a measurable spatial offset between auditory and visual cues, and **perceptual disparity**, where users report misalignment despite cues being colocated. Unlike most previous studies that employed controlled but simplified experimental setups, our research focuses on complex, realistic VR environments, allowing us to assess the actual implications for VR content design. Our experiments indicate that users are **highly sensitive to true audiovisual disparities in controlled environments, detecting even minor misalignments**. However, when engaged in additional tasks within realistic settings, **their ability to notice such discrepancies diminishes significantly**. We also observed that **previously found perceptual disparities persist in complex audiovisual environments**. However, we identify **self-initiated head rotations as a key factor**; its absence prevents the effect entirely. We hope our findings offer practical insights for designing more immersive and perceptually coherent VR experiences.

---

## 核心贡献

| # | 贡献 |
|---|-------|
| 1 | 严格区分**真实冲突**与**知觉冲突**两类空间视听不一致 |
| 2 | 首次在**复杂真实 VR 环境**（而非受控简化实验）中评估其后果 —— 直接服务于 VR 内容设计 |
| 3 | 发现**自发起头部旋转**是知觉冲突得以出现的**必要条件** |

### 两类冲突的定义

| 类型 | 定义 | 考察的感知机制 |
|------|------|--------------|
| **真实冲突** (true disparity) | 听觉与视觉线索间**可测量的空间偏移** | 对声源的**精确定位**能力 |
| **知觉冲突** (perceptual disparity) | 线索**已同位**，但用户仍报告不对齐 | 整合/融合阶段的**知觉一致性** |

---

## 主要发现

1. **受控环境中对真实冲突高度敏感** —— 用户能察觉**微小**的错位
2. **复杂真实场景 + 附加任务 → 察觉能力显著下降**（任务占据认知资源）
3. **知觉冲突在复杂视听环境中持续存在**
4. **自发头部旋转是关键调节变量** —— 其缺失使该效应**完全不出现**

> 🔸 **设计含义**：
> - VR 内容中的**声源定位精度要求可以适度放宽** —— 当用户沉浸于其他任务时，微小错位的感知代价远低于受控实验的暗示
> - 但**知觉冲突必须避免** —— 即便线索同位，用户仍会报告不对齐，说明整合层面存在独立于定位误差的问题
> - **交互设计可利用发现 2**：不要指望用户能在忙碌时察觉声画冲突

---

## 与几何处理的关联

**弱关联。** 这是一篇 VR 感知研究，不涉及几何算法、网格处理或三维表示。

仅在两处有间接关联：
- **空间化音频的定位精度**依赖场景几何（HRTF、房间几何、声源位置的坐标一致性）
- "视听冲突"的几何本质是**两个三维位置估计的不一致** —— 从纯几何角度看，这是一组**点-点对应约束**问题（音频定位 vs 视觉定位），但论文未从该角度建模

---

## 🥢 可行性分析

### 推荐结论

⚠️ **仅作设计参考收录，不建议投入实现**

- **算法复杂度**：N/A —— 纯感知实验研究，无算法贡献
- **实现难度**：N/A
- **依赖项**：VR 头显、空间音频渲染、实验控制软件

### 落地建议

1. **VR 内容设计**：声源定位误差在用户专注其他任务时容忍度较高；但**必须保证线索的空间同位**（避免知觉冲突）
2. **交互设计**：可利用"任务占用降低冲突察觉"这一效应，把需要精确声画同步的场景放在用户注意力空闲时
3. **不要把本文当作几何管线的输入** —— 其结论是感知层面的，不涉及几何精度要求

---

**已传递给 @墨鱼丸。**

---

## 相关笔记

- [[2026-11-09-CrowdDirector-Runtime-Crowd-Natural-Language]] — 同日另一篇，SIGGRAPH MIG '26
