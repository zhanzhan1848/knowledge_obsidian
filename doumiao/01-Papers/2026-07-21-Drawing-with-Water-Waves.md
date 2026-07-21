# Drawing with water waves

## 论文信息
- **arXiv**: [2607.13691](https://arxiv.org/abs/2607.13691)
- **作者**: Taiga Kanehira et al.
- **领域**: 流体模拟 / 水面渲染
- **发表时间**: 2026-07-15
- **主题**: 波浪场控制 / SPH 模拟

## 核心创新

### 研究问题
如何用确定性方法在水面生成任意 2D 曲线和 3D 立体形状？

### 解决思路
1. **Bézier 曲线参数化** - 将目标形状转换为参数化曲线
2. **等弧长采样** - 确保波浪聚焦点均匀分布
3. **IAC (Iterative Amplitude Correction) 算法** - 迭代校正振幅，消除波高过冲
4. **多向瞬时聚焦波** - 实现精确空间叠加

### 技术验证
- 线性波理论验证
- **SPH 模拟** - 成功复现 2D 字符和 3D 人脸
- FloWave 圆形波浪池物理实验 - 验证 2D 星形和 3D 金字塔

## 渲染方法
- **类型**: 表面渲染 / 水面波浪
- **技术**: SPH (Smoothed Particle Hydrodynamics)
- **模拟规模**: 168 个造波器围绕圆形水池

## 视觉质量
- 逼真度: ⭐⭐⭐⭐ (需进一步整合非线性波理论)
- 风格化支持: 否

## 性能预期
- 帧率: N/A (离线模拟)
- GPU 需求: 中等 (SPH 模拟)

## 适用场景
- 海洋工程波浪场控制
- 艺术装置 / 波浪投影映射
- 游戏/影视水面特效

## 关键公式/方法
- Tait 方程联系压力与密度 (WCSPH)
- 弱可压缩 SPH (Weakly Compressible SPH)
- 迭代振幅校正 (IAC)

## 相关链接
- arXiv: https://arxiv.org/abs/2607.13691
- PDF: https://arxiv.org/pdf/2607.13691

## 标签
#water-rendering #wave-simulation #SPH #fluid-rendering #ocean
