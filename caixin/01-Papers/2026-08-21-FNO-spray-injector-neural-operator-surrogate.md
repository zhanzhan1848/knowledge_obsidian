# Towards Rapid Prototyping of Spray Injectors: A Regime-Agnostic Neural Operator Surrogate for Gas-Liquid Interface Evolution

**arXiv:** [2608.17825v1](https://arxiv.org/abs/2608.17825v1)  
**Published:** 2026-08-18  
**Category:** physics.flu-dyn  
**Tags:** #neural-operator #spray-atomization #VOF #FNO #U-Net #interface-tracking #surrogate-modeling

## 核心创新点

- 针对喷雾雾化过程中**气液界面演化**的快速预测
- **边界条件 Fourier Neural Operator (FNO)** 预测符号距离函数 (SDF) 演化
- 训练数据：2D 尖锋界面 VOF CFD 模拟，覆盖多种雾化 regime
- **SDF-FNO** 比直接用体积分数的 FNO 更好地保持界面特性（但不如 U-Net）

## 模型架构对比

| 模型 | 界面保真度 | 守恒性 |
|------|-----------|--------|
| SDF-FNO | 高 | 较好 |
| Volume-fraction FNO | 低 | 差 |
| **U-Net** | **最高** | 最佳 |

## 损失函数设计

1. **液体存量 penalty**：改善守恒（局部界面精度略降）
2. **物理信息扩展**：
   - 开放域目标增量液体平衡 penalty
   - 窄带 Eikonal 正则器（保持 SDF 几何特性）
   - 相边界 penalty

## 关键发现

- 物理信息扩展使模型稳定训练，但对预测误差、界面重叠、守恒行为**改善有限**
- 展示了用 SDF-FNO 对固定几何喷嘴的操作条件排序（按单位气体注入功率的界面面积生成率）

## 应用价值

- 喷雾喷嘴快速设计空间探索
- 操作条件排序
- 最终实现喷雾控制

## 关键词
#FNO #U-Net #spray-atomization #VOF #neural-operator #interface-evolution #surrogate
