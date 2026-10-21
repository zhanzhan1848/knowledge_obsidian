---
type: paper
created: 2026-10-21
updated: 2026-10-21
tags: [paper, geometry-processing, point-cloud, language-model, 6d-pose, scene-layout, support-relation, SIGGRAPH-Asia-2026, cs.GR]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.28280
arxiv_id: 2610.28280v1
---

# GALA: Geometry-Aware Language Model for Controllable Object Arrangement

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GALA: Geometry-Aware Language Model for Controllable Object Arrangement |
| **作者** | Chucheng Xiang, Runze Wang, Zhi Deng, Ruchao Bao, Yuanwei Zhang, Yuxuan Xie |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers** · arXiv 2026-10-20 |
| **链接** | [原文](https://arxiv.org/abs/2610.28280) · [项目页](https://xccelephant.github.io/paper/gala/) |
| **DOI** | [10.48550/arXiv.2610.28280](https://doi.org/10.48550/arXiv.2610.28280) |
| **代码** | 项目页标注数据集将开源，模型代码截至 v1 未放出 |

---

## 核心贡献

> 现有 3D 场景布局方法用 OBB（有向包围盒）表示物体，对「支撑/包含」这类细粒度几何约束完全失明；GALA 引入**显式点云感知**来做可控摆放。

1. **指出 OBB 表示的根本缺陷**：面向包围盒的推理（support / containment）对细粒度几何是「盲」的——杯子能否放在窄边桌上，OBB 尺度上看不出差别。
2. **提出 GALA 几何感知语言模型**：以语言模型为骨架，**显式注入点云几何感知**，自回归逐个预测目标物体的 **6D 位姿**。
3. **两阶段训练策略**：
   - 阶段一：**预训练任务对齐几何模态与文本模态**
   - 阶段二：在摆放任务上**微调**
4. **构建多源场景数据集**：覆盖多样房间类型与细粒度家具摆放，将开源供社区使用。
5. **延伸出 plan–place–verify 多阶段 agent 管线**：用 GALA 做文本驱动的场景生成，含验证环节。

---

## 技术方案

### 核心思想

| 组件 | 职责 |
|------|------|
| **语言模型主干** | 理解摆放指令与场景上下文，自回归生成序列 |
| **点云几何编码** | 显式几何感知分支，替代 OBB 的粗粒度信息 |
| **6D 位姿回归头** | 每次预测一个物体的完整 6D 位姿（3D 旋转 + 3D 平移） |
| **多源数据集** | 多房间类型 + 细粒度家具摆放 |

### 推理流程

```
场景上下文（点云） + 摆放指令
        ↓
  自回归循环：逐个物体
        ↓
  预测 6D 位姿 → 校验（支撑/包含约束）→ 下一个
        ↓
  完整场景布局
```

---

## 复杂度分析

| 项 | 说明 |
|----|------|
| **表示成本** | O(点数) 点云编码 vs O(1) OBB → **表示开销显著增加** |
| **自回归长度** | O(K)，K 为场景物体数 → 串行生成，延迟随物体数线性增长 |
| **LLM 主干** | 取决于所用语言模型规模（自回归 LLM 推理成本） |

---

## 实现难度评估

| 维度 | 评估 |
|------|------|
| **算法复杂度** | 中高。LLM 主干 + 点云几何分支的多模态融合是主要工程量 |
| **数值稳定性** | ✅ 好。回归式位姿预测，非优化求解 |
| **依赖项** | PyTorch；点云骨干（如 PointNet++/Point Transformer）；LLM 框架（vLLM / HF） |
| **数据依赖** | ⚠️ 需自建多源场景数据集（论文已构建，开源后可省） |

---

## 推荐结论

✅ **推荐关注（场景理解/布局方向）**

对几何处理而言，核心启示是 **「粗粒度代理表示（OBB）会丢失细粒度可支撑关系」**。这个结论对 CAD 布局、BIM 场景、机器人抓取放置都有迁移价值。

**实现建议**：
- 若只需摆放能力而不需语言接口，可**去掉 LLM 主干**，改用轻量 point-cloud + transformer + set-prediction → 大幅降本
- 关键验证点：**点云分辨率 vs. 摆放精度**的 tradeoff（几何感知收益来自何处）
- 数据集开源后优先做复现，作为下游 3D 场景编辑的几何模块

---

## 可行性分析

### 算法复杂度
- **时间**：O(K) 次自回归解码 × 每次 LLM 前向
- **空间**：O(点云规模) 表示开销

### 实现难度
- **算法复杂度**：中高
- **数值稳定性**：✅ 好
- **依赖项**：PyTorch、点云骨干、LLM 推理框架

### 开源参考
- **项目页**：https://xccelephant.github.io/paper/gala/
- **相关工作**：SceneSNN、COINS、IKEA 布局数据集系列
- **相关工具**：Open3D 点云处理、PyTorch3D

---

## 相关笔记

- [[2026-10-20-2610-28598-Neural-Implicit-Energy-LiDAR-Mapping]]
- [[Point-Cloud-Representation]]
- [[Scene-Understanding]]

---
💡 已传递给 @墨鱼丸。