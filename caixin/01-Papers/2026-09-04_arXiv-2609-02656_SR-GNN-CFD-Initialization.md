---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [CFD, GNN, super-resolution, NekRS, initialization, ML-CFD]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.02656
---

# Super-Resolution Initialization of High-Fidelity CFD Simulations for Pebble-Bed Reactors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Super-Resolution Initialization of High-Fidelity CFD Simulations for Pebble-Bed Reactors |
| **作者** | Guilherme Gottems, Elia Merzari et al. (多机构) |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.02656) |

---

## 核心贡献

> 使用超分辨率图神经网络（SR-GNN）改善 NekRS 高阶 CFD 模拟的初始化，将 P=2 低阶速度场重建为 P=7 高阶表示，加速流动发展

1. SR-GNN 从低阶 P=2 场重建高阶 P=7 表示
2. Re=5000 时 SR-GNN 初始化比直接 P=2 restart 更快达到稳态
3. 训练好的 Re=5000 模型成功迁移到 1568 球体大型几何

---

## 技术方案

| 技术 | 说明 |
|------|------|
| NekRS | 高阶谱元 CFD 求解器 (P=7) |
| SR-GNN | 超分辨率图神经网络 |
| 低阶场 | P=2 速度场作为输入 |
| 高阶场 | P=7 重建场用于 restart |
| Pebble-bed | 146 球体 (Re=1000/2500/5000), 1568 球体 (迁移测试) |

### 方法流程

1. 配对低阶(P=2)和高阶(P=7)快照训练 SR-GNN
2. 推理：P=2 → SR-GNN → P=7 重建场
3. 使用重建场初始化 P=7 restart 模拟
4. 以压力降收敛作为主要评估指标

---

## 关键结果

- **Re=1000, 2500**：SR-GNN 初始化案例产生与直接 P=2 restart 相似的压力降历史
- **Re=5000**：SR-GNN 初始化比直接 P=2 restart 和均匀初始化的 P=7 参考模拟更快达到稳态
- **几何迁移**：1568 球体床层定性地展示了工作流的可扩展性

---

## 局限性

- 湍流雷诺数和几何形状的泛化性需进一步研究
- Re=1000/2500 的改进不如 Re=5000 显著

---

## 相关工作

[[Neural network CFD]], [[Super-resolution]], [[GNN fluid flow]], [[NekRS]], [[High-order CFD]]
