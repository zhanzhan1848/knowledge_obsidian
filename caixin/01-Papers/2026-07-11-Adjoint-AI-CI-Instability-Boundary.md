# 2607.08305 - Tracking the Boundary Between Absolute/Convective Instability Using Adjoint Equations

## 论文信息
- **arXiv**: [2607.08305](https://arxiv.org/abs/2607.08305)
- **作者**: Yue Xiao, Hui Li, Zijing Ding
- **提交日期**: 2026-07-09
- **字数**: 未提供
- **DOI**: 10.48550/arXiv.2607.08305

## 关键词
- Absolute/Convective instability (AI/CI)
- Adjoint equations
- Hydrodynamic stability
- Orr-Sommerfeld equation
- Pseudo-arclength continuation
- Saddle-node bifurcation
- Ginzburg-Landau equation
- Free-surface film
- Oldroyd-B fluid

## 研究背景
确定绝对/对流不稳定(AI/CI)边界传统上需要在复波数平面进行重复的鞍点搜索，然后在物理参数空间扫描定位零绝对增长率。对于大型非正规特征值问题，这种嵌套计算代价高昂且对模态分支关联敏感。

## 核心创新点
1. **直接连续方法**: 开发了频率仿射广义特征值问题中性 stationary-saddle 边界的直接连续方法
2. **伴随可解性残差**: 将零群速度条件表达为伴随可解性残差
3. **联合求解**: 与直接和伴随特征值问题、复规范约束和中性增长条件联合求解
4. **缩放伪弧长连续**: 在组合状态-参数空间中追踪一维解流形，可穿越参数折叠而不切换物理连续变量
5. **计算效率提升**: 14.0-30.6倍wall time节省

## 方程与算法

### 核心方程
- **Ginzburg-Landau方程**: 解析解恢复验证
- **Gaussian wake Orr-Sommerfeld问题**: 与有限差分鞍点校正一致到~10^-8相对临界雷诺数
- **Oldroyd-B自由表面薄膜**: 发现中性鞍点流形的真实折叠和重入CI-AI-CI边界几何

### 算法流程
1. 构建零群速度条件的伴随可解性残差
2. 联合求解直接+伴随特征值问题 + 复规范约束 + 中性增长条件
3. 使用伪弧长连续追踪解流形
4. 穿越参数折叠

## 验证结果
- Ginzburg-Landau: 解析恢复 ✓
- Gaussian wake Orr-Sommerfeld: 10^-8精度 ✓
- Oldroyd-B film: 发现新物理（折叠和重入边界）✓

## URL
- Abstract: https://arxiv.org/abs/2607.08305
- PDF: https://arxiv.org/pdf/2607.08305
