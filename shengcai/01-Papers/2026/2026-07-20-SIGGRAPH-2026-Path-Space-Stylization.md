---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, path-tracing, stylization, image-space, rendering, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: http://www.cg.it.aoyama.ac.jp/yonghao/sig26/abstsig26.html
---

# Lifting Lines and Tone: Image-space Stylization in Path-space

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Lifting Lines and Tone: Image-space Stylization in Path-space |
| **作者** | Rex West, Sayan Mukherjee, Yonghao Yue |
| **机构** | Aoyama Gakuin University, The University of Tokyo |
| **发表** | SIGGRAPH 2026 |
| **链接** | [项目页面](http://www.cg.it.aoyama.ac.jp/yonghao/sig26/abstsig26.html) |

---

## 核心贡献

> 在路径空间中进行图像空间风格化，实现基于路径追踪的艺术化渲染效果

1. 提出一种将图像空间风格化技术提升到路径空间的方法
2. 在路径追踪框架内实现线条和色调的艺术化处理
3. 结合路径追踪的物理准确性与图像风格化的艺术表现力

---

## 技术方案

### 核心思想

传统图像空间风格化在最终渲染图像上操作，而本工作将风格化提升到光线传输路径层面，实现更深层次的视觉控制。

### 关键技术

| 技术 | 说明 |
|------|------|
| Path Tracing | 物理基础光线传输 |
| Image-space Stylization | 图像空间风格化 |
| Line Stylization | 线条艺术化 |
| Tone Mapping | 色调处理 |

### 创新点

- 将2D图像风格化提升到3D路径空间
- 保持路径追踪的物理准确性
- 提供更丰富的艺术控制能力

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 电影特效、艺术渲染、游戏风格化
- **推荐度**: ⭐⭐⭐⭐ 艺术渲染的新方向

---

## 相关工作

- 图像空间风格化
- 路径追踪
- 非真实感渲染 (NPR)
- 基于光线传输的艺术效果
