---
title: GeRM: A Generative Rendering Model From Physically Realistic to Photorealistic
authors: Jiayuan Lu et al.
date: 2026-06-04
source: arXiv cs.CV
url: https://arxiv.org/abs/2604.09304
pdf: https://arxiv.org/pdf/2604.09304
tags: [rendering, PBR, photorealistic, generative, ControlNet, neural-rendering]
status: unread
---

# GeRM: A Generative Rendering Model From Physically Realistic to Photorealistic

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | GeRM: A Generative Rendering Model From Physically Realistic to Photorealistic |
| 作者 | Jiayuan Lu et al. (8 authors) |
| 来源 | arXiv cs.CV |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.09304) |
| PDF | [下载](https://arxiv.org/pdf/2604.09304) |

## 核心贡献
1. 首个多模态生成式渲染模型，弥合PBR到PRR（P2P）的差距
2. 学习Distribution Transfer Vector (DTV)场来指导生成过程
3. 多条件ControlNet：综合PBR图像并逐步过渡到PRR图像
4. G-buffers、文本提示、增强区域线索引导
5. 残差感知迁移机制：将文本提示与目标修改区域关联
6. 多智能体视觉语言模型框架构建P2P-50K专家配对迁移数据集

## 技术方案
**DTV Field (Distribution Transfer Vector)**:
```math
\text{DTV}: \text{PBR} \rightarrow \text{PRR}
```
- 学习从物理真实渲染到照片级真实渲染的分布迁移向量场

**Multi-condition ControlNet**:
- G-buffers输入（几何缓冲区）
- 文本提示
- 增强区域线索
- 逐步从PBR图像合成PRR图像

**Residual Perceptual Transfer Mechanism**:
- 将文本提示与对应的目标修改区域关联
- 更清晰地定义增量组件更新

**P2P-50K Dataset**:
- 多智能体视觉语言模型框架构建
- 专家配对迁移数据集

## 实验结论
- 在PBR和PRR图像合成和编辑的多种应用中表现优异
- 优于现有SOTA基线

## 局限性
- 需要PBR作为输入条件
- 对复杂光传输场景的泛化能力待验证

## 可行性分析
- 实现难度：高（需要ControlNet + 多模态训练）
- 性能预期：生成质量高，适用于渲染管线后期处理
- 适用场景：游戏/电影后期处理、渲染工作流加速

## 相关工作
- [[2026-03-19-VideoMatGen-PBR-Materials]]
- [[2026-03-12-LiTo-Surface-Light-Field-Tokenization]]