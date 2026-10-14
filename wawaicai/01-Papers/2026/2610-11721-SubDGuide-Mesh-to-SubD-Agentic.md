---
title: "A Modeler-Inspired Agentic Workflow for Mesh-to-SubD Reconstruction"
arxiv_id: "2610.11721"
date: 2026-10-08
venue: arXiv preprint
tags: [几何, 细分曲面, SubD, 网格重建, Agentic, Mesh-to-SubD, 重网格化]
authors:
  - Mengnan Jiang
url: "https://arxiv.org/abs/2610.11721"
---

# A Modeler-Inspired Agentic Workflow for Mesh-to-SubD Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Modeler-Inspired Agentic Workflow for Mesh-to-SubD Reconstruction |
| **作者** | Mengnan Jiang (et al.) |
| **发表** | arXiv preprint |
| **链接** | [arXiv:2610.11721](https://arxiv.org/abs/2610.11721) |
| **DOI** | 10.48550/arXiv.2610.11721 |
| **代码** | TBD |

---

## 核心贡献

> 提出 SubDGuide：将稠密网格重建为稀疏 SubD 控制 cage 的多智能体工作流。规划器从不直接生成顶点或拓扑，几何工具执行并验证每次修改。

1. **两阶段代理架构**: Stage A 出计划 + Stage B 决策（修复/回滚/停止）
2. **多模态规划器兼容**: 6 个 LLM/VLM 规划器，相同接口
3. **强于自动重网格化**: 5 项指标全面领先（一击 + 反馈模式）

---

## 技术方案

### 核心思想

模仿建模师工作流的智能体设计：
1. **Stage A — 计划**: 读取多视图几何证据 → 输出 cage 分辨率、特征映射、粗拟合格局
2. **Stage B — 决策**: 检测结果 → 请求诊断 → 选择 repair / rollback / stop
3. **几何工具**: 执行所有修改并验证（规划器不直接产生顶点）

### 关键技术

| 技术 | 说明 |
|------|------|
| 多视图几何证据 | 对齐的多角度几何输入 |
| 状态化反馈 | stateful，每步使用前一状态 |
| 验证-保留策略 | revert 到先前 checkpoint（如提议无益） |
| 多模态规划器 | LLM/VLM 集成接口 |

---

## 算法复杂度

- **Stage A**: 一次规划 + 几何证据分析
- **Stage B**: 多轮评估，单轮 cost 取决于几何工具
- **典型运行时间**: 受迭代次数限制

---

## 实验结论

- **Cohort**: 固定评估队列
- **基线**: 自动重网格化
- **关键结果**:
  - Chamfer-L1: 0.641% → **0.443%**（中位占 bounding-box 对角线比）
  - F-score@1%: 82.00% → **92.78%**
  - 5/5 指标全部改善
  - 状态化反馈 vs 一次性规划：4/5 指标更优

---

## 局限性

- 依赖 LLM/VLM 规划器（成本）
- Stage A 出错需 Stage B 多轮恢复
- 几何工具需维护自身数值稳定性

---

## 相关工作

- [[Subdivision-Surfaces]]
- [[Mesh-Remeshing]]
- [[Surface-Reconstruction]]
- [[Loop-Subdivision]]
- [[Catmull-Clark]]
- [[Agentic-Geometry-Processing]]

---

## 实现建议

- **实现难度**: 高（多智能体 + 几何工具链）
- **预期性能**: 取决于规划器，可达实时演示级
- **适用场景**:
  - CAD 反向建模（mesh → SubD）
  - 工业设计资产生成
  - 自动 3D 网格简化与语义压缩
- **开源参考**:
  - libigl: 网格简化 (`qslim`)
  - CGAL: SubD（包 `CGAL::Subdivision_method_3`）
  - OpenSubdiv: 工业级 SubD 库
  - LangChain / LlamaIndex: 智能体编排

---

## 论文元数据

- **arXiv 提交**: 2026-10-08 11:21 UTC
- **预期引用**: SubD 重建、几何代理、智能体网格建模
