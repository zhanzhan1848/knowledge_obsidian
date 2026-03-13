# Exact Scaling Laws in Isotropic Binary Fluid Turbulence

**arXiv**: [2603.12143](https://arxiv.org/abs/2603.12143)  
**作者**: Nandita Pan  
**提交日期**: 2026-03-12  
**分类**: physics.flu-dyn

## 摘要
二元流体湍流与普通流体湍流的区别在于界面动力学。从 von Kármán-Howarth 张量形式出发，推导了各向同性 Cahn-Hilliard-Navier-Stokes (CHNS) 湍流的精确标度律。

## 核心创新
- 推导 CHNS 湍流的 $1/3$, $4/3$, $2/15$, $4/5$ 标度律
- 新标度律包含体相流动和界面的贡献
- $2/15$ 和 $4/5$ 律涉及非纵向方向的额外贡献
- DNS 验证（高达 $1024^3$ 网格点）

## 控制方程
**Cahn-Hilliard-Navier-Stokes 方程**:
$$\rho(\partial_t \mathbf{u} + \mathbf{u} \cdot \nabla \mathbf{u}) = -\nabla p + \mu \nabla^2 \mathbf{u} + \mathbf{f}_{\text{interface}}$$

## 数值方法
- **离散化**: 伪谱方法
- **网格**: $1024^3$ (DNS)
- **验证**: 标度律的数值验证

## 关键结论
从齐次散度形式到各向同性 $4/5$ 形式，惯性区向大尺度偏移，级联率剖面更平坦。

## 相关概念
- [[Kolmogorov 标度律]]
- [[Cahn-Hilliard 方程]]
- [[二元流体]]
- [[界面动力学]]

## 应用场景
- 相分离流动
- 乳化过程
- 合金凝固

---
*检索日期: 2026-03-13*
