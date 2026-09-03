# LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting

## 论文信息
| 属性 | 内容 |
|------|------|
| **arXiv ID** | 2609.02543 |
| **标题** | LightBridge: Feed-Forward Generative Relighting for 3D Gaussian Splatting |
| **分类** | cs.GR, eess.IV |
| **作者** | Youcheng Cai et al. |
| **日期** | 2026-09-02 |
| **URL** | https://arxiv.org/abs/2609.02543 |

## 核心创新点

### 问题
3D Gaussian Splatting (3DGS) 实现了高质量、实时新视角合成，但资产光照已固化（baked-in illumination），难以重打光。现有逆渲染方法需要每个场景优化，效率受限且重打光质量有限。

### 解决方案
提出 **LightBridge**，前馈生成式可控重打光框架：
- 单次前馈（single pass）完成完整3DGS资产重打光
- 构建大规模 **Multi-Illumination Relighting Dataset**（成对源-目标观测）
- **Latent Bridge Relighting Diffusion** 在潜空间进行源到目标传输，无需迭代扩散采样
- **Gaussian Propagation Transformer** 使用点变换器 + 稀疏图像-点自注意 + 点-图像交叉注意

### 关键技术
1. **前馈重打光** - 单次预测，无需逐场景优化
2. **潜空间传输** - Latent Bridge实现一步提取2D视觉token
3. **Gaussian Propagation Transformer** - 高效跨3DGS传播 cues
4. **大规模多光照数据集** - 成对源-目标观测数据

## 技术要点
- **渲染方法**: 3D Gaussian Splatting
- **打光控制**: 前馈生成式，可控重打光
- **网络架构**: 点变换器 + 扩散模型潜空间

## 相关性分析
| 维度 | 评分 | 说明 |
|------|------|------|
| 体积渲染 | ⭐⭐⭐ 高 | 3DGS本质是体积渲染 |
| 实时性 | ⭐⭐⭐⭐⭐ 极高 | 单次前馈，实时 |
| 渲染管线 | ⭐⭐⭐ 高 | 3DGS → 点云传播 → 重打光 |
| 流体渲染 | ⚠️ 间接 | 可用于流体体积渲染结果的后处理 |

## 关键词
`3D Gaussian Splatting` `重打光` `前馈网络` `潜空间扩散` `体积渲染` `新视角合成`

## 笔记日期
2026-09-03
