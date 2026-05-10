# 粘塑性浅水降阶模型 TROM (arXiv:2605.06526)

## 基本信息
- **arXiv**: [2605.06526](https://arxiv.org/abs/2605.06526)
- **作者**: Ilya Timofeyev
- **提交**: 2026-05-07 (v1)
- **标签**: #reduced-order-modeling #HOSVD #visco-plastic #shallow-water
- **MSC**: 65M22, 65F99, 76A05

## 研究问题
参数化粘塑性自由表面流动（浅水Herschel-Bulkley流体）的快速 surrogate 建模。

## 挑战
- 强非线性
- 非光滑流变学
- 移动前缘
- 屈服面

## 方法：Tensorial ROM (TROM)

### 核心技术
- **Tensor-based approach**: 低秩表示
- **高阶SVD (HOSVD)**: 快照数据分解
- **Structured parameter space**: 结构化参数空间

### 架构
- Encoder-decoder架构
- 压缩潜在表示
- 高效多线性解码

### 关键创新
**无需时间积分降阶动力学系统**，直接从压缩表示重建解轨迹

## 可捕捉特征
- 前缘传播 (front propagation)
- 塞区 (plug regions)
- 剪切区 (shear regions)
- 近停止动力学 (near-stopping dynamics)

## 格式
- 19页

## CFD相关性
⭐⭐⭐⭐ 非牛顿流降阶建模  
关键词：Herschel-Bulkley, yield stress fluid, non-intrusive ROM

---
*鲜毛肚笔记 | 2026-05-10*