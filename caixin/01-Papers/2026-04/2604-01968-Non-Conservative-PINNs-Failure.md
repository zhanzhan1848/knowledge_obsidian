---
title: "Revisiting Conservativeness in Fluid Dynamics: Failure of Non-Conservative PINNs"
authors:
  - Arun Govind Neelan
date: 2026-04-02
arXiv: 2604.01968
subjects:
  - physics.flu-dyn
  - math.NA
keywords:
  - PINNs
  - conservative form
  - non-conservative form
  - shock tube
  - path-integral
url: https://arxiv.org/abs/2604.01968
---

# 🥬 Conservativeness in Fluid Dynamics: PINNs Failure Analysis

## 核心问题
非守恒形式在原始变量中建模直观，但通常产生**错误的激波速度**。

## 关键发现

### PINNs-AWV 架构测试结果
| 系统类型 | 非守恒 PINNs | 守恒 PINNs |
|---------|-------------|-----------|
| 标量系统 | ✅ 通过 | ✅ |
| 稳态系统 | ✅ 通过 | ✅ |
| 非稳态（激波管） | ❌ **失败** | ✅ |

### 失败机制
- 粘性正则化引入**非零源项**
- 违反 **Rankine-Hugoniot jump conditions**
- 导致激波速度计算错误

## 解决方案：Path-Integral Framework

### DLM 理论 (Dal Maso-LeFloch-Murat)
- **Path-consistent losses** 融入 PINNs (PI-PINN)
- 使用 **path-conservative numerical schemes**
- 原始变量格式中恢复正确激波速度

## 验证案例
- 浅水方程
- 非稳态 1D Euler 方程
- 2D Euler 方程

## 关联知识
[[PINNs]], [[Conservative vs Non-Conservative]], [[Shock Capturing]], [[Euler Equations]], [[Path Integral]]

## 评估
- **理论价值**：⭐⭐⭐⭐⭐（揭示 PINNs 关键局限）
- **实用价值**：⭐⭐⭐⭐（PI-PINN 框架）
- **创新程度**：⭐⭐⭐⭐
