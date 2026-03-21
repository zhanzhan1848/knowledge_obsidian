---
type: paper
created: 2026-03-21
updated: 2026-03-21
tags: [paper, 3d-generation, garment, geometry-image, cvpr2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.19053
---

# SwiftTailor: Efficient 3D Garment Generation with Geometry Image Representation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SwiftTailor: Efficient 3D Garment Generation with Geometry Image Representation |
| **作者** | Phuc Pham, et al. |
| **发表** | CVPR 2026 |
| **日期** | 2026-03-19 |
| **链接** | [原文](https://arxiv.org/abs/2603.19053) |
| **DOI** | 10.48550/arXiv.2603.19053 |
| **PDF** | [View PDF](https://arxiv.org/pdf/2603.19053) |

---

## 核心贡献

> 两阶段框架，通过几何图像表示统一缝纫模式推理和网格合成，将推理时间从 30-60 秒降至实时

1. **PatternMaker**: 高效 VLM 预测缝纫模式
2. **GarmentSewer**: 密集预测 Transformer 生成服装几何图像
3. **几何图像表示**: 在统一 UV 空间编码 3D 表面
4. **快速重建**: 逆映射 + 重网格化 + 动态缝合

---

## 技术方案

### 核心思想

传统方法依赖大型 VLM 生成序列化 2D 缝纫模式，再通过物理模拟转换为 3D 网格，推理慢（30-60 秒）。SwiftTailor 通过几何图像表示，将缝纫模式推理和网格合成统一为一个高效流程。

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何图像 | 统一 UV 空间编码 3D 表面 |
| PatternMaker | VLM 预测缝纫模式 |
| GarmentSewer | Dense Prediction Transformer |
| 逆映射 | 快速 3D 重建 |

---

## 公式

```math
几何图像: G(u,v) = (x, y, z, n_x, n_y, n_z)
重建: M = InverseMapping(G) + Remesh + Stitch
```

---

## 代码片段

```python
# SwiftTailor 流程
class SwiftTailor:
    def __init__(self):
        self.pattern_maker = PatternMaker()  # VLM
        self.garment_sewer = GarmentSewer()  # DPT
    
    def generate(self, input_modality):
        # Stage 1: 预测缝纫模式
        pattern = self.pattern_maker(input_modality)
        # Stage 2: 生成几何图像
        geo_image = self.garment_sewer(pattern)
        # Stage 3: 重建 3D 网格
        mesh = inverse_mapping(geo_image)
        return mesh
```

---

## 实验结论

- **数据集**: Multimodal GarmentCodeData
- **精度**: SOTA 几何和视觉保真度
- **速度**: 显著快于传统方法（30-60s → 实时）
- **模块化**: 支持多种输入模态

---

## 局限性

- 几何图像表示可能有 UV 变形
- 复杂服装拓扑可能需要特殊处理

---

## 相关工作

- [[Geometry Image]]
- [[3D Generation]]
- [[Parametric Garment Modeling]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 实时推理
- **适用场景**: 
  - 虚拟试衣
  - 数字时尚
  - 游戏角色服装

---

*🥬 生菜 (shengcai) - 2026-03-21*
