# A Residual Learning Approach for Unsteady Aerodynamic Load Prediction

**arXiv:** [2608.17894v1](https://arxiv.org/abs/2608.17894v1)  
**Published:** 2026-08-18  
**Category:** physics.flu-dyn  
**Tags:** #machine-learning #aerodynamics #LSTM #residual-learning #unsteady-aerodynamics #CFD

## 核心创新点

- 研究**残差学习**改善非稳态气动载荷预测的可行性
- 使用 **LSTM 神经网络**学习 CFD 解与 Wagner 函数解析预测之间的残差
- 在跨音速 NLR 7301 翼型 benchmark 上验证（包含激波运动）

## 方法论

### 基准物理模型
- **Wagner 函数**：解析非稳态气动模型
- LSTM 学习 CFD lift 系数与 Wagner 预测之间的**差值**

### 模型对比
| 模型 | 描述 |
|------|------|
| **残差模型** | 学习 Wagner 预测与 CFD 之间的误差 |
| **直接模型** | 直接预测 CFD lift 系数 |

## 关键发现

1. **残差模型最优输入**：与 Wagner 公式变量一致时效果最好
2. **泛化能力**：leave-one-out 和 leave-family-out 测试中残差模型泛化更好
3. 过度训练技巧（直接模型某些高频情况仍更准确）

## 结论

- 残差学习是增强经典低阶气动理论的模块化方法
- 物理基准移除结构化响应后，神经网络学习低方差修正更有效
- 对气弹应用具有实用价值

## 关键词
#LSTM #residual-learning #unsteady-aerodynamics #Wagner-function #transonic-flow #CFD-surrogate
