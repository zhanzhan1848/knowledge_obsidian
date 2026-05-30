# Prism: Scalable Multimodal Continual Instruction Tuning Infrastructure

## 元信息
| 标题 | Prism: A Plug-in Reproducible Infrastructure for Scalable Multimodal Continual Instruction Tuning |
|------|------|
| 作者 | Da-Wei Zhou |
| 链接 | [原文](https://arxiv.org/abs/2605.26110) |
| arXiv | arXiv:2605.26110 |
| 发表 | 2026-05-25 (v1) |
| 领域 | cs.LG, cs.CL, cs.CV |
| 代码 | [GitHub](https://github.com/LAMDA-CL/Prism) |

## 核心贡献

1. **Plugin Architecture**: 通过轻量级插件注册机制分离算法开发与 backbone 实现
2. **消除结构碎片化**: 新策略作为独立插件集成，无需修改底层 MLLM 代码
3. **大规模训练 Pipeline**: 原生支持大规模可重复实验

## 问题背景

### MCIT 挑战
- 直接修改 base MLLM 代码
- 实现开销大
- 方法特定架构限制代码复用

### Prism 解决方案
- 即插即用的可重现 codebase
- 独立插件机制
- 可扩展 MCIT 研究

## 架构

```
MLLM Backbone ← Plugin Registry → Algorithm Plugins
                                    - Strategy 1
                                    - Strategy 2
                                    - ...
```

## 关键词
#Multimodal #Continual-Learning #Instruction-Tuning #Infrastructure #Codebase