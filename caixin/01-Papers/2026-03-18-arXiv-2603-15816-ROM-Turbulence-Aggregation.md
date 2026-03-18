# Efficient and Accurate Surrogate Modeling of Turbulent Flows via Space-Dependent Aggregation and Reduced Order Models

**arXiv**: [2603.15816](https://arxiv.org/abs/2603.15816)  
**发表日期**: 2026-03-16  
**作者**: Anna Ivagnes  
**分类**: math.NA (主), physics.flu-dyn (次)

---

## 📋 基本信息

| 项目 | 内容 |
|------|------|
| 领域 | 数值分析、湍流建模 |
| 方法 | RANS + ROM + Aggregation |
| 应用 | 湍流代理模型 |
| 特点 | 近实时计算成本 |

---

## 🎯 研究动机

### RANS 模型局限性

- 计算效率高
- **精度依赖湍流闭合选择**
- **空间变化的模型性能**

### 现有解决方案

**空间依赖模型聚合**:
- 组合多个湍流模型
- 提高预测精度
- **代价**: 需要多次高保真仿真

---

## 🔬 核心创新

### 1. 统一框架

```
多湍流模型 + 空间聚合 + 非侵入式 ROM
```

### 2. 两种聚合管道

#### MFR (Mixed FOM-ROM)
```
RANS 1 ┐
RANS 2 ├→ 聚合 → ROM 训练
RANS 3 ┘
```

#### MR (Mixed-ROM)
```
RANS 1 → ROM 1 ┐
RANS 2 → ROM 2 ├→ 直接聚合
RANS 3 → ROM 3 ┘
```

### 3. 神经网络聚合权重

**特点**:
- 空间连续平滑权重
- 相比标准加权技术**泛化性更强**

$$
w_i(\mathbf{x}) = \text{NN}_{\theta}(\mathbf{x})
$$

---

## 📊 验证算例

### 1. 二维周期丘陵
- 经典分离流测试
- 回流区预测

### 2. 高度相关凸起流
- 变几何参数
- 参数化研究

---

## 📈 性能表现

| 指标 | 单一 RANS | 单一 ROM | 本方法 |
|------|-----------|----------|--------|
| 精度 | ⚠️ | ⚠️ | ✅ |
| 速度 | 中等 | 快 | **近实时** |
| 泛化 | 有限 | 有限 | **强** |

---

## 💡 创新点

1. **统一框架** - 首次结合模型聚合 + ROM
2. **两种管道** - 灵活选择
3. **神经权重** - 平滑空间变化
4. **近实时成本** - 兼顾精度与效率

---

## 🔬 技术细节

### RANS 模型组合

常用模型:
- $k-\varepsilon$
- $k-\omega$
- SST $k-\omega$
- Spalart-Allmaras

### 聚合策略

$$
\mathbf{u}_{agg}(\mathbf{x}) = \sum_{i=1}^{N} w_i(\mathbf{x}) \mathbf{u}_i(\mathbf{x})
$$

约束:
$$
\sum_{i=1}^{N} w_i(\mathbf{x}) = 1, \quad w_i(\mathbf{x}) \geq 0
$$

### ROM 构造

- POD 基
- Galerkin 投影
- 插值超简化

---

## 🔗 技术关联

- [[RANS]] - 雷诺平均 N-S
- [[ROM]] - 降阶模型
- [[POD]] - 本征正交分解
- [[Model-Aggregation]] - 模型聚合
- [[Turbulence-Closure]] - 湍流闭合

---

## 📚 相关工作

1. **RANS Model Uncertainty** (Duraisamy et al., 2019)
2. **POD-ROM** (Lumley, 1967)
3. **Model Aggregation** (Parish & Duraisamy, 2016)
4. **Neural Network Weighting** (Ling et al., 2016)

---

## 🚀 应用前景

1. **设计优化** - 快速迭代
2. **不确定性量化** - 模型误差估计
3. **实时监控** - 工业流动
4. **参数研究** - 多工况分析

---

## ⚠️ 局限性

1. 依赖高保真数据训练权重
2. 二维流动验证
3. 简化几何
4. 外推能力待测试

---

## 📖 引用

```bibtex
@article{ivagnes2026efficient,
  title={Efficient and Accurate Surrogate Modeling of Turbulent Flows via Space-Dependent Aggregation and Reduced Order Models},
  author={Ivagnes, Anna},
  journal={arXiv preprint arXiv:2603.15816},
  year={2026}
}
```

---

*Created: 2026-03-18 | Caixin Agent*
