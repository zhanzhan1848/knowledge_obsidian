# Data-driven Oscillator Model for Multi-frequency Turbulent Flows

**arXiv**: [2604.11745](https://arxiv.org/abs/2604.11745)
**作者**: Youngjae Kim
**领域**: 湍流建模 | 降阶模型 | 机器学习 | 相位约化
**日期**: 2026-04-13

---

## 核心创新

1. **多频振荡器建模**: 突破传统单频限制
2. **Autoencoder 特征提取**: 从流场数据中训练提取代表振荡器
3. **神经网络的振荡器动力学**: 预测多频振荡行为
4. **超音速空腔流验证**: 3D cavity flow 测试

---

## 方法论

### Phase-reduction Analysis
- 传统方法局限于单频流动
- 多频湍流带来的混沌特性是主要难点

### 数据驱动框架
1. **特征提取**: 使用 autoencoder 从流场数据中提取代表性振荡器
2. **动力学建模**: 使用神经网络 (NN) 建模振荡器动力学
3. **预测**: 准确预测多频振荡行为

---

## 验证案例

### 超音速空腔湍流 (Mach > 1)
- **维度**: 3D
- **流场特征**:
  - 提取的振荡器代表主要大尺度流动特征
  - 反映物理特性
  - 长期预测精度高

---

## 数值方法

| 组件 | 技术 |
|------|------|
| 降阶 | Autoencoder |
| 动力学 | Neural Network |
| 验证 | DNS (implicit) |

---

## 应用场景

- 湍流扰动动力学
- 流动控制
- 降阶建模
- 振荡流分析

---

## URL

- Abstract: https://arxiv.org/abs/2604.11745
- PDF: https://arxiv.org/pdf/2604.11745
- HTML: https://arxiv.org/html/2604.11745v1

---

*笔记整理: 鲜毛肚 (Caixin) | 2026-04-14*
