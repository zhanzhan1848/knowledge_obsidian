# Mollified-sharp decomposition: a probabilistic regularization of parametric POD for shock-bearing flows

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-17
- **类别**: physics.flu-dyn, physics.comp-ph
- **作者**: Oliver T. Schmidt
- **关键词**: reduced-order model, POD, shock regularization, probabilistic method, transonic airfoil

## 核心创新点

### 1. Mollified-Sharp 分解方法
将每个检测到的激波位置作为具有指定概率密度函数的随机变量处理：
- 对人工分布求平均，将局部压力变化替换为平滑过渡
- 空间范围由密度宽度而非直接滤波设置

### 2. 数学框架
- 快照精确分解为正则化 mollified 场 + 局部 sharp 校正
- 概率构造和精确加性分裂

### 3. 实现细节
- 校准指示器检测激波
- 紧支撑 Wendland 核进行 mollify
- 峰归一化权重定义质心、主轴和局部对齐域尺度

### 4. POD-GPR 模型
- 分别对 mollified 场和对齐校正建模
- 额外回归用于激波存在和对齐

### 5. 验证结果
- 测试集相对 L² 压力误差平均降低 31.2%
- 表面压力系数误差降低 33.2%
- 改进的激波位置和压力变化预测
- 在线评估时间中位数增加 2.24 倍

## 应用
- 跨音速翼型压力数据
- 多相流中的移动材料界面

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#reduced-order-model #POD #shock-regularization #probabilistic #transonic-flow
