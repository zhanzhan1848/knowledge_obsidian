# The Level Set Ensemble Kalman Filter: Sequential Data Assimilation for Flows With Shocks

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-16
- **类别**: physics.flu-dyn
- **关键词**: ensemble Kalman filter, level set, data assimilation, compressible flow, shocks

## 核心创新点

### 1. 问题
标准 EnKF 应用于带激波的可压缩流时产生虚假振荡：
- 原因：激波位置的跨集合不确定性

### 2. Level Set EnKF 方法
使用非线性映射从原始状态空间到潜在空间：
- 潜在表示包含:
  - 编码不连续位置的水平集函数 (level set function)
  - 定义在完整物理域上的光滑状态扩展
  - 表示激波两侧的解

### 3. 数学框架
作为在潜在空间中进行数据同化的通用方法的具体实例

### 4. 验证
- 一维可压缩流多个案例
- 二维爆炸波

## 应用场景
- 航空航天
- 高超声速流动
- 激波捕捉

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#ensemble-Kalman-filter #level-set #data-assimilation #compressible-flow #shocks
