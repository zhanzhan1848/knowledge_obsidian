---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [turbulence, DNS, 3D, benchmark, machine-learning, TIDE, forecasting]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04222
---

# TIDE: A Physically Diverse 3D Turbulence Benchmark Dataset for Advancing Scientific Machine Learning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A physically diverse 3D turbulence benchmark dataset for advancing scientific machine learning |
| **作者** | Yilong Dai |
| **发表** | arXiv 2026-08-04 |
| **链接** | [原文](https://arxiv.org/abs/2608.04222) |
| **DOI** | https://doi.org/10.5281/zenodo.21589489 |
| **代码** | https://github.com/Dyloong1/TIDE-dataset-benchmark |

---

## 核心贡献

> 发布 TIDE：256³ 分辨率的 3D 不可压湍流 DNS 数据集和基准测试套件

1. **15 种配置**：8 个独立控制轴，独立 ensembles
2. **压力场 + 方程级验证**：包含完整压力场数据
3. **五大基准任务**：预测、插值、恢复等
4. **当前模型性能**：学习模型仅略优于 persistence，约为 spectral solver 误差的 2 倍

---

## 数据集规格

| 参数 | 值 |
|------|---|
| 分辨率 | 256³ |
| 任务数 | 5 个基准任务 |
| 配置数 | 15 种 |
| 控制轴 | 8 个 |
| Ensembles | 独立 ensembles |

### 控制轴

- Reynolds 数
- 初始条件
- forcing 类型
- 衰减阶段
- 等

---

## 基准测试结果

- **Persistence baseline**: 当前 ML 模型难以显著超越
- **Spectral solver**: 误差约为 ML 模型的 1/2
- **小尺度动力学**: 低点误差可能伴随严重扭曲的小尺度动力学
- **泛化问题**: forced → decay 转移揭示 conditioning 缺失问题

---

## 开放问题

1. **精度差距**: 如何超越 persistence
2. **物理保真度**: 点误差不等于物理保真度
3. **Conditioning**: forced 训练模型无法预测 decay 演化

---

## 实现建议

- **实现难度**: ★★☆☆☆（数据集使用）
- **预期性能**: 为 ML-CFD 提供标准基准
- **适用场景**: 科学机器学习、湍流建模、数据驱动方法评估
