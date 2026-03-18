# A Dataset of 3,000 Lattice-Boltzmann Simulations of Random Building Layouts

**arXiv**: [2603.16554](https://arxiv.org/abs/2603.16554)  
**发表日期**: 2026-03-17  
**作者**: Sangseung Lee  
**页数**: 14 pages, 23 figures

---

## 📋 基本信息

| 项目 | 内容 |
|------|------|
| 领域 | 计算流体力学、机器学习 |
| 方法 | Lattice-Boltzmann Method |
| 数据规模 | 3000 个 2D 模拟 |
| 应用 | 城市流场预测、ML 训练 |

---

## 🎯 研究动机

城市流场分析对以下领域至关重要:
- 行人安全 (风环境)
- 污染物扩散
- 自然通风
- 建筑能效

**问题**: CFD 计算成本高昂，ML 替代模型有前景，但**缺乏开源训练数据集**。

**贡献**: 提供大规模 2D 城市流场数据集，支持 ML 模型开发和传递学习。

---

## 📊 数据集特征

### 几何多样性

| 参数 | 范围 |
|------|------|
| 建筑数量 | 3-6 栋 |
| 建筑尺寸 | 随机 |
| 建筑位置 | 随机 |
| 旋转角度 | 0° - 90° |

### 流动参数

- **雷诺数**: 3 个不同值
- **输出**: 时间平均速度场

### 流动特征捕获

- ✅ 尾流形成 (Wake formation)
- ✅ 流动加速 (Flow acceleration)
- ✅ 遮蔽效应 (Shielding effects)
- ✅ 回流区 (Recirculation zones)

---

## 🔬 数值方法

**求解器**: Lattice-Boltzmann Method (LBM)

**优势**:
- 复杂几何处理能力强
- 并行效率高
- 适合 GPU 加速

---

## 💡 应用场景

### 1. ML 模型训练
- CNN / U-Net 流场预测
- GAN 数据增强
- Transformer 架构

### 2. 传递学习策略
```
2D 大数据集预训练 → 3D 小数据集微调
```

### 3. 基准测试
- 不同 ML 架构对比
- 泛化能力评估

---

## 🔗 技术关联

- [[LBM]] - 格子玻尔兹曼方法
- [[Urban-CFD]] - 城市计算流体力学
- [[ML-CFD]] - 机器学习辅助 CFD
- [[Transfer-Learning]] - 传递学习
- [[Dataset-Benchmark]] - 数据集基准

---

## 📚 相关数据集

1. **ShapeNet** - 3D 形状数据集
2. **CityScapes** - 城市街景数据集
3. **Turbulence Databases** - JHTDB 等

---

## 🚀 研究价值

1. **填补空白** - 首个大规模城市流场 2D 数据集
2. **几何多样** - 随机布局捕获复杂流动特征
3. **ML 友好** - 专为数据驱动模型设计
4. **传递学习** - 支持从 2D 到 3D 的知识迁移

---

## ⚠️ 局限性

1. 仅 2D 模拟（3D 更真实但昂贵）
2. 稳态时间平均场（无瞬态数据）
3. 单一物理场（速度，无温度/浓度）
4. 简化建筑形状

---

## 📖 引用

```bibtex
@article{lee2026dataset,
  title={A Dataset of 3,000 Lattice-Boltzmann Simulations of Random Building Layouts},
  author={Lee, Sangseung},
  journal={arXiv preprint arXiv:2603.16554},
  year={2026}
}
```

---

*Created: 2026-03-18 | Caixin Agent*
