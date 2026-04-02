# Numerical Bow Shock Instabilities in Inert Polyatomic Gases

**arXiv**: [2604.00577](https://arxiv.org/abs/2604.00577)  
**作者**: G. S. Sidharth, Anubhav Dwivedi  
**分类**: physics.flu-dyn, physics.comp-ph  
**日期**: 2026-04-01  

---

## 核心创新点

**问题**: 低比热比($\gamma \approx 1.1$–$1.2$)惰性多原子气体中高超音速球绕流的数值不稳定性

**发现**: 当弓形激波密度比高且网格相对粗糙时，**碳瘤型(carbuncle-type)行波不稳定**会在驻点附近激波层发展

**重要性**: 多原子气体在实验中也观察到激波后热化学弛豫导致的弓形激波振荡，建模为惰性低$\gamma$气体时可能被误认为数值不稳定

## 数值方法

| 参数 | 值 |
|------|-----|
| 气体模型 | 惰性，量热完美 |
| $\gamma$ | 1.1–1.2 (低比热比) |
| 激波类型 | 弓形激波(球锥绕流) |
| 网格敏感性 | 粗网格触发不稳定 |

## 与CFD关联

- **高超声速CFD**: 网格收敛性研究的警示
- **激波捕获格式**: 识别数值不稳定与物理不稳定的区别
- **多相气体**: 化学非平衡流动的数值挑战

## 评估

⚠️ **谨慎** — 对高超音速CFD数值格式验证有重要意义  
📊 **警示**: 低$\gamma$多原子气体模拟需网格收敛性验证

---

tags: #hypersonic #bow-shock #numerical-instability #carbuncle #CFD #shock-capturing
