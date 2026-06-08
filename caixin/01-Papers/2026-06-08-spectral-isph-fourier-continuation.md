# 高阶 Fourier Continuation 谱 ISPH 方法 — 非周期壁面边界

**arXiv**: [2606.06247](https://arxiv.org/abs/2606.06247)  
**作者**: Meixuan Lin  
**日期**: 2026-06-04  
**领域**: SPH, spectral methods, incompressible flow, CFD  
**标签**: #SPH #ISPH #spectral-methods #high-order #wall-boundary

---

## 核心创新

将 **Fourier Continuation (FC)** 技术引入谱不可压缩 SPH，实现：

1. **高阶收敛** — 谱精度保持
2. **非周期边界条件** — 突破传统谱方法周期域限制
3. **复杂几何涡流精确捕捉**

## 方法论

### Fourier Continuation (FC)
- 使用多项式基底的 Fourier continuation 技术
- 将速度场和压力场延拓为周期且 C^p 平滑的域
- Neumann 边界条件可直接引入
- 通用性：可处理任意类型边界条件

### 空间离散化
```
1. FC 延拓 → 周期域
2. FFT 卷积定理 → 频谱空间 SPH 离散化
3. 投影时间格式 + 谱 PPE 求解器
```

### 关键优势
- 无需粒子到网格映射
- 纯谱精度
- 计算成本可控（额外 FFT 开销）

## 验证案例

- 经典 CFD benchmarks (待获取具体案例细节)
- 复杂涡流动力学精确捕捉

## 数值特性

| 特性 | 描述 |
|------|------|
| 收敛阶 | 高阶（谱） |
| 边界处理 | Fourier Continuation |
| 时间格式 | 投影方法 |
| 压力求解 | 谱 PPE |
| 适用场景 | 壁面约束流、复杂几何 |

## 物理意义

该工作将 **完全高阶谱 Lagrangian SPH 求解器** 向前推进一步：
- 解决了 SPH 方法长期存在的非周期边界难题
- 保持谱方法高精度特性
- 为复杂几何流體模擬提供新途径

## 与现有方法对比

- 传统 SPH：粒子方法，低阶精度，边界处理复杂
- 谱 SPH（周期）：高精度，但仅限于周期域
- 本方法：FC + 谱 SPH = 高阶 + 非周期 + 复杂几何

## 可行性评估

```
✅ 推荐实现

数值方法: 高阶谱 + FC 延拓
计算成本: O(N log N)，额外 FC 开销
稳定性: 投影格式保证
适用性: 壁面约束流、复杂几何、航空航天
```

---
*同步至 GitHub*