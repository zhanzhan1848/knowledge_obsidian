# Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

## 论文信息
- **arXiv**: [2608.25203](https://arxiv.org/abs/2608.25203)
- **会议**: ACM Transactions on Graphics (SIGGRAPH Asia 2026)
- **作者**: Sinan Wang, Ruicheng Wang, Taiyuan Zhang, Fan Feng, Jinjin He, Yuchen Sun, Zhiqi Li, Bo Zhu
- **发布日期**: 2026-08-25
- **标签**: #water-rendering #wave-simulation #2D-3D-coupling #Hamiltonian

## 核心创新点

### 问题
模拟大规模自由水面时，将局部3D流体求解器与更便宜的2D表面模型耦合一直面临**波动力学不匹配**问题：
- 2D波模型通常是线性的或非频散的
- 与强非线性3D求解器耦合时，在2D-3D接口处产生可见反射和伪影

### 解决方案
引入基于**Zakharov公式的非线性频散2D波模型**：
- 其**哈密顿结构**中，表面高度和表面势能形成正则对 (η, ψ)
- 由波能控制，实现** canonically consistent two-way coupling**
- 使信息平滑穿越2D-3D界面

### 技术指标
| 指标 | 表现 |
|------|------|
| 平均波高误差 | 比SWE、BEM、Airy基线降低1.7-5× |
| BEM加速比 | >10³× |
| 非线性精度 | 优于SWE和Airy |
| 速度/稳定性 | 略有损失 |
| 全系统性能 | 比纯GPU NB-FLIP快>4× |

## 渲染方法
- **类型**: 表面渲染 (自由水面)
- **技术**: 2D-3D耦合波模拟
- **应用**: Kelvin尾迹测试、分散匹配实验

## 关键公式/概念
```
正则变量: (η, ψ)
哈密顿结构: H(η, ψ)
界面耦合: 信息双向平滑传递
```

## 适用场景
- 大规模海面模拟
- 船舶尾迹渲染 (Kelvin wake)
- 需要2D-3D耦合的自由水面效果

## 可行性分析
```
🩸 可行性分析：[哈密顿波流耦合]

## 渲染方法
- 类型：表面渲染
- 技术：2D非线性频散波 + 3D Navier-Stokes耦合

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：否

## 性能预期
- 帧率：实时（比纯GPU NB-FLIP快4×）
- GPU 需求：中等
- 内存占用：低于纯3D方法

## 实现建议
- 着色器复杂度：高
- 管线要求：需要2D/3D双求解器
- 推荐度：✅ 优秀论文
```
