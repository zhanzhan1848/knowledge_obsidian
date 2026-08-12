# Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

## 论文信息
- **arXiv/TOG**: https://doi.org/10.1145/3811289
- **发表**: SIGGRAPH 2026 Honorable Mention, ACM Transactions on Graphics 45(4), July 2026
- **作者**: Bernhard Braun, Rene Winchenbach (TU Munich), Jan Bender (RWTH Aachen), Nils Thuerey (TU Munich)
- **项目主页**: https://ge.in.tum.de/2026/07/16/siggraph26-spatiotemporal-flip-for-liquid-simulations/
- **论文PDF**: https://ge.in.tum.de/download/ST-FLIP.pdf

## 核心创新

### 问题背景
大规模液体模拟中，FLIP 粒子在单步内移动过远会产生视觉瑕疵（时间步 Aliasing）

### 核心思想
**将粒子视为 4D 时空中的采样点**：
- 不仅在空间上抖动粒子，还在时间轴上随机化粒子位置
- 使用可分离的 4D 粒子到网格核函数进行粒子到网格沉积
- 作为 FLIP 风格求解器的时间反锯齿机制

### 技术特点
- 支持比 CFL 约束求解器大一个数量级的时间步长
- 保留详细的自由表面和两相流动结构
- 仅需一个额外粒子属性，无额外网格，无额外线性求解
- 可轻松集成到现有 FLIP/PIC/APIC 管线

## 渲染方法
- **类型**: 体积渲染 / 粒子系统
- **技术**: FLIP 粒子模拟 + 4D 时空采样
- **应用**: 自由表面、两相流

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐ (SIGGRAPH 2026 Honorable Mention)
- **风格化支持**: 通用

## 性能预期
- **帧率**: 生产级性能
- **GPU 需求**: 高端 GPU (多十亿粒子模拟)
- **加速比**: 2× ~ 8× 加速
- **内存占用**: 依赖粒子数量

## 实现建议
- **着色器复杂度**: 高 (4D 核函数)
- **管线要求**: 现有 FLIP 管线 + 时空扩展
- **推荐度**: ✅ (SIGGRAPH Honorable Mention)

## 关键参数
- 测试场景: 2 billion particles
- 有效网格分辨率: 3K × 3K × 2K
- 海洋漩涡 + 重力波叠加

## 应用场景
- 电影/视觉特效大规模液体模拟
- 实时预览 (大时间步)
- 多相流仿真
- 海面/海洋模拟

## 技术细节
```
ST-FLIP = FLIP + 4D space-time sampling
         ↓
    时间步扩展 (up to 10× larger)
         ↓
    保持视觉保真度
         ↓
    多 billion 粒子，单工作站
```

## 相关链接
- Thuerey Group: https://ge.in.tum.de/
- MantaFlow: https://mantaflow.com/ (开源流体求解器)

---

tags: #fluid-simulation #FLIP #spacetime #free-surface #SIGGRAPH2026 #honorable-mention #large-scale
