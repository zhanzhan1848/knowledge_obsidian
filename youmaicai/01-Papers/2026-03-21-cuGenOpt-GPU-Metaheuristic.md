# cuGenOpt: A GPU-Accelerated General-Purpose Metaheuristic Framework for Combinatorial Optimization

## 元信息
| 标题 | A GPU-Accelerated General-Purpose Metaheuristic Framework for Combinatorial Optimization |
|------|------|
| 作者 | Yuyang Liu |
| 链接 | [原文](https://arxiv.org/abs/2603.19163) |
| arXiv | arXiv:2603.19163 |
| 日期 | 2026-03-19 |
| 代码 | [GitHub](https://github.com/L-yang-yang/cugenopt) |

## 核心贡献
1. 提出 cuGenOpt：GPU 加速的通用元启发式框架
2. 同时解决通用性、性能和易用性三方面
3. 集成 LLM 建模助手，将自然语言转换为求解代码

## 框架设计
**三个层次**：

1. **引擎层**：
   - "one block evolves one solution" CUDA 架构
   - 统一编码抽象（排列、二进制、整数）
   - 两级自适应算子选择
   - 硬件感知资源管理

2. **扩展层**：
   - 用户定义算子注册接口
   - 允许领域专家注入特定问题的 CUDA 搜索算子

3. **易用层**：
   - JIT 编译流水线
   - 纯 Python API
   - **LLM 建模助手**：自然语言 → 可执行求解代码

## 实验结果
- **测试环境**：T4, V100, A800 GPU
- **测试套件**：5 个主题套件
- **性能**：
  - 比通用 MIP 求解器快几个数量级
  - 在 n≤150 实例上与专用求解器竞争
  - TSP-442：30s 内达到 4.73% gap
  - 12 种问题类型（5 种编码变体）求解到最优
- **框架优化**：
  - pcb442 gap 从 36% 降至 4.73%
  - VRPTW 吞吐量提升 75-81%

## 局限性
- 未提及

## LLM 集成
- LLM 建模助手
- 自然语言问题描述 → 可执行求解代码

## 相关链接
- [[combinatorial-optimization]]
- [[GPU-acceleration]]
- [[metaheuristic]]
- [[LLM-code-generation]]
- [[CUDA-programming]]
