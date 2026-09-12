# A Conservative Hybrid Eulerian-Lagrangian Method with Persistent Structure Tracking for Multiscale Cavitation

**arXiv**: [2609.11776](https://arxiv.org/abs/2609.11776)  
**Authors**: Mahdi Lavari, Aswin Gnanaskandan  
**Category**: physics.flu-dyn  
**Published**: 2026-09-10

## 创新点

### 核心问题
多尺度空化中，已解算的蒸气结构用欧拉描述，未解算的气泡用拉格朗日描述。现有方法将过渡处理为局部几何操作，且每个时间步独立识别结构，无法利用时间历史。

### 关键创新
1. **持久结构追踪（Persistent Structure Tracking）**：在运行时通过连通分量标记检测蒸气结构，并跨处理器边界协调
2. **物理信息预测关联**：利用结构位置和大小的物理预测来关联连续观测，保持结构身份穿越破碎、合并、过渡
3. **守恒双向转移算子**：保持蒸气质量和线性动量，同时防止同一蒸气体积被双重表示

## 控制方程
- 欧拉框架：RANS/NS方程 + 空化模型（Rayleigh-Plesset类）
- 拉格朗日：球形气泡动力学（Keller-Miksis方程）
- 质量/动量守恒转移算子

## 数值方法
- **离散化**：有限体积法（Eulerian）+ 拉格朗日粒子追踪
- **结构检测**：连通分量标记（connected component labeling）
- **并行处理**：确定性跨processor协调程序
- **时间推进**：多尺度时间步

## 验证案例
1. 穿越碎裂、合并、近距离交叉的持久追踪
2. 重复表示切换的守恒验证
3. 质量/动量守恒检验
4. 确定性并行行为

## 计算成本
- 并行可扩展性依赖结构追踪通信
- 相比纯欧拉方法，降低了网格分辨率要求

## 相关方法
- [[VOF]] (Volume of Fluid) - 界面追踪
- [[Level Set]] - 界面捕捉
- 纯欧拉多相流方法

## 标签
#空化 #多相流 #欧拉-拉格朗日 #结构追踪 #守恒算法 #CFD
