# 晶圆键合流固耦合有限元实现

> **arXiv**: [2603.22827](https://arxiv.org/abs/2603.22827)
> **日期**: 2026-03-25
> **作者**: Bhavesh Shrimali et al.

---

## 摘要

开发晶圆-晶圆 (WxW) 键合的数学一致降阶模型，将 Kirchhoff-Love 板方程与 Reynolds 润滑方程耦合，在 FEniCSx 框架中单体求解。

---

## 🔬 物理问题

### WxW 键合
- 三维集成关键使能技术
- Cu-Cu 细间距互连
- 混合键合

### 耦合物理
- 晶圆变形 (结构)
- 滞留空气 (流体)
- 强耦合时变 FSI

---

## 📐 数学模型

### Kirchhoff-Love 板方程
```
D∇⁴w = p(x,y,t)
```
- 从三维线弹性推导
- 四阶算子

### Reynolds 润滑方程
```
∂h/∂t = ∇·(h³/12μ ∇p)
```
- 晶圆间空气膜

### 耦合系统
```
板-Reynolds 非线性系统
```

---

## 🔧 数值方法

### FEniCSx 框架
- 高性能有限元
- 自动微分

### 离散化
| 方程 | 方法 |
|------|------|
| 板方程 | C⁰ 内罚法 |
| 压力场 | 连续 Galerkin |
| 时间积分 | 隐式 |
| 非线性 | Newton 求解器 |

---

## 📊 验证与结果

### 验证
- 探针位移历史与实验吻合
- 键合前沿力平衡验证

### 参数研究
- 初始间隙敏感性
- 空气粘度敏感性
- 界面能敏感性
- **非线性/非单调响应**

---

## 💡 创新点

1. **降阶模型**: 数学一致的板-Reynolds 系统
2. **单体求解**: FEniCSx 高性能实现
3. **C⁰ 内罚法**: 四阶算子处理
4. **工艺优化**: 可操作的趋势指导

---

## 🔗 相关概念

- [[FSI]] - 流固耦合
- [[FEniCSx]] - 有限元框架
- [[Reynolds 润滑]] - 薄膜润滑理论
- [[Kirchhoff-Love 板]] - 薄板理论

---

## 📖 参考文献

```bibtex
@article{shrimali2026wafer,
  title={Wafer-to-Wafer Bonding: Part I -- The Coupled Physics Problem and the 2D Finite Element Implementation},
  author={Shrimali, Bhavesh},
  journal={arXiv preprint arXiv:2603.22827},
  year={2026}
}
```
