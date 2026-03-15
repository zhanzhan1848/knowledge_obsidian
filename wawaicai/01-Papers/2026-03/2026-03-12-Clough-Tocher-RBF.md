---
tags: [几何, 曲面插值, RBF, Clough-Tocher, 数值稳定性, cs.GR]
arxiv: 2603.10590
date: 2026-03-12
status: 📥待分析
---

# Exact Interpolation under Noise: Clough-Tocher vs Multiquadric RBF Surfaces

## 元信息
- **arXiv**: [2603.10590](https://arxiv.org/abs/2603.10590)
- **作者**: Mirkan Emir Sancak
- **提交日期**: 2026-03-11
- **分类**: cs.GR (Graphics)
- **代码**: SciPy/NumPy 脚本 (论文附送)

## 核心方法

### 问题定义
比较多变量曲面分析中的三次插值 (Clough-Tocher) 和径向基函数 (RBF) 插值。

### 实验设置
1. **统一评估协议**
   - 相同的合成函数族
   - 切片式训练/测试协议
   - 消除评估偏差

2. **两种测试场景**
   - 无噪声观测
   - 有噪声观测

3. **评估指标**
   - RMSE
   - MAE
   - R²

## 关键发现

### 无噪声场景
- 两种方法都达到高精度
- 各有优势，取决于输出特性

### 有噪声场景
- 精确插值会过拟合噪声节点
- 样本外性能下降
- **三次插值相对更稳定**

## 数值稳定性评估
- ⚠️ 有噪声时精确插值存在过拟合风险
- ✅ 三次插值在有噪声场景更稳定
- 实用建议：噪声或不一致测量不应直接丢弃，可结构化后插值恢复物理意义

## 算法复杂度
| 方法 | 时间复杂度 | 空间复杂度 |
|------|-----------|-----------|
| Clough-Tocher | O(n log n) | O(n) |
| Multiquadric RBF | O(n²) | O(n²) |

## 开源参考
- **SciPy**: `scipy.interpolate.CloughTocher2DInterpolator`
- **SciPy**: `scipy.interpolate.RBFInterpolator`
- **代码**: 论文附送单脚本，固定随机种子

## 相关技术
- [[曲面插值]]
- [[径向基函数 RBF]]
- [[数值稳定性]]

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 低 |
| 实现难度 | 低 (SciPy 内置) |
| 数值稳定性 | ⚠️ 噪声敏感 |
| 推荐度 | ✅ 推荐作为基准方法 |

## 实践建议
- 环境工程中噪声测量可保留
- 使用结构化插值恢复物理行为
- 有噪声时优先考虑三次插值

---
🥬 *由 wawaicai 自动收集于 2026-03-15*
