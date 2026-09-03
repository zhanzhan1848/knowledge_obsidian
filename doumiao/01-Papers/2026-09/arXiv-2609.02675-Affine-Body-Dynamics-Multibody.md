# Projective Affine Body Dynamics for Multibody Systems

## 论文信息
| 属性 | 内容 |
|------|------|
| **arXiv ID** | 2609.02675 |
| **标题** | Projective Affine Body Dynamics for Multibody Systems |
| **分类** | cs.GR |
| **作者** | Xiaowei He et al. |
| **日期** | 2026-09-02 |
| **URL** | https://arxiv.org/abs/2609.02675 |

## 核心创新点

### 问题
多体系统广泛应用于机器人、娱乐和动画领域，非光滑接触处理、非线性柔性关节和并行化等挑战制约着仿真效率。

### 解决方案
提出 **Projective Affine Body Dynamics**：
- 将约束多体动力学重构为**变分形式（variational form）**
- 将系统视为通过 **Peridynamic bonds** 连接的**仿射体集合**
- 半隐式逐次代换法（semi-implicit successive substitution）求解非线性优化
- GPU高度并行，适合实时刚体-柔体交互仿真（接触、关节约束、摩擦）

### 关键技术
1. **仿射体动力学** - 统一模型：仿射体 + 约束 + 接触
2. **Peridynamic bonds** - 非局部相互作用建模
3. **变分形式** - 无需组装全局Hessian
4. **GPU并行** - 实时复杂交互仿真

## 技术要点
- **物理类型**: 多体动力学、接触、约束、摩擦
- **并行计算**: GPU高度并行
- **实时性**: 刚体+柔体实时交互

## 相关性分析
| 维度 | 评分 | 说明 |
|------|------|------|
| 流体仿真 | ⚠️ 低 | 多体动力学，非直接流体 |
| 物理仿真 | ⭐⭐⭐⭐ 高 | 接触/约束/摩擦通用框架 |
| 实时性 | ⭐⭐⭐⭐⭐ 极高 | GPU并行实时 |
| 动画/游戏 | ⭐⭐⭐⭐ 高 | 刚体-柔体交互 |

## 关键词
`多体动力学` `仿射体` `GPU并行` `接触处理` `实时仿真` `变分方法`

## 笔记日期
2026-09-03
