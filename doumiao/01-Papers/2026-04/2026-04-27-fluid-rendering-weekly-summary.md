# 🌊 流体渲染周报 - 2026年4月27日

## 📅 搜索时间
- 搜索范围：最近24小时 arXiv cs.GR + SIGGRAPH/SIGGRAPH Asia 会议

---

## 🔍 本期发现

### SIGGRAPH Asia 2025 流体相关论文

#### 1. Implicit Position-Based Fluids
- **作者**: Elie Diaz, Jerry Hsu, Eisen Montalvo-Ruiz, Chris Giles, Cem Yuksel
- **会议**: SIGGRAPH Asia 2025
- **类别**: 粒子流体模拟
- **技术**: 位置动力学（PBD）的隐式求解器，用于流体模拟
- **URL**: https://dblp.org/db/conf/siggrapha/siggrapha2025.html
- **代码**: 待查

**核心创新**:
- 改进了位置动力学方法的稳定性
- 支持更大的时间步长
- 保持了 PBD 的简单性和效率

---

#### 2. NeLiF: Neural Lighting Function Generation for Real-Time Indoor Rendering
- **作者**: Hongtao Sheng, Yuchi Huo, Chuankun Zheng, Guangzhi Han, Yifan Peng, Shi Li, Bin Zang, Hao Zhu, Rui Tang, Yiming Wu, Rui Wang, Hujun Bao
- **会议**: SIGGRAPH Asia 2025
- **类别**: 神经渲染 / 光照
- **URL**: https://dblp.org/db/conf/siggrapha/siggrapha2025.html

**核心创新**:
- 实时室内渲染的神经光照函数生成
- 可能间接应用于流体渲染的光照

---

### SIGGRAPH 2023 Talks 火焰渲染论文

#### 3. Singed Silhouettes and Feed Forward Flames: Volumetric Neural Style Transfer for Expressive Fire Simulation
- **作者**: Paul Kanyuk, Vinicius C. Azevedo, Raphael Ortiz, Jingwei Tang
- **会议**: SIGGRAPH 2023 Talks
- **类别**: 体积渲染 / 火焰风格化
- **技术**: 体积神经风格迁移

**核心创新**:
- 神经风格迁移应用于火焰体积渲染
- 支持表达性的火焰模拟
- 可用于艺术化的火焰效果

**关键词**: Fire Simulation, Volumetric Rendering, Neural Style Transfer

---

### JCGT 屏幕空间折射与焦散

#### 4. Ultra-fast Screen-Space Refractions and Caustics via Newton's Method
- **期刊**: Journal of Computer Graphics Techniques (JCGT)
- **卷号**: Vol. 15, No. 1, 2026
- **URL**: https://jcgt.org/published/0015/01/03/
- **类别**: 实时渲染 / 水面渲染

**核心创新**:
- 用 Newton 法替代 ray marching 求解屏幕空间折射
- 快速收敛，仅需少量迭代
- 同时加速屏幕空间焦散的计算

**技术细节**:
- 避免传统 ray marching 的高开销
- 适用于实时水体的折射效果

---

## 📊 分类统计

| 类别 | 数量 |
|------|------|
| 粒子流体 (PBD/SPH) | 1 |
| 火焰渲染 | 1 |
| 水面渲染 | 1 |
| 神经渲染 | 1 |
| **总计** | **4** |

---

## 🎯 下一步关注

1. 位置动力学隐式求解器的最新进展
2. 神经风格迁移在流体渲染中的应用
3. 屏幕空间方法在实时流体渲染中的扩展

---

## 📚 相关资源

- arXiv cs.GR: https://arxiv.org/list/cs.GR/recent
- DBLP SIGGRAPH Asia 2025: https://dblp.org/db/conf/siggrapha/siggrapha2025.html
- Graphics Programming Weekly: https://www.jendrikillner.com/

---

*报告生成时间: 2026-04-27 UTC*
*下次自动更新: 2026-04-28 02:00 UTC*
