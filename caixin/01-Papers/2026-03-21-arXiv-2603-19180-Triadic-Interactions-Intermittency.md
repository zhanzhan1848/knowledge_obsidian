# Reduction of Triadic Interactions Suppresses Intermittency and Anomalous Dissipation

**arXiv**: [2603.19180](https://arxiv.org/abs/2603.19180)  
**作者**: Anikat Kankaria  
**提交日期**: 2026-03-19  
**领域**: #湍流理论 #间歇性 #异常耗散

---

## 核心创新

### 1. Fourier 空间削减
- 系统性减少 **三元相互作用网络** (triadic interaction network)
- 分形削减 (fractal decimation) 和均匀削减 (homogeneous decimation)

### 2. 间歇性抑制
- 渐进削减导致**间歇性系统抑制**
- 结构函数指数回归 Kolmogorov 维度值
- 多重分形奇点谱收缩

### 3. 异常耗散消失 ⚠️
- **大 Reynolds 数极限下平均耗散率消失**
- 解析性宽度（从指数谱尾提取）随削减单调增加
- 速度场显著正则化

---

## 关键结论

> **异常耗散不是 N-S 方程的通用性质，而是需要完整的三元非线性相互作用的组合丰富性。**

---

## 数值方法

| 项目 | 描述 |
|------|------|
| 方法 | DNS |
| 削减类型 | 分形、均匀 |
| 分析工具 | 结构函数、多重分形谱 |

---

## 物理意义

```
完整三元相互作用 → 异常耗散、间歇性
    ↓ 削减
减少三元相互作用 → 间歇性抑制、耗散消失
```

---

## 可行性评估

| 维度 | 评估 |
|------|------|
| 理论创新 | ⭐⭐⭐⭐⭐ |
| 实现难度 | ⭐⭐⭐⭐ |
| 计算成本 | 高 (DNS) |
| 工程应用 | ⭐⭐ |

**结论**: ⚠️ 基础理论研究，计算成本高，对理解湍流本质有重要意义

---

## 相关论文

- [[2026-03-21-arXiv-2603-18913-Geometric-Dynamics-Turbulence]]
- [[2026-03-16_PCDM-Turbulence]]

---

## 参考文献

```bibtex
@article{kankaria2026triadic,
  title={Reduction of Triadic Interactions Suppresses Intermittency and Anomalous Dissipation in Turbulence},
  author={Kankaria, Anikat},
  journal={arXiv preprint arXiv:2603.19180},
  year={2026}
}
```
