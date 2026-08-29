# Quantum-Inspired CFD for Transient Turbulent Compressible Flows

- **arXiv**: [2608.26995](https://arxiv.org/abs/2608.26995)
- **Published**: 2026-08-27
- **Categories**: physics.flu-dyn, quant-ph
- **Authors**: Shang Xian Matthew Lee, Melissa Kozul, Muhammad Usman, Martin Sevior, Matthew L. Sims-Goh, Richard D. Sandberg

## 核心创新

首个**可压缩 Navier-Stokes 方程**全量子启发 CFD 求解器（QICFD），所有运算均在 **Tensor Train (TT) 格式**中进行。

### 关键技术突破
1. **TT 除法与开方算法**：突破量子启发方法仅能处理不可压流的限制
2. **Sutherland 粘度定律**：通过新算法实现粘度计算
3. **可压缩流 DNS**：首次将 QICFD 应用于可压缩流直接数值模拟

## 数值方法

| 方面 | 实现 |
|------|------|
| 格式 | Tensor Train (TT) |
| 验证基准 | HiPSTAR (经典 CFD) |
| 算例 | Taylor-Green Vortex (TGV)，Ma=0.8 和 Ma=0.1 |
| 并行能力 | 多 TGV 算例同时运行，额外成本仅 10-20% |

## 关键发现

- TGV 测试（瞬态湍流，对累积误差敏感）结果与经典 CFD 高度一致
- **多算例并行**：可同时运行多个不同初始化的 TGV 算例，边际成本低
- 工业级条件仍面临挑战：需进一步算法进步

## 湍流特征

- 低分辨率 TGV（湍流起始阶段）
- 可压缩性效应：Ma=0.8 超声速 vs Ma=0.1 低速
- 瞬态敏感性：误差累积显著

## 计算成本

- TT 格式提供良好的 scaling 特性
- 并行额外开销 10-20%，远低于复制完整求解器

## 评估

✅ **推荐实现** — 量子启发 CFD 进入可压缩流领域是重要里程碑，TT 格式在高位维问题上有前景。

## 相关链接
- PDF: https://arxiv.org/pdf/2608.26995v1
- 项目: Tensor Train 格式

---
*分类: #CFD #量子计算 #可压缩流 #Tensor-Train #TGV #DNS #湍流*
