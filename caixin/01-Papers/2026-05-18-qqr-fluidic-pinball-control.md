---
title: "Control of the Fluidic Pinball using the Quadratic-Quadratic Regulator"
authors:
  - Ali Bouland
date: 2026-05-14
arxiv_id: "2605.15438"
categories: ["math.OC", "physics.flu-dyn"]
tags: ["flow control", "Navier-Stokes", "model reduction", "QQR", "vortex shedding", "nonlinear control"]
status: processed
---

# 核心贡献

提出 **IMOR-QQR** 框架稳定化 **Fluidic Pinball** 湍流wake，显著优于线性控制器。

## 背景: Fluidic Pinball

三个圆柱尾流的复杂相互作用，是**非线性流动控制**的标准 benchmark。

## 方法框架

### 组件
1. **IMOR** (Interpolatory Model Order Reduction) - 降阶建模
2. **QQR** (Quadratic-Quadratic Regulator) - 专为 N-S 方程二阶非线性设计的控制器

### 控制策略
- 基于 FEM 生成全阶模型
- 使用 IMOR 获取精确的输入-输出降阶模型 (ROM)
- QQR 反馈控制利用 N-S 方程的二次非线性

---

## 性能对比

| 雷诺数 | 线性控制器 | QQR 控制器 |
|--------|-----------|-----------|
| Re_D = 30 | 基线 | 快 40.1% 达到目标 |
| Re_D = 50 | **失效** | ✅ 成功稳定 |

### QQR 效果
- ✅ 有效抑制 vortex shedding
- ✅ 消除升力振荡
- ✅ 降低阻力系数

---

## 数值方法

| 技术 | 说明 |
|------|------|
| FEM | 有限元法建模 |
| IMOR | 插值模型降阶 |
| QQR | 二次-二次调节器 |

### 关键优势
- **非线性控制**: 相比线性控制器处理强非线性
- **模型精确**: ROM 保持输入-输出特性

---

## URL
- arXiv: https://arxiv.org/abs/2605.15438
- PDF: https://arxiv.org/pdf/2605.15438

---

#metadata
#flow-control #navier-stokes #model-reduction #nonlinear-control