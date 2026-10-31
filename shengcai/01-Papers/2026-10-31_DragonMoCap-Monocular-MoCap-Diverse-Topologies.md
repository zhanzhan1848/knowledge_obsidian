---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, SIGGRAPH-Asia-2026, motion-capture, rigging, monocular, transformer, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.25437
---

# DragonMoCap: Monocular Video-based Motion Capture for Diverse Dragon Topologies

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DragonMoCap: Monocular Video-based Motion Capture for Diverse Dragon Topologies |
| **作者** | Zhongfei Qing, Xiaoxiang Zhao, Ling-Hao Chen, Zhongang Cai, Wenjia Wang, Yifan Wu, Qianying Liu, Wei Zeng, Bo Hu |
| **发表** | **SIGGRAPH Asia 2026**, 2026-10-18 |
| **链接** | [原文](https://arxiv.org/abs/2610.25437) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> DragonMoCap — 面向龙型角色的单目动作捕捉：把目标骨架当作**动态输入**而非固定先验，用语言接地的关节查询 token 实现跨拓扑零样本适配。

1. **骨架即输入** — 不再假设固定模板回归器，target rig 作为动态输入处理，突破龙型角色极端拓扑多样性（关节数与命名各异）带来的限制。
2. **语言接地的关节查询 token** — 双属性表示：保证**骨架内可区分性**（intra-rig discriminability）+ 保持**跨骨架相似性**（cross-rig similarity）。
3. **非参数查询 token 检索机制** — 对未见骨架零样本适配，无需重训。

---

## 技术方案

### 核心思想

龙型角色的 MoCap 目前依赖人工 K 帧，因为缺少高质量数据集与参数化模型，且**骨架拓扑极度多样**（不同龙 rig 关节数与命名规则都不同），传统固定模板回归器（HMR 类）直接失效。

DragonMoCap 的核心重构：**把 rig 从"固定先验"变成"动态输入"**。为实现这点，用语言接地的关节查询 token：
- 语言接地让语义相近的关节（如所有龙的"前肢"）在不同 rig 间共享 token → 跨骨架相似
- 骨架内可区分性保证同一 rig 的不同关节 token 不混淆

再配合非参数检索机制，实现对未见 rig 的零样本泛化。

### 关键技术

| 技术 | 说明 |
|------|------|
| 动态 rig 输入 | target rig 作为输入而非固定模板 |
| 语言接地查询 token | 跨 rig 语义对齐 |
| 双属性 token 表示 | 骨架内可区分 + 跨骨架相似 |
| 非参数 token 检索 | 未见 rig 零样本适配，无需重训 |
| 生产拓扑范围约束 | 聚焦最常见的生产级拓扑以保高质量 |

---

## 公式

```math
// 语言接地关节查询 token（概念式）
q_j^{\text{rig}} = \text{Retrieve}\big( \phi(\text{text}(j)),\ \mathcal{B}_{\text{lang}},\ \mathcal{T}_{\text{rig}} \big)
// \phi(text(j)) = 关节名的语言嵌入；\mathcal{T}_rig = 该 rig 的结构信息
```

---

## 代码片段

```python
# 概念伪代码：DragonMoCap 推理
def mocap(monocular_video, target_rig):
    tokens = language_grounded_query_tokens(target_rig)  # 非参数检索，未见 rig 亦可
    out = []
    for frame in monocular_video:
        pose = transformer(frame, tokens)                  # 骨架内可区分 + 跨骨架相似
        out.append(pose)
    return out
```

---

## 实验结论

- **数据**: 多样龙型骨架拓扑（生产级常见拓扑）
- **基线**: HMR 类固定模板回归器
- **结果**:
  - 在多样龙拓扑上持续优于 HMR 类基线
  - 未见骨架零样本适配
  - 已集成进专业动画工作流，具备实时工业应用潜力

---

## 局限性

- 有意限定在"最常见的生产拓扑"范围内，超出范围性能未验证
- 单目固有的深度/遮挡歧义
- 语言接地的关节命名质量依赖上游资产规范

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **"把骨架当动态输入"** 的重构思想可迁移到其他可变拓扑任务（机械臂、不同拓扑车辆、可变拓扑布料）
- 关联：[[2026-10-31_UniffordInteractor-Unified-Affordance-HOI]]、[[2026-10-31_Joints-Camera-Action-CoGenerating-Motion-Video]]

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 优于 HMR 基线；零样本适配
- **适用场景**: 游戏/影视角色 MoCap、程序化角色动画
- **优先级**: 低（非渲染管线核心）
