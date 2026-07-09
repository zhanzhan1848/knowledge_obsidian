# 🥬 LLM 论文分析：STRACE — Structural Trajectory Analysis and Causal Extraction

## 基本信息
- **作者**: Ying Chang et al.
- **发表**: arXiv cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07702](https://arxiv.org/abs/2607.07702)
- **代码**: https://github.com/moomight/STRACE
- **关键词**: LLM Agent, Trajectory Optimization, Causal Analysis

---

## 核心贡献

1. **问题**: LLM Agent 执行轨迹存在冗余和异质性，直接用于优化效率低且易过拟合；同时单条轨迹含大量无关步骤，朴素截断/滑动窗口会丢失因果关键步骤

2. **STRACE 框架**:
   - **Batch 级别**：挖掘失败模式，过滤冗余轨迹，保留代表性失败案例
   - **Trace 级别**：在文本依赖图上做因果定位，移除非因果步骤，识别真正根因模块

3. **实验结果**: VeruSAGE-Bench 形式验证任务，成功率从 42.5% 提升至 58.5% (1.4×)

---

## 方法细节

### 轨迹结构分析
- 构建文本依赖图 (textual dependency graph)
- 识别因果链与非因果噪声步骤

### 根因提取
- 对每条轨迹定位导致失败的关键模块
- 只对根因模块进行优化，避免无关干扰

### 与基线对比
| 方法 | 成功率 |
|------|--------|
| 标准上下文过滤 | 基线 |
| STRACE | **58.5%** (+1.4×) |

---

## 局限性

- 目前聚焦形式验证任务 (VeruSAGE-Bench)
- 依赖结构化依赖图构建，非结构化场景需适配

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 长时 horizon Agent 优化、代码生成、复杂推理任务
