---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [CFD, actuator-line, wind-turbine, FR-CPR, LES, VAWT]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2608.27943
---

# High-Order CFD Modeling of Rotating Actuator Line Systems

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | High-Order CFD Modeling of Rotating Actuator Line Systems |
| **作者** | Abdullah Al Imran, Meilin Yu |
| **发表** | arXiv 2026-08-28 / FEDSM 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.27943) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.27943 |

---

## 核心贡献

> 结合高阶 CFD (FR/CPR) 与旋转致动线模型 (ALM)，无需网格化叶片几何，实现全旋转风力机的高精度模拟。

1. **高阶虚拟体框架**：FR/CPR (Flux Reconstruction/Correction Procedure via Reconstruction) 格式 + Actuator Line Model，无需叶片网格
2. **时间依赖源项**：将叶片旋转和气动力通过高斯平滑注入固定笛卡尔网格
3. **VAWT 验证**：低尖速比 (TSR) 垂直轴风机，尾流结构和涡脱落与实验/LES 一致

---

## 技术方案

### 核心思想

采用 FR/CPR 高阶格式在固定笛卡尔网格上求解 N-S 方程，叶片通过致动线 (ALM) 表示，气动力以高斯平滑源项形式注入，避免了复杂的旋转网格生成。

### 关键技术

| 技术 | 说明 |
|------|------|
| FR/CPR 格式 | 高阶通量重构格式，离散精度高 |
| Actuator Line Model | 翼型气动力数据 → 线段分布力 |
| Gaussian Smoothing | 源项空间平滑，保证高阶格式稳定性 |
| Phase-averaged Analysis | 旋转机械相位平均分析 |
| LES Validation | 大涡模拟作为基准验证 |

---

## 物理模型

- **控制方程**：非稳态可压/不可压 N-S 方程
- **叶片模型**：准稳态翼型气动数据 (CL, CD, CM)
- **湍流模型**：大涡模拟 (LES) 用于基准验证
- **尖速比 TSR**：低 TSR 运行工况

---

## 核心公式

叶片气动力分布：
```
F(x) = Σ F_b * exp(-|x - x_b|² / ε²)
```
其中 ε 为高斯平滑核半径，F_b 为翼型截面气动力。

---

## 实验结论

- **验证对象**：两叶片 VAWT，2D 截面 + 3D 尾流
- **对比基准**：实验数据 + blade-resolved LES
- **结果**：相位平均载荷、尾流速度型与文献结果一致
- **适用**：强非稳态条件下的风力机气动分析

---

## 局限性

- 叶片气动数据依赖准稳态假设
- 高斯平滑参数需经验调节
- 旋转机械的相位平均需要周期性假设

---

## 实现建议

- **实现难度**：中等（需 FR/CPR 格式基础）
- **预期性能**：高阶精度，计算效率优于网格化叶片
- **适用场景**：风机阵列、VAWT、旋转机械气动设计

---

## 相关工作

- [[Actuator Line Method]]
- [[FR-CPR Format]]
- [[LES for Wind Turbine]]
