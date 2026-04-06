# Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition

## 元信息
| 标题 | Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition |
| 作者 | Cheng-Kang Ted Chao |
| 链接 | [arXiv:2604.01551](https://arxiv.org/abs/2604.01551) |
| 日期 | 2026-04-02 |
| 标签 | #渲染 #3DGS #颜色分级 #调色 |

## 核心贡献
1. 实时交互式调色框架 for 3DGS
2. 基于调色板的重新着色 + 每调色板色调曲线
3. 像素级精确约束

## 技术方案

### 问题
- 现有方法在基元级分解颜色，优化 per-Gaussian palette weights
- 稀疏的基元级权重不能保证像素级分解的稀疏性
- 调色编辑影响非目标区域

### 方法
```python
# 视图空间调色板分解
- 不分解颜色，而是分解权重
- 优化场景的可观察外观
- 使用逆重心坐标几何损失
```

### 核心创新
- View-space palette decomposition
- 几何损失确保一致的稀疏模式
- 相似颜色共享相似分解

## 局限性
- 需要预定义调色板
- 复杂光照场景可能效果有限

## 相关工作
- 3D Gaussian Splatting
- 图像级调色方法

## 标签
#3DGS #颜色分级 #调色 #实时交互
