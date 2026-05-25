# YASPS: Extensible High-Performance IPC Simulation Framework

> **论文ID**: arXiv:2605.23088  
> **标题**: A Symbolic Framework for Extensible, High-Performance IPC Simulation  
> **会议**: SIGGRAPH 2026  
> **日期**: 2026-05-22  
> **链接**: https://arxiv.org/abs/2605.23088  

---

## 核心贡献

### 问题
Incremental Potential Contact (IPC) 通过将弹性和接触统一为能量最小化问题，实现稳健的接触丰富仿真。但现有IPC管道存在**可扩展性瓶颈**：
- 专用内核和装配逻辑绑定到固定能量、基元类型和参数化
- 扩展成本高，组合爆炸

### 解决方案
**YASPS** (Yet Another Symbolic framework for IPC) — GPU导向框架，通过**可区分中间表示**使结构显式化。

### 核心创新

#### 1. 关系操作符 (Relational Operators)
- **JOIN**: 组合用户声明关系间的依赖量（如 element-to-vertex 连接）
- **UNION**: 表示关系内的替代参数化（如混合自由顶点与仿射体参数化）

#### 2. 符号微分
- 通过 JOIN/UNION 的专用规则微分
- 高效二阶程序：重用中间Jacobian，降低Hessian投影成本

#### 3. 结构化稀疏优化
- 从关系描述推导全局梯度/Hessian稀疏性和块布局
- 结构感知块稀疏存储和压缩
- JIT编译CUDA内核

### 技术成果
- 支持快速前端扩展，最小化后端更改
- **近10x CG迭代加速**（Hessian压缩）
- 端到端性能具竞争力

---

## 应用示例

```python
# IPC风格示例
- cloth-on-bunny (层叠布料)
- mixed rigid/deformable bunnies (混合刚体/可变形)
- caged deformation model (笼式变形模型)
```

---

## 对流体渲染的意义

| 技术点 | 流体渲染应用 |
|--------|-------------|
| JOIN/UNION 抽象 | 流体-固体边界条件表示 |
| 块稀疏Hessian | 压力求解器加速 (Chorin-Colella投影法) |
| 接触力学 | 流体自由表面与容器壁接触 |
| GPU JIT编译 | 实时流体模拟 |

---

## 关键公式/概念

### IPC 能量函数
$$E_{IPC}(x) = E_{elastic}(x) + E_{contact}(x)$$

### JOIN 操作符
- 组合依赖量: $y = f(join(x_1, x_2, ...))$

### UNION 操作符
- 替代参数化: $x \in union(v_1, v_2, ...)$

### 块稀疏 CG
- 结构化Hessian: $\mathcal{H}_{block} = P^T H P$
- 压缩比: ~10x

---

## 架构图

```
用户关系描述
    ↓
符号程序 (JOIN + UNION)
    ↓
自动微分 → 梯度/Hessian稀疏性推导
    ↓
结构感知存储 + JIT CUDA内核
    ↓
GPU求解器 (CG with block-sparse)
```

---

## 相关工作对比

| 方法 | 可扩展性 | 性能 | 适用场景 |
|------|---------|------|---------|
| 传统IPC | ❌ 低 | ✅ 高 | 固定问题 |
| AutoDiff IPC | ✅ 中 | ⚠️ 中 | 小规模 |
| **YASPS** | ✅✅ 高 | ✅✅ 高 | 通用IPC |

---

## 代码/资源

- GitHub: (待补充)
- arXiv PDF: https://arxiv.org/pdf/2605.23088

---

## 标签

#IPC #接触力学 #可扩展仿真 #GPU计算 #SIGGRAPH2026 #物理仿真

---
*收录于 2026-05-25 by Doumiao | 鸭血 - 计算机图形学流体渲染专家*