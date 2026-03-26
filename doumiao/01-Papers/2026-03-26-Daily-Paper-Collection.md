# 每日论文搜索报告 - 2026-03-26

## 搜索配置
- **时间范围**: 2026-03-25 至 2026-03-26
- **数据源**: arXiv cs.GR, cs.LG, physics.flu-dyn
- **关键词**: fluid rendering, volume rendering, neural fluid, incompressible flows

## 发现论文汇总

### 🌟 核心论文 (3篇)

#### 1. Project and Generate: Divergence-Free Neural Operators for Incompressible Flows
- **arXiv**: 2603.24500
- **日期**: 2026-03-25
- **领域**: 神经算子 + 不可压缩流体
- **创新**: 可微光谱 Leray 投影 + 散度自由高斯参考测度
- **推荐度**: ✅✅✅

#### 2. NeuralFVM: Neural-physics-based Finite Volume Method for Turbulent Flows
- **arXiv**: 2603.21869
- **日期**: 2026-03-23
- **领域**: 神经物理求解器 + k-ω 湍流模型
- **创新**: 卷积基模板算子 + GPU 19-46x 加速
- **推荐度**: ✅✅✅

#### 3. Fluids You Can Trust: Property-Preserving Operator Learning
- **arXiv**: 2602.15472
- **日期**: 2026-02-17 (更新 2026-03-17)
- **领域**: 核算子学习 + 保属性
- **创新**: 桌面 GPU 训练 + 6 个数量级误差降低
- **推荐度**: ✅✅✅

### 📊 相关论文 (cs.GR)

| arXiv ID | 标题 | 相关性 |
|----------|------|--------|
| 2603.23933 | NPC Daily Activities (CVM 2026) | ❌ 不相关 |
| 2603.23194 | PhysSkin - Physics-Based Animation (CVPR 2026) | ⚠️ 部分相关 |
| 2603.23192 | LiDAR-Regularized 3D Gaussian Splatting | ❌ 不相关 |
| 2603.22780 | High-Order Quadrilateral Mesh Generation | ❌ 不相关 |
| 2603.21002 | SURF - Fast Video Generation | ❌ 不相关 |

## 技术趋势分析

### 神经流体模拟趋势
1. **物理约束硬化**: 从软惩罚转向硬约束
2. **GPU 原生设计**: 面向 GPU 的算法重构
3. **代理模型**: 核方法 vs 神经算子
4. **湍流建模**: 神经网络 + k-ω 模型融合

### 性能对比
| 方法 | 训练硬件 | 误差 | 速度 |
|------|----------|------|------|
| Fluids You Can Trust | 桌面 GPU | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| NeuralFVM | GPU | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Divergence-Free Neural Ops | GPU | ⭐⭐⭐⭐ | ⭐⭐⭐ |

## 下一步行动
- [ ] 深入分析 Divergence-Free Neural Operators 的实现细节
- [ ] 评估 NeuralFVM 的渲染管线集成可能性
- [ ] 研究 Fluids You Can Trust 的核方法应用

## 笔记文件
- [[2026-03-26-Divergence-Free-Neural-Operators]]
- [[2026-03-26-NeuralFVM-Turbulent-Flows]]
- [[2026-03-26-Fluids-You-Can-Trust]]

---
🩸 **豆苗 (Doumiao)** - 流体渲染研究专家
