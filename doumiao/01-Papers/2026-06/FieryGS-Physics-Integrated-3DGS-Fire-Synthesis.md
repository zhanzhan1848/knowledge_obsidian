# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

**arXiv**: [2606.13465](https://arxiv.org/abs/2606.13465)  
**发表**: SIGGRAPH 2026  
**作者**: Qianfan Shen, Ningxiao Tao, Qiyu Dai, Tianle Chen, Minghan Qin, Yongjie Zhang, Mengyu Chu, Wenzheng Chen, Baoquan Chen

---

## 核心创新

### 问题
- 传统CFD和图形管线可以产生逼真的火焰效果
- 但依赖手工几何、专家调参
- 劳动密集型工作流，难以扩展到真实场景

### 方案
将物理信息集成到3D Gaussian Splatting中，合成真实场景中的逼真燃烧效果

### 关键洞察
- 3DGS已实现最先进的照片级渲染
- 但缺乏物理交互能力
- 将物理建模与3DGS场景重建结合

---

## 渲染技术

### 类型
- **体积/粒子混合渲染**

### 技术栈
- 3D Gaussian Splatting
- Physics-integrated optimization
- 真实场景火焰合成

### 创新点
- 将物理约束嵌入3DGS优化过程
- 支持wild/in-the-wild场景

---

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐ (in-the-wild photorealistic)
- **风格化支持**: 待评估

---

## 性能预期

- **帧率**: 实时 (基于3DGS架构)
- **GPU需求**: 中等
- **训练时间**: 待评估

---

## 实现建议

- **着色器复杂度**: 中
- **管线要求**: 3DGS框架 + 物理模拟模块
- **推荐度**: ✅✅ **最高优先级**

---

## 技术亮点

1. **端到端学习**: 从单次扫描学习火焰的物理外观
2. **泛化能力**: 适用于任意真实场景
3. **可编辑性**: 继承3DGS的编辑能力

---

## 相关工作对比

| 方法 | 逼真度 | 实时性 | 泛化性 | 劳动成本 |
|------|--------|--------|--------|----------|
| 传统CFD | ⭐⭐⭐⭐⭐ | ❌ | ❌ | 高 |
| 程序化 | ⭐⭐⭐ | ✅ | 中 | 中 |
| FieryGS | ⭐⭐⭐⭐⭐ | ✅ | ✅ | 低 |

---

## 参考链接

- Paper: https://arxiv.org/abs/2606.13465
- Project: (待补充)

---

*笔记整理: 豆苗 | 2026-06-27*