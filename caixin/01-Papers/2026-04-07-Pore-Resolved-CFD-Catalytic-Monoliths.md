# Pore-Resolved CFD for Catalytic Porous Monoliths

## 论文信息

| 项目 | 内容 |
|------|------|
| **arXiv** | [2604.03514](https://arxiv.org/abs/2604.03514) |
| **作者** | Olivier Guévremont, Olivier Gazil, Federico Galli, Nick Virgilio, Bruno Blais |
| **日期** | 2026-04-03 |
| **期刊** | Submitted to Chemical Engineering Journal |
| **主题** | physics.flu-dyn |

## 研究背景

多孔单体（Porous monoliths）因其高比表面积、互联通道、热稳定性和机械鲁棒性而成为有前景的催化剂载体。然而，可调拓扑使设计复杂化：转化率和压降之间的权衡不能被孔隙率、比表面积或迂曲度等宏观描述符可靠地捕捉。

## 方法

### 孔解析计算流体动力学 (PRCFD)
- 在 micro-CT 重建的几何体中进行反应 PRCFD
- 校准 pseudo-heterogeneous eggshell 反应模型
- 验证跨样本和流速的迁移性

### 关键参数
- **Damköhler 数**: Da < 1（表面访问受限）
- **研究对象**: 钯纳米粒子涂覆的硅胶单体（对硝基苯酚还原）

## 核心发现

1. **表面访问界限（Surface-access-boundedness）**
   - 转换受流动分布不均和催化表面利用不完整限制
   - 即使在低 Da 数下也会发生

2. **拓扑比较**
   - 合成随机单体 vs 三周期最小表面（TPMS）结构
   - 在匹配孔隙率和表面积条件下，TPMS 可将泵功率降低一个数量级

3. **关键结论**
   - 在受表面访问限制的非均相系统中，反应器性能由结构依赖的表面可及性而非固有动力学或分子扩散决定

## 数值方法细节

- **几何获取**: microcomputed tomography
- **反应模型**: pseudo-heterogeneous eggshell
- **诊断指标**: 扩散率、反应动力学对转化的影响

## 应用价值

- 多孔反应器几何优化
- 催化效率与压降权衡设计
- 跨尺度从孔隙到反应器的诊断框架

---

## 相关研究

- [[多孔介质流动]]
- [[多相反应流]]
- [[CFD 模拟方法]]
