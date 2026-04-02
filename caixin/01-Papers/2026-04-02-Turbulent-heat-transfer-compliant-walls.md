# Turbulent Heat Transfer Enhancement by Compliant Walls

**arXiv**: [2604.00484](https://arxiv.org/abs/2604.00484)  
**作者**: Morie Koseki, Marco Edoardo Rosti  
**分类**: physics.flu-dyn  
**日期**: 2026-04-01  

---

## 核心创新点

**问题**: 柔壁(compliant walls)对槽道湍流热传递的影响及机理

**方法**: **直接数值模拟(DNS)** + 全解析流体-结构耦合(FSI)

**参数范围**:
- 壁面弹性变化
- 热扩散率变化
- 全湍流条件

**关键发现**:
1. 柔壁不仅增加动量传递，也增加热传递
2. 柔壁动态运动 → 近壁区热通量主要由湍流对流而非扩散传递
3. 热通量可通过热扩散率或横向弹性模量控制
4. 弹性模量调控壁法向速度波动 → 温度波动 → 热传递
5. **sweep和ejection事件**是控制机理

## DNS设置

| 参数 | 值 |
|------|-----|
| 湍流Re | 高Re |
| 网格 | 全解析，无壁模型 |
| 耦合 | FSI完全解析 |
| 热边界条件 | 等温或热通量 |

## 物理机制

```
柔壁横向弹性 → 壁法向速度波动↑ → 温度波动↑ → Sweep/Ejection强化
                                                            ↓
                                                    热对流↑ (而非扩散)
                                                            ↓
                                                    热通量↑
```

## 与CFD关联

- **热交换器设计**: 柔壁可用于增强传热
- **生物流动**: 血管等柔性壁面的传热
- **DNS验证**: 可作为LES/RANS壁模型验证基准

## 评估

✅ **推荐** — DNS研究，物理清晰，对传热优化有指导意义  
📊 **数据价值**: 丰富的sweep/ejection统计可用于模型验证  
⚠️ **计算成本**: 全FSI DNS计算量大

---

tags: #DNS #turbulence #heat-transfer #fluid-structure-interaction #compliant-wall #sweep #ejection #CFD
