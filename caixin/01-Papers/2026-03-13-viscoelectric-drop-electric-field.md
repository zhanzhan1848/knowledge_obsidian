# On the Deformation of a Shear Thinning Viscoelastic Drop in a Steady Electric Field

## 元数据
- **arXiv ID**: 2603.11580
- **提交日期**: 2026-03-12
- **作者**: Sarika Shivaji Bangar, Gaurav Tomar
- **机构**: Indian Institute of Science, Bangalore
- **URL**: https://arxiv.org/abs/2603.11580
- **PDF**: https://arxiv.org/pdf/2603.11580

## 核心创新
使用开源求解器 Basilisk 研究 LPTT 粘弹性液滴在电场中的变形和破碎动力学。

## 关键技术点

### 本构模型
- **线性 Phan-Thien-Tanner (LPTT) 模型**
- 剪切稀化粘弹性流体

### 数值方法
- **求解器**: [[Basilisk]] 开源代码
- **参数空间**: 6 个特征区域 (PR_A+, PR_B+, PR_A-, PR_B-, OB+, OB-)

### 关键参数
- **σ_r**: 电导率比
- **ε_r**: 介电常数比
- **Ca_E**: 电毛细数
- **De**: Deborah 数

## 主要发现

### 区域特性
| 区域 | 行为 |
|------|------|
| PR_A-, PR_B-, OB+ | 近似牛顿行为 |
| PR_A+ | 长椭球 → 多叶状/破碎 |
| PR_B+ | 长椭球 → 锥形端 |
| OB- | 扁椭球 → 破碎 |

### 弹性效应
- 增加弹性 (提高 De) → 阻碍变形
- 非单调依赖: 低 De 增加，高 De 减小

## 应用领域
- 微流控
- 喷墨打印
- 电流体动力学

## 相关论文
- [[Basilisk 求解器]]
- [[LPTT 本构模型]]
- [[电液滴动力学]]

## 标签
#viscoelastic #electrohydrodynamics #drop-deformation #Basilisk #LPTT
