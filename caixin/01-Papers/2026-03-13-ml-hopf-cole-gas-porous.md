# A Machine Learning-Enhanced Hopf-Cole Formulation for Nonlinear Gas Flow in Porous Media

**arXiv**: [2603.11250](https://arxiv.org/abs/2603.11250)  
**作者**: Kalyana Babu Nakshatrala  
**提交日期**: 2026-03-11  
**分类**: math.NA, cs.LG, physics.flu-dyn

## 摘要
多孔介质气体流动的集成建模框架，结合 Klinkenberg 增强本构关系、Hopf-Cole 变换混合形式、共享主干神经网络和 DeepLS 求解器。

## 核心创新
1. **Hopf-Cole 变换**: 非线性方程线性化
2. **共享主干网络**: 同时预测压力和速度场
3. **DeepLS 求解器**: 深度最小二乘求解器
4. **逆建模**: 从有限观测估计渗透率和滑移参数

## Klinkenberg 效应
气体的压力依赖渗透率：
$$k_{\text{eff}} = k_0 (1 + \frac{b}{p})$$

## Hopf-Cole 变换
将非线性流动方程转化为与 Darcy 模型密切相关的等效线性系统。

## 框架组成
```
Klinkenberg 本构 → Hopf-Cole 变换 → 混合形式 → 共享主干 NN → DeepLS 求解器
```

## 收敛性分析
- 理论收敛性证明
- 数值收敛性验证
- 稳定性分析

## 应用场景
- 油藏性能预测
- 碳捕获与封存
- 燃料电池和电池

## 逆建模能力
- 压力依赖渗透率估计
- 滑移参数估计
- 从有限/间接观测恢复

## 数值结果
- 宽压力范围内准确恢复流动动力学
- 参数估计准确
- 稳健性和计算效率

## 相关概念
- [[多孔介质流动]]
- [[Klinkenberg 效应]]
- [[Hopf-Cole 变换]]
- [[物理信息神经网络]]

## 方法优势
- 避免非线性迭代
- 自然处理逆问题
- 紧密型储层适用

---
*检索日期: 2026-03-13*
