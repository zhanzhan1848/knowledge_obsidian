# Elemental Alchemist: Semantic Control of Particle Systems Across Dynamic Levels of Abstraction

**日期**: 2026-05-11
**arXiv**: [2605.10014](https://arxiv.org/abs/2605.10014)
**会议**: ACM DIS 2026
**标签**: `particle-system` `VFX` `semantic-control` `generative-interface`
**领域**: 粒子系统 / 视觉特效

---

## 核心问题

编辑粒子系统视觉特效 (VFX) 对数字故事讲述至关重要，但由于其多维特性，实现**可控的、艺术导向的 (art-directable) 结果**仍然具有挑战性。

用户面对大量参数，必须找到与创作目标相关的参数，这需要：
1. 对粒子系统的系统性理解
2. 参数如何映射到高层意图（如"让火看起来愤怒"）

---

## 核心创新

### 1. Contextual Brush Palette（上下文画笔调色板）
- 根据场景上下文生成工具
- 提供直观的交互方式

### 2. Generative Control Panel（生成控制面板）
- 暴露相关技术参数
- 抽象为**中层语义属性**和**高层概念控制**
- 将高层创作意图转化为粒子系统参数

### 分层抽象
```
高层概念控制 ("angry fire")
        ↓
中层语义属性 ("turbulence", "color temperature")
        ↓
底层技术参数 (velocity, emission rate, particle count)
```

---

## 技术细节

### 用户研究
- 10 名新手 + 5 名专家 VFX 从业者评估
- 系统支持用户将高层创作目标转化为粒子系统参数

### 关键观察
- 粒子系统参数与视觉结果之间的关系复杂
- 需要层级化抽象来桥接创意意图和技术参数

---

## 实验验证

- 评估显示系统有效支持从高层意图到参数的转化
- 新手和专家用户均能从系统受益

---

## 领域关联

### 与流体渲染的关系
| 方面 | 说明 |
|------|------|
| 粒子系统 | ✅ 直接相关：粒子系统参数控制 |
| 烟雾渲染 | ✅ 可用于烟雾粒子控制 |
| 火焰渲染 | ✅ 可用于火焰语义控制 |
| 艺术导向 | ✅ 支持风格化流体效果 |

### 可应用于
- 烟雾/火焰/爆炸的直觉式编辑
- 实时预览粒子参数调整效果
- 非专业用户也能控制的 VFX 系统

---

## 参考链接

- **arXiv**: https://arxiv.org/abs/2605.10014
- **PDF**: https://arxiv.org/pdf/2605.10014

---

*笔记由豆苗 (doumiao) 自动生成于 2026-05-13*