---
tags: [渲染, 运动生成, 扩散模型, 交互, SIGGRAPH2026, 2026]
date: 2026-07-14
status: 已读
review: 待深入
---

# ARDY: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation

## 元信息

| 标题 | ARDY: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation |
|------|------|
| 作者 | NVIDIA Research (SIL Lab) |
| 会议 | ACM Transactions on Graphics (SIGGRAPH 2026) |
| 链接 | [arXiv:2607.08741](https://arxiv.org/abs/2607.08741) |
| 领域 | cs.GR, cs.CV, cs.LG, cs.RO |
| 日期 | 2026-07-09 |

## 核心贡献

1. **混合运动表示**：将运动解耦为显式根特征 + 隐式身体 embedding，平衡精确轨迹控制与高效生成学习
2. **两阶段自回归 Transformer 去噪器**：支持可变历史上下文 + 长时域 kinematic 约束条件
3. **在线文本提示**：原生支持实时文本条件，无需 test-time 优化
4. **高效推理**：4 步扩散，**平均生成延迟 33ms**，达到实时交互级别

## 关键特性对比

| 特性 | ARDY | Prior 离线方法 | Prior 在线方法 |
|------|------|---------------|--------------|
| 实时生成 | ✅ | ❌ | ✅ |
| 在线文本提示 | ✅ | ✅ | 部分 |
| 长时域 kinematic 约束 | ✅ | ✅ | ❌ |
| 无需 test-time 优化 | ✅ | 部分 | 部分 |

## 技术方案

### 混合运动表示

- **显式根特征**：精确控制轨迹和高度
- **隐式身体 embedding**：通过学习型 tokenizer 获得，紧凑且适合高效生成学习

### 两阶段自回归去噪

在去噪循环内交错两阶段：
1. **第一阶段**：预测干净显式根
2. **第二阶段**：在第一阶段根预测条件下预测干净隐式身体 embedding

两阶段连续相互影响，同时满足文本指令和 kinematic 约束。

### 约束类型支持

- 根路径和航点
- 全身关键帧
- 稀疏关节位置和旋转
- 末端执行器位置/旋转
- 在线文本提示

### 推理延迟

- **4 步扩散**（远少于标准 diffusion 的 50-1000 步）
- 平均生成延迟 **33ms**
- 骨骼动画数据集 Bones Rigplay（生产级质量）

## 实验

- HumanML3D benchmark：SOTA 运动质量和约束遵循
- Bones Rigplay：大规模生产质量数据集验证
- 交互 Demo：鼠标键盘控制的实时 locomotion

## 评估

- **创新性**：⭐⭐⭐⭐（混合表示 + 快速扩散设计精巧）
- **实用性**：⭐⭐⭐⭐⭐（33ms 延迟可直接用于游戏/机器人）
- **难度**：高（两阶段 Transformer 去噪 + 运动 tokenizer 联合训练）

## 链接

- 项目主页： https://research.nvidia.com/labs/sil/projects/ardy/
- PDF： https://arxiv.org/pdf/2607.08741
