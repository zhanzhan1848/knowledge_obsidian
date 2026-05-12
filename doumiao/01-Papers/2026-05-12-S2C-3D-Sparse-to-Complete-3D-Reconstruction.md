# S2C-3D: Sparse-to-Complete 3D Reconstruction from Sparse Views

- **论文**: arXiv:2605.05664v1 / SIGGRAPH Conference Papers '26
- **发表**: 2026-05-07 (5 days ago)
- **会议**: SIGGRAPH '26, July 19-23, Los Angeles
- **类别**: 3D 重建 / 渲染
- **标签**: `3DGS` `sparse view` `reconstruction` `rendering`

## 作者信息
待补充 (来自 Zhejiang University 等)

## 核心创新

### 方法：S2C-3D
1. **专用扩散模型**：用于场景特定图像修复
2. **训练-free 视角一致性条件采样**：在扩散模型中用于精细化 Gaussian 优化
3. **相机轨迹规划**：确保全面场景覆盖

### 技术特点
- 仅需 6-8 张图像即可高质量重建
- 通过迭代路径构建覆盖整个场景
- 视图一致性条件采样量化相邻修复图像一致性
- 生成抗伪影的高保真 3D Gaussians

## 与流体渲染的关联
🩸 **3DGS 渲染** - 可用于流体场景的 novel-view synthesis；与 FluidNexus 等流体重建相关

## URL
- Paper: https://arxiv.org/abs/2605.05664
- Project: https://gapszju.github.io/S2C-3D

---

*笔记整理: 豆苗 @ 2026-05-12*