---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, 3DGS, world-model, panorama, rendering, neural-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.11673
---

# ABot-3DWorld 0: A Universal World Model to Explore Any 3D Space

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ABot-3DWorld 0: A Universal World Model to Explore Any 3D Space |
| **作者** | Mingchao Sun, Luyang Tang, Yu Liu, Xu Yan, Zhan Li, Yongwei Zhang, Fei Yu, Zengye Ge, Yumin Liu, Jiacheng Zhang, Yongchang Zhang, Jiawei Zhang, Zhicheng Liu, Zhongxu Sun, Tianjian Ouyang, Wenzheng Chen, Shixing Yang, Nianfei Fan, Guodong Sun, Huan Li, Zheng Zhou, Yongze Li, Yingliang Peng, Mengmeng Du, Yuan Liu, Haozhe Shi, Chunnuo Gong, Chengzhen Yu, Chunxue Jia, Yang Liu, Shiying Zeng, Hang Zhang, Ning Guo, Baoquan Chen, Mu Xu, Hongyu Pan |
| **发表** | arXiv cs.CV (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.11673) |
| **DOI** | https://doi.org/10.48550/arXiv.2607.11673 |
| **代码** | https://abot-world.amap.com/plaza |

---

## 核心贡献

> 将文本、图像和视频输入转换为高保真度、可探索的3D世界

1. **Spatial Generative Primitive (SGP)**: 统一的紧凑表示，由高质量全景图和空间点云组成
2. **3D一致的全景视频生成器**: 沿规划轨迹探索SGP
3. **全景视频重建引擎**: 将生成的视频转换为干净的、逼真的3D Gaussian Splatting (3DGS)世界

---

## 技术方案

### 核心思想

ABot-3DWorld 0采用三阶段pipeline：
1. 多模态输入→SGP提升
2. SGP→3D一致全景视频生成
3. 全景视频→3DGS世界重建

### 关键技术

| 技术 | 说明 |
|------|------|
| SGP | 统一的空间生成原语，包含全景图+点云 |
| 3DGS | 3D Gaussian Splatting 用于最终渲染 |
| 几何恢复 | 镜像观测场景的几何约束重建 |
| 生成式补全 | 单图/句子→创意世界 |

### 渲染管线

- 使用 **3DGS (3D Gaussian Splatting)** 作为最终渲染表示
- 支持两种模式：
  - **丰富输入** (多视角、 casual video): 几何约束恢复
  - **单图/句子**: 生成式补全为创意世界

---

## 实验结论

- 在开源方法中达到SOTA
- 在丰富多模态输入下比Marble表现更强的场景保真度
- 支持消费级规模的地图本地空间探索

---

## 局限性

- 依赖高质量全景图输入
- 生成式补全的质量受限于输入多样性

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 3D内容创建、数字孪生、VR/AR、游戏
- **相关工作**: SuGaR, 2DGS, PGSR (mesh extraction from 3DGS)
