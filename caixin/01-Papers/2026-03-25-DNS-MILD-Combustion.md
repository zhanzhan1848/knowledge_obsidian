# MILD 燃烧直接数值模拟: 混合与自点火

> **arXiv**: [2603.22927](https://arxiv.org/abs/2603.22927)
> **日期**: 2026-03-25
> **作者**: Lorenzo Frascino et al.

---

## 摘要

Moderate or Intense Low-oxygen Dilution (MILD) 燃烧通过将反应物与热燃烧产物强烈稀释和预热来实现。本研究使用 DNS 研究三流混合层中的混合与自点火动力学。

---

## 🔬 物理配置

### 三流混合层
```
燃料流  ←→  空气流  ←→  热产物流
```

- 燃料-空气混合
- 空气-热产物混合
- 变化的时间尺度

### DNS 案例设计
- 4 个精心设计的 DNS 案例
- 评估不同稀释水平的影响

---

## 📊 主要发现

### MILD vs 非 MILD

| 条件 | 稀释水平 | 点火机制 |
|------|----------|----------|
| MILD | 高稀释 | 预混-自点火主导 |
| 非 MILD | 低稀释 | 预混-爆燃贡献显著 |

### 点火驱动机制
- **MILD 条件**: 点火主要由与热产物混合驱动
- **非 MILD 条件**: 燃料与周围气体混合主导

---

## 🔧 分析方法

### 火焰指数 (Flame Index, FI)
- 识别局部燃烧模式

### 化学爆炸模态分析 (CEMA)
- 识别化学爆炸模态
- 区分自点火与爆燃

### 标量耗散率条件分析
- MILD: 对燃料和热产物混合敏感
- 非 MILD: 主要受燃料混合影响

---

## 💡 创新点

1. **三流 DNS 数据集**: 首个包含燃料-空气-热产物的 DNS
2. **FI + CEMA 联合分析**: 精确识别燃烧模式
3. **混合时间尺度研究**: 揭示混合与点火的耦合机制

---

## 🔗 相关概念

- [[DNS]] - 直接数值模拟
- [[MILD 燃烧]] - 中等或强烈低氧稀释燃烧
- [[CEMA]] - 化学爆炸模态分析
- [[火焰指数]] - 局部燃烧模式识别

---

## 📖 参考文献

```bibtex
@article{frascino2026dns,
  title={Direct Numerical Simulation of MILD Combustion: Mixing and Autoignition from Non-Premixed Streams},
  author={Frascino, Lorenzo},
  journal={arXiv preprint arXiv:2603.22927},
  year={2026}
}
```
