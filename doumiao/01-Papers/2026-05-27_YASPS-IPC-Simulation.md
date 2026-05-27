# YASPS: IPC 仿真符号框架
**日期**: 2026-05-21
**类型**: 物理仿真基础设施
**会议**: SIGGRAPH 2026
**链接**: https://arxiv.org/abs/2605.23088

---

## 核心贡献

YASPS 是 GPU 导向的框架，通过**可微分的符号中间表示**解决 IPC (Incremental Potential Contact) 仿真扩展性问题。

### 关键创新: JOIN 和 UNION 操作符

- **JOIN**: 组合用户声明关系中的依赖量 (如 element-to-vertex 连接)
- **UNION**: 在关系内表示替代参数化 (如混合自由顶点与仿射体)

### 符号差异化

- JOIN/UNION 作为符号程序的一部分进行差异化
- 专用规则 + 高效二阶程序
- 重用中间 Jacobian，减少 Hessian 投影成本

---

## 技术实现

### 稀疏性利用
- 从相同关系描述推导全局梯度/Hessian 稀疏性和块布局
- 结构感知块稀疏存储和压缩

### 性能
- JIT 编译 CUDA 内核用于评估、导数、组装和求解
- Hessian 压缩实现近 **10x 更快的 CG 迭代**

### 验证示例
- cloth-on-bunny (分层)
- mixed rigid/deformable bunnies
- caged deformation model

---

## 渲染相关信息

**相关性**: 中等
- YASPS 主要关注物理仿真，未直接处理流体渲染
- 但其符号框架可扩展到包括流体在内的其他物理系统
- IPC 方法已用于流体-固体耦合仿真

**可应用场景**:
- 物理仿真管线开发
- 复杂耦合系统 (流体-刚体-软体)
- 高性能仿真需求

---

## 快速参考

```
方法: 符号 IPC 框架 + JOIN/UNION 操作符
优势: 可扩展 Hessian 压缩 (~10x CG 加速)
适用: 物理仿真开发、流体耦合系统
```