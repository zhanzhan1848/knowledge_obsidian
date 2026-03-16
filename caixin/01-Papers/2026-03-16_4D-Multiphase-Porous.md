# Learning Pore-scale Multiphase Flow from 4D Velocimetry

**arXiv ID**: 2603.12516v1  
**发布日期**: 2026-03-12  
**链接**: https://arxiv.org/abs/2603.12516  
**PDF**: https://arxiv.org/pdf/2603.12516v1  

## 作者
- Chunyang Wang, Linqi Zhu, Yuxuan Gu, Robert van der Merwe, Xin Ju
- Catherine Spurin, Samuel Krevor, Rex Ying, Tobias Pfaff
- Martin J. Blunt, Tom Bultreys, Gege Wen

## 分类
- cs.LG (机器学习)
- physics.flu-dyn (流体动力学)

## 摘要
提出多模态学习框架，从时间分辨的四维(4D)显微测速测量中推断多相孔隙尺度流动。模型结合图网络模拟器（拉格朗日示踪粒子运动）和3D U-Net（体素化界面演化），实现从实验数据直接学习多相流动力学。

## 核心创新点
1. **多模态学习**: 图网络 + 3D U-Net 耦合
2. **实验驱动**: 从4D显微测速直接学习
3. **Haines跳跃捕获**: 捕获突变界面重排
4. **高效推理**: 将小时/天级DNS降至秒级

## 数值方法
- **拉格朗日示踪**: 图网络模拟器
- **界面演化**: 3D U-Net
- **边界约束**: 孔隙几何作为边界条件
- **迭代耦合**: 流速与多相界面预测

## 应用场景
- 地质CO₂封存
- 地下储氢
- 多孔介质流动

## 关键结果
| 指标 | 传统DNS | 学习代理 |
|------|---------|----------|
| 计算时间 | 小时~天 | 秒级 |
| 物理时间 | 秒级 | 秒级 |
| Haines跳跃 | ✅ | ✅ |

## 技术要点
- **毛细数**: $Ca \approx 10^{-6}$ (毛细主导)
- **训练**: 自回归训练
- **物理约束**: 孔隙几何边界约束

## 相关链接
- [[多相流]]
- [[多孔介质]]
- [[机器学习-CFD]]

## 标签
#多相流 #多孔介质 #机器学习 #图网络 #CO2封存 #储氢
