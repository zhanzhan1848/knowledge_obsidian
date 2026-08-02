---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, 3DGS, compression, geometry, XR]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.26525
---

# AtlasLC: Fast Codec-Ready Compression of Object-Centric 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fast Codec-Ready Compression of Object-Centric 3D Gaussian Splatting |
| **作者** | Byunghyun Kim et al. |
| **发表** | arXiv cs.GR, IEEE ISMAR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.26525) |
| **DOI** | 10.48550/arXiv.2607.26525 |
| **代码** | 待查 |

---

## 核心贡献

> 针对XR资产管线的source-free, training-free 3DGS压缩方案，解决映射瓶颈并保持前景支持

1. **Local-Competition Pruning**：局部竞争剪枝
2. **Deterministic Atlas Packing**：确定性atlas打包
3. **单趟条件传输**：作为剪枝和打包的共享坐标骨架

---

## 技术方案

### 核心思想

现有 3DGS 压缩方法针对场景级捕获设计，存在问题：
- 依赖重布局生成或激进全局剪枝
- 不适合语义集中的前景物体

AtlasLC 特点：
- 直接在发布的 Gaussian 资产上操作
- 无需原始图像、相机姿态或逐资产优化
- 保留深度和轮廓线索

### 性能提升

| 指标 | 提升 |
|------|------|
| Atlas准备时间 | 最高25倍 |
| 端到端压缩时间 | 最高5倍 |
| 比特数 | 比同类结构基线少6-8% |
| 感知/几何质量 | 相当 |

---

## 应用场景

- XR (Extended Reality) 资产管线
- 可扩展 XR 资产库
- 重复使用的物体资产

---

## 实现建议

- **实现难度**: 中等
- **相关技术**: 3D Gaussian Splatting, 几何压缩
- **参考**: 3DGS 压缩相关工作

---

## 相关笔记

- [[3D Gaussian Splatting]]
- [[Geometry Compression]]
- [[XR Assets]]
