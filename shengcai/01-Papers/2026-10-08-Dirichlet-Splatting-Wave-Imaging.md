---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, differentiable-rendering, gaussian-splatting, wave-imaging, terahertz, ACM-TOG, inverse-problems]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.00618
venue: ACM Transactions on Graphics
year: 2026
---

# Dirichlet Splatting: Differentiable Rendering for Wave-Based Inverse Problems

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dirichlet Splatting: Differentiable Rendering for Wave-Based Inverse Problems |
| **作者** | Xingyu Chen et al. |
| **发表** | ACM Transactions on Graphics (TOG) |
| **链接** | [原文](https://arxiv.org/abs/2610.00618) |

---

## 核心贡献

> 针对**相干波成像**（太赫兹、声学、毫米波雷达），用**物理精确的 Dirichlet 核**替代 3D Gaussian splat 的高斯足迹。Dirichlet 核是有限窗 DFT 的精确点扩散函数——**复值、振荡、周期**——能保留高斯 splat 丢弃的旁瓣能量（10-20%）和相位信息。配套 Dirichlet Sliding Frank-Wolfe (DSFW) 求解器。

1. **Dirichlet 核渲染图元** —— 物理精确对应波成像测量原理
2. **DSFW 求解器**：variable projection + 残差对偶证书 + 证书驱动硬替换
3. **周期低分辨率耦合 Levenberg-Marquardt** 校正
4. **O(1) 闭式评估** Dirichlet 核
5. **前向模型精确匹配 FFT 真值到机器精度**，端到端可微
6. 太赫兹反射器中心 RMSE 0.018 bin，**比波形级 AD 快 10-50 倍**

---

## 技术方案

### 核心思想

波成像（太赫兹/声学/雷达）的 PSF 不是高斯，而是有限窗 DFT 的 Dirichlet 核：
```math
D_N(\theta) = \frac{\sin(N\theta/2)}{N \sin(\theta/2)}
```

高斯 splat 直接用于波成像会**失败**——丢失 10-20% 旁瓣能量和相位。

**关键洞察**：把 splat 的**足迹函数**从高斯换成 Dirichlet 核。surfel 携带面积、法线、材质，匹配测量物理。

### Dirichlet Sliding Frank-Wolfe (DSFW)

| 组件 | 作用 |
|------|------|
| Variable projection | 交替优化 splat 参数和激活状态 |
| Residual dual certificates | 检测低效用 splat |
| Certificate-driven hard replacement | 主动替换冗余 splat |
| Periodic Levenberg-Marquardt | 周期性低分辨率精化 |

### 关键技术

| 技术 | 说明 |
|------|------|
| Dirichlet kernel splat | O(1) 闭式，物理精确 |
| Surfel (area + normal + material) | 几何表示 |
| Hard splat replacement | 求解器主动删除冗余 |
| Coherent phase preservation | 与 FFT 真值精确对齐 |

---

## 公式

```math
\text{Dirichlet kernel:} \quad D_N(\theta) = \frac{\sin(N\theta/2)}{N \sin(\theta/2)}
```

前向模型：
```math
\mathbf{y} = \sum_{i=1}^{M} \alpha_i \, \mathbf{n}_i \, D_N(\theta_i(\mathbf{x}_r, \mathbf{p}_i)) \cdot \mathbf{r}_i
```

其中 $\mathbf{p}_i$ 是 surfel 中心，$\mathbf{x}_r$ 是传感器位置，$\alpha_i, \mathbf{n}_i$ 是振幅与材质。

可微：所有操作都是闭式或显式编程实现。

---

## 实验结论

- **场景**：密集太赫兹重建
- **基线**：3D Gaussian splatting（直接迁移）、波形级自动微分
- **结果**：
  - 反射器中心 RMSE 0.018 bin
  - 比波形级 AD **快 10-50 倍**
  - 高斯 splat 失败（旁瓣/相位丢失）

---

## 局限性

1. 主要针对相干波成像模态，**非光波**（光波高斯足够好）
2. DSFW 求解器实现复杂
3. 19 页论文（含附录），核心实现细节多

---

## 相关工作

- [[3D Gaussian Splatting]] (Kerbl 2023)
- Wave-based imaging PSF analysis
- Differentiable rendering inverse problems
- Sliding Frank-Wolfe method

---

## 实现建议

- **实现难度**：高（DSFW 求解器 + Dirichlet 核可视化）
- **预期性能**：比波形 AD 快 10-50×；比高斯 splat 慢（Dirichlet 核评估稍贵）
- **适用场景**：
  - 太赫兹/毫米波成像重建
  - 合成孔径声学
  - 任何相干波成像（SAR、医用 OCT）
- **对 moyuwan 的建议**：
  - **不直接适用于光波渲染**
  - 但代表了一种**"PSF 物理精确化"的通用思路**——未来光波领域若需要考虑衍射极限以外的信息（如相干光），此方法有参考价值
  - ACM TOG 发表，**推荐作为领域前沿参考**