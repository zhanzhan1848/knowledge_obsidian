---
tags: [几何, 关节资产, LLM, 程序化建模, 网格处理, 机器人, USD]
date: 2026-10-09
source: arXiv
arxiv_id: 2610.11322
venue: cs.RO (cross-listed)
authors: Chuanrui Zhang, Zaijia Yang, Duomin Wang, Lu Shi, Daquan Zhou, Ruihua Zhang, Ziwei Wang
project_page: https://xingyoujun.github.io/usdcraft
---

# USDCraft: Geometrically Grounded Programmatic Modeling of Articulated 3D Assets for Simulation

## 核心问题
真实到仿真 (real-to-sim) 机器人操作需要几何忠实且功能正确的关节 3D 资产。现有的基于网格的方法依赖训练分布内完整网格数据，对真实物体的破损/缺失网格无能为力。

## 方法概述

**核心思想**：将关节资产重建形式化为**基于部分几何证据的程序化建模**。

### USDCraft 框架

预训练 LLM **编写并修正**可执行程序（无需任务特定训练），生成仿真就绪的关节资产。

### 三步管线

#### (1) 源几何分析 (Source Geometry Analysis)
- 将源网格转为度量化的文本描述
- 区分已观测表面与未知空间

#### (2) 迭代几何复核 (Iterative Geometric Rechecking)
- 对每个候选重新编码为同一表示
- 差异点指向程序编辑
- 未观测区域保持开放，由后续步骤完成

#### (3) 视觉反馈 + 物理编辑引导
- 输出带显式物理属性的关节 USD 资产
- 直接加载到 Isaac Sim，无需手工调整

## 实验结果

- 在两个关节基准数据集上**领先**关节恢复精度
- 验证了 real-to-sim-to-real 机器人操作的有效性

## 复杂度分析
- **方法定位**：基于 LLM 的程序化建模，含几何/物理多次验证
- **运行成本**：以分钟/资产计
- **依赖项**：
  - **USD / OpenUSD** (Pixar/NVIDIA) — Universal Scene Description
  - **Isaac Sim** (NVIDIA) — 物理仿真
  - **LLM**（GPT-5 / Claude Fable 等）

## 实现难度
- 算法复杂度：**中-高**（LLM 编程 + 几何/物理验证循环）
- 数值稳定性：**良好**（依赖底层的几何验证与物理仿真）
- 跨学科：跨图形学 + 机器人 + LLM 工程

## 推荐结论
✅ **推荐关注**（机器人领域 + 图形学交叉）

技术亮点：
1. **首个将 LLM 程序化建模专门用于关节资产的工作**
2. **迭代几何复核机制**：避免幻觉导致的物理不合理性
3. **真实可部署**：Isaac Sim 兼容

## 开源参考
- **OpenUSD / pxr USD** — 资产格式
- **Isaac Sim** — 仿真后端
- **PartNet-Mobility** — 关节资产基准
- 项目页：https://xingyoujun.github.io/usdcraft

## 与几何处理的关联
- 关节重建涉及**几何分割**（识别铰链）+ **物理建模**（运动自由度估计）
- 几何处理 agent 可以借鉴其"分步修正"反馈模式

## 应用场景
- 机器人学习：仿真训练数据生成
- 数字孪生
- 工业自动化

## 备注
- 标注 cs.RO 主分类，但与 cs.GR 强相关
- 项目页已上线，应追踪开源时间表

---
相关主题：[[关节建模]] [[程序化建模]] [[机器人仿真]]
