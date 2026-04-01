# Data-Informed Lifting Line Theory
**arXiv:** [2603.29051](https://arxiv.org/abs/2603.29051) | **分类:** physics.flu-dyn, cs.LG
**作者:** Arjun Sharma, Jonas A. Actor, Peter A. Bosler
**日期:** 2026-03-28 | **版本:** v1

---

## 研究背景与动机
- **经典方法:** 升力线理论 (LLT) 计算高效但精度有限，尤其在低展弦比、高后掠角时
- **问题:** 如何将高保真面元法 (panel method) 数据嵌入 LLT，保持计算效率
- **目标:** 数据驱动扩展 LLT 到更宽气动工况

## 方法论

### 神经网络架构
- **输入分支 1:** 展向配置点（Conv1D → 全连接层）
- **输入分支 2:** 全局几何/气动参数（攻角、弦长、扭转、后掠翼型分布）
- **双分支并行:** 分别处理局部展向信息和全局设计参数
- **输出:** LLT 修正量（corrections）

### 训练策略
- 高保真面元法仿真数据作为标签
- 学习 LLT 输出与真实流场的偏差
- 保留 LLT 的物理结构作为骨架

## 主要结果

### 预测精度
- 有效学习低展弦比和高后掠角的 **高阶三维效应**
- 展向升力和阻力分布预测与高保真模拟高度吻合
- **泛化能力:** 超出 LLT 适用区间和训练数据范围的机翼配置均表现良好

### 计算效率
- 推理成本与 LLT 同级别（毫秒级）
- 可嵌入气动优化循环和早期飞机设计流程

## 应用前景
- 早期飞机设计阶段的气动快速评估
- 螺旋桨性能预测扩展
- 气动优化设计中的嵌入式低阶模型

## 技术标签
#LiftingLineTheory #PanelMethod #NeuralNetwork #Aerodynamics #WingDesign #SurrogateModel #CFD #ArX:2603.29051

## 原文链接
- Abstract: https://arxiv.org/abs/2603.29051
- PDF: https://arxiv.org/pdf/2603.29051
