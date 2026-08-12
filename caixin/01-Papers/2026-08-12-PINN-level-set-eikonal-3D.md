# Eikonal Regularisation in PINNs for 3D Level-Set Advection

## 论文信息
- **ID**: [arXiv:2608.08322](https://arxiv.org/abs/2608.08322)
- **关键词**: Physics-Informed Neural Networks, Level-Set, Eikonal Regulariser, Interface Tracking

## 核心创新点
PINN 应用于 level-set 界面追踪时，eikonal 正则化权重（惩罚 ||∇φ|| 偏离1）是主导超参数。

## 关键发现
1. 最优权重范围跨越 **4 个数量级**（10⁻¹ 到 10⁻⁵）
2. 权重值追踪精确解偏离有符号距离函数 (SDF) 的程度：
   - `10⁻¹`: 精确满足 SDF（刚体运动）
   - `10⁻⁵`: 界面被拉伸
3. 2D 设计原则 **可排序迁移到 3D**（4个 benchmarks 验证）
4. 具体数值迁移：4个中2个保持不变，2个需要调整

## 3D Benchmarks
| Case | 描述 | 最优权重量级 |
|------|------|-------------|
| Translating Sphere | 平移球（刚体） | 10⁻¹ |
| Rotating Sphere | 旋转球（刚体） | ~10⁻¹ |
| Slotted Sphere | 开缝球（变形） | ~10⁻³ |
| Reversed Vortex | 反向涡旋（拉伸） | ~10⁻⁵ |

## 方法论
- 权重选择：6个权重 × 3个种子 × 完整训练预算
- 预注册选择规则
- 迁移性验证：benchmark 之间和 run-to-run 变异性

## 数值细节
- **PINN 架构**: Standard feedforward NN + physics-informed loss
- **Loss 组成**: Residual loss + Initial condition loss + Eikonal regulariser
- **训练**: Full training budget per weight-seed combination

## 核心公式
```
Loss = L_residual + L_IC + λ_eikonal * (||∇φ|| - 1)²
```
其中 λ_eikonal 即为主导超参数。

## 启示
1. 界面变形程度越大 → eikonal 权重越小
2. 纯刚体运动可接受较大权重（因为 SDF 性质保持良好）
3. Run-to-run 变异性不可忽视，需要多种子验证

## 可行性分析
🥢 可行性分析：PINN Level-Set 3D Interface Tracking

## 控制方程
Level-set 输运方程：
∂φ/∂t + u·∇φ = 0
约束：|∇φ| = 1 (eikonal condition)

## 数值方法
- **PINN 离散化**: NN 参数化 φ(x,t)
- **损失函数**: Residual + IC + Eikonal
- **稳定性**: 高度依赖 λ_eikonal

## 计算成本
- 训练: O(N_epochs × N_params)
- 推理: O(1) per point
- 3D 验证成本高

## 推荐结论
✅ 推荐实现（参数敏感性需重点关注）

---
*标签*: #PINN #level-set #CFD #interface-tracking #machine-learning
*创建时间*: 2026-08-12
