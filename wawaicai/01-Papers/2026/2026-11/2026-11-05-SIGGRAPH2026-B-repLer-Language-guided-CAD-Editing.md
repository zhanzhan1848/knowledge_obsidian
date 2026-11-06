---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, CAD, B-Rep编辑, 语言驱动, 潜空间, 数据集, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_959&sess=sess122
---

# B-repLer: Language-guided Editing of CAD Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | B-repLer: Language-guided Editing of CAD Models |
| **作者** | Yilin Liu (UCL), Niladri Shekhar Dutt (UCL), Changjian Li (爱丁堡大学), Niloy J. Mitra (UCL / Adobe Research) |
| **发表** | SIGGRAPH 2026 Conference Papers |
| **链接** | [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_959&sess=sess122) · [ACM DL](https://dl.acm.org/doi/10.1145/3811361) |
| **会话** | Monday, 20 July 2026 11:05am PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 当前语言驱动的 CAD 编辑受**数据集稀缺**困扰，且**依赖构造历史（construction history）**。B-repLer 让**文本驱动的 CAD 编辑在学习的潜空间（learned latent space）中完成，无需构造历史**；并提出 **BrepEDIT-240K** —— **首个大规模 CAD 编辑数据集**。

1. **无需构造历史**：直接在 B-Rep 潜空间编辑 ⟹ 可编辑**只有最终几何、无参数化历史**的模型
2. **潜空间编辑**：学习到的潜空间承载"可编辑性"
3. **BrepEDIT-240K**：**首个大规模编辑数据集**（24 万条编辑）⟹ 本身是重要资源
4. **高层文本命令**：支持复杂、抽象的编辑指令
5. **数据集稀缺问题被显式识别**并作为贡献解决

---

## 技术方案

### 核心思想

```
现有语言驱动 CAD 编辑的痛点：
   ① 数据集稀缺
   ② 依赖构造历史（construction history）
      → 只能编辑"带参数化脚本的模型"
      → 而真实世界的 CAD 文件大多只有 B-Rep
        ↓
B-repLer：
   B-Rep ⟹ 编码器 ⟹ 潜空间
   文本 ⟹ 编辑指令 ⟹ 潜空间中的方向
        ↓
   解码器 ⟹ 编辑后的 B-Rep
   （全程不需要构造历史）
```

**核心洞察**："依赖构造历史"是比"数据集稀缺"更根本的限制 —— 它把方法的适用范围限制在 CAD 软件里生成的文件上。绕开它才能覆盖真实的 B-Rep 文件。

### 关键技术

| 技术 | 说明 |
|------|------|
| **B-Rep 潜空间编码** | 拓扑 + 几何的联合编码 |
| **文本条件编辑** | 在潜空间做方向性编辑 |
| **无需构造历史** | 覆盖任意来源的 B-Rep |
| **BrepEDIT-240K** | 24 万条编辑对的数据集 |

---

## 算法复杂度

- **时间复杂度**：编码 + 编辑 + 解码，均为前馈 $O(\text{模型复杂度})$
- **空间复杂度**：$O(\text{B-Rep 大小})$
- **编辑延迟**：目标交互级（<1s）

---

## 实现难度

- **算法复杂度**：**中高** — B-Rep 的潜空间编码（拓扑 + 几何联合）是难点
- **数值稳定性**：**中** — 生成模型，输出需后验有效性检查
- **依赖项**：PyTorch；B-Rep 解析（OpenCASCADE / OCCT / pythonocc-core）；数据集（BrepEDIT-240K）
- **衔接本轮**：[[2026-11-05-SIGGRAPH2026-Flatten-the-Complex-BRep-kCell-Particles]] 是**互补方向**（生成而非编辑），且其 k-cell 粒子表示**也可作为本文潜空间的编码底座**

---

## 实验结论

- 无需构造历史即可完成文本驱动的 CAD 编辑
- BrepEDIT-240K 支持准确、复杂的编辑
- 首个大规模编辑数据集发布

---

## 局限性

- 依赖 BrepEDIT-240K 的域覆盖（工业零件长尾可能不足）
- 潜空间编辑的"可控性"有限（难以精确指定尺寸/位置等硬约束）
- B-Rep 有效性需后验检查

---

## 可行性评估

✅ **推荐实现（数据集价值可能高于算法价值）**

### 推荐理由
1. **BrepEDIT-240K 是本轮唯一的大规模数据集贡献** —— 数据集对整个领域的长期价值通常超过单个模型
2. **"不依赖构造历史"是真实场景刚需** —— 客户手上的 B-Rep 文件没有特征树
3. **与本轮 [[2026-11-05-SIGGRAPH2026-Flatten-the-Complex-BRep-kCell-Particles]] 构成完整 B-Rep 工具链**：Flatten the Complex 管生成，B-repLer 管编辑

### 实现建议
- **优先级**：**中高**
- **实施路径**：
  1. **先取数据集**：若 BrepEDIT-240K 已公开，直接用于本库的 CAD 生成/编辑实验
  2. **基线**：用 OpenCASCADE 的参数化编辑做"有构造历史"的对照
  3. **实现潜空间编码**：从 B-Rep 的拓扑（面-边-顶点邻接）+ 几何（顶点坐标、NURBS 参数）构造 token 序列
- **风险**：B-Rep 的序列化/反序列化是脏活，建议用 `pythonocc-core` 或自建 OCCT 绑定

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Flatten-the-Complex-BRep-kCell-Particles]] — **互补**：B-Rep 生成
- [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — 相关：曲面表示
- [[2026-11-05-SIGGRAPH2026-C0-Generalized-Coons-Volumes-Any-Polytopes]] — 相关：体构造
- [[B-Rep]]
- [[CAD Editing]]
- [[Text-to-3D]]

---

**推荐度**：⭐⭐⭐⭐
