---
type: paper
created: 2026-03-15
updated: 2026-03-15
tags: [paper, rendering, gaussian-splatting, neural-rendering, avatar, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.08645
---

# Retrieval-Augmented Gaussian Avatars: Improving Expression Generalization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Retrieval-Augmented Gaussian Avatars: Improving Expression Generalization |
| **作者** | Matan Levy 等 |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.08645) |
| **DOI** | 10.48550/arXiv.2603.08645 |

---

## 核心贡献

> 检索增强的高斯头像（RAF），提高无模板头像的表达泛化能力

1. 提出**RAF（Retrieval-Augmented Faces）**训练时增强策略，用于无模板头像学习
2. 构建大型**无标签表情库**，训练时用检索到的最近邻替换部分主体表情特征
3. 增强**身份-表情解耦**，提高对表情分布偏移的鲁棒性，无需配对跨身份数据或额外标注

---

## 技术方案

### 核心思想

通过检索增强将变形场暴露于更广泛的表情条件，鼓励更强的身份-表情解耦，提高对未见表情的泛化能力。

### 关键技术

| 技术 | 说明 |
|------|------|
| 表情库构建 | 大规模无标签表情特征 |
| 最近邻检索 | 替换训练时的表情特征 |
| 身份-表情解耦 | 增强泛化能力 |
| Gaussian Avatars | 基于高斯的头像表示 |

---

## 公式

暂无关键数学公式（需进一步阅读PDF）

---

## 代码片段

暂无

---

## 实验结论

- **数据集**: NeRSemble benchmark
- **评估**: 自驱动和跨驱动场景
- **结果**: 
  - 持续提高表情保真度
  - 检索到的邻居在表情和姿态上感知更接近

---

## 局限性

- 论文未明确说明（需进一步阅读）

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Neural Rendering]]
- [[Digital Human]]

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 提高表情泛化能力
- **适用场景**: 
  - 数字人/虚拟形象
  - 视频会议
  - 虚拟试衣

## 渲染相关度

⭐⭐⭐⭐ 高度相关

- 基于3D Gaussian Splatting技术
- 属于神经渲染和数字人渲染的前沿工作
- 涉及实时头像渲染
