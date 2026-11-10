---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, multimodal-agent, 3D-graphics, reinforcement-learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10768
arxiv: 2611.10768
---

# BlenderFORGE: Framework for Optimizing Reactive 3D-Graphics Editing Ability of MLLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BlenderFORGE: Framework for Optimizing Reactive 3D-Graphics Editing Ability of MLLMs |
| **作者** | Zilin Guo, Tianrui Zhang, Yi Rong, Yichen Liu, Yuxin Guo, Jingcheng Ni 等 |
| **发表** | NeurIPS 2026（35 页含附录与 checklist） |
| **链接** | [原文](https://arxiv.org/abs/2611.10768) |
| **arXiv** | arXiv:2611.10768 |
| **分类** | cs.AI |
| **代码** | 项目页 https://sensetime-fvg.github.io/BlenderFORGE/ |

---

## 核心贡献

> 把 MLLM 的 Blender 3D 编辑能力从"推理时搜索"变成"训练时可摊销的技能"：用扰动式数据生成 + 隔离沙箱环境 + 两阶段（SFT + AgentLoop-RL）训练，得到开源权重的 3D 编辑智能体。

1. **可扩展的扰动式数据生成管线**：基于精选资产与大规模 3D 场景库，采样 start/goal 状态，覆盖 placement、shape-key、lighting、material 四类可状态验证的编辑任务族。
2. **闭环 Blender Sandbox**：实例隔离的并行 Blender 执行环境，支持 bpy 代码执行、渲染反馈、结构化场景状态导出与确定性奖励计算。
3. **两阶段训练**：先用离线 teacher（GPT-5.2）轨迹做冷启动 SFT（General-SFT），再用沙箱奖励做多轮工具智能体强化学习（AgentLoop-RL，VeRL + GSPO）。
4. **跨基准与跨骨干验证**：Qwen3-VL-8B 与 Qwen3.5-9B 均在全部四类任务上大幅超越基座，并在独立基准 BlenderGym 与 held-out camera reframing 上保持提升。

---

## 技术方案

### 核心思想
与依赖闭源 API、靠测试时多轮搜索+验证器选优的既有 3D 编辑系统不同，BlenderFORGE 走"训练时摊销"路线。框架由三块拼成：（1）**数据侧**：把 Blender 场景当作可程序化扰动的状态空间——对场景施加受控的位移/旋转、shape key 插值、灯光参数、材质参数扰动，得到 (start state, goal state) 对，配合几何、场景状态与视觉差异作为可验证信号；（2）**环境侧**：一个实例隔离的 Blender Sandbox，接收 agent 生成的 `bpy` 代码，隔离执行后回传渲染图与导出的结构化场景状态（物体位姿、灯光参数、材质槽等），据此确定性判定编辑是否达成目标并计算进度归一化奖励；（3）**训练侧**：第一阶段用 teacher（GPT-5.2）生成的跨四类任务的完整工具调用轨迹做 General-SFT 冷启动（冻结视觉编码器与多模态投影器，只微调语言模型），第二阶段用沙箱奖励在最多 T=8 轮交互内做 AgentLoop-RL（多轮工具调用 RL）。全流程在统一的场景状态空间中打通"任务生成—执行—验证—优化"。

### 关键公式
```math
（本文核心方法为数据-环境-优化三件套的系统性设计；奖励由沙箱按进度归一化信号计算）

Steering：\tilde h_\ell \leftarrow h_\ell + \alpha\,\sigma_\ell\,\hat v \quad（此处不适用，见 Sycophancy 笔记）

奖励（各任务族选择最贴合被编辑属性的验证信号）：
R = w_{scene} \cdot \Delta_{scene-state} + w_{vis} \cdot \Delta_{visual} + w_{geo} \cdot \Delta_{geometric}
（placement 用几何进度，shape-key 用场景状态 + 视觉进度，lighting/material 用视觉进度）
```

### 关键组件
- **Perturbation-based 数据生成**：在精选资产 + 大规模 3D 场景库上做参数化扰动，构造 start-to-goal 编辑任务（train split：placement 3,000 样本，其余各族各 2,000）。
- **Blender Sandbox**：并行、实例隔离的 Blender 执行；支持 bpy 代码执行、渲染反馈、结构化状态导出、闭环奖励计算。
- **General-SFT**：使用 Swift 框架，仅微调 LM（冻结 vision encoder 与 multimodal projector）；240 步、lr 1e-5、batch size 64。
- **AgentLoop-RL**：VeRL/HybridFlow + GSPO；lr 1e-6、batch size 2、最大上下文 32,768、最大 T=8 轮交互、KL 系数设为 0。
- **任务族**：object placement、shape-key editing、lighting adjustment、material modification（均属"状态可验证"编辑）。
- **评测指标**：SR@τ（成功率阈值）、归一化 P-Chamfer 距离（Med.）、感知指标 PL（perceptual loss）与 N-CLIP 距离。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| Placement SR@.5（Qwen3-VL-8B 基座） | 1.50% |
| Placement SR@.5（全流程 SFT+RL） | 36.00%（消融 N=200；训练集 Placement SR@.5 达 40.00%） |
| Placement SR@.5（仅 Trajectory-SFT / General-SFT） | 8.50% / 25.50% |
| Placement SR@.5（Traj+RL，无 General-SFT） | 21.00%（低于 Traj SFT 的 24.00%，RL 并非一致有益） |
| 平均交互轮数 | Base 9.29 → General-SFT 5.76（无RL）/ 全流程 6.49 |
| Shape-Key SR@.5（Qwen3.5-9B） | 6.00% → 27.50% |
| Lighting PL（Qwen3.5-9B） | 36.1 → 7.3 |
| 迁移到 BlenderGym：Placement SR@.5 | 20.00% → 36.00% |
| 迁移到 BlenderGym：Shape-Key SR@.5 | 10.26% → 17.95% |
| 迁移到 BlenderGym：Lighting PL | 52.6 → 19.0 |
| Qwen3.5-9B 相对零样本专有模型排名 | Placement 六项指标仅次于 GPT-5.2；Lighting 两项仅次于 GPT-5.2 与 Claude-Sonnet-4.6 |
| 硬件 | 8×RTX 5090 做优化，额外最多 8 卡做沙箱渲染 |

---

## 局限性

- 仍落后于最强专有模型（GPT-5.2、Claude-Sonnet-4.6）在多项指标上的表现；细粒度编辑仍存在残留误差。
- 训练依赖 teacher（GPT-5.2）离线轨迹做冷启动，继承了闭源模型的偏置与成本，无法完全摆脱对专有模型的依赖。
- Material 编辑任务无法迁移到 BlenderGym（其旧版 Blender 与本文材质编辑 API 不兼容），跨基准覆盖不完整。
- 沙箱训练开销大（最多额外 8 张卡专做渲染），且 RL 并非在所有配置下都带来提升（Traj+RL 反而低于 Traj SFT）。
- 任务族限定在"状态可验证"的几何/外观编辑，复杂的程序化建模、拓扑修改等未被覆盖。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：需要训练自有开源权重 3D/图形编辑智能体的团队；研究可验证闭环 RL 环境（sandbox-as-environment）设计；DCC 工具智能体化改造的落地参考。
- **值得复现**：是（sandbox + 扰动数据 + AgentLoop-RL 的组合可迁移到其他可执行编辑场景，如 CAD、图形设计、代码编辑器）

---

**相关论文**：[[2026-03-11-Hybrid-Sequence-Models]]
**主题标签**：#LLM #NLP #MLLM-Agent #3DGraphics #RL
