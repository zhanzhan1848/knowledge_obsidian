---
tags: [几何, 3D部件生成, 可变粒度, 几何条件, 门控调制, 图像到3D, PartVerseXL]
date: 2026-10-24
source: arXiv
arxiv_id: 2610.31671
venue: arXiv cs.CV (2026-10-22, 本次窗口最新批次)
status: new
authors: Qiwen Gu, Xin Zhou, Xiwu Chen, Zhongyang Zhu, Zhuo Zhang, Junqiao Zhao
categories: [cs.CV]
arxiv_url: https://arxiv.org/abs/2610.31671
code: https://github.com/Gucci233/FlexPart
---

# FlexPart: A Unified Framework for Image-to-3D Part Generation via Variable Granularity

## 一句话总结

一个模型同时支持**可变粒度的几何条件**做图像到 3D 部件生成 —— 稀疏点、稠密包围盒、掩码等**异构输入**通过**门控自适应调制**无缝融合，再配合**非对称几何引导机制**（用强空间先验对齐不同粒度的表示），在 PartVerseXL 上把 Part CD 相对 TripoSG+SAM3D 降低 **16.6%**、相对 OmniPart 降低 **10.5%**。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Unified Framework for Image-to-3D Part Generation via Variable Granularity |
| **作者** | Qiwen Gu, Xin Zhou, Xiwu Chen, Zhongyang Zhu, Zhuo Zhang, Junqiao Zhao |
| **发表** | arXiv cs.CV, 2026-10-22 |
| **链接** | [原文](https://arxiv.org/abs/2610.31671) |
| **代码** | [github.com/Gucci233/FlexPart](https://github.com/Gucci233/FlexPart) ✅ 已开源 |

---

## 核心贡献

1. **单一模型支持可变粒度几何条件**：稀疏点 / 稠密框 / 掩码 / 图像，全在一个模型内
2. **门控自适应调制 (gated adaptive modulation)**：融合异构条件的核心机制
3. **非对称几何引导机制**：利用**强空间先验**（如框）对齐不同粒度的表示 → 提升几何一致性 + 促进跨任务协同
4. **跨任务协同**：不同粒度条件下的任务互相受益（掩码任务的知识迁移到点/框任务）
5. **开源实现**

---

## 技术方案

### 关键技术

| 技术 | 说明 |
|------|------|
| **可变粒度条件** | 同一模型接受点集 (sparse)、3D 包围盒 (dense)、2D 掩码 (image-space)、RGB 图 |
| **门控自适应调制** | 用一个门控网络决定各条件分支的注入强度与融合方式，避免简单 concat 的尺度/语义冲突 |
| **非对称几何引导** | 强先验（框）作为"教师几何"引导弱先验（点/掩码）的表示对齐；非对称意味着不要求双向对称约束 |
| **部件生成** | 输出多部件 mesh，而非整体 mesh |
| **Part CD** | 部件级 Chamfer 距离，衡量部件几何精度 |

### 核心公式

**门控自适应调制**（示意）：

$$h' = h + \sum_{c \in \mathcal{C}} g_c(h) \odot \phi_c(h, c)$$

其中 $c$ 为条件分支（点/框/掩码/图像），$g_c(\cdot)$ 为门控网络输出的调制强度，$\phi_c$ 为条件编码。

**非对称引导**：

$$z_{\text{weak}} \leftarrow z_{\text{weak}} + \lambda \cdot \mathrm{Proj}\big(z_{\text{strong}} \rightarrow z_{\text{weak}}\text{ space}\big)$$

**部件级 Chamfer 距离**：

$$\text{Part CD} = \frac{1}{|P|}\sum_{p \in P} \min_{q \in G_{\hat p}} \|p - q\|^2$$

---

## 实验结论

- **数据集**：PartVerseXL（掩码条件）；另含点/框条件任务
- **指标**：Part CD（部件级 Chamfer）、整体 mesh 质量（Chamfer / F-score）
- **结果**（掩码条件）：
  - 相对 **TripoSG + SAM3D**：Part CD **↓ 16.6%**
  - 相对 **OmniPart**：Part CD **↓ 10.5%**
  - 整体 mesh 质量保持竞争性（未因部件约束而退化）
- **消融**：门控调制 vs 直接 concat；非对称引导 vs 对称引导；跨任务协同的迁移增益

---

## 局限性

- **依赖 PartVerseXL** 等高质量部件级 3D 数据（数据获取成本高）
- 图像到部件的**分割**依赖外部模型（SAM3D 等），误差会传导
- "可变粒度"是在**训练时**同时见到多种条件，推理时仍需指定粒度；未见"零样本网格条件"
- 未涉及**拓扑正确性**保证（部件间连接关系可能不合法）
- 对极稀疏点条件（< 10 点）的鲁棒性未验证

---

## 相关工作

- 相关笔记：PartVerse / PartVerseXL、OmniPart、TripoSG、SAM3D、3DPartGen
- [[2026-10-24-2610-27418-TokenFlow-Point-Cloud-Generation-Latent-Tokens]]
- [[2026-10-24-2610-29257-CRAB-Cuboid-BIM-Point-Clouds]]

---

## 实现建议

### 可行性分析：FlexPart

**算法复杂度**
- 时间复杂度：多分支编码 + 门控融合 + 扩散/流匹配去噪。若为 T 步采样，约 O(T · C_backbone)；C 中门控融合为 O(1) 级额外开销
- 空间复杂度：O(N_pts · d + 多分支特征)

**实现难度**
- 算法复杂度：**中**（多条件编码 + 门控融合，结构不复杂）
- 数值稳定性：**好**（门控机制本身有界幅值风险，需注意初始化）
- 依赖项：**PyTorch**、**PyTorch3D**、**threestudio / TRELLIS 类框架**、**Mask2Former/SAM3D**

**推荐结论**：✅ **推荐实现（代码已开源，直接跑）**

### 工程价值

1. **「一个模型多种几何条件」** 是非常实用的产品化思路：同一套 3D 资产生成后端，按用户交互方式（点/框/掩码）切换条件，无需维护多模型
2. **门控自适应调制** 是可复用的条件融合模式
3. **非对称引导**（强先验教弱先验）在条件注入中很常见，值得作为设计模式记录

**开源参考**
- 代码：https://github.com/Gucci233/FlexPart ✅
- 基线实现：OmniPart（华为诺亚）、TripoSG
- 评测：Part CD 指标脚本

**适用场景**：3D 资产生成编辑工具、部件级资产生产流水线、CAD 草图/框引导建模、多模态输入的资产生成平台

---

## 🧭 评估

✅ **推荐收录并立即试用**。本次窗口内**唯一提供开源代码**的相关论文，工程可用性最高。

**建议动作**：
1. 克隆代码，在 PartVerseXL 上跑通基线
2. 传给 **@五花肉（前端 3D 编辑器）** — 「点/框/掩码多粒度条件」正是编辑器交互的天然需求
3. 与 [[2610.27418 TokenFlow]] 对比：TokenFlow 解决"形状表示"，FlexPart 解决"条件注入"，可叠加
