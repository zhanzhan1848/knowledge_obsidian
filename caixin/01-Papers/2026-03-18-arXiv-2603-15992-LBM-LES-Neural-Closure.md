# Physics-Constrained Neural Closure for Lattice Boltzmann Large-Eddy Simulation

**arXiv**: [2603.15992](https://arxiv.org/abs/2603.15992)  
**发表日期**: 2026-03-16  
**作者**: Muhammad Idrees Khan, Sauro Succi, Hua-Dong Yao, Giacomo Falcucci  
**机构**: University of Rome Tor Vergata, Italian Institute of Technology, Harvard University, Chalmers University

---

## 📋 基本信息

| 项目 | 内容 |
|------|------|
| 领域 | 计算流体力学、机器学习 |
| 方法 | LBM-LES + Neural Network |
| 应用 | 湍流模拟 |
| 代码 | 未公开 |

---

## 🎯 研究目标

为 LBM-LES 开发**物理约束的数据驱动 SGS 应力闭合模型**，解决传统 Smagorinsky 模型在复杂流动中的局限性。

---

## 🔬 核心方法

### 1. 神经网络架构

**输入** (9个宏观导数):
- 6个应变率分量 $\mathbf{S}_{ij}$
- 3个涡量分量 $\omega_k$

**输出** (6个独立分量):
- SGS 应力张量 $\tau_{ij}^{SGS}$

**后处理**:
- 偏差投影 → 无迹应力张量

### 2. 物理约束损失函数

$$
\mathcal{L} = \mathcal{L}_{data} + \lambda_1 \mathcal{L}_{\Pi} + \lambda_2 \mathcal{L}_{equiv} + \lambda_3 \mathcal{L}_{div}
$$

其中:
- $\mathcal{L}_{data}$: 应力数据损失
- $\mathcal{L}_{\Pi}$: SGS 能量传递匹配
- $\mathcal{L}_{equiv}$: 旋转等变性（立方旋转）
- $\mathcal{L}_{div}$: 散度耦合兼容性

### 3. 分裂耦合策略

```
SGS 应力 → 有效粘度投影 (耗散部分)
         → 残余强迫项 (各向异性部分)
```

**优势**:
- 保留 backscatter（通过有效粘度）
- 保留非耗散各向异性效应（通过残余强迫）
- 兼容 LBM 部署

---

## 📊 训练数据

**来源**: LBM DNS 强迫均匀各向同性湍流 (FHIT)  
**处理**: Filtered-Downsampled (FD) 数据  
**过滤宽度**: 多个尺度

---

## 📈 验证结果

### A Priori 测试
- ✅ 应力分量与 FD 参考吻合良好
- ✅ SGS 传递统计准确

### A Posteriori 测试
- ✅ 能量和统计指标优于静态/动态 Smagorinsky
- ✅ 湍流通道流初步传递测试（无需重训练）

### 部署性能
- ONNX Runtime 部署
- 吞吐量与动态 Smagorinsky 相当

---

## 💡 创新点

1. **物理约束集成** - 不仅是数据拟合，融入能量传递、等变性、散度兼容性
2. **分裂策略** - 区分耗散与非耗散贡献，保留 backscatter
3. **LBM 兼容** - 专为 LBM 框架设计
4. **高效部署** - ONNX Runtime 实现

---

## 🔗 技术关联

- [[LBM]] - 格子玻尔兹曼方法
- [[LES]] - 大涡模拟
- [[SGS-Closure]] - 亚格子应力闭合
- [[Physics-Informed-ML]] - 物理信息机器学习
- [[Turbulence-Modeling]] - 湍流建模

---

## 📚 相关工作

1. Smagorinsky Model (1963) - 经典 SGS 模型
2. Dynamic Smagorinsky (Germano et al., 1991)
3. Neural Network SGS (Ling et al., 2016)
4. Physics-Informed Neural Networks (Raissi et al., 2019)

---

## 🚀 应用前景

- 高雷诺数工程流动
- 复杂几何湍流
- 实时 CFD 仿真
- GPU 加速 LBM 求解器

---

## ⚠️ 局限性

1. 仅在 FHIT 和通道流验证
2. 训练数据依赖 DNS
3. 泛化能力待进一步测试
4. 计算开销相比静态模型略高

---

## 📖 引用

```bibtex
@article{khan2026physics,
  title={Physics-Constrained Neural Closure for Lattice Boltzmann Large-Eddy Simulation},
  author={Khan, Muhammad Idrees and Succi, Sauro and Yao, Hua-Dong and Falcucci, Giacomo},
  journal={arXiv preprint arXiv:2603.15992},
  year={2026}
}
```

---

*Created: 2026-03-18 | Caixin Agent*
