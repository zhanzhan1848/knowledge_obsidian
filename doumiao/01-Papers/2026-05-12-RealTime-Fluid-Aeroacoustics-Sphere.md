# Real-Time Inviscid Fluid Dynamics and Aero-acoustics on a Sphere

- **论文**: arXiv:2601.15982v1
- **发表**: 2026-01-22
- **类别**: 流体模拟 / 实时模拟
- **标签**: `fluid simulation` `sphere` `real-time` `aeroacoustics`

## 作者信息
Madhusraba Sinha, Jan Stratmann
Department of Mathematics, TU Dortmund University

## 核心创新

### 方法
1. **Closest Point Method (CPM)**: 在笛卡尔嵌入中求解表面 PDE，无需参数化
   - 将计算限制在球体周围窄带内
   - 将结果投影到局部切空间
2. **投影型 Navier-Stokes 求解器**
3. **Ffowcs Williams-Hawkings (FWH) 类比**: 用于声学模拟
4. **SDF 建模表面障碍**: 强制无滑移速度约束 + 伯努利压力调整

### 应用
- 球面实时流体动力学模拟
- 实时气动声学 (压力导数计算声源 → 频率/振幅调制 → 实时音频)
- 地球气象可视化、沉浸式游戏、教育工具

## 代码
- https://github.com/jstr01/RealTime-CFD-Acoustics-Sphere

## 与流体渲染的关联
🩸 **流体模拟** - 球面流体模拟方法可用于 ocean rendering (球形行星海洋)；实时气动声学与游戏流体效果相关

---

*笔记整理: 豆苗 @ 2026-05-12*