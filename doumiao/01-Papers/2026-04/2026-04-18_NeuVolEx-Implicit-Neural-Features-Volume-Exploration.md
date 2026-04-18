# NeuVolEx: Implicit Neural Features for Volume Exploration

**arXiv**: [2604.11172](https://arxiv.org/abs/2604.11172)
**时间**: 2026-04-14
**类别**: cs.GR, cs.CV
**状态**: Under review
**日期**: 2026-04-18

---

## 核心问题

Direct Volume Rendering (DVR) 的目标是帮助用户识别和检查体数据中的 ROI（感兴趣区域），而有效的特征表示对 ROI 分类和聚类至关重要。

**现有方法局限**:
- 显式局部特征表示：难以捕捉更广泛的几何模式和空间相关性
- 隐式卷积特征表示：对实际用户监督有限的情况下不能保证鲁棒性能

---

## 核心创新：NeuVolEx

将 INR (Implicit Neural Representation) 的角色从**体积压缩**扩展到**体积探索**。

### 关键技术

#### 1. 结构编码器 (Structural Encoder)
- 为 base INR 增加结构编码器
- 改善空间连贯性以支持 ROI 表征

#### 2. 多任务学习方案
- INR 训练期间学习到的特征表示作为体积探索的鲁棒基
- 适应性特征用于探索任务

#### 3. 两大验证任务
- **图像传递函数 (TF) 设计**：稀疏用户监督下精确 ROI 分类
- **视点推荐**：无监督聚类识别紧凑互补视点

---

## 技术细节

### 框架
```
Volume Input → Base INR + Structural Encoder → Feature Fields
                                              ↓
              Multi-task Learning ← ROI Classification
                                              ↓
              Unsupervised Clustering ← Viewpoint Recommendation
```

### INR 特征作为探索基础
- 传统 INR 用于压缩，但忽略训练期间学到的特征
- NeuVolEx 利用这些隐式特征进行 ROI 表征
- 比纯输出的方法更具空间连贯性

### 传递函数设计
- 稀疏用户标注 → 精确 ROI 分类
- 比传统方法更少用户输入

### 视点推荐
- 无监督聚类识别紧凑互补视点
- 揭示不同 ROI 簇
- 帮助用户全面理解体积数据

---

## 关键公式/概念

1. **Feature Field Augmentation**: INR 训练期间注入结构先验
2. **Multi-task Learning**: 压缩 + ROI 表征联合优化
3. **Sparse Supervision**: 少量标注 → 精确分类

---

## 实验验证

### 数据集
- 多种模态的体积数据
- 不同 ROI 复杂度

### 任务
1. Image-based TF Design（传递函数设计）
2. Viewpoint Recommendation（视点推荐）

### 结果
- 有效性：超越先验方法的准确率
- 可用性：稀疏用户监督下精确 ROI 分类

---

## 流体渲染价值

### INR 在流体中的应用
- Neural VDB / Neural Fluid 压缩已有先例
- NeuVolEx 扩展了 INR 的应用场景

### 潜在应用
1. **流体体积数据探索**：烟雾/火焰体积数据的快速 ROI 标注
2. **传递函数设计**：定义流体密度/温度等物理量的可视化映射
3. **视点推荐**：为流体模拟生成最佳可视化视点

### 技术借鉴
- INR 特征用于探索 → 可迁移到流体体积压缩+探索一体化
- 多任务学习 → 流体参数回归 + 可视化联合学习

---

## 与流体渲染的关系

| 方面 | 关系 |
|------|------|
| 体积渲染 | 直接应用 (DVR) |
| 烟雾渲染 | 间接 (体积数据探索方法) |
| INR/压缩 | 直接相关 (Neural VDB 类比) |
| 传递函数 | 直接相关 (流体物理量映射) |

---

## 参考价值

- ⭐⭐⭐ 体积渲染研究者必读
- ⭐⭐ 流体模拟可视化可参考
- ⭐⭐ INR+流体交叉领域前沿

---

*由 doumiao (豆苗) 整理 | 2026-04-18*
