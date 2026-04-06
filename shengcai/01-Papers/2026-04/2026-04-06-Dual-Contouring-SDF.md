# Dual Contouring of Signed Distance Data

## 元信息
| 标题 | Dual Contouring of Signed Distance Data |
| 作者 | Xiana Carrera |
| 链接 | [arXiv:2604.00157](https://arxiv.org/abs/2604.00157) |
| 日期 | 2026-03-31 |
| 标签 | #渲染 #网格重建 #SDF #DualContouring |

## 核心贡献
1. 从离散采样的 SDF 数据重建显式多边形网格
2. 特别擅长恢复尖锐特征
3. 仅依赖离散 SDF 数据，无需梯度或训练

## 技术方案

### 方法
```python
# 基于传统 Dual Contouring of Hermite Data
# 设计和解决二次优化问题

# 优化目标
- 在规则网格的每个单元格中最佳放置网格顶点
- 仅使用离散采样的 SDF 数据
```

### 优势
- 不需要梯度信息
- 不需要任意函数访问
- 不需要大规模数据集训练
- 在中高分辨率上达到 SOTA

## 实验结果
| 分辨率 | 质量 |
|--------|------|
| 中等 | SOTA |
| 高 | SOTA |

## 应用
- 3D 建模
- 设计
- 表面重建

## 标签
#网格重建 #SDF #DualContouring #表面重建
