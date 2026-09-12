---
tags: [渲染, 逆图形, 笔触渲染, 2026]
date: [[2026-09-12]]
status: 待读
---

# Transport-Based Rendering with Deposition Strokes for Inverse Graphics

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Yushan Han et al. |
| 发表 | arXiv cs.GR (2026-09-08, v2 2026-09-10) |
| 链接 | [arXiv:2609.08722](https://arxiv.org/abs/2609.08722) |
| PDF | [PDF](https://arxiv.org/pdf/2609.08722) |

## 核心贡献

1. **Transport-Coupled Strokes** — 每笔触沉积自身面积的材料并移动之前所有标记而不改变其面积
2. **闭合形式逆** — 除 deposit 区域外具有闭合形式逆
3. **内存高效 adjoint** — 使用 8.7x 更少内存的 adjoint 方案
4. **2000 笔触程序** — 1024×1024 分辨率约 4 分钟完成

## 问题背景

数字大理石纹（digital marbling）需要设计笔触程序来近似目标图像。逆问题是根据目标图像优化笔触程序。

## 技术方案

### 笔触模型
笔触是一个胶囊形状，连续连接圆形液滴和绘制沉积：

- 传输是精确面积保持的
- 传输与线源势流的差异为平均位移的 8%
- 闭合形式逆存在于 deposit 区域外

### Replay Adjoint
中间状态重新生成而非存储：

```python
# 相比 checkpointed autograd 节省 8.7x 内存
def replay_adjoint(strokes, target):
    # 重新生成中间状态
    # 而非存储全部检查点
    intermediate = regenerate_states(strokes)
    return compute_gradient(intermediate, target)
```

### 融合实现
融合实现可在单 GPU 上约 4 分钟拟合 2000 笔触程序（1024×1024）。

## 实验结论

- 五个大理石 sheet 上恢复的程序与已发布笔触拟合器相当
- 在 4 倍分辨率范围内重放有效
- 支持程序顺序和调色板空间编辑

## 可行性分析

| 维度 | 评估 |
|------|------|
| 实现难度 | 中 |
| 创新性 | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐ |
| 代码可用性 | 待确认 |

## 标签

#逆图形 #笔触渲染 #大理石纹 #内存优化
