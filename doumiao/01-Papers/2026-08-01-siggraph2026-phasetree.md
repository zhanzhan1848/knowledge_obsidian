# The PhaseTree: Multiphase Signed Distance Fields

> **日期**: SIGGRAPH 2026  
> **来源**: SIGGRAPH 2026  
> **关键词**: multi-phase SDF, signed distance field, multiphase fluid, implicit surface  
> **链接**: https://keenancrane.github.io/siggraph-papers-schedule/  
> **标签**: #multi-phase-SDF #implicit-surface #fluid-rendering #SIGGRAPH2026

## 核心创新

**PhaseTree** 提出一种**多相（multiphase）**符号距离场表示，用于同时表示多种物质（如水、空气、固体）的交界面的隐式曲面。

## 核心问题

传统 SDF 仅能表示单一物质（inside/outside），无法处理多种流体相（如油-水-空气）的复杂界面。

## 技术方法

PhaseTree 将多相 SDF 组织为树结构：
- 每个叶节点代表一个相（phase）
- 内部节点编码相变关系
- 支撑多相流体的复杂拓扑变化

## 流体渲染相关性

- **体积渲染**：多相 SDF 可用于 ray marching 多相流体
- **表面渲染**：支持液体-气体-固体多相交界的精确渲染
- **相变模拟**：冰淇淋/蜡等相变流体可视化

## 实现建议

- 着色器复杂度：高
- 管线要求：隐式曲面求交 + 光线步进
- 推荐度：✅ 多相流体渲染重要进展

## 参考文献

Eric Galin, Pierre Hubert-briere, Marie-Paule Cani, Adrien Peytavie, Eric Guérin, Hugo Schott
SIGGRAPH 2026
