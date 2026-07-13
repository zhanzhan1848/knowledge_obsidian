---
tags: [渲染, 3DGS, 修复, 2026]
date: 2026-07-13
status: 已读
---

# Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting

## 基本信息
- **作者**: Kristof Overdulve et al.
- **发表**: arXiv:2607.05598 (cs.GR)
- **链接**: [arXiv](https://arxiv.org/abs/2607.05598)
- **提交历史**: v1: Jul 6 2026

## 核心贡献
1. 提出SSA-3DGS: 无监督去除3DGS屏幕空间伪影框架
2. 联合优化3D场景和2D可学习覆盖层
3. 利用跨视图几何一致性分离静态伪影和3D几何
4. 在合成和真实数据集上验证

## 技术方案
### 问题背景
- 3DGS依赖干净、多视角一致、有位姿的输入图像
- 屏幕空间伪影: 固定在2D平面而非3D世界的遮挡
  - 传感器缺陷、环境遮挡(雨/泥)
  - 拍摄遮挡(手指/仪表盘)
  - 数字覆盖(水印/UI)

### 核心思想
```
输入:  corrompoted images + camera poses
         ↓
3DGS + 可学习2D overlay联合优化
         ↓
利用几何一致性分离:
  - 静态伪影 → 2D overlay
  - 3D几何 → 干净场景
```

### 方法流程
```
1. 标准3DGS训练
2. 添加可学习2D overlay
3. 跨视图几何一致性约束
4. 联合优化分离两者
```

## 实验结论
- 合成腐败: 重建保真度提升至9dB PSNR
- 真实数据集: 有效去除各种屏幕空间伪影
- 忠实保留腐败伪影用于后续分析

## 可行性分析
- **创新性**: ⭐⭐⭐⭐ - 针对特定问题的高效解决方案
- **实用性**: ⭐⭐⭐⭐ - 实际采集数据处理
- **难度**: 中 - 需3DGS基础
- **推荐度**: ⭐⭐⭐⭐ - 对实际应用有价值

## 相关工作
- 3D Gaussian Splatting
- 神经渲染去噪
- 场景重建

## 链接
- 论文: https://arxiv.org/abs/2607.05598
