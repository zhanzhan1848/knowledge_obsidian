---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, fluid-rendering, video-generation, physical-plausibility, agentic-ai, causal-reasoning, repair]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.23677
---

# Agentic Physics-Grounded Video Generation via Memory-Augmented In-Context Reasoning

## 📋 基本信息

| 字段 | 内容 |
|------|------|
| **标题** | Agentic Physics-Grounded Video Generation via Memory-Augmented In-Context Reasoning |
| **方法名** | **PhysRepair** |
| **arXiv** | [2610.23677](https://arxiv.org/abs/2610.23677) |
| **提交日期** | 2026-10-16 |
| **作者** | Xikang Guan, Shaocong Yang, Yanqi Bao, Can Wang, Zheng Gu, Zhengqing Chen (+3) |
| **机构** | 上海交通大学 / 清华大学 等 |
| **项目主页** | https://xxkkxxx.github.io/PhysRepair-Website/ |
| **篇幅** | 12 页, 5 图, 1 表 |
| **领域** | cs.CV |

---

## 📝 摘要

**物理合理性**对生成逼真的视频至关重要。现有方法通过**合成前**施加物理引导（仿真或精炼提示），但这会**限制动态多样性**、**遗漏仅在生成后才显现的错误**，且当不一致残留时**需要反复重新生成**。

本文研究一个 **generate-diagnose-repair (生成-诊断-修复)** 范式，**保留原始生成能力**，并在事后**选择性地修复**物理不一致性。

---

## 🔑 核心贡献

1. **Generate-Diagnose-Repair 范式**：事后选择性修复，而非事前约束
2. **Spatiotemporal Causal Constraints (时空因果约束)**：识别**第一个无效的物理状态**及其**因果影响的状态**，产出修复规格 (repair specification)
3. **局部化自适应修复**：只重新生成受影响区域，**保留未受影响的内容**
4. **Experience-augmented In-context Learning (经验增强上下文学习)**：结合当前修复上下文 + **先前修复的相关经验**，让 agent 跨失败案例**积累完成轨迹**
5. **多物理领域验证**：固体力学、流体动力学、光学、热力学、磁学

---

## 🧪 技术方案

### 核心思想

```
生成视频 v₁...vₙ
     │
     ▼
诊断 (Diagnose)
  ├─ Spatiotemporal Causal Constraints:
  │    定位第一个无效物理状态 t*
  │    追踪其因果影响的状态集合 S
  │    → 产出 repair specification
  │
  ▼
修复 (Repair)
  ├─ 局部化自适应重新生成 (只改 S 内)
  ├─ Experience-augmented In-context Learning:
  │    当前修复上下文 + 历史修复经验库
  │    → 决策可跨失败类型迁移
  └─ 累积完成轨迹 → 未来案例复用
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **时空因果约束** | 找到物理失效的**最早**时间点，而非所有违规点 |
| **修复规格 (repair specification)** | 结构化描述"哪里错、怎么错"的中间表示 |
| **局部化再生成** | 只重生成受影响时空区域，避免全局重生成破坏多样性 |
| **经验增强 ICL** | 把过往修复轨迹作为 in-context 示例 |
| **完成轨迹累积** | 长期记忆机制 |

---

## 📊 渲染方法分类

- **类型**：视频生成（含流体现象）
- **技术**：扩散/流匹配视频模型、Agent 框架、因果推理、In-Context Learning

## 🎯 视觉质量

- **逼真度**：⭐⭐⭐⭐（修复后物理合理性提升）
- **风格化支持**：是（保留原始生成能力 → 多样性不被牺牲）
- **物理准确性**：中-高（事后诊断修复，非前向物理约束）

## ⚡ 性能预期

- **额外成本**：需多轮"生成-诊断-修复"，推理成本上升（相对单次生成）
- **GPU 需求**：高（视频模型 + 诊断模型/agent）
- **收益**：避免"反复完全重新生成"的质量-成本权衡

## 🔧 实现建议

- **着色器复杂度**：不适用
- **管线要求**：
  - 视频生成模型
  - 物理诊断模块（可用规则/视觉检查器）
  - 局部化重生成（时空掩码 + 局部重采样）
  - 经验记忆库
- **推荐度**：✅ 推荐——"**事后诊断 + 局部修复**"是生成式流体视频从"能看"到"能用"的关键一步，尤其适合**难以用提示词精确控制的物理现象**（烟涡结构、火焰形变）

## ⚠️ 局限性

- 依赖**可靠的物理诊断器**——这本身是难题，诊断错了会"修复"成更糟
- 多轮迭代的推理成本高
- 局部再生成的时序一致性需仔细处理（边界可能出现闪烁）
- 抽象描述覆盖流体动力学，但**流体专属的物理诊断器**细节需查原文

## 🔗 相关工作

- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]]（同为流体视频生成，路线互补）
- [[2026-10-29-WMEval-Interactive-World-Models-Physical-Simulations]]（评测互补）
- [[Physics-IQ-Verified]]
- [[Video-Diffusion-Model]] · [[In-Context-Learning]]

## 📚 引用

```bibtex
@article{guan2026physrepair,
  title={Agentic Physics-Grounded Video Generation via Memory-Augmented In-Context Reasoning},
  author={Guan, Xikang and Yang, Shaocong and Bao, Yanqi and Wang, Can and Gu, Zheng and
          Chen, Zhengqing},
  journal={arXiv preprint arXiv:2610.23677},
  year={2026}
}
```

---
*创建日期: 2026-10-29*
*来源: arXiv cs.GR 每日论文搜索*
*标签: #fluid-rendering #video-generation #physical-plausibility #agentic-ai #causal-reasoning #repair*
