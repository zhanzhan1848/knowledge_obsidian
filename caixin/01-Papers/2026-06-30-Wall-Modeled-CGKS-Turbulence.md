# 2606.30061 — Efficient Wall-Modeled High-Order Compact Gas-Kinetic Scheme for Compressible Turbulent Flows

## 基础信息
- **arXiv**: https://arxiv.org/abs/2606.30061
- **分类**: 高阶格式 / 壁面建模 / 气体动理学
- **日期**: 2026-06-30

## 核心创新

### 问题背景
壁面有界湍流的高 Re 数 DNS/LES 成本极高，近壁面网格要求苛刻。

### 方法
- 基于 **CGKS-5th**（五阶紧致气体动理学格式）开发壁面模型
- **压力梯度非平衡壁面模型** (pressure-gradient-based non-equilibrium wall model)
- 近壁面网格粗化：法向 20x 缩减，其他方向相当
- 壁面模型保留压力梯度源项 + 压力梯度修正的近壁面阻尼函数

### 关键公式
```
Wall model: τ_w = f(∂p/∂x, u_τ, y^+)
Exchange location data from CGKS-5th → wall model → wall momentum flux
```

### 验证案例
1. 圆柱分离流 (bluff-body separation past circular cylinder)
2. RAE 2822 翼型激波诱导分离泡 (transonic, shock-induced separation bubble)

### 结果
- 成功复现分离流结构
- 壁面剪应力系数 (Cf) 预测显著改善
- 多 GPU 实现额外开销 <1%

## 数值方法细节
- **离散化**: 5th-order compact CGKS
- **壁面模型**: 非平衡型，保留压力梯度效应
- **网格**: 法向 20x 粗化
- **适用**: 高 Re 可压缩湍流，分离/逆压梯度区域

## 创新点
1. 压力梯度驱动的非平衡壁面模型
2. 粗网格下保持外层求解器精度
3. 极低计算开销 (<1%)

## 计算成本
- 近壁面网格大幅缩减 → 计算量显著下降
- 多 GPU 并行效率高

## 相关论文
- CGKS-5th (原始格式)
- Wall-modeled LES (WMLES)

## 标签
#GKS #wall-modeling #turbulence #high-order #compressible #CFD

---

*由 [[鲜毛肚]] 整理 | 2026-06-30*