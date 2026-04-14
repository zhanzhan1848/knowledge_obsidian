# Schrödinger-Navier-Stokes Equation for Capillary Fluids

**arXiv**: [2604.11747](https://arxiv.org/abs/2604.11747)
**作者**: L. Salasnich, S. Succi, A. Tiribocchi
**机构**: Università di Padova, IIT Roma, CNR Roma
**日期**: 2026-04-13
**领域**: 量子流体 | 微流控 | 毛细流体

---

## 核心创新

1. **形式等价性**: SNS 方程与 Navier-Stokes-Korteweg (NSK) 方程在作用量泛函层面等价
2. **参数物理意义**:
   - κ: 控制量子 (κ=0) 到经典 (κ=1) 的过渡
   - γ: 粘性耗散系数
3. **声波色散关系**: 推导了一般 κ, γ 下的声模色散关系
4. **一维化简**: 推导了毛细管中受限流体的有效一维 SNS 方程

---

## 控制方程

### SNS 方程 (Madelung 表示)
```
iℏ∂tψ = [−ℏ²/2m ∇² + μ(|ψ|²) + κ ℏ²/2m ∇²|ψ|/|ψ| 
         + iγ(|ψ|²) ℏ²/m ∇²ln(ψ/|ψ|)] ψ
```

### 经典 NSK 方程
```
∂tn + ∇⋅(nv) = 0

(∂t + v⋅∇)v = −∇P/mn + ν∇²v + ε/n ∇(n∇²n − |∇n|²/2)
```

其中:
- ν = γD = γℏ/m (运动粘度)
- ε = (1−κ)D²/4 (毛细系数)

---

## 关键发现

1. **毛细系数**: ε 在 κ=1 时消失 (纯 NS), 在 κ=0 时最大 ε=D²/4 (GP 方程)
2. **Korteweg 自由能泛函**:
   ```
   ℱK[n] = ∫ d³r [f(n) + ε/2n |∇n|²]
   ```
3. **气泡解**: 球形气泡的密度分布 ~ tanh²((r−R)/√2 ξκ)
4. **NSK vs SNS**: SNS 形式避免了 NSK 在 n→0 时的奇异性

---

## 数值方法

- **主要方法**: 理论推导 + 半解析解
- **求解器**: 解析求解 (1D bubble profile)
- **参数**: ξκ = ξ/√(1−κ) (愈合长度)

---

## 应用场景

- 微流控芯片
- 软物质
- 毛细流动
- 量子模拟经典流体

---

## URL

- Abstract: https://arxiv.org/abs/2604.11747
- PDF: https://arxiv.org/pdf/2604.11747
- HTML: https://arxiv.org/html/2604.11747v1

---

## 关联论文

- [[SNS Quantum Simulation (2604.11113)]] - 相关量子算法

---

*笔记整理: 鲜毛肚 (Caixin) | 2026-04-14*
