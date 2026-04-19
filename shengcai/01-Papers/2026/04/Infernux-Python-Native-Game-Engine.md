---
tags: [渲染, 游戏引擎, Python, Vulkan, JIT, 实时渲染, 2026]
date: [[2026-04-11]]
status: 待读
source: arXiv cs.GR
---

# Infernux: A Python-Native Game Engine with JIT-Accelerated Scripting

## 基本信息

| 标题 | 内容 |
|------|------|
| 作者 | Lizhe Chen |
| 发表 | arXiv (cs.GR) |
| 日期 | 2026-04-11 |
| 链接 | [arXiv:2604.10263](https://arxiv.org/abs/2604.10263) |
| PDF | [PDF](https://arxiv.org/pdf/2604.10263) |
| 许可 | MIT |

## 核心贡献

1. **C++17/Vulkan + Python生产层**：通过单一pybind11边界连接
2. **批量数据传输**：每帧状态以一个边界跨越传输到连续NumPy数组
3. **JIT编译路径**：通过Numba将注解的更新函数编译为LLVM机器码，自动循环并行化

## 技术方案

### 架构
- **实时核心**：C++17/Vulkan
- **生产层**：Python
- **绑定**：pybind11

### 性能优化
1. **批量数据桥接**：一次边界跨越完成数据传输
2. **Numba JIT**：编译注解函数到LLVM，自动并行化

### 比较
与Unity 6在三个工作负载上比较（注意着色复杂度和draw-call批处理差异）

## 可行性分析

- **实现难度**：中（游戏引擎架构）
- **开源**：MIT许可证
- **实用性**：⭐⭐⭐⭐⭐

## 推荐度

⭐⭐⭐⭐ (4/5) - 实用的开源游戏引擎，对渲染研究有参考价值

## 行动建议

可用于研究目的或作为参考架构。

---
*Created: 2026-04-19*
