# Denoising Diffusion and Latent Diffusion Models for Physics Field Simulations

**arXiv ID**: [2603.10799](https://arxiv.org/abs/2603.10799)  
**提交日期**: 2026-03-11  
**作者**: Yuan Jia et al.  
**分类**: physics.flu-dyn  

## 摘要
本研究将去噪扩散概率模型（DDPM）应用于物理场预测，包括热扩散引起的温度场以及从不可压缩到高超音速的流场。引入潜在扩散模型（LDM）以降低计算成本。

## 核心创新点
1. **DDPM 应用于物理场**：首次将条件 DDPM 框架用于稳态热扩散和复杂流场预测
2. **Latent Diffusion Model**：使用自编码器进行降维，在潜在空间进行扩散训练
3. **多工况验证**：涵盖不可压缩翼型绕流和高超音速压缩拐角流动

## 数值方法
- **模型**: Denoising Diffusion Probabilistic Models (DDPMs)
- **降维**: Autoencoder (AE) 用于潜在空间学习
- **验证案例**:
  - 带孔平板热扩散（误差 ~0.013）
  - 翼型不可压缩绕流
  - 高超音速压缩拐角（分离长度偏差 4.28%）

## 应用领域
- 电子系统热管理
- 航空翼型优化
- 高超音速飞行器流场控制

## 关键结果
- LDM 在保持重建质量的同时显著降低训练成本
- 在高超音速流动中准确预测分离长度
- 对关键区域（如孔洞附近）具有高精度预测能力

## 技术细节
### DDPM 框架
- 条件生成模型
- 逐步去噪过程
- 物理场作为条件输入

### Latent Diffusion
- 编码器：将物理场映射到低维潜在空间
- 潜在空间扩散训练
- 解码器：重建物理场

## 相关工作
[[Diffusion Models]]
[[Deep Learning for CFD]]
[[Reduced Order Modeling]]
[[Physics-Informed Neural Networks]]

## 标签
#CFD #MachineLearning #DiffusionModels #ThermalSimulation #HypersonicFlow #LatentDiffusion

## 引用
```bibtex
@article{jia2026diffusion,
  title={Denoising diffusion and latent diffusion models for physics field simulations},
  author={Jia, Yuan and others},
  journal={arXiv preprint arXiv:2603.10799},
  year={2026}
}
```

## 备注
- **计算效率**: LDM 显著降低训练成本
- **适用范围**: 从不可压缩到高超音速
- **工程价值**: 适用于实际工程应用
