---
type: paper
created: 2026-03-14
updated: 2026-03-14
tags: [paper, projection-mapping, light-field, cs.GR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.11573
---

# High-Contrast Projection Mapping under Light Field Illumination with LED Display and Aperiodic Lens Array

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | High-Contrast Projection Mapping under Light Field Illumination with LED Display and Aperiodic Lens Array |
| **作者** | Daisuke Iwai 等 |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.11573) |
| **DOI** | 10.48550/arXiv.2603.11573 |

---

## 核心贡献

> 突破投影映射的"暗室约束"，实现明亮环境下的高对比度投影

1. **目标排除照明方法** - 选择性照明周围环境，避免照亮投影目标
2. **LED + 非周期透镜阵列** - 实现光场照明，提供大有效光源面积
3. **非周期透镜优化** - 抑制串扰造成的暗点，支持动态 PM

---

## 技术方案

### 核心思想

使用 LED 显示面板配合优化的非周期透镜阵列实现光场照明，在不增加环境暗度的情况下，通过精确控制照明空间来避免投影目标被环境光"冲淡"。

### 关键技术

| 技术 | 说明 |
|------|------|
| 光场照明 | LED + 非周期透镜阵列组合 |
| 目标排除照明 | 空间选择性照明算法 |
| 非周期透镜布局 | 抑制串扰暗点 |
| LED 亮度模式计算 | 支持动态 PM |

---

## 公式

```math
# 透镜布局优化目标函数（推测）
# 最小化串扰造成的暗点
minimize: Σ crosstalk_artifacts(lens_positions)
```

---

## 代码片段

```python
# LED 亮度模式计算框架（概念）
def compute_led_pattern(target_mask, environment_mask):
    # 计算避开目标区域的照明模式
    led_pattern = optimize_light_field(target_mask, environment_mask)
    return led_pattern
```

---

## 实验结论

- **原型系统**: LED 显示面板 + 非周期透镜阵列
- **效果**: 在明亮环境中实现高对比度 PM
- **优势**: 保持自然软阴影，同时精确避开目标

---

## 局限性

- 系统复杂度较高
- 需要精确的透镜阵列制造
- 动态场景可能需要实时重新计算

---

## 相关工作

- [[Projection Mapping]]
- [[Light Field Rendering]]
- [[HDR Display]]

---

## 实现建议

- **实现难度**: 中高 - 需要硬件和算法配合
- **预期性能**: 高对比度 PM，适用于展览/演出场景
- **适用场景**: 增强现实投影、展览展示、舞台效果
