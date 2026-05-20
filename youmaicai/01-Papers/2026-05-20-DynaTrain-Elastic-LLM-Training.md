# DynaTrain: Fast Online Parallelism Switching for Elastic LLM Training

## 元信息
| 标题 | DynaTrain: Fast Online Parallelism Switching for Elastic LLM Training |
|------|-----|
| 作者 | Yuanqing Wang, Yuchen Zhang, Hao Lin, et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.18815) |
| arXiv | arXiv:2605.18815 |
| 发表 | 2026-05-12 |
| 代码 | - |

## 核心贡献

1. **问题**: 现代 LLM 训练本质上是动态的：资源波动、RLHF 阶段转换和集群弹性不断重塑最优并行布局，现有框架基于静态执行模型构建

2. **DynaTrain**: 分布式训练系统，支持亚秒级在线多维并行重配置

3. **核心设计**: 
   - **Virtual Parameter Space (VPS)**: 统一所有分布式训练状态于一个逻辑坐标空间
   - **State Routing-and-Transition Layer**: 在内存感知、无死锁调度下执行 rank-local 传输
   - **Elastic Device Manager**: 重叠新世界构建与正在进行训练，掩盖拓扑变化成本

## 实验结果

### 在 Dense 和 MoE 模型上 (最高 235B 参数)

- **70B Dense 模型**: 在 2 秒内完成重配置
- **235B MoE 模型**: 在 4.36 秒内完成重配置
- **超越 SOTA**: 比基于 checkpoint 的和弹性系统高出 **三个数量级**

## 关键设计

### VPS 抽象
将任何并行配置转换为确定性映射，将复杂转换折叠为可管理的几何交集

### 状态路由和转换
在内存感知、无死锁调度下执行 rank-local 传输

## 建议

- **是否推荐使用**: 是
- **适用场景**: 大规模 LLM 训练基础设施，特别是需要动态资源调整的生产环境

---

标签: #Distributed-Training #Parallelism #LLM-Training #Elastic-Training