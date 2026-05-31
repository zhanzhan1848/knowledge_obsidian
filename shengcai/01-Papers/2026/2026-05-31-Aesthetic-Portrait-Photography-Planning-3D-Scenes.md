---
title: Before the Shutter: Aesthetic and Actionable Portrait Photography Planning in 3D Scenes
authors: Ruoxiang Jiang
date: 2026-05-28
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.30318
pdf: https://arxiv.org/pdf/2605.30318
tags: [rendering, 3D-scene, photography, portrait, AI-planning, paper, 2026]
status: unread
---

# Before the Shutter: Aesthetic and Actionable Portrait Photography Planning in 3D Scenes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Before the Shutter: Aesthetic and Actionable Portrait Photography Planning in 3D Scenes |
| 作者 | Ruoxiang Jiang |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.30318) |
| PDF | [下载](https://arxiv.org/pdf/2605.30318) |

## 核心贡献
1. 提出 **3D Aesthetic Portrait Planning**：在 3D 场景中生成人体姿态、相机、光照和曝光计划
2. 构建 **Photographic Scene Graph**：表示场景可供性、主体-场景关系和肖像相关光照结构
3. 基于该表示进行美学引导的比较规划
4. 实验表明产生的肖像被人类评分者和 MLLM 评估者优于竞争基线

## 技术方案

### Photographic Scene Graph
- 场景可供性（affordances）
- 主体-场景关系
- 肖像相关光照结构

### 规划方法
- 美学引导的比较规划
- 结合取景器观测
- 保持物理可行性

## 实验结论
- 生成的肖像被人类评分者偏好
- MLLM 评估优于竞争基线
- 保持高物理可信度

## 局限性
- 专注于室内外场景
- 需要场景几何和光度信息

## 可行性分析
- 实现难度：中
- 性能预期：结合场景感知和 AI 美学评估
- 适用场景：摄影规划、虚拟摄影、3D 内容创作

## 相关工作
- [[Portrait Photography]]
- [[3D Scene Understanding]]
- [[Computational Photography]]