---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, SIGGRAPH-Asia-2026, neural-rendering, volumetric-video, diffusion, 4D, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.30023
---

# RealMe: Immersive Volumetric Video from Minimal Captures

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RealMe: Immersive Volumetric Video from Minimal Captures |
| **作者** | Chenxu Zhou, Zhiyuan Yu, Yudong Jin, Yinji Shentu, Yu Zhang, Jiaming Sun, Xiaowei Zhou |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers**, 2026-10-21 (DOI: 10.1145/3829340.3842349) |
| **链接** | [原文](https://arxiv.org/abs/2610.30023) |
| **DOI** | 10.1145/3829340.3842349 |
| **代码** | 项目页 https://zju3dv.github.io/realme |

---

## 核心贡献

> RealMe — 从稀疏低分辨率采集构建沉浸式体积视频：以高分辨率视频扩散模型为核心，把有限采集增强为 2K、4D 一致的视频以支持体积视频重建。

1. **统一框架** — 基于高分辨率视频扩散模型，将有限采集增强为高分辨率（2K）、4D 一致的视频，再用于体积视频重建。
2. **布局感知位置编码 + 因子化时空注意力** — 视频扩散模型适配多视角采集布局，跨视角与跨时间去噪潜表示。
3. **潜空间频域损失** — latent frequency loss 在潜空间提供频域监督，缩小生成视频与真实采集的数据差距。

---

## 技术方案

### 核心思想

稠密多视角重建能产出高质量体积视频，但采集成本高昂（需密集相机阵列）。生成式方法放宽了采集要求，却受限于分辨率与 4D 一致性。

RealMe 的思路是**先增强采集、再重建**：
- 从采集视频构造辅助数据，编码为潜表示 + 布局感知位置编码
- 因子化时空注意力适配多视角采集布局（区分"跨视角"与"跨时间"两组轴）
- 跨视角与跨时间联合去噪，解码为增强视频以精化 4D 表示
- 潜空间频域损失提供频域一致性监督

### 关键技术

| 技术 | 说明 |
|------|------|
| 高分辨率视频扩散模型 | 核心生成器，输出 2K |
| 因子化时空注意力 | 按多视角采集布局分解注意力轴 |
| 布局感知位置编码 | 编码相机布局先验 |
| Latent frequency loss | 潜空间频域监督，缩小生成-真实差距 |
| 4D 表示精化 | 用增强视频反哺体积重建 |

---

## 公式

```math
// 因子化时空注意力（概念式）
\text{Attn} = \text{Attn}_{\text{time}}(\mathbf{z}_{t}, \mathbf{z}_{t})
            \otimes \text{Attn}_{\text{view}}(\mathbf{z}_{v}, \mathbf{z}_{v})
// 潜空间频域损失
\mathcal{L}_{\text{freq}} = \big\| \mathcal{F}\big[\mathcal{D}(z_0)\big] - \mathcal{F}[x_{\text{real}}] \big\|_2^2
```

---

## 代码片段

```python
# 概念伪代码：RealMe 增强流程
aux = build_auxiliary_data(capture_videos)
latents = vae.encode(aux)                              # 潜表示
latents += layout_aware_pos_embed(capture_layout)      # 布局感知位置编码
for t in schedule:
    z = video_diffusion(z, t, factorized_attention=True)
    loss = mse(z, target) + lambda_freq * latent_frequency_loss(z, real_freq)
enhanced = vae.decode(z)                               # 2K 增强视频
volumetric_video = reconstruct_4D(enhanced)
```

---

## 实验结论

- **数据集**: 公开 DNA-Rendering 基准 + 自采 RealVV 数据集
- **基线**: SOTA 稠密多视角重建方法、生成式体积视频方法
- **结果**:
  - 视觉保真度与 4D 一致性均超越 SOTA
  - 从最小化采集生成沉浸式体积视频
  - 有效缓解生成视频与真实采集之间的数据差距

---

## 局限性

- 依赖预训练高分辨率视频扩散模型（算力成本高）
- 生成模型的幻觉可能引入几何不一致（频域损失只是部分缓解）
- 摘要未给出具体 PSNR/一致性量化数值

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 因子化时空注意力适配多视角布局的思路，可迁移到多相机渲染/立体匹配的注意力设计
- 关联：[[2026-10-31_CompMVR-Compression-Aware-MultiView-Restoration]]、[[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]]

---

## 实现建议

- **实现难度**: 高（需高分辨率视频扩散模型 + 因子化注意力改造 + 体积重建）
- **预期性能**: 质量 SOTA；速度慢（离线推理）
- **适用场景**: 沉浸式体积视频、VR 会议空间、影视特效虚拟拍摄
- **优先级**: 中
