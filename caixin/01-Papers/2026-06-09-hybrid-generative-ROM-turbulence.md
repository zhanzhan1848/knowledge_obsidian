# Hybrid Generative Reduced-Order Model for Minimal Flow Unit

**arXiv**: [2606.09044](https://arxiv.org/abs/2606.09044)  
**日期**: 2026-06-09  
**分类**: AI+CFD / 数据驱动 / 湍流建模  

## 核心贡献

提出 **β-VAE-GAN + Sensor-conditioned Transformer** 框架，用于从稀疏传感器测量预测壁湍流间歇性近壁动力学。

## 方法架构

```
High-dimensional flow field
         ↓ (β-VAE-GAN compression)
4D latent space (87% TKE recovered)
         ↓ (sensor-conditioned Transformer)
Latent variable forecasting
         ↓ (decoder)
Reconstructed velocity field (82% TKE)
```

## 关键创新

1. **β-VAE-GAN 压缩**: 4D 潜空间恢复 87% 湍动能，超标准 β-VAE 10%+
2. **Easy Attention**: 静态时间混合算子，替代标准自注意，显著降低计算成本
3. **AdaLN-Zero 调制**: 传感器条件适应
4. **物理可解释性**: 潜坐标自主编码特征时间尺度，特定坐标捕获近壁再生循环低频特征 (T⁺ ≈ 1724)

## 性能指标

| 指标 | 数值 |
|------|------|
| 潜空间维度 | 4D |
| TKE 恢复率 (压缩) | 87% |
| TKE 恢复率 (端到端) | 82% |
| 预测时长 | 17,288 t⁺ |
| 初始化窗口 | 128 t⁺ |
| Re_τ | 200 |
| 评估位置 | y⁺ = 14 |

## 局限性
- 稀有极端振幅事件被衰减
- 编码器优先保留低维瓶颈中最统计上常见的流动状态

## 湍流模型分类
```
类型: ROM (Reduced-Order Model) + Deep Learning
训练数据: DNS / LES
应用: 近壁湍流, Minimal Flow Unit
```

## 可行性分析
✅ **推荐深入** — AI+CFD 融合的代表性工作，物理可解释性强