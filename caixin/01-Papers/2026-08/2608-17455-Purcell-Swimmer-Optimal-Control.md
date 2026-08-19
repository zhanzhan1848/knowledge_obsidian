---
title: "Optimal control of a swimming robot based on Purcell's microswimmer model"
arxiv: "2608.17455"
date: 2026-08-19
tags: [microswimmer, Purcell-model, low-Reynolds-number, optimal-control, robotics, Lighthill-efficiency]
categories: [microswimmer, optimal-control, bio-inspired-robotics]
---

# Optimal Control of Swimming Robot Based on Purcell's Microswimmer Model

## 论文信息
- **arXiv**: 2608.17455
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Robotics (cs.RO); Optimization and Control (math.OC)
- **关键词**: Purcell swimmer, low Reynolds number, optimal control, Lighthill efficiency, Pontryagin's Maximum Principle

## 核心创新点

### 模型扩展
- **原始 Purcell 模型**: 三连杆平面模型，由两个驱动旋转关节连接
- **本文变体**: 
  - 非细长连杆
  - 中心刚性球体（代表机器人中心浮力块的附加阻力）

### 最优控制框架
1. **位移最大化**:
   - 基于 Pontryagin 最大原理 (PMP)
   - 微分几何方法转换为关节平面中步态轨迹所围成的面积积分
   - 提供视觉解释：拓扑变化与关节角度约束的关系

2. **能量效率优化**:
   - 最大化 Lighthill 能量效率
   - 导出两点边值问题 (BVP)
   - 获得效率最优步态

### 数值方法
- 参数化输入步态为截断傅里叶级数
- GPOPS-II 求解器
- 为求解 BVP 提供足够初始猜测

### 关键发现
- 位移最优步态的拓扑变化可通过几何解释理解
- 效率最优步态与位移最优步态不同
- 中心球体影响最优步态形式

## 物理基础
- **低雷诺数流体力学**: Stokes 流动
- **Purcell 的 3-link swimmer**: 经典微生物游泳模型
- **Lighthill 效率**: 机械功与净推进功的比率

## 实验验证
- 宏尺度机器人实现
- 高粘度流体中的运动验证

## 评估
- ✅ 推荐： Purcell 游泳器最优控制的系统性研究
- 对于微纳机器人和生物医学应用有重要参考价值
