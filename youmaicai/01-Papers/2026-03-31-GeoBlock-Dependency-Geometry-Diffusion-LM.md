# GeoBlock: Inferring Block Granularity from Dependency Geometry in Diffusion Language Models

## 元信息
| 标题 | GeoBlock: Inferring Block Granularity from Dependency Geometry in Diffusion Language Models |
|------|------|
| 作者 | Lipeng Wan, Junjie Ma, Jianhui Gu, Zeyang Liu, Xuyang Lu, Xuguang Lan |
| 链接 | [原文](https://arxiv.org/abs/2603.26675) |
| arXiv | arXiv:2603.26675 |
| 代码 | available upon publication |
| 发表 | arXiv, 2026-03-04 (announced 2026-03-31) |

## 核心贡献
1. 提出 **GeoBlock**，首个基于依赖几何的 block inference 框架
2. 从注意力派生依赖几何直接确定 block 粒度
3. 分析跨 token 依赖模式，识别几何稳定 refine 区域，动态确定适当的 block 边界
4. 无需额外训练，可无缝集成到现有 block diffusion 架构

## 核心洞察
**扩散解码的几何视图**：
- 强因果顺序的区域需要顺序更新
- 语义连贯的区域允许并行 refine

## 方法
```
注意力派生依赖几何
    ↓
GeoBlock: 分析跨token依赖模式
    ↓
识别几何稳定refine区域 + 动态block边界
    ↓
保持并行效率 + 依赖一致refine
```

## 实验结果
- GeoBlock 可靠识别几何一致的 block 边界
- 在小量额外计算预算下提升 block diffusion 准确率

## 关键优势
- 无需训练
- 无缝集成现有 block diffusion
- 自适应 block 粒度

## URL
- arXiv: https://arxiv.org/abs/2603.26675
- PDF: https://arxiv.org/pdf/2603.26675

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*
