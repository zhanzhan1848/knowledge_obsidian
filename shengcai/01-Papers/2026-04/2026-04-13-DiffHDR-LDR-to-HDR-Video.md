---
type: paper
created: 2026-04-13
updated: 2026-04-13
tags: [paper, HDR, video, diffusion, rendering, tone-mapping, arxiv]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.06161
---

# DiffHDR: Re-Exposing LDR Videos with Video Diffusion Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DiffHDR: Re-Exposing LDR Videos with Video Diffusion Models |
| **作者** | Zhengming Yu, Li Ma, Mingming He, Leo Isikdogan, Yuancheng Xu, Dmitriy Smirnov, Pablo Salamanca, Dao Mi, Pablo Delgado, Ning Yu, Julien Philip, Xin Li, Wenping Wang, Paul Debevec |
| **发表** | arXiv cs.CV/cs.GR, 2026-04-07 (v2: 2026-04-10) |
| **链接** | [原文](https://arxiv.org/abs/2604.06161) |
| **DOI** | 10.48550/arXiv.2604.06161 |

---

## 核心贡献

> 首个基于视频扩散模型的LDR到HDR转换框架，通过在潜在空间中进行生成性radiance inpainting恢复丢失的动态范围

1. **首个视频扩散HDR框架**：将LDR到HDR转换制定为生成性radiance inpainting任务
2. **Log-Gamma颜色映射**：将HDR内容压缩到预训练视频VAE的操作范围
3. **曝光感知控制**：基于亮度mask的上下文提示和交叉注意力

---

## 技术方案

### 核心思想

在视频扩散模型的潜在空间中进行LDR到HDR转换，通过Log-Gamma颜色空间利用预训练视频模型的时空生成先验。

### 关键技术

| 技术 | 说明 |
|------|------|
| Log-Gamma Color Mapping | 将HDR压缩到LDR VAE可处理范围 |
| Video Diffusion Model | 预训练视频扩散模型提供时空先验 |
| Luminance-based Masks | 检测过曝/欠曝区域引导生成 |
| Context-focused Prompting | 上下文聚焦提示增强可控生成 |
| HDR Video Data Pipeline | 从静态HDRI合成HDR视频训练数据 |

### 流程

1. 输入LDR视频 → 检测clipped regions
2. Log-Gamma映射到潜在空间
3. 视频扩散模型重建过/欠曝区域radiance
4. 逆映射输出HDR视频

---

## 实验结论

- **数据集**: 合成HDR视频 + 真实世界视频
- **基线**: 现有LDR-to-HDR方法
- **结果**: 在radiance保真度和时间稳定性上显著优于SOTA

---

## 局限性

- 依赖预训练视频模型的先验质量
- 对极端曝光场景的泛化能力有限

---

## 相关工作

- [[HDR Video]] - HDR视频处理
- [[Video Diffusion]] - 视频扩散模型
- [[Tone Mapping]] - 色调映射

---

## 实现建议

- **实现难度**: 高（视频扩散模型训练）
- **预期性能**: 高质量HDR视频转换
- **适用场景**: 视频后期制作、HDR显示内容准备

---

## 标签

#HDR #视频处理 #扩散模型 #渲染 #色调映射 #2026
