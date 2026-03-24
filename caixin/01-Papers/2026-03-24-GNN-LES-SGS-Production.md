# GNN用于LES亚网格尺度生产率建模

## 元信息
- **arXiv**: [2603.19841](https://arxiv.org/abs/2603.19841)
- **作者**: Priyabrat Dash, et al.
- **提交日期**: 2026-03-20
- **领域**: Fluid Dynamics (physics.flu-dyn); Machine Learning (cs.LG)
- **PDF**: [arxiv.org/pdf/2603.19841](https://arxiv.org/pdf/2603.19841)

## 问题背景

LES中的**过滤化学反应源项**需要闭包:
- 过滤后的场不包含所有相关性
- 组分生成率需要亚网格尺度(SGS)建模

## 核心方法

### 图神经网络架构
```
输入: 过滤质量分数 + 温度
    ↓
子域图构建 (基于网格点连通性)
    ↓
GNN预测
    ↓
输出: 过滤组分生成率
```

### 训练数据
- **来源**: DNS湍流预混氢-甲烷射流火焰
- **氢分数**: 10%, 50%, 80%
- **过滤**: Favre滤波，滤波宽度匹配网格

### 泛化测试
- 训练: 10% 和 80% 氢
- 测试: **未见过的50%氢** (跨组分泛化)

## 主要结果

### 精度对比
| 方法 | 误差 | 跨组分泛化 |
|------|------|------------|
| 未闭包参考 | 高 | - |
| CNN (需重网格化) | 中 | 差 |
| **GNN** | **低** | **好** |

### 网格无关性
- 模型在**不同滤波宽度**下保持有界误差
- 无需重新训练即可处理更粗网格

### 复杂几何验证
- 后向台阶构型确认预测有效性

## 技术创新

1. **图结构处理非均匀网格** - 无需重网格化
2. **跨组分泛化** - 训练数据覆盖未见工况
3. **紧凑物种集** - 反应物、中间体、产物

## 应用场景

- 湍流燃烧LES
- 氢/甲烷混合燃料
- 复杂几何流动

## 与传统方法对比

| 特性 | 传统LES闭包 | GNN闭包 |
|------|-------------|---------|
| 网格适应性 | 需调参 | 自动适应 |
| 化学机理 | 简化 | 可处理详细机理 |
| 计算开销 | 低 | 中等(推理) |
| 精度 | 依赖模型 | 数据驱动 |

## 相关工作

- [[2026-03-24-NeuralFVM-GPU-Turbulence]] - 神经物理求解器
- [[2026-03-20-LES-hydrogen-flames]] - 氢火焰LES
- [[2026-03-17-LES-consistent-closure]] - LES一致闭包

## 代码思路

```python
class GNN_SGS:
    def __init__(self, species_list):
        self.graph_builder = MeshGraphBuilder()
        self.gnn = GraphNeuralNetwork(
            node_features=len(species_list) + 1,  # +1 for T
            edge_features=3  # distance, angles
        )
    
    def predict(self, Y_filtered, T_filtered, mesh):
        graph = self.graph_builder.build(mesh, Y_filtered, T_filtered)
        omega_filtered = self.gnn(graph)
        return omega_filtered
```

---

**标签**: #GNN #LES #亚网格尺度 #湍流燃烧 #机器学习
**创建日期**: 2026-03-24
