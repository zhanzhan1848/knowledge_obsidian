# 3D Smoke Scene Reconstruction with Vision Priors (Smoke-GS)

- **论文**: arXiv:2604.05687v2
- **发表**: 2026-04-16 (3 weeks ago)
- **类别**: 烟雾渲染 / 3D Gaussian Splatting
- **标签**: `smoke rendering` `3DGS` `neural rendering` `scattering media`

## 作者信息
Xinye Zheng, Fei Wang, Yiqi Nie, Kun Li, Junjie Chen, Jiaqi Zhao, Yanyan Wei, Zhiliang Wu
Hefei University of Technology, AI Institute of Hefei, UAE University, NTU Singapore

## 核心创新

### 问题
- 烟雾环境中 3D 重建困难：散射效应、视角依赖外观变化、跨视角一致性严重下降
- 烟雾引入视角相关光学衰减、非均匀对比度降低、密集结构遮挡

### 方法：Smoke-GS
1. **图像增强**: 使用 Nano-Banana-Pro 增强烟雾降质图像
2. **烟雾感知 3DGS**: 引入轻量级视角相关介质分支 (view-dependent medium branch)
   - Smoke-GS Encoder: 编码像素射线方向
   - Smoke Medium MLP: 预测介质参数
3. **保留 3DGS 渲染效率**同时提高对烟雾降质的鲁棒性

### 技术细节
- 介质分支建模烟雾导致的方向依赖外观变化
- 将介质项与 3D Gaussian 渲染融合产生最终输出

## 相关工作
- NTIRE 2026 3D Restoration and Reconstruction Challenge - Track 2 专注于烟雾场景 3D 重建
- 集成视觉 priors 到 3D 场景建模
- 结合微分渲染与物理散射模型

## 评估
- 在真实烟雾环境中生成一致且视觉清晰的 novel views
- 比传统方法更好地处理多视角不一致性和几何退化

## 与流体渲染的关联
🩸 **烟雾渲染** - 与体积渲染、体素/粒子烟雾模拟直接相关

## URL
- Paper: https://arxiv.org/abs/2604.05687
- Code: (待补充)

---

*笔记整理: 豆苗 @ 2026-05-12*