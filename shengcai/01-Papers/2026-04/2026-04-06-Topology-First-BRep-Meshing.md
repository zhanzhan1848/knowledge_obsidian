# Topology-First B-Rep Meshing

## 元信息
| 标题 | Topology-First B-Rep Meshing |
| 作者 | YunFan Zhou |
| 链接 | [arXiv:2604.02141](https://arxiv.abs/2604.02141) |
| 日期 | 2026-04-02 |
| 标签 | #渲染 #网格生成 #CAD #拓扑 |

## 核心贡献
1. 将 B-Rep 拓扑作为网格过程的不变量
2. 允许单一用户定义容差控制网格与曲面的偏差
3. 输出网格在算法层面拓扑正确

## 技术方案

### 问题
- B-Rep 转网格过程脆弱
- 高阶曲面和曲线交集近似到低阶基元
- 现有方法通过启发式特征合并和修复策略

### 方法
```python
# 拓扑优先方法
B-Rep topology = invariant of meshing process

# 关键创新
- 拓扑作为不变量
- 单一容差参数控制几何精度
- 几何保真度随容差增加而降低
```

## 实验结果
- 在 ABC 和 Fusion 360 数据集的数千个真实 CAD 模型上评估
- 包括在标准网格工具上失败的情况
- 可靠的网格生成

## 相关工作
- Dual Contouring
- B-Rep meshing

## 标签
#网格生成 #CAD #拓扑 #DualContouring
