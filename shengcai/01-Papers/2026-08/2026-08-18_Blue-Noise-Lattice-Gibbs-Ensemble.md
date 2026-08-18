---
tags: [渲染, 采样, Blue Noise, 2026]
date: [[2026-08-18]]
status: 待读
---

# Blue Noise as a Lattice Gibbs Ensemble

## 元信息
| 标题 | 值 |
|------|-----|
| 作者 | Zhuoran Yi |
| 链接 | [arXiv:2608.13446](https://arxiv.org/abs/2608.13446) |
| PDF | [PDF](https://arxiv.org/pdf/2608.13446) |
| 发表 | arXiv cs.GR, 2026-08-13 |

## 核心贡献

1. **理论框架**: 将Blue-noise采样形式化为二元格点占据上的Gibbs分布采样问题
2. **参数化**: 密度、排斥强度、相互作用尺度、核硬度作为分布参数
3. **高效采样**: 使用Coupling Towards The Past追踪Markov链，限制深度以保证效率

## 技术方案

### Gibbs分布建模
```math
P(x) \propto \exp(-\beta E(x))
```
其中能量 $E$ 对所有成对相互作用求和

### 采样算法
1. 从目标状态向后追踪Markov链
2. 在固定深度截断轨迹
3. 保证每个样本依赖区域有界
4. 单 tile 生成时带足够halo，与大域生成bit-identical

### 特点
- 内存由tile大小决定，不依赖输出大小
- 多类扩展支持
- 自适应stippling示例：14K分辨率

## 实验结论

| 验证项 | 结果 |
|--------|------|
| 模型验证 | 复现标准blue-noise频谱 |
| 采样器验证 | 匹配预测的工作量和内存 |
| 拼贴输出 | 与全域生成bit-identical |
| 自适应stippling | 14K分辨率，内存常量 |

## 相关工作

- Blue-noise采样
- 渲染中的采样策略
- Markov Random Fields

## 标签
#渲染 #采样 #BlueNoise #Gibbs #2026
