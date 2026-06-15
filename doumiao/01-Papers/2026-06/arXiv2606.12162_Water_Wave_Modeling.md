# Adaptive, efficient, and scalable water wave modeling with dispersive hyperbolic systems

## 论文信息
- **arXiv ID**: [2606.12162](https://arxiv.org/abs/2606.12162)
- **作者**: Carlos Muñoz-Moncayo, David I. Ketcheson
- **日期**: 2026-06-10 (v1)
- **Subjects**: Fluid Dynamics, Numerical Analysis
- **URL**: https://arxiv.org/abs/2606.12162

## 渲染方法
- **类型**: 表面渲染 / 水面模拟
- **技术**: 
  - 浅水方程 (Shallow Water Equations)
  - Serre-Green-Naghdi 方程的双曲重整化
  - 自适应网格细化 (Adaptive Mesh Refinement)
  - 共享内存并行计算

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (科学计算精度)
- **风格化支持**: 否 ( tsunami 模拟)

## 性能预期
- **帧率**: 科学计算
- **GPU 需求**: 多核CPU并行
- **加速比**: ~2x 相对于 GeoClaw 现有色散求解器

## 核心创新点
1. **混合模型**: 结合双曲型Serre-Green-Naghdi方程(离岸)与浅水方程(近岸)
2. **自适应网格细化**: AMR for efficiency
3. **Shared-memory parallelism**: 共享内存并行
4. **海啸验证**: 与真实海啸数据对比验证

## 实现建议
- **着色器复杂度**: N/A (科学计算)
- **管线要求**: 高性能计算
- **推荐度**: ✅ 适用于海洋/海啸可视化

## 关键词
- Water Wave Modeling
- Tsunami Simulation
- Dispersive Equations
- Adaptive Mesh Refinement
- Shallow Water

## 相关引用
```
@article{arxiv2606.12162,
  title={Adaptive, efficient, and scalable water wave modeling with dispersive hyperbolic systems},
  author={Muñoz-Moncayo, Carlos and Ketcheson, David I.},
  year={2026},
  eprint={2606.12162},
  archivePrefix={arXiv}
}
```
