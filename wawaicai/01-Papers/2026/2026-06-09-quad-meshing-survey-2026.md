---
title: "Quad Meshing Survey - 2026 Papers Compilation"
venue: "GitHub Repository"
date: 2026-06
tags: [网格处理, 四边形网格, 调研, 神经网格生成, 场引导]
links:
  repo: "https://github.com/Bigger-and-Stronger/quad-meshing-survey"
---

# 四边形网格化调研 2026 论文汇总

## 2026 年重要论文

### 神经网格生成

| 论文 | 作者 | 会议/期刊 | 链接 |
|------|------|-----------|------|
| TopGen: Learning Structural Layouts and Cross-Fields | Chen et al. | arXiv | [2603.10606](https://arxiv.org/abs/2603.10606) |
| SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields | Kong et al. | ACM TOG (SIGGRAPH) | [project](https://youkang-kong.github.io/squadgen/) |
| QuadLink: Autoregressive Quad-Dominant Mesh Generation | Zhang et al. | arXiv | [2605.16813](https://arxiv.org/abs/2605.16813) |
| QuadGPT: Native Quadrilateral Mesh Generation with Autoregressive Models | Liu et al. | ICLR 2026 | [OpenReview](https://openreview.net/forum?id=oRmo4p1KEE) |
| Mesh-Pro: Artist-style Quadrilateral Mesh Generation | Zhou et al. | CVPR 2026 | [2603.00526](https://arxiv.org/abs/2603.00526) |
| SATO: Strips as Tokens | Xu et al. | ACM TOG (SIGGRAPH) | [2604.09132](https://arxiv.org/abs/2604.09132) |
| NeurFrame: Learning Continuous Frame Fields | Yu et al. | arXiv | [2603.12820](https://arxiv.org/abs/2603.12820) |

### 传统方法

| 论文 | 作者 | 会议/期刊 | 链接 |
|------|------|-----------|------|
| Surface Quadrilateral Meshing from Integrable Odeco Fields | Couplet et al. | SGP 2026 | [2604.03889](https://arxiv.org/abs/2604.03889) |
| Size-controlled quadrilateral meshing using integrable odeco fields | Couplet et al. | Computer-Aided Design | [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S0010448525001356) |
| Learning Conjugate Direction Fields | Tao et al. | AAAI 2026 | [39786](https://ojs.aaai.org/index.php/AAAI/article/view/39786) |
| Embedding Optimization of Layouts via Distortion Minimization | Heuschling et al. | Computer Graphics Forum | [GitHub](https://github.com/7-AlexH/layout-embedding-optimization) |

## 技术趋势

1. **神经网络主导**：神经网格生成成为主流研究方向
2. **UV 感知**：强调 UV 分割和边界保持
3. **自回归模型**：Transformer/自回归方法用于网格生成
4. **四边形优先**：保持边流连贯性和几何规则性

## 开源资源

- Quad Meshing Survey: https://github.com/Bigger-and-Stronger/quad-meshing-survey

## 相关笔记

[[四边形网格]], [[神经网格生成]], [[场引导网格]]

---

> 来源: GitHub Repository
> 分析日期: 2026-06-09