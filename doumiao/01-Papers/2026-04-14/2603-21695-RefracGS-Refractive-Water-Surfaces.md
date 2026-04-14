# RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing

## 论文信息
- **arXiv ID**: 2603.21695v1
- **作者**: Yiming Shao et al.
- **发表日期**: 2026-03-23
- **分类**: cs.CV / cs.GR
- **PDF**: https://arxiv.org/pdf/2603.21695v1
- **项目主页**: https://yimgshao.github.io/refracgs/

## 研究领域
- [[水面渲染]]
- [[折射渲染]]
- [[3D Gaussian Splatting]]
- [[新型视图合成]]

## 核心创新点

### 问题
通过非平面折射表面进行新颖视图合成（NVS）面临严重、空间变化的光学畸变挑战。NeRF 和 3DGS 等方法假设直线光线传播，在折射条件下失效，导致明显伪影。

### 方法：RefracGS 框架
1. **折射边界解耦**: 将折射表面与目标物体显式解耦
2. **神经高度场**: 使用神经高度场建模折射表面，捕捉波浪几何
3. **3D 高斯场**: 底层场景使用 3D 高斯场表示
4. **折射感知高斯光线追踪**: 使用斯涅尔定律精确计算非线性光线轨迹
5. **端到端联合优化**: 同时优化折射表面和底层高斯场

### 技术特点
- 15x 训练加速
- 实时渲染 200 FPS
- 高保真 NVS 和视图一致表面恢复
- 支持合成和真实复杂波浪场景

## 渲染方法
- **类型**: 表面渲染 + 体积渲染
- **技术**: 3D Gaussian Splatting + Ray Tracing + Neural Height Field + Snell's Law Refraction

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 待定

## 性能预期
- **帧率**: 200 FPS (实时渲染)
- **GPU 需求**: 中等
- **内存占用**: 待定

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 3DGS 管线 + 自定义光线追踪
- **推荐度**: ✅ 优秀的水面折射渲染方案

## 关键公式
- 斯涅尔定律 (Snell's Law): $n_1 \sin\theta_1 = n_2 \sin\theta_2$
- 折射感知高斯光线追踪

## 相关工作
- NeRF (Neural Radiance Fields)
- 3D Gaussian Splatting (3DGS)
- Refractive Novel View Synthesis
- Neural Height Fields

## 待深入
- [ ] 查看项目主页演示效果
- [ ] 分析 RefracGS 与现有 3DGS 管线的集成方式
