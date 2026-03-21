---
tags: [几何, 3D重建, Gaussian-Splatting, 渲染优化, NPU]
arXiv: 2603.18707
date: 2026-03-20
---

# Gaussian Splatting with Polynomial Kernels

## 基本信息
- **标题**: Gaussian Splatting with Polynomial Kernels
- **副标题**: From ex(p) to poly
- **arXiv**: [2603.18707](https://arxiv.org/abs/2603.18707)
- **作者**: Joerg H. Mueller, et al.
- **提交日期**: 2026-03-19
- **分类**: cs.LG, cs.CV, cs.GR

## 核心方法

### 问题定义
现有 3D Gaussian Splatting (3DGS) 的各种核函数修改虽然提升了性能，但与原始高斯核优化的数据集**不兼容**，阻碍了广泛采用。

### 技术方案
提出**多项式核近似 + ReLU** 替代原始指数核：

#### 1. 核函数替换
```
原始: exp(-α·d²)
新方案: ReLU(多项式近似(-α·d²))
```

#### 2. 关键优势
- ✅ **兼容性**: 与现有数据集完全兼容
- ✅ **计算效率**: 更激进的高斯剔除（culling）
- ✅ **性能提升**: 4-15% 加速
- ✅ **质量保持**: 图像质量影响可忽略

#### 3. NPU 优化潜力
- 多项式计算更适合 NPU 硬件
- 减少指数运算（expensive on NPU）

### 算法复杂度
- **时间复杂度**: 
  - 原始: O(n·exp) - n 为高斯点数量
  - 新方案: O(n·poly) - 多项式计算更快
- **空间复杂度**: O(n) - 与原始相同
- **加速比**: **1.04x - 1.15x** (4-15%)

## 实验结果

### 性能表现
- **加速**: 4-15%（不同实现）
- **图像质量**: 影响可忽略（PSNR/SSIM 基本持平）
- **兼容性**: 与原始 3DGS 数据集完全兼容

### 数学分析
- 论文提供了详细的数学分析
- 多项式近似的误差分析
- ReLU 对剔除策略的影响

## 创新点

1. ✅ **兼容性优先** - 保持与现有数据集的兼容性
2. ✅ **简单有效** - 仅替换核函数，无架构改动
3. ✅ **NPU 友好** - 为 NPU 部署优化
4. ✅ **理论支撑** - 提供详细数学分析

## 局限性

- 论文未明确提及（需进一步阅读全文）
- 可能不适用于所有 3DGS 变体

## 可行性分析

### 实现难度
- **算法复杂度**: **低**
- **数值稳定性**: 良好
- **依赖项**: 
  - 3D Gaussian Splatting 基础框架
  - 标准深度学习框架

### 推荐结论
✅ **强烈推荐实现**

**理由**:
- **实现简单** - 仅替换核函数
- **收益明显** - 4-15% 免费加速
- **零成本** - 无质量损失，无兼容性问题
- **NPU 优化** - 为移动端/边缘设备部署提供优势

**实现步骤**:
1. 找到 3DGS 代码中的核函数定义
2. 将 `exp(-α·d²)` 替换为 `ReLU(poly(-α·d²))`
3. 测试性能和质量

## 开源实现

- **代码**: 待发布（关注 arXiv）
- **相关库**: 
  - 3DGS: https://github.com/graphdeco-inria/gaussian-splatting
  - 各种 3DGS 实现

## 数学细节

### 多项式近似
- **目标**: 近似 exp(-x)
- **方法**: 泰勒展开或其他多项式拟合
- **精度**: 需要平衡精度与计算效率

### ReLU 作用
- **目的**: 更激进的剔除
- **原理**: 负值直接置零，避免无效计算
- **效果**: 加速渲染

## 技术标签

`#3D重建` `#Gaussian-Splatting` `#渲染优化` `#NPU优化` `#性能优化`

## 相关笔记

- [[3D Gaussian Splatting]]
- [[Matryoshka Gaussian Splatting]]
- [[实时渲染优化]]
- [[NPU 加速]]

## 引用

```bibtex
@article{mueller2026polynomial,
  title={Gaussian Splatting with Polynomial Kernels},
  author={Mueller, Joerg H. and others},
  journal={arXiv preprint arXiv:2603.18707},
  year={2026}
}
```

---
**分析日期**: 2026-03-21  
**分析者**: 娃娃菜 (Wawaicai)  
**推荐度**: ⭐⭐⭐⭐⭐ (5/5)  
**实现难度**: ⭐ (1/5 - 极简单)
