---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 浮点稳健性, 连续碰撞检测, CCD, 参数曲面, 基准测试, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811310
---

# Floating-Point Robustness in Parametric Surface Continuous Collision Detection: From Algorithm to Benchmarking

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Floating-Point Robustness in Parametric Surface Continuous Collision Detection: From Algorithm to Benchmarking |
| **作者** | Xuwen Chen, Junyu Wang, Cheng Yu, Xingyu Ni, Meng Zhang, Bin Wang, Mengyu Chu, Baoquan Chen (UESTC / 阿里达摩院) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-14 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811310) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_390&sess=sess122) |
| **DOI** | 10.1145/3811310 |
| **会话** | Monday, 20 July 2026 · Keywords: Geometry / Modeling / Registration |

---

## 核心贡献

> 针对**参数曲面连续碰撞检测（CCD）**中的**浮点诱导决策错误**：给出**抗误差的 CCD 方法**，以及一套**已知真值（known GT）的数据构造流程**用于在浮点扰动下评测算法 —— **从算法到基准测试两端配套**。

1. **抗误差 CCD 算法**：解决浮点误差导致的"是否碰撞"误判
2. **已知 GT 的数据构造管线**：这是本文的独特贡献 —— 不仅给方法，还给**评测基础设施**
3. **浮点扰动下的系统性评测**：多数 CCD 工作只在"精确算术"假设下对比，本文显式引入扰动
4. **端到端配套**：算法 + 基准 ⟹ 可持续比较

---

## 技术方案

### 核心思想

```
CCD（连续碰撞检测）的核心问题：
   在 [t0, t1] 内是否存在碰撞时刻 t*？
        ↓
浮点现实：
   碰撞方程的求根在高精度下解接近 0 或根不稳定
   → "距离几乎为零" 时，浮点舍入决定判定结果
   → 误判 ⟹ 物理仿真穿模 / 碰撞漏检
        ↓
本文两端：
   ① 算法：抗误差的 CCD（提升判定可靠性）
   ② 基准：已知 GT 的浮点扰动数据集（可复现评测）
```

**核心洞察**：这是一个**"方法与评测必须配套"**的问题。只给方法无法证明鲁棒性（因为缺少带真值的扰动测试集）；只给基准则是空架子。本文同时给两端。

### 关键技术

| 技术 | 说明 |
|------|------|
| **浮点鲁棒 CCD** | 处理"距离≈0"时的决策 |
| **已知 GT 数据构造** | 生成带真值标注的浮点扰动测试集 |
| **参数曲面** | NURBS / B-spline 曲面的 CCD（非多边形） |
| **浮点扰动注入** | 系统性地扰动输入以模拟不同精度环境 |
| **算法 + 基准配套** | 本轮少见的方法论完整性 |

---

## 算法复杂度

- **时间复杂度**：CCD 本身为 $O(n \log n)$ 级别（保守推进 / 层次包围体）
- **空间复杂度**：$O(n)$
- **鲁棒版本的额外代价**：精度提升 ⟹ 计算量略增（需更保守的区间估计）

---

## 实现难度

- **算法复杂度**：**中高** — 参数曲面 CCD 的浮点鲁棒性是硬问题
- **数值稳定性**：**高** — 本文核心即解决此问题
- **依赖项**：libigl `ccd` / `igl::collide`（仅多边形/三角）；**参数曲面 CCD 需自建**；精确算术库（Shewchuk predicates / MPFR）
- **可参考**：本轮 [[2026-11-05-SIGGRAPH2026-Surface-Chamfering-Robust-Tetrahedral-Meshing]] 用"间接几何谓词"解决同源问题 —— **思路可迁移**

---

## 实验结论

- 抗误差 CCD 方法在浮点扰动下显著更可靠
- 提供**带已知 GT 的数据构造管线**供后续工作评测

---

## 局限性

- 参数曲面 CCD 的实现复杂度高（三角网格 CCD 已有成熟方案）
- 需要精确算术或区间算术支持，性能有代价

---

## 可行性评估

✅ **推荐实现（基准部分价值可能高于算法部分）**

### 推荐理由
1. **"从算法到基准"是本轮唯一强调评测基础设施的工作** —— 对一个知识库而言，**基准的价值通常高于单个算法**
2. **参数曲面 CCD 的工具链缺口真实存在**：libigl 的 `collide` 主要面向多边形
3. **浮点稳健性是本轮主题**（呼应 [[2026-11-05-SIGGRAPH2026-Surface-Chamfering-Robust-Tetrahedral-Meshing]] 的间接谓词路线）

### 实现建议
- **优先级**：**中高**（若业务涉及参数曲面碰撞则升为高）
- **实施路径（建议先做基准）**：
  1. **先建基准**：对参数曲面（NURBS）构造已知相交/相离的配对，用**高精度算术（MPFR / python-flint）** 计算真值 → 再注入浮点扰动生成扰动版本
  2. 评测现有 CCD 实现（可用 libigl 的保守推进做参考实现）
  3. **再实现抗误差算法**：借鉴 [[2026-11-05-SIGGRAPH2026-Surface-Chamfering-Robust-Tetrahedral-Meshing]] 的"间接几何谓词"思路 —— 用区间算术代替直接比较
- **验收指标**：在扰动集上的误判率（false positive / false negative 分开统计）

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Surface-Chamfering-Robust-Tetrahedral-Meshing]] — **同源问题**：几何谓词的数值稳健性
- [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — **强相关**：参数曲面表示（CCD 的输入形式）
- [[Continuous Collision Detection]]
- [[Numerical Robustness]]
- [[NURBS]]

---

**推荐度**：⭐⭐⭐⭐
