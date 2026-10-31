---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, NVIDIA, video-generation, motion-capture, rigging, cross-attention, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.28632
---

# Joints, Camera, Action! Co-Generating 3D Motion and Video for Arbitrary Rigs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Joints, Camera, Action! Co-Generating 3D Motion and Video for Arbitrary Rigs |
| **作者** | Noam Rotstein, Yoad Tewel, Chen Tessler, Haggai Maron, Gal Chechik, Or Litany, Yoni Kasten, Yuval Atzmon |
| **发表** | arXiv preprint (cs.CV / cs.AI / cs.GR), 2026-10-20 |
| **链接** | [原文](https://arxiv.org/abs/2610.28632) |
| **DOI** | - |
| **代码** | 项目页 https://research.nvidia.com/labs/par/projects/jca/ (NVIDIA) |

---

## 核心贡献

> Joints, Camera, Action! (JCA) — 为任意骨架联合生成 3D 运动与视频，并恢复将运动注册到场景的相机。

1. **任意骨架支持** — 3D 运动放在独立模型中，支持任意骨架；通过少量 cross-attention 层连接到预训练视频模型。
2. **相机恢复** — 模型学习在视频帧中定位每个关节，从而恢复相机并把 3D 运动放置到场景中。
3. **近 20 万训练对** — 用生成式视频编辑器把动画 3D 资产放入适配其动作的场景，策划编辑使已知运动保持有效，结合人类与机器人视频。
4. **双向能力** — 视频→骨架运动、骨架运动→视频、关键帧控制 3D 运动。

---

## 技术方案

### 核心思想

视频生成模型能画出逼真运动，但无法把运动"还给" 3D——比如模型能显示猴子跳过横杆，却不能把这段跳跃作为可重放的 3D 运动放回 3D 场景。

既有视频-运动模型的两种做法都有问题：
- 只处理人体骨架，且动辄增加数十亿参数
- 从生成的 2D 姿态图三角化重建 3D 运动

JCA 的解法是**分离**：
- 3D 运动模型独立存在，先只从运动数据学习骨架如何运动（运动数据比配对视频容易获取与增广）
- 通过少量 cross-attention 层连接预训练视频模型
- 联合学习"在视频帧中定位关节"这一任务，从而反解相机

### 关键技术

| 技术 | 说明 |
|------|------|
| 独立 3D 运动模型 | 支持任意骨架，与视频模型解耦 |
| 轻量 cross-attention 桥 | 少量层连接预训练视频模型，避免参数爆炸 |
| 关节定位辅助任务 | 学习在帧中定位关节 → 恢复相机 |
| 生成式视频编辑器造数据 | 造场景匹配动作的训练对 |
| 双向转换 | video↔motion，以及关键帧控制 |
| ~200K 训练对 | 人类 + 机器人视频 + 编辑策划 |

---

## 公式

```math
// 联合目标（概念式）
\mathcal{L} = \mathcal{L}_{\text{video}}(\mathbf{V}) + \mathcal{L}_{\text{motion}}(\mathbf{M})
             + \mathcal{L}_{\text{joint\_loc}}(\mathbf{V}, \mathbf{M})
// 由关节定位 + 已知 3D 运动反解相机
(\mathbf{R}, \mathbf{t}) = \arg\min \sum_{j,i} \Big\| \pi(\mathbf{R}\,\mathbf{M}_j^{(i)} + \mathbf{t}) - \hat{\mathbf{p}}_j^{(i)} \Big\|^2
```

---

## 代码片段

```python
# 概念伪代码：JCA 双向能力
# 骨架运动 -> 视频
motion = motion_model.sample(rig=rig, text=text)
video  = video_model.cross_attend(motion)        # 轻量桥接

# 视频 -> 骨架运动 + 相机
motion = motion_model.infer(video, rig=rig)
cam    = recover_camera(video, motion)           # 用关节定位反解
```

---

## 实验结论

- **训练数据**: 近 200K 训练对（人类视频 + 机器人视频 + 生成式编辑器策划）
- **基线**: 视频优先（video-first）管线、HMR 类方法
- **结果**:
  - 文本驱动下，多样骨架的动画保真度优于视频优先管线
  - 运动对周围场景有响应（场景条件化）
  - 视频→运动、运动→视频双向转换
  - 支持关键帧控制 3D 运动

---

## 局限性

- 依赖预训练视频模型的先验质量
- 关节定位精度决定相机恢复精度（误差耦合）
- 场景响应性的建模是隐式的

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **"解耦 + 少量 cross-attention 桥接"** 是连接两个大模型的实用范式；关节定位→相机恢复的思路对运动重投影有参考价值
- 关联：[[2026-10-31_DragonMoCap-Monocular-MoCap-Diverse-Topologies]]、[[2026-10-31_RealMe-Immersive-Volumetric-Video-Minimal-Captures]]

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 优于视频优先管线；双向能力
- **适用场景**: 游戏角色动画、机器人动作数据生成、影视特效
- **优先级**: 低（生成模型方向，非渲染管线核心）
