---
tags: [几何, SIGGRAPH2026, 虚拟试穿, 3D服装, 物理仿真]
---

# FIT: Fit-Aware Virtual Try-On Dataset

## 核心方法

**问题定义**: 现有虚拟试穿方法忽视服装合身性（garment fit）问题，无法准确展示衣服在实际人物身上的穿着效果。

**核心贡献**:
1. **FIT数据集**: 1.13M+ 试穿图像三元组，附带精确人体和服装尺寸
2. **可扩展合成策略**:
   - 使用 GarmentCode 程序化生成3D服装
   - 物理仿真悬垂获取真实服装合身性
   - 新型 re-texturing 框架将合成渲染转换为照片级图像，保持几何
   - Person identity preservation 生成配对人物图像
3. **Baseline fit-aware VTO model**

**数据集特点**:
- 覆盖 "ill-fit" 情况（大号衣服穿在小号人身上等）
- 精确尺寸标注

## 会议
SIGGRAPH 2026

## 相关笔记
[[几何, 3D服装]]
[[几何, 物理仿真]]
