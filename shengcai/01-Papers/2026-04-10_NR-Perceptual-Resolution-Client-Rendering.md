---
type: paper
created: 2026-04-10
updated: 2026-04-10
tags: [paper, real-time-rendering, perceptual-quality, power-efficiency, client-rendering, neural-network]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.07959
---

# Non-reference Perceptual Resolution Selection for Power-Efficient Client-Side Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Non-reference Perceptual Resolution Selection for Power-Efficient Client-Side Rendering |
| **作者** | Yaru Liu, Dayllon Vinícius Xavier Lemos, Ali Bozorgian, Chengxi Zeng, Alexander Hepburn, Arnau Raventos |
| **发表** | arXiv cs.GR, 2026-04-09 |
| **链接** | [原文](https://arxiv.org/abs/2604.07959) |
| **DOI** | 10.48550/arXiv.2604.07959 |
| **代码** | - |

---

## 核心贡献

> 利用人类视觉系统的时空感知限制，提出一种无需参考图像的分辨率预测方法，在 120Hz 高帧率下自适应选择最低感知质量可接受的渲染分辨率，实现功耗节省。

1. **无需参考图像的感知分辨率选择**：利用人类视觉系统（HVS）的时空限制，从渲染视频本身预测最低感知足够的分辨率
2. **首个面向高帧率（120Hz）渲染的分辨率预测框架**：显式利用 120fps 时的时间掩蔽效应
3. **大规模游戏引擎数据集**：73 个动态场景，33 个环境，5 种渲染配置（TSR/FXAA/FSR3/TAA+FSR3），使用 ColorVideoVDP 标注 JOD 质量分数

---

## 技术方案

### 核心思想

在 120Hz 高帧率渲染时，多个空间分辨率在感知上可能无法区分。通过分析人类视觉系统的时空限制，构建一个无需参考图像的神经网络分辨率预测器，从短时渲染视频（~250ms, 31帧）中预测最低感知足够的分辨率，从而在不影响主观质量的前提下显著降低渲染功耗。

### 关键技术

| 技术 | 说明 |
|------|------|
| ColorVideoVDP | 全参考感知视频质量指标，生成 JOD（just-objectionable-differences）质量标签 |
| DINOv2 ViT-S/14 | 冻结的视觉 backbone，提取每帧空间特征（CLS token, 384维） |
| 3D 卷积运动编码器 | 处理游戏引擎提供的每像素运动向量（2通道），提取紧凑运动表征 |
| 门控融合 | 空间特征与运动特征通过门控加法融合 |
| 70×70 中心裁剪 | 避免运动向量重采样，保持几何一致的高保真运动信号 |

### 训练目标

最低分辨率选择准则（0.1 JOD 容差）：
```math
r^* \leftarrow \arg\min_{r} f \cdot r^2 \quad \text{s.t.} \quad Q^* - Q(f,r) \leq 0.1
```
其中 $f$ 是固定帧率，$r$ 是分辨率，$Q(r)$ 是 JOD 质量分数。

### 数据集

- **引擎**：Unreal Engine 5（物理光照管线）
- **场景**：73 个动态场景（5-15秒），33 个环境，第三人称视角
- **帧率**：120fps，1920×1080
- **渲染配置**：
  1. Reference（无抗锯齿）
  2. TSR（Temporal Super Resolution AA）
  3. FXAA + 32 samples
  4. FSR3（FidelityFX Super Resolution 3，最高画质）
  5. TAA + FSR3
- **目标分辨率**：360p, 480p, 720p, 864p, 1080p
- **标注**：ColorVideoVDP 产生 JOD 分数，31,671 个 clips（250ms each）
- **数据量**：3.5 TB，10 天提取

### 网络架构

**输入**：31 帧 120Hz 视频 clip（~250ms）+ 每像素运动向量
**输出**：离散分辨率标签 {360p, 480p, 720p, 864p, 1080p}

1. RGB 帧 → 70×70 中心裁剪 → DINOv2 ViT-S/14 → CLS token → $S \in \mathbb{R}^{T \times 384}$
2. 运动向量 → 3D Conv-GELU blocks → 自适应平均池化 → $Z \in \mathbb{R}^{T' \times D_m}$
3. 门控融合：$S_{fused} = S + gate(Z) \odot S$
4. MLP 分类头输出分辨率标签

---

## 实验结论

- **功耗节省**：平均减少 **51.0%** 渲染像素，无感知质量损失
- **方法对比**：相比全参考 ColorVideoVDP，预测速度显著提升，适合设备端部署
- **感知质量**：在 0.1 JOD 容差下，分辨率选择与 ColorVideoVDP 最优决策高度一致

---

## 局限性

- 针对 120Hz 设计，低帧率场景效果可能不同
- 需要游戏引擎提供运动向量（UE5 原生支持）
- 训练数据基于 UE5 游戏引擎，泛化到其他引擎需进一步验证

---

## 实现建议

- **实现难度**：中（需要 UE5 插件采集数据 + 神经网络训练）
- **预期性能**：推理延迟低，适合移动端部署
- **适用场景**：移动游戏、VR/AR、云游戏客户端渲染节能
- **集成方式**：codec-agnostic，最小化基础设施修改

---

## 相关工作

- [[ColorVideoVDP]] - 感知视频质量评估
- [[DINOv2]] - 自监督视觉特征提取
- [[Temporal Super Resolution]] - 时间超分辨率抗锯齿
- [[Foveated Rendering]] - 注视点渲染（本研究专注于非注视点区域的高帧率掩蔽）
