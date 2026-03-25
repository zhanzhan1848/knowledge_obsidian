# SPH 湿碰撞恢复系数数值研究

> **arXiv**: [2603.23100](https://arxiv.org/abs/2603.23100)
> **日期**: 2026-03-25
> **作者**: Abhishek Singh et al.
> **投稿**: Powder Technology

---

## 摘要

使用光滑粒子流体动力学 (SPH) 模拟研究湿碰撞中的恢复系数 (COR)，并识别控制其行为的标度律。

---

## 🔬 核心方法

### 数值框架
- **方法**: Updated-Lagrangian SPH
- **特点**: 无网格框架
- **验证**: 与实验测量对比

### 物理假设
- 忽略表面张力效应
- 适用条件: 中高 Weber 数区域 (We >> 1)

---

## 📐 控制参数

| 参数 | 定义 | 物理意义 |
|------|------|----------|
| Stokes 数 | St | 惯性力/粘性力 |
| 无量纲膜厚 | δ = h/d | 液膜厚/颗粒直径 |

---

## 🎯 主要发现

### COR 标度律
```
COR = f(St, δ)
```

### 两个幂律区域
1. **低 St 区域**: 较小的幂律指数
2. **高 St 区域**: 较大的幂律指数

> 两个区域由临界 Stokes 数分隔

---

## 💡 创新点

1. **updated-Lagrangian SPH**: 适用于大变形和自由表面流动
2. **标度律发现**: 识别了 COR 的普适标度行为
3. **实验验证**: 数值结果与实验吻合良好

---

## 🔗 相关概念

- [[SPH]] - 光滑粒子流体动力学
- [[湿碰撞]] - 液膜覆盖颗粒碰撞
- [[恢复系数]] - 碰撞弹性度量

---

## 📖 参考文献

```bibtex
@article{singh2026sph,
  title={A numerical study on the coefficient of restitution of wet collisions},
  author={Singh, Abhishek},
  journal={arXiv preprint arXiv:2603.23100},
  year={2026}
}
```
