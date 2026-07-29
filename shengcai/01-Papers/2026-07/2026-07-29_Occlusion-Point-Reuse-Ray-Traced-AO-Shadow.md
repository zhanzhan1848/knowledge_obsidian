---
type: paper
created: 2026-07-29
updated: 2026-07-29
tags: [paper, ray-tracing, ambient-occlusion, shadow, real-time-rendering, occlusion-reuse]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.23122
---

# Occlusion-Point Reuse for Ray-Traced Ambient Occlusion and Shadow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Occlusion-Point Reuse for Ray-Traced Ambient Occlusion and Shadow |
| **作者** | Haojie Jin, Fujia Su, Zehui Lin, Chenxiao Hu, Jierui Ren, Yuqing Yuan, Yanchen Zhang, Zhongtao Wang, Yisong Chen, Kangying Cai, Guoping Wang, Sheng Li |
| **机构** | Peking University, Huawei |
| **发表** | arXiv cs.GR (2026-07-28) |
| **链接** | [原文](https://arxiv.org/abs/2607.23122) |
| **PDF** | [下载](https://arxiv.org/pdf/2607.23122) |

---

## 核心贡献

> 将光线追踪的 AO 和面积光源阴影估计重构成遮挡点域积分，通过 MIS 组合邻近遮挡点样本，实现首次命中遮挡点的复用——比传统光线复用更高效

1. **遮挡点复用框架 (Occlusion-Point Reuse)**：不是复用最终着色值或光源样本，而是将阻挡光线首次命中的遮挡点作为可复用几何事件，重用给邻近像素

2. **无偏估计器**：重新评估每个复用遮挡点对目标接收者是否也是首次命中，验证收敛到变换后的遮挡点域积分

3. **实践有偏估计器**：假设局部首次命中遮挡点一致性，去除跨像素首次命中验证光线，使复用在实时成本下可行

4. **首个 AO 光线复用公式**：基于首次命中遮挡点复用追踪 AO 光线，而非对已完成 AO 值滤波

---

## 技术方案

### 核心思想
将 AO 和面积光源阴影的可见性估计重构成**遮挡点域积分**，使邻近接收者可按自身几何和支持权重重新加权共享遮挡点。

### AO 遮挡点复用
```math
\omega_{AO}(p, \omega_i) = \int_H V(p, h) \cdot g(p, h) \cdot \frac{(o_h - p) \cdot \omega_i}{|o_h - p|^3} \, dA(o_h)
```
其中 $o_h$ 是首次命中遮挡点，$V$ 是可见性函数，$g$ 是几何衰减。通过 MIS 组合邻近像素的遮挡点样本。

### 阴影遮挡点复用
将面积光源阴影估计重构成遮挡点域积分：
- 传统方法复用光源样本，假设邻近接收者对光源样本可见性一致 → 在半影、薄遮挡器、深度不连续处失效
- 遮挡点复用假设局部首次命中遮挡点一致 → 更匹配可见性几何

### 有偏 vs 无偏
- **无偏**：需要 cross-pixel 首次命中验证光线
- **有偏**：假设局部首次命中遮挡点一致性，移除验证光线，实时可行

---

## 实验结论

- RTAO 质量显著高于非复用基准
- 阴影质量在相近成本下优于光源样本复用
- 在半影、薄遮挡器区域改进尤为明显
- 论文发表于 ACM TOG (Transactions on Graphics)

---

## 局限性

- 有偏版本依赖局部首次命中遮挡点一致性假设
- 对复杂几何（多处遮挡路径）可能失效
- 主要针对静态场景，未讨论动态场景

---

## 可行性分析

| 维度 | 评分 |
|------|------|
| **创新性** | ⭐⭐⭐⭐⭐ 遮挡点作为复用单元是全新的思路 |
| **实用性** | ⭐⭐⭐⭐⭐ 直接改善硬件光线追踪的实时性能 |
| **实现难度** | ⭐⭐⭐ 中等，需修改 DXR/Vulkan 光线追踪管线 |
| **适用场景** | 游戏、实时渲染、硬件光线追踪设备 |

**推荐结论**: ✅ 推荐实现

---

## 相关工作

- ReSTIR (Bitterli et al., 2020)
- Screen-space AO (Bavoil et al., 2008)
- Shadow maps (Williams, 1978)

---

## 标签

#渲染 #光线追踪 #环境光遮蔽 #阴影 #实时渲染 #采样优化 #2026
