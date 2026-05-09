---
tags: [渲染, 评估协议, 数据泄露, 内在图像分解, 全局光照]
date: 2026-05-09
status: 待读
---

# The Frame-Level Leakage Trap: Rethinking Evaluation Protocols for Intrinsic Image Decomposition

## 元信息
| 标题 | The frame-level leakage trap: rethinking evaluation protocols for intrinsic image decomposition |
| 作者 | Jihwan Woo (Amazon Web Services) |
| 链接 | [arXiv](https://arxiv.org/html/2605.06359v1) |
| 领域 | 内在图像分解, 评估协议, 数据泄露, 全局光照 |
| 提交日期 | 2026-05-08 |

## 核心贡献
1. **首次定量证明** frame-level split 在 MPI Sintel 上造成数据泄露：相比 scene-level split，测试 R_PSNR 被高估 1.6–2.0 dB
2. 提出 **scene-level splits** 作为社区新标准，并提供 6 个代表性模型的 reference numbers
3. 提出 **physics-informed decomposition** with **source-separable three-way heteroscedastic uncertainty head**
4. 验证了通道特化现象：non-Lambertian uncertainty channel 与非朗伯残差误差的交叉相关性 r=0.67

## 技术方案

### 问题：评估协议不一致
现有方法在 MPI Sintel 上按 frame 划分数据集，导致同一场景的空间相似帧同时出现在训练集和测试集中，造成数据泄露。

### 三点梯度评估
Random split < Temporal split < Scene-level split (gap is continuous)

### 方法：Physics-Informed Decomposition
I = R ∘ S + N
其中 R 为 reflectance，S 为 shading，N 为噪声。

### Source-Separable Uncertainty Head
- 三个异方差不确定通道
- 验证了通道特化：non-Lambertian uncertainty channel 显示 r=0.67 与非朗伯残差的相关性（是 texture channel 的 4 倍以上）

### 下游应用
过滤掉 75% 最高不确定像素，在保留像素上重建 MSE 降低 77%，而随机过滤无改善。

### 达到性能
15.98±0.41 dB R_PSNR，与 55-member Deep Ensemble（成本 1/5）差距在 0.8 dB 内。

## 相关链接
- [arXiv HTML](https://arxiv.org/html/2605.06359v1)

---

#标签 #评估协议 #数据泄露 #内在图像分解 #不确定性量化 #PBR #2026-05
