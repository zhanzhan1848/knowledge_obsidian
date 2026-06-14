---
tags: [渲染, PBR, microfacet, BRDF, retroreflection, OpenPBR, MaterialX]
date: 2026-06-07
status: 待读
---

# The Minimal Retroreflective Microfacet (MRM) Model

## 元信息
| 标题 | The Minimal Retroreflective Microfacet Model |
| 作者 | Jamie Portsmouth |
| 链接 | [arXiv](https://arxiv.org/abs/2606.08739) |
| 领域 | PBR, Microfacet BRDF, Retroreflection |
| 提交日期 | 2026-06-07 |
| 期刊 | Journal of Computer Graphics Techniques (JCGT), Vol. 15, No. 1, 2026 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.08739) |

## 核心贡献
1. **极简retroreflective microfacet模型**：将任意现有microfacet BSDF变为物理合理的retroreflective版本，只需将视角方向替换为其关于表面法线的反射
2. **已被OpenPBR和MaterialX标准采用**：工业标准认可
3. **证明互易性和能量守恒**：在reflection-symmetric NDF假设下成立

## 技术方案

### MRM替换
```cpp
// 标准microfacet评估
vec3 v_r = reflect(-v, n);  // 视角方向关于法线反射
float D = NDF(n, h, v_r);   // 用反射视角方向评估
```

### 数学保证
在reflection-symmetric NDF假设下：
- **互易性**：$f_r(v_i, v_o) = f_r(v_o, v_i)$ ✓
- **能量守恒**：$\int_{\Omega} f_r(v_i, v_o) \cos\theta_i d\omega_i \leq 1$ ✓

## 实验结论
- 与测量retroreflective材质数据高度吻合
- 已获工业标准采纳（OpenPBR + MaterialX）

## 相关笔记
- [[2026-03-19_VideoMatGen-PBR-Materials]]

## 链接
- [JCGT Published](http://jcgt.org/published/0015/01/04/)

---

#标签 #PBR #microfacet #BRDF #retroreflection #OpenPBR #MaterialX #JCGT #2026-06