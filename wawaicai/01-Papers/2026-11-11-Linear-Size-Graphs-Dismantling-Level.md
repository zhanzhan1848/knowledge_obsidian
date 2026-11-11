---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, 几何处理, 计算几何, 组合数学, 图论, 拓扑, 单纯复形, Euler特征, 折叠, cs.CG, math.CO]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.14430
---

# Linear-size graphs at every strict dismantling level — 线性规模严格拆除层图

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Linear-size graphs at every strict dismantling level |
| **作者** | Jesús F. Espinoza（通讯）, Martín Eduardo Frías-Armenta, Rosalía G. Hernández-Amador, Héctor A. Hernández-Hernández |
| **单位** | Departamento de Matemáticas, Universidad de Sonora, Hermosillo, Sonora, México |
| **发表** | arXiv 2026-11-10（math.CO 主分类，cs.CG / cs.GR 交叉），15 页 3 图，MSC 05C75 (Primary) / 05C69, 05E45 |
| **链接** | [原文](https://arxiv.org/abs/2611.14430) |
| **DOI** | 10.48550/arXiv.2611.14430 |
| **关键词** | k-dismantlable graph, dismantling hierarchy, clique complex, Euler characteristic, graph construction |

---

## 核心贡献

> 把「严格 $k$-可拆除图」的最小阶，从 Fieux–Jouve 的**指数级** $2^{k+1}+2k+2$ 降到**线性级** $3k+8$，并给出两族构造，其上界为 $\min\{4k+4,\,3k+8\}$。

1. **第一族构造 $F_k$**：对每个 $k\ge1$，构造严格 $k$-可拆除图，阶为 **$3k+8$**。每层只增加 **3 个顶点**：
   - 其一（中心 centre）的邻居诱导出**上一层**的图 → 因此中心可在 level $k+1$ 被删除；
   - 其余两个提供邻接关系，用于**排除其他顶点在更低层被首先删除**。
2. **第二族构造**：阶为 **$4k+4$**，在前三层比 $F_k$ 更小。
3. **上界**：两族合起来给出严格 level $k$ 最小阶的上界 $\min\{4k+4,\,3k+8\}$ —— **线性 vs 指数**。
4. **Euler 特征障碍法**：给出一个**可计算的排除判据** —— 若顶点 $v$ 的邻域诱导图的**团复形 Euler 特征 $\ne 1$**，则 $v$ 在**任何层**都不可删除。
5. **拓扑解释**：普通折叠对应团复形的**强坍缩 (strong collapse)**；图属于某个拆除类当且仅当其团复形是 **non-evasive**；而 non-evasive 复形必然**可坍缩 (collapsible)**。

---

## 技术方案

### 核心概念

**拆除 (dismantling)**：逐个删除顶点直到只剩一个。删除 $v$ 合法当且仅当 $v$ 的某个邻居与 $v$ 的**所有其他邻居**都相邻。

**分层定义**（Fieux & Jouve）：
- **level 0**：邻居诱导图是**锥 (cone)**（即存在一个顶点与其余全部相邻）—— 等价于 $v$ 被某顶点**支配 (dominated)**，记作 fold $u\to t$
- **level $k\ge1$**：$v$ 的邻居诱导图本身可在 level $k-1$ 拆除

**严格 level $k$**：可在 level $k$ 拆除，但**不能**在 level $k-1$ 拆除。

**类层级**：$\mathcal{D}_{-1}$ = 所有非空锥；$\mathcal{D}_j$ 递归定义。

### 关键引理

**Lemma 2.1（锥测试）**：$H[N_H(u)]$ 是锥 $\iff$ $u$ 被另一顶点支配。
> 证明要点：若 $N_H[u]\subseteq N_H[t]$（$t\ne u$），则 $t$ 与 $u$ 相邻，且 $t$ 与 $N_H(u)\setminus\{t\}$ 中每个顶点相邻 → $t$ 是开邻域图的顶点。反之若 $t$ 是顶点则闭邻域包含成立。

**Lemma 4.3（团多项式递推）**：定义 $q(H)=C_H(-1)$，其中 $C_H(z)=\sum_{c\text{ clique}} z^{|c|}$ 是**团多项式**。

$$C_H(z)=C_{H-v}(z)+z\,C_{H[N_H(v)]}(z)\qquad\Longrightarrow\qquad q(H)=q(H-v)-q(H[N_H(v)])$$

> 证明：按团是否含 $v$ 分类。不含 $v$ 的团恰是 $H-v$ 的团；从每个含 $v$ 的团去掉 $v$ 得到 $H[N_H(v)]$ 的团（双射），加回 $v$ 基数 +1 → 项 $z\,C_{H[N_H(v)]}(z)$。在 $z=-1$ 取值得 $q$ 递推。

**关键性质**：锥的 $q=0$（把每个不含顶点的团与加顶点的团配对，贡献抵消）；**fold 保持 $q$ 不变**。

**Lemma 4.4**：若 $H\in\mathcal{D}_r$ 则 $q(H)=0$。因此 **$q\ne0$ 排除所有拆除类**。
> 归纳：$r=-1$ 是锥；$r\ge0$ 时每步删除的邻域图属 $\mathcal{D}_{r-1}$（$q=0$），删除保持 $q$，最终到 $K_1$（$q=1-1=0$）。

**Euler 判据**：图 $H$ 的团复形（clique complex）的 Euler 特征为 1；应用到**邻域图**上给出排除测试 —— 若邻域图的 Euler 特征 $\ne1$，该顶点在**每个层**都不合格。

### 层构造（Layer Construction $G_m$）

通用构造 $G_m$：种子 $A$ + 层 $L_1,\dots,L_m$，每层含：

- **中心 (centre)** $c_i$：其邻居诱导 $G_{i-1}$（即上一层）
- **辅助顶点 (auxiliary)** $x_{j,i}$：按类型 $j$ 复制

**Lemma 4.5（符号交替）**：设 $\alpha_a=q(B[N_B(a)])$、$\beta_j=q(B[N_B(x_j)])$，则

$$q(G_m[N_{G_m}(a)])=(-1)^{m-1}\alpha_a,\qquad q(G_m[N_{G_m}(x_{j,i})])=(-1)^{m-1}\beta_j$$

> **递推机制**：在邻域图 $H$ 内部对某个中心 $c_i$ 应用 Lemma 4.3 的递推。选中心使得删除它后剩余图 $q=0$（通过 fold 把 $x_{j,h}$ 折到 $x_{j,i}$，使剩余中心成为顶点 apex）。另一项则由 Lemma 4.1 的同构识别为**上一层**的邻域图，取负号 → **符号逐层交替**。
>
> 论文附注：存在**同调变体**，用 $\mathbb{F}_2$ 上的非零约化同调替代 Euler 判据；本文采用 Euler 判据，Lemma 4.2 / 4.5 的论证在后续各层保持成立。

**Theorem 4.6（主定理）**：设 $B=G_1$、$p=c_0$。若

1. $A\in\mathcal{D}_s\setminus\mathcal{D}_{s-1}$
2. $B-p\in\mathcal{D}_s$
3. $q(B[N_B(v)])\ne0$ 对每个 $v\in V(B)\setminus\{p\}$

则对每个 $m\ge0$：

$$G_m\in\mathcal{D}_{s+m}\setminus\mathcal{D}_{s+m-1},\qquad |V(G_m)|=|V(A)|+(d+1)m$$

**证明策略**：
- 由 (3) + Lemma 4.5，非中心顶点的邻域图 $q\ne0$ → 由 Lemma 4.4 不属任何拆除类 → **只有中心能作为首次删除**
- $m=0$：种子层级给出严格 level $s$
- $G_1=B$：$p$ 的邻域图是 $A\in\mathcal{D}_s$ → $p$ 在 level $s+1$ 合格；由 (2) $B-p\in\mathcal{D}_s\subseteq\mathcal{D}_{s+1}$ → 归约可完成；在 level $s$ 唯一候选是 $p$，但其邻域图不在 $\mathcal{D}_{s-1}$（由 (1)）→ **删除被禁止**
- 层归纳：Lemma 4.5 的符号交替保证后续层保持严格性

### 逐顶点删除的效果

论文还给出 $F_k$（$k\ge2$）**删除单个顶点**的效果：

- 删除**中心** → 剩下一个**普通可拆除**图（ordinary dismantlable）
- 删除**任何其他顶点** → 剩下一个**不属于任何拆除类**的图

这刻画了构造的**极小性 / 稳健性**。

---

## 实验结论

本文为**纯理论**工作，无实验与数据集。核心结论：

| 构造 | 阶 | 备注 |
|------|-----|------|
| Fieux–Jouve (cubions) | $2^{k+1}+2k+2$ | **指数级**，原有界 |
| $F_k$（本文第一族） | $3k+8$ | 每层 +3 顶点，**线性** |
| 第二族（本文） | $4k+4$ | 前三层更小 |
| **合上界** | $\min\{4k+4,\,3k+8\}$ | **线性 vs 指数** |

具体数值对比：

| $k$ | cubions | $F_k$ | 第二族 | 取小 |
|------|---------|-------|--------|------|
| 1 | 6 | 11 | 8 | 6 |
| 2 | 10 | 14 | 12 | 10 |
| 3 | 18 | 17 | 16 | **16** |
| 4 | 34 | 20 | 20 | **20** |
| 10 | 2054 | 38 | 44 | **38** |
| 20 | 2,098,186 | 68 | 84 | **68** |

> $k=20$ 时从 **208 万** 降到 **68** —— 约 3 万倍的差距。

---

## 局限性

- **只给上界，未给下界**：论文只证明「存在这样的图」，未证明 $3k+8$ 是**最优**的（严格 level $k$ 最小阶的确切值仍未知）。
- **构造的显式性**：主定理是**存在性 + 归纳**论证，层的具体连接方式依赖「种子 $A$、型 $R$、profile」等参数的选取，读者需自行填充具体实例才能得到可计算的图。
- **仅用 Euler 判据**：同调变体（$\mathbb{F}_2$ 约化同调）仅在脚注中提及，未完整展开；不同判据可能给出更紧的排除条件。
- **与几何处理的距离**：论文本身属于纯组合数学/计算几何理论，**未给出几何应用**（如网格简化、拓扑修复中的具体算法）。其价值在于提供了**底层组合结构**的理论刻画。

---

## 相关工作

- [[2026-11-11-Geo-FlashAttention-Spatial-Spectral-Shape-Correspondence]] — 同日论文，同为 cs.GR 交叉分类
- [[Adaptive-Homology-Preserving-Dimensionality-Reduction]] — 拓扑保持方法（2026-10-16 收录）
- [[DC-SQEM-Medial-Mesh-Dual-Contouring]] — 网格提取与拓扑
- [[Real-Time-Self-Penetration-Repair-Skinned-Characters]] — 拓扑修复的工程实现

---

## 实现建议

- **实现难度**：🟡 中（理论证明为主，但验证需要构造具体实例并编写图论算法）。
- **数值稳定性**：✅ 好。纯组合，无浮点问题；$q(H)$ 是整数计数，Euler 特征判定精确。
- **依赖项**：
  - `networkx`（图操作、团枚举、邻域诱导子图）
  - `sage` / `sympy`（多项式与 $q$ 值计算）
  - 自实现：$k$-dismantling 层级判定（递归）、团多项式 $C_H(z)$ 在 $z=-1$ 的求值、团复形的 Euler 特征
  - 大图时团枚举需用 bitset 加速（$\binom{n}{k}$ 爆炸）
- **适用场景**：
  1. **理论基座** —— 为「图/网格的折叠式简化」提供**层级复杂度**的严格刻画
  2. **拓扑复杂度指标** —— 拆除层级可作为网格/图的**拓扑深度**度量，类似 Eppstein 的 dismantling distance
  3. **算法分析** —— 若要设计「折叠式简化」算法，可用本论文的构造来**构造最难的情形**，测试算法鲁棒性
- **预期性能**：$O(n + \text{cliques})$ 用于 $q$ 计算；层级判定递归深度 $k$，每层需算邻域图的团多项式
- **可复用模块**：
  - **Euler 特征排除判据**（邻域图 $\ne$ 1 则不可删）—— 可直接用于任何「基于 fold 的简化算法」的剪枝
  - **团多项式递推** $q(H)=q(H-v)-q(H[N_H(v)])$ —— 高效局部更新 $q$ 值
  - **团复形 strong collapse ↔ fold 的对应** —— 几何上，「折叠一个顶点」= 「团复形的强坍缩」，这是理解**网格简化为何保持同调**的理论语言
- **落地建议**：本论文更适合作为**理论参考**而非实现目标。建议关注两点：(a) 是否有人把拆除层级用于实际网格简化算法的复杂度分析；(b) 同调变体是否会被后续工作扩展为更紧的判据。

---

## 关键技术点速览

1. **指数 → 线性**：$2^{k+1}+2k+2 \to 3k+8$，$k=20$ 时从 208 万降到 68。
2. **Euler 特征作为排除判据**：邻域图团复形的 Euler 特征 $\ne1$ → 该顶点任何层都不可删。这是把**代数拓扑工具**引入**组合构造**的漂亮手法。
3. **团多项式在 $z=-1$ 的求值** $q(H)=C_H(-1)$ 是**整数不变量**，可局部递推更新。
4. **符号交替引理 (Lemma 4.5)**：$(-1)^{m-1}$ 的交替是「排除更低层首次删除」的核心机制。
5. **拓扑语言**：fold = 团复形的 strong collapse；可拆除 ⇔ 团复形 non-evasive；non-evasive ⇒ collapsible。
6. **极小性刻画**：删中心 → 普通可拆；删其他 → 脱离所有拆除类。
