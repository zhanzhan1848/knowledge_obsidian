---
type: paper
created: 2026-03-14
updated: 2026-03-14
tags: [paper, surface-interpolation, RBF, cs.GR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.10590
---

# Exact Interpolation under Noise: Clough-Tocher vs Multiquadric RBF Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Exact Interpolation under Noise: A Reproducible Comparison of Clough-Tocher and Multiquadric RBF Surfaces |
| **作者** | Mirkan Emir Sancak |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.10590) |
| **DOI** | 10.48550/arXiv.2603.10590 |

---

## 核心贡献

> 统一框架下比较三次和 RBF 插值在噪声环境下的表现

1. **统一评估协议** - 切片式训练/测试协议消除偏差
2. **两种噪声场景** - 无噪声观测 vs 有噪声观测
3. **可复现性** - SciPy/NumPy 脚本，固定随机种子

---

## 技术方案

### 核心思想

在统一框架下比较 Clough-Tocher 三次插值和 Multiquadric RBF 插值，评估它们在噪声数据上的表现。

### 关键技术

| 技术 | 说明 |
|------|------|
| Clough-Tocher | 三次样条插值，局部支持 |
| Multiquadric RBF | 径向基函数，全局支持 |
| 切片式评估 | 统一的 train/test 划分 |
| Bootstrap 不确定性 | 统计显著性评估 |

---

## 公式

```math
# Clough-Tocher 三次插值
# 每个三角形内使用分段三次多项式

# Multiquadric RBF
φ(r) = √(r² + c²)

# 其中 c 为形状参数
```

---

## 实验结论

- **无噪声场景**: 两种方法均高精度，各有优势
- **有噪声场景**: 精确插值会过拟合噪声节点，降低泛化性能
- **稳定性**: 三次插值在噪声环境下相对更稳定
- **RMSE/MAE/R²**: 均有详细报告

---

## 局限性

- 仅针对合成函数族测试
- 实际工程应用需要更多验证

---

## 相关工作

- [[Surface Reconstruction]]
- [[Point Cloud Processing]]

---

## 实现建议

- **实现难度**: 低 - SciPy 内置支持
- **预期性能**: 无噪声场景优秀，有噪声需谨慎
- **适用场景**: 曲面重建、环境工程数据处理
