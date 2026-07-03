---
title: "Practical High-Fidelity Novel-View Synthesis of Mounted Lepidoptera"
authors: ["Kristof Overdulve", "et al."]
date: 2026-06-30
venue: "arXiv"
status: important
tags: [渲染, 新视角合成, 高斯泼溅, 宏成像, 深度学习]
links:
  arXiv: "https://arxiv.org/abs/2606.31679"
  PDF: "https://arxiv.org/pdf/2606.31679"
---

## 核心贡献

1. 端到端管道将蝴蝶标本转换为照片级3D模型
2. 手持焦点堆叠 (handheld focus stacking) 无需三脚架
3. 非接触第一表面镜面系统
4. 分割无关、无镜面感知的3D Gaussian Splatting扩展

## 技术方案

### 挑战
- 蝴蝶标本极难3D数字化
- 小而脆弱，有微观毛发和静脉结构
- 需要微距镜头，景深(Dof)非常有限
- 无法在标本下方 maneuver 相机拍摄腹侧

### 三种关键方法

1. **手持焦点堆叠**
   - 无需三脚架的全in-focus微距捕捉

2. **非接触第一表面镜面系统**
   - 暴露腹侧表面而不触碰标本

3. **分割无关的镜面感知3DGS扩展**
   - 3D Gaussian Splatting extension

## 实验验证

- 在四个不同标本上验证重建效果

## 标签

#新视角合成 #高斯泼溅 #3D重建 #微距摄影 #神经渲染
