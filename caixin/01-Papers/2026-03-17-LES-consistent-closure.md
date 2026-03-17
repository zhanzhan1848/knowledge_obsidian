# LES 一致性封闭模型

**arXiv ID**: 2603.15069
**作者**: Berend van Wachem
**提交日期**: 2026-03-16
**链接**: https://arxiv.org/abs/2603.15069
**PDF**: https://arxiv.org/pdf/2603.15069

---

## 📌 核心创新

### 问题识别
传统 LES 框架存在**概念不一致性**：
- 常用平流项 $\overline{u_i} \cdot \nabla \overline{u_j}$ 在滤波 N-S 方程中引入**高频波数**
- 这与滤波方程的定义不一致
- 导致需要通量限制器、稳定项或去混叠技术
- LES 解通常**网格依赖**

### 解决方案
**直接近似滤波平流项** $\overline{u_i \cdot \nabla u_j}$

---

## 🔬 方法

### 滤波平流项的精确表达式

基于**无穷级数展开**（以滤波宽度 $\Delta$ 为小参数）：

$$
\overline{u_i \cdot \nabla u_j} = \overline{u_i} \cdot \nabla \overline{u_j} + \sum_{n=1}^{\infty} c_n \Delta^{2n} \nabla^{2n}(\overline{u_i} \cdot \nabla \overline{u_j})
$$

**截断策略**: 仅保留前几项即可获得高度相关性

### 优势
1. **一致性**: 不引入超出滤波范围的高频波数
2. **稳定性**: 减少对人工耗散的需求
3. **收敛性**: 减少网格依赖性

---

## 📊 验证结果

### 测试案例

| 案例 | 描述 |
|------|------|
| 衰减湍流 | 各向同性均匀湍流 |
| 剪切流 | 湍流剪切层 |

### 性能指标
- **动能谱**: 改进的频谱特性
- **滤波速度相关性**: 更准确的统计量

---

## 💡 理论意义

### 对传统 LES 的反思
```
传统 LES:
  滤波 → N-S 方程 → 平流项引入高频 → 需要亚格子模型 → 网格依赖

一致 LES:
  滤波 → 滤波 N-S 方程 → 直接近似滤波平流项 → 无需额外亚格子模型
```

### 与亚格子模型的关系
- 传统 Smagorinsky/Dynamic 模型处理的是**未解析-未解析**相互作用
- 本方法直接处理**未解析-解析**相互作用
- 两者可能互补

---

## 🔧 实现要点

1. **滤波核选择**: 高斯滤波 / 盒式滤波
2. **级数截断阶数**: 1-3 阶通常足够
3. **数值离散**: 需要高阶格式以保持精度

---

## 📚 参考文献

```bibtex
@article{wachem2026consistent,
  title={Consistent closure modeling in large eddy simulations by direct approximation of the filtered advection term},
  author={van Wachem, Berend},
  journal={arXiv preprint arXiv:2603.15069},
  year={2026}
}
```

---

## 🔗 相关笔记

- [[LES理论]]
- [[亚格子模型]]
- [[滤波方法]]
- [[湍流建模]]

---

#LES #湍流 #数值方法 #封闭模型 #滤波
