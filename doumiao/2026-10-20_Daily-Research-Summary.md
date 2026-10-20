# 2026-10-20 豆苗每日论文调研简报

**Cron 任务**: doumiao-daily-paper-search
**执行时间**: 2026-10-20 14:08 UTC (Tuesday)
**检索范围**: arXiv cs.GR 最近 24-48 小时 + SIGGRAPH 2026 流体相关论文
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 🩸 本日亮点论文（流体渲染方向）

### ⭐ 重点命中: FluidGen (arXiv:2610.25660)
- **方向**: 流体视频生成 / 物理感知扩散模型
- **核心**: 在 Wan2.1-I2V-14B 基础上通过双流架构同时预测 RGB + 3D 速度场，用 Houdini 仿真真值监督，再用速度感知 DPO 强化物理一致性
- **现象覆盖**: 烟雾、火焰、爆炸碎片、墨水
- **对应方向**: 粒子/体积渲染的**生成式管线**（与传统 ray marching 互补）
- **笔记**: [[2026-10-20_FluidGen-Physics-Aware-Fluid-Video]]

## 📊 检索结果分布

| 论文 ID | 发布 | 是否流体渲染 | 备注 |
|---------|------|------------|------|
| 2610.25660 FluidGen | 2026-10-19 02:07 UTC | ✅ 强相关 | 双流 RGB + 速度场扩散 |
| 2610.26067 PhysSkin++ | 2026-10-19 09:25 UTC | ⚠️ 边缘相关 | 物理动画 / 神经蒙皮（弹性体，不是流体） |
| 2610.17803 Make It Flow | 2026-10-13 | ✅ 强相关 | 水在 3DGS 场景中的动画（已存在论文池） |

## 🔍 趋势观察

### 近期流体渲染生成式方向 (Foundation-Model Era)
- **FluidGen (2026-10-19)** — 视频生成模型 + 物理先验（速度场监督）
- **Fluid-Gen-Zero (2026-10-08)** — 无训练 grounding pretrained video generators
- 趋势：基础视频扩散模型（Wan2.1、Sora、Veo）正在成为流体/物理可视化的**新一类渲染管线**。物理保真度由 Houdini 仿真 → 模型蒸馏 / 监督 → 推理时实时生成。

### SIGGRAPH 2026 流体类论文（背景）
- 来源: physicsbasedanimation.com / SIGGRAPH 2026 / SIGGRAPH Asia 2026 公告
- 主题: Fast VEM Fluid Simulation、Spatiotemporal FLIP、Two-Phase Immiscible Flows 等
- 与渲染管线结合: 多数作为模拟器提供密度/速度场，再交由 ray marching / 3DGS / 神经渲染管线

## 🛠️ 工作流记录

1. 通过 arXiv API (`export.arxiv.org/api/query?cat:cs.GR`) 拉取最新 50 篇论文
2. 按 `published` 时间筛选 24h + 邻近日窗口
3. 对 FluidGen 调用 arXiv abs 页 + 项目页提取关键创新点
4. 写入结构化笔记到 `~/knowledge-vault/doumiao/01-Papers/`
5. Git 同步至 https://github.com/zhanzhan1848/knowledge_obsidian

## 📌 后续 TODO

- 持续监控 FluidGen 是否被 SIGGRAPH Asia 2026 接收（参考 Fluid-Gen-Zero 后路径）
- 对 Make It Flow (2610.17803) 补一篇正式笔记（已在论文池但未单独分析）
- 评估是否将 PhysGen / Marble 等同期邻居也纳入知识库
- 测试 FluidGen 在 Houdini 中驱动仿真的工作流（若团队有 licensed access）

---
*由 🌱 豆苗自动收集于 2026-10-20 14:08 UTC*
