---
tags: [渲染, Monte Carlo, 采样, 2026]
date: [[2026-08-18]]
status: 待读
---

# A Stable Transport-Mechanism Descriptor for Per-Pixel Rendering Difficulty

## 元信息
| 标题 | 值 |
|------|-----|
| 作者 | Po-Ting Lin |
| 链接 | [arXiv:2608.16730](https://arxiv.org/abs/2608.16730) |
| PDF | [PDF](https://arxiv.org/pdf/2608.16730) |
| 发表 | arXiv cs.GR, 2026-08-17 |

## 核心贡献

1. **问题定义**: Monte Carlo渲染中，传统使用采样方差 $\hat\sigma^2(p)$ 衡量像素级渲染困难度，但在重尾传输（heavy-tailed transport）情况下最不可靠
2. **解决方案**: 提出离散的传输机制描述符，对每个贡献事件按BSDF lobe端点、delta-specular事件存在性、单/多弹跳区分进行分类
3. **实验验证**: 在64-4096 samples/pixel下，主导标签一致率达87-99.6%，而分位数分箱方差仅21%

## 技术方案

### 传输机制分类
七个互斥标签：
- 端点BSDF lobe
- delta-specular事件存在性
- 单弹跳/多弹跳区分

### 关键公式
- 相对误差受积分器峰度(kurtosis)控制
- split-half可靠性：variance-derived targets仅0.23-0.29（40000 samples/pixel）

### 性能提升
- 在重尾桶场景中，基于标签校正噪声先验方差优于均匀采样
- 在ajar-door场景中，variance allocation失败6.8dB时，标签正确识别失败类型并放弃

## 实验结论

| 指标 | 结果 |
|------|------|
| 主导标签一致性 | 87-99.6% (64 vs 4096 samples/pixel) |
| 方差一致性 | 21% (同等条件) |
| ajar-door场景 | 标签识别失败类型，6.8dB提升 |

## 局限性

- 依赖BSDF lobe分类
- 需要预热采样阶段

## 相关工作

- Monte Carlo渲染采样策略
- Importance sampling
- MIS (Multiple Importance Sampling)

## 标签
#渲染 #MonteCarlo #采样优化 #传输机制 #2026
