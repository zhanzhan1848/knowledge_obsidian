---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [360-camera, 3DGS, 3DGRT, radiance-field, operator-removal]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.22572
---

# FullCircle: Effortless 3D Reconstruction from Casual 360° Captures

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FullCircle: Effortless 3D Reconstruction from Casual 360° Captures |
| **作者** | Ipek Oztas, Daniel Rebain, Aysegul Dundar, Kwang Moo Yi, Lily Goli, Andrea Tagliasacchi |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.22572) |
| **项目页** | https://theialab.github.io/fullcircle |

---

## 核心贡献

> 首个端到端360°相机原始图像→3D重建管道，无需特殊采集协议，自动去除拍摄者。

1. 提出首个无需特殊预处理的360°相机原始图像3D重建管道
2. 利用预训练视觉基础模型（无需训练）自动生成拍摄者mask
3. 解决了360°相机重建中拍摄者导致的严重伪影问题
4. 发布99个多样化场景 benchmark

---

## 技术方案

### 核心问题

360°相机每帧覆盖全向视野，提供远超传统相机的视角覆盖和视觉约束，但存在一个关键问题：**拍摄者必然出现在画面中**，导致光度不一致和重建失败。

### 解决方案

```
原始360°图像 → 预训练基础模型(训练-free) → 操作符mask
                         ↓
              3DGS/3DGRT重建（去除操作符）
                         ↓
            高质量新视角合成
```

### 3DGRT的应用

论文中3DGRT（Gaussian Ray Tracing）被用于360°场景渲染，但FullCircle方法通过去除操作员使其在casual capture场景下可用。

---

## 实验结论

- **数据集**: 99个多样化360°场景 + 对应无干扰测试集
- **对比**: Vanilla 3DGS for 360° + 鲁棒perspective baseline
- **结果**: 显著优于所有基线，包括从相同轨迹模拟perspective相机的情况

---

## 局限性

- 依赖预训练视觉基础模型的质量
- 复杂光照条件下操作符mask可能不准确

---

## 实现建议

- **实现难度**: 中（集成预训练模型 + 3DGS pipeline）
- **预期性能**: 实际采集效率大幅提升
- **适用场景**: 大规模3D数据采集、消费者3D扫描、VR内容创建

---

## 相关笔记

- [[360-Camera-3D-Reconstruction]]
- [[3DGRT-Ray-Tracing]]
- [[Operator-Removal-3D]]
