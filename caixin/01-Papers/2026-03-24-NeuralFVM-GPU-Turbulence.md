# NeuralFVM: GPU加速湍流有限体积求解器

## 元信息
- **arXiv**: [2603.21869](https://arxiv.org/abs/2603.21869)
- **作者**: Tingkai Xue, Yu Jiao, Te Ba, et al.
- **提交日期**: 2026-03-23
- **领域**: Fluid Dynamics (physics.flu-dyn)
- **PDF**: [arxiv.org/pdf/2603.21869](https://arxiv.org/pdf/2603.21869)

## 核心创新

### 1. 张量化有限体积法
- 控制方程重写为**局部张量运算**
- 使用**卷积模板算子** (convolution-based stencil operators)
- 保持FVM守恒性质
- 兼容深度学习库 (PyTorch/TensorFlow)

### 2. 算子分裂处理刚性项
k-ω湍流模型的输运方程包含**刚性耗散项** (stiff destruction terms):
```
∂(ρk)/∂t + ... = P_k - β*ρkω  (刚性!)
∂(ρω)/∂t + ... = P_ω - ρω²    (刚性!)
```

**解决方案**:
- 刚性项: **半隐式**处理
- 其他项: **显式**推进
- 避免全局矩阵组装 → 纯局部张量操作

### 3. 几何多重网格
- 基于卷积的**几何多重网格算法**
- 嵌入神经网络架构
- 求解压力-速度耦合

## 验证结果

| 测试案例 | 对比软件 | 一致性 |
|----------|----------|--------|
| 通道流 | ANSYS Fluent | ✅ 速度场吻合 |
| 室内气流 | ANSYS Fluent | ✅ 温度场吻合 |
| 湍流量 | ANSYS Fluent | ✅ k, ω吻合 |

## 性能加速

| 网格规模 | GPU加速比 |
|----------|-----------|
| 小网格 | ~19x |
| 大网格 | ~46x |

## 技术细节

### 控制方程
- 连续性方程
- 动量方程 (Navier-Stokes)
- 能量方程
- k-ω湍流模型 (标准)

### 离散化
- 空间: 有限体积法
- 时间: 算子分裂 + 显式/半隐式

## 应用前景

1. **数据驱动湍流建模** - 与ML工作流无缝集成
2. **参数优化** - GPU并行加速
3. **实时仿真** - 高效求解器

## 代码实现

```python
# 伪代码示意
class NeuralFVM:
    def __init__(self, mesh, turbulence_model='k_omega'):
        self.stencil_ops = ConvStencilOperators(mesh)
        self.multigrid = GeometricMultigrid(mesh)
    
    def step(self, U, k, omega, dt):
        # 算子分裂
        U, k, omega = self.explicit_convection(U, k, omega, dt)
        k, omega = self.semi_implicit_destruction(k, omega, dt)
        p = self.multigrid.solve_pressure(U)
        return self.correct_velocity(U, p)
```

## 相关论文

- [[2026-03-24-GNN-LES-SGS-Production]] - GNN用于LES
- [[2026-03-17-LBM-multiphase-porous]] - LBM GPU实现
- [[2026-03-18-arXiv-2603-16277-Immersed-Boundary-Neural]] - 神经网络边界处理

## 待解决问题

1. 复杂几何边界的模板算子设计？
2. 高阶格式 (MUSCL, WENO) 的张量化？
3. 多GPU扩展性？

---

**标签**: #CFD #GPU #湍流模型 #k-omega #有限体积法 #机器学习
**创建日期**: 2026-03-24
