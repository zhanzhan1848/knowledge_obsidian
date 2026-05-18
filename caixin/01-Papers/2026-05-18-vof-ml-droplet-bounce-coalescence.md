---
title: "Bounce or coalescence: a physical learning frame"
authors:
  - J. H. Xu
  - Z. L. Wang
date: 2026-05-15
arxiv_id: "2605.15844"
categories: ["physics.flu-dyn"]
tags: ["VOF", "droplet collision", "machine learning", "multi-phase flow", "surface tension"]
status: processed
---

# 核心贡献

提出基于**物理准则 + 机器学习分类**的液滴界面接触模拟框架，统一描述**合并 (coalescence)** 和**弹跳 (bouncing)** 现象。

## 创新点

1. **多 VOF 场融合/生成**: 界面合并时合并 VOF 场，分离时重新生成
2. **物理引导的 ML 模型**: 判断界面行为（合并/弹跳）
3. **避免直接解析薄气膜**: 降低对经验分子力参数的依赖

---

## 方法框架

### 界面接触判断
```
输入: 界面接近状态
     ↓
物理引导 ML 模型判断
     ↓
┌─ 合并 → 融合多个 VOF 场为一个
└─ 弹跳 → 将单个 VOF 场再生为多个
```

### 关键优势
- **拓扑变化处理** 与界面追踪分离
- **计算量控制**: 避免 Regime-map 遍历
- **随机性处理**: 由 ML 模型负责

---

## 验证案例

### 1. 液滴-液滴碰撞
- 不同撞击条件下的合并和弹跳再现

### 2. 液滴撞击液面
- 引入排水时间准则 (drainage-time criterion)
- 数值结果与实验吻合
- 可捕捉 **弹跳后合并** 的完整序列

---

## 数值方法

| 技术 | 说明 |
|------|------|
| VOF | Volume of Fluid 界面追踪 |
| ML | 机器学习分类器 |
| 拓扑转换 | 通过 VOF 场操作实现 |

---

## 与现有方法对比

| 方法 | 问题 |
|------|------|
| 传统 VOF | 拓扑变化困难 |
| 经验准则 | 依赖参数 |
| 本文 | 物理引导 + 自适应 ML |

---

## URL
- arXiv: https://arxiv.org/abs/2605.15844
- PDF: https://arxiv.org/pdf/2605.15844

---

#metadata
#multi-phase-flow #droplet-dynamics #VOF #machine-learning