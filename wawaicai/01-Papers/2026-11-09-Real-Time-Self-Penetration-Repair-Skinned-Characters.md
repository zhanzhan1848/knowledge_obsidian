---
tags: [几何处理, 蒙皮, 自穿透, 二次规划, 接触, 姿态修正, 角色动画, 运动重定向, 论文]
date: 2026-11-09
source: arXiv
arxiv_id: 2611.09693
venue: arXiv cs.GR (preprint)
status: processed
agent_id: wawaicai
authors: Yifei Zhu (Tohoku University)
url: https://arxiv.org/abs/2611.09693
code: https://github.com/zhuyifeiabcd1/retarget-guard
pdf: https://arxiv.org/pdf/2611.09693
---

# Real-Time Self-Penetration Repair for Skinned Characters with Soft Contact Budgets

> **免训练**的后处理模块：**Layer 1** 顶点级局部 QP 修正 21 个非根关节的局部旋转（纯 C、单核 **1.11 ms**），**Layer 2** 无状态接触变形器做有界皮肤压缩（**1.18 ms**）。手–躯干 >20 mm 穿深帧率 **15.53% → 0.00%**，最大深度 **135.6 mm → 9.3 mm**，关节速度高频比中位 **1.008**（几乎不动原动作）。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Self-Penetration Repair for Skinned Characters with Soft Contact Budgets |
| **作者** | Yifei Zhu（唯一作者，东北大学 Tohoku University） |
| **发表** | arXiv cs.GR 2611.09693, 2026-11-06（4 图 9 表，CC BY 4.0） |
| **分类** | MSC 68U05（主）/ 90C20；ACM I.3.7, I.3.5 |
| **链接** | [原文](https://arxiv.org/abs/2611.09693) / [代码](https://github.com/zhuyifeiabcd1/retarget-guard) |

---

## 问题定义

论文明确区分**两个**自穿模来源：

1. **形状变化诱发**：把一段在一个身体上合理的动画拷到另一个身体（躯干宽度、四肢粗细、比例改变）后，**关节旋转数值不变**，但表面间的空间关系变了 —— 手插进胸口、手臂穿过腹部
2. **源动画自带**：即使不换身体，运动模型在**其原生角色**上的输出本身就可能已自穿模

**关键洞察**：
- 骨架本身无法描述"手贴在厚躯干旁边还有多少余量"→ 必须用**几何（顶点）观测**
- **把所有相交都当成刚性违例是错的** —— 有些接触本应通过"**压软皮肤**"而非"抬走手臂"来解决（呼应 Villegas et al. 的"可接受解剖相交"观点）
- 修正必须在交互结束后**平滑释放**；无修正状态残留时必须**精确回到输入**
- 部署接口必须让 host 保留自己的 motion representation、generator 与渲染管线

---

## 架构总览

```
Host 的运动模型 (黑盒) ──► 同步 native/target 局部旋转 │
      ┌───────────────────────┴────────────────────┐
      │  Layer 1: 顶点级局部 QP（plain C, 单核）        │
      │  → 修正 21 个非根身体关节的局部旋转            │
      └───────────────────────┬────────────────────┘ │  host 用修正后的骨架做 skinning
      ┌───────────────────────┴────────────────────┐
      │  Layer 2: 无状态接触变形器（作用于最终蒙皮网格）│
      │  → 有界皮肤压缩                              │
      └───────────────────────┬────────────────────┘
                              ▼  最终渲染网格 + 重算法线
```

### 接口约定（Eq. 1）

$$R^{\rm out}_{t,j}=R^{\rm in}_{t,j}\operatorname{Exp}(\widehat{\delta_{t,j}}),\qquad\delta_{t}\in\mathbb{R}^{63}$$

- 21 个非根语义身体关节 × 3 维指数坐标 = **63 维**
- 根关节与其他"不可控"局部旋转**直接拷贝**；后代（含手指）保留输入局部旋转，但继承被修正祖先的 world transform
- 根平移不在修正变量内
- 坐标：右手系、Y-up、米；角度用弧度
- Host 可选 lookahead $0 \le L \le 5$；流式缓冲 L 帧后吐出最老姿态
- Layer 2 接收 host 的最终顶点与**外向单位法线**，之后再重算法线

---

## 角色包（Character Pack）—— 离线构建，零训练

**输入**：rest mesh + 外向绕序三角形、skin weights、parent-before-child 骨架层级、rest joints、**22 个 body semantics 映射**、可选 world bind bases。

**派生**：
- 由 world bind frame 派生 local bind bases $B_j$ 与 offsets $\ell_j$
- 每个额外骨骼继承其最近映射祖先的 body-part 标签
- **顶点标签**：取"最大累计 part weight"，除以总 skin weight 得 **part purity**
- **14 个 part**：torso、head、左右 upper arm / forearm / hand / thigh / shin / foot

**两套独立采样集合**（确定性 farthest-point sampling）：
- **query vertices**（做检测，purity ≥ **0.9**）vs **collider vertices**（被检测，purity ≥ **0.6**）
- upper-arm 查询点额外要求位于 shoulder-to-elbow 轴向 **0.35** 之外

**Table 3 —— 采样几何与材料系数**（$f_a$ 缩放估计的静息距离，$D_a$ 限制可接受的负平面）：

| Part | Query cap | Collider cap | $f_a$ | $D_a$ (m) |
|---|---|---|---|---|
| Torso | 0 | 1000 | 0.25 | 0.3 |
| Head | 0 | 350 | 0.03 | 0.13 |
| L/R upper arm | 60 | 250 | 0.35 | 0.1 |
| L/R forearm | 60 | 200 | 0.25 | 0.08 |
| L/R hand | 60 | 220 | 0.1 | 0.05 |
| L/R thigh | 100 | 450 | 0.35 | 0.18 |
| L/R shin | 70 | 280 | 0.2 | 0.1 |
| L/R foot | 50 | 220 | 0.1 | 0.08 |

### 软厚度估计（Eq. 2）

$$s_{i}=f_{\mathsf{p}(i)}\min_{(u,v)\in\mathcal{S}_{\mathsf{p}(i)}}\left\|v_{i}-\left(q_{u}+\operatorname{clip}_{[0,1]}\frac{(v_{i}-q_{u})^{\top}(q_{v}-q_{u})}{\max(\|q_{v}-q_{u}\|^{2},\varepsilon_{s})}(q_{v}-q_{u})\right)\right\|$$

### 蒙皮与关节几何（Eq. 3–4）

$$G_{j}(\delta)=G_{\pi(j)}(\delta)B_{j}R^{\rm in}_{j}\operatorname{Exp}(\widehat{\delta_{j}}),\qquad p_{j}(\delta)=p_{\pi(j)}(\delta)+G_{\pi(j)}(\delta)\ell_{j}$$

$$c_{i}(\delta)=\sum_{z=1}^{4}w_{iz}\bigl(G_{b_{iz}}(\delta)\,B^{\rm world\,\top}_{b_{iz}}(v_{i}-q_{b_{iz}})+p_{b_{iz}}(\delta)\bigr)$$

保留并重归一化每顶点**最大的 4 个 skin influences**；推导 area-weighted normals（法线用同样的 blended rotational influences 并归一化）。

---

## Layer 1 —— 局部二次规划

### 主目标（Eq. 5）

$$\min_{\underline{x}\leq x\leq\overline{x}}\frac{1}{2}x^{\top}Hx+g^{\top}x+\frac{1}{2}\sum_{r}\omega_{r}[b_{r}-A_{r}x]_{+}^{2}$$

- $x$ 是**加性指数坐标增量**（不是两次增量旋转指数的复合）；残余 $d+x$，其中 $d=\delta_{t-1}$
- 每个 hinge 等价于引入一个非负 slack 并约束其上界为 $b_r-A_rx$ → **凸 QP**
- **碰撞与接触是软代价；组件盒是同一次 solve 内的硬约束**

### 角度二次项（Eq. 6–8）

$$E_{\rm ang}(x)=\frac{1}{2}\bigl(w_{r}\|d+x\|_{W}^{2}+m(u)w_{v}\|x\|_{W}^{2}+m(u)w_{a}\|x-(d-d^{-})\|_{W}^{2}\bigr)$$

$$W_{j}=\nu_{j}c_{j}I_{3},\qquad c_{j}=\begin{cases}c_{\rm spine},&j\in\{3,6,9,12,15\},\\1,&\text{otherwise,}\end{cases}$$

$$(\nu_{1},\ldots,\nu_{21})=(2,2,8,2,2,8,3,3,8,3,3,8,4,4,8,1,1,1,1,2,2)$$

$\nu=8$ 出现在三关节一组的位置（脊柱/颈/头与髋）。$d^{-}=\delta_{t-2}$；后两项是**残余的一阶/二阶差分**。

### 笛卡尔与朝向项（Eq. 9–11）

对末端执行器 $e$：$r_e=p_e(d)-p_e(0)$，$J_e$ 为 $d$ 处 Jacobian：

$$E_{\rm cart}(x)=\frac{1}{2}\sum_{e\in\mathcal{E}_{p}}w_{e}\|r_{e}+J_{e}x\|^{2}+\frac{m(u)}{2}\sum_{e\in\mathcal{E}_{c}}\left(w_{pv}\|r_{e}+J_{e}x-r_{e}^{-}\|^{2}+w_{pa}\|r_{e}+J_{e}x-2r_{e}^{-}+r_{e}^{--}\|^{2}\right)$$

$$E_{\rm ori}(x)=\frac{w_{o}}{2}\sum_{e\in\mathcal{E}_{h}}\|G_{e}(d)+\mathcal{D}_{e}x-G_{e}(0)\|_{F}^{2}$$

- $\mathcal{E}_p$ = ankles, feet, wrists；$\mathcal{E}_h$ = wrists；$\mathcal{E}_c$ = $\mathcal{E}_p$ + shoulders + elbows
- 朝向保持用**九个矩阵元素的 Frobenius 范数**，不是 rotation-log 距离

### 解析导数（Eq. 12–15）

$\theta=\|d_j\|,\ Q_j=G_j(d)J_r(d_j)$：

$$J_{r}(d_{j})=I-\frac{1-\cos\theta}{\theta^{2}}\widehat{d_{j}}+\frac{\theta-\sin\theta}{\theta^{3}}\widehat{d_{j}}^{\,2}$$

$$(J_{e})_{j}=-\widehat{p_{e}-p_{j}}\,Q_{j}\,\mathbf{1}_{j\preceq e},\qquad(\mathcal{D}_{e}x)=\sum_{j\preceq e}\widehat{Q_{j}x_{j}}\,G_{e}$$

$$M_{ij}=\sum_{z}w_{iz}\mathbf{1}_{j\preceq b_{iz}}(p_{iz}-p_{j})$$

$$(A_{ab,n})_{j}=\bigl((M_{aj}-M_{bj})\times n\bigr)^{\top}Q_{j}$$

> ⚠️ **碰撞行在每次 solve 期间冻结**所选法线、最近采样与材料预算 —— 它们是**局部 surrogate**，而非完整最近曲面测试的导数。

---

## 穿透行与"软接触预算"

### 间隙估计（Eq. 16–18）

常量：$R_s=0.04$，$r_n=0.012$，$\eta_n=0.7$。

$$\mathcal{I}_{ab}=\{\phi<0,\quad(d_{ab}<r_{n}\ \text{or}\ \phi<-\eta_{n}d_{ab}),\quad\phi>-D_{\mathsf{p}(b)},\quad o_{a}\leq r_{n}\}$$

$$g_{ab}=\begin{cases}\phi,&\mathcal{I}_{ab},\\d_{ab},&\text{otherwise,}\end{cases}\qquad B_{ab}=\rho_{\mathsf{p}(a),\mathsf{p}(b)}(s_{a}+s_{b})$$

$$\rho_{a,b}=\begin{cases}\rho_{h},&a\text{ is a hand},\\\rho_{f},&a\text{ is a forearm and }b\text{ is torso},\\\rho,&\text{otherwise,}\end{cases}$$

> **关键语义**：这是最近顶点/法线平面测试，**不是网格 signed-distance function**。被拒绝的负平面会变成**正**欧氏距离。**软厚度抵消负间隙直到预算上限；它不会放大正间隙。**

### 固定对余量与源观测（Eq. 19–20）

$$a_{t,k}=a_{k}^{0}+\sigma_{\rm src}[-e^{s}_{t,k}]_{+},\qquad a_{k}^{0}=\begin{cases}0.04,&\zeta_{k}=6,\\0.003,&\text{otherwise,}\end{cases}$$

$$\boxed{\sigma_{\rm src}=0}$$

> 🔸 **源穿透不提供任何额外穿透许可**（论文反复强调，设计克制且正确 —— 源穿模不应成为目标穿模的许可）。每个 directed pair 最多保留 **44** 个候选，按 effective gap 排序。

### 激活与行滤波（Eq. 21–23）

令 $S(z)=\bar{z}^{2}(3-2\bar{z})$（cubic smoothstep）：

$$q_{r}=S((I-c_{r})/I),\qquad\gamma_{r}\leftarrow\gamma_{r}+\beta(q_{r}-\gamma_{r})$$

$$\widetilde{A}_{r}\leftarrow(1-\alpha_{r})\widetilde{A}_{r}+\alpha_{r}A_{r},\qquad\omega_{r}=w_{\rm pen}\gamma_{r}\min\left(1,\frac{c_{\rm cap}}{\max(c_{\rm cap},-c_{r})}\right)$$

冻结参数 $\beta=1$、$\alpha=1$ → 有效行更新**立即生效**。

### 接触拉力（Contact Pull, Eq. 24–25）

仅当 query part 为 hand：源有效 pair gap < $d_p=0.008$ 时 run counter 递增，否则重置。**连续 $n_p=12$ 次观测后 pull 才合格。**

$$q_{k}^{p}=1-S\left(\frac{[\ell^{0}-r_{p}]_{+}}{T_{p}}\right),\qquad\omega_{k}^{p}=w_{\rm pull}\gamma_{k}^{p}q_{k}^{p}$$

> 这是**单边闭合代价** —— 惩罚"闭合不足"，而非强制等式接触。Pull 行在穿透选择**之后**加入，**不消耗 $K$**。

---

## 组件盒（Component Boxes）—— 限幅与刹车

### 形状自适应余量角（Eq. 26–27）

builder 在 C 中度量：沿肩部横向轴的躯干外向范围 $e_s$、上臂在臂长 $[0.2,0.8]$ 区间的半径 $r_s$。

$$\chi_{s}=\left[\frac{180}{\pi}\arcsin\min\left(0.9,\frac{e_{s}+r_{s}}{\ell_{s}}\right)-\theta_{0}\right]_{+},\qquad\theta_{0}=15$$

$$\Theta_{a,s}=\min\bigl(75,\Theta_{a}+g_{\ell}[\chi_{s}-b_{\theta}]_{+}\bigr),\qquad w_{h,s}=\frac{w_{h}}{1+r_{h}[\chi_{s}-b_{\theta}]_{+}/\theta_{0}}$$

角度单位为**度**。

### 关节限位分配
每侧三个脊柱关节各 $\Theta_s/3$；neck 与 head 各 $\Theta_n$；髋 $\Theta_h$；腕 $\Theta_w$；其余臂/锁骨关节 $\Theta_{a,s}$；其余腿关节 $\Theta_l$。

内接组件盒用 $L_j=(\pi/180)\Theta_j/\sqrt{3}$。**这些是修正量的界，不是输入姿态绝对解剖角。**

### 停车距离与盒约束（Eq. 28–31）

$$n(D,A_{t})=\left\lfloor\frac{\sqrt{1+8D/A_{t}}-1}{2}\right\rfloor,\qquad\mathcal{V}(D,A_{t})=\frac{D}{n(D,A_{t})+1}+\frac{A_{t}n(D,A_{t})}{2}$$

$$\underline{x}_{i}=\max\{v_{i}^{-},v_{i}-A_{t}\},\qquad\overline{x}_{i}=\min\{v_{i}^{+},v_{i}+A_{t}\}$$

刹车计算包含下一离散帧，$D=u+[u-A_t]_+ +[u-2A_t]_+ +\cdots$。

---

## 求解器（Coordinate Descent）

- **88 次循环 sweep**（引用 Wright 2015《Coordinate descent algorithms》），从零投影进盒开始
- 单变量导数与曲率（Eq. 32–33）：

$$f_{i}^{\prime}(z)=h_{i}+H_{ii}z-\sum_{r:r_{r}-A_{ri}z>0}\omega_{r}A_{ri}(r_{r}-A_{ri}z)$$

$$f_{i}^{\prime\prime}(z)=H_{ii}+\sum_{r:r_{r}-A_{ri}z>0}\omega_{r}A_{ri}^{2}$$

- 最多 **88 次 safeguarded Newton 更新**，在 $[\underline{x}_i-x_i,\overline{x}_i-x_i]$ 内括住标量最小值
- **所有迭代都满足盒约束；固定 sweep 次数并不宣称收敛到精确 QP 最优解**

### 释放与归零（Eq. 34–36）

$$z_{i}=\operatorname{clip}_{[\underline{x}_{i},\overline{x}_{i}]}(-d_{i}/\tau_{r})$$

$$\mathcal{J}_{\rm held}=\{j:\exists r,\ A_{r}z<b_{r}\ \text{and}\ \|(A_{r})_{j}\|_{\infty}>1\times10^{-9}\}$$

$$\delta_{t,j}=\begin{cases}0,&j\notin\mathcal{J}_{\rm held}\ \text{and}\ \|d_{j}+x^{\prime}_{j}\|<(\pi/180)\theta_{\rm snap},\\d_{j}+x^{\prime}_{j},&\text{otherwise,}\end{cases}$$

> ⚠️ **snapping 在 release 之后进行，不重新检查盒或行** —— 这是确定性的归零，不是额外的 QP solve。

### Frame-exact pass-through 🔸

当某关节残余**精确为 0**，native 输出用 `memcpy` 直接拷贝该关节的输入矩阵（绕过指数求值与矩阵乘）。零残余 + 零存储残余速度 + 当前与 lookahead 几何均无邻近 pair → 走**整姿态直接拷贝路径**。

> **结果：干净、未激活的帧在 C double-matrix 接口上逐位相同（bit-identically）。**
>
> 🔸 这是被很多同类工作忽视的**正确性属性** —— 用 memcpy 而非 Exp 求值是实打实的位级保证。

---

## Lookahead 与深度触发 Urgency

### Lookahead（Eq. 37）

$$\mathcal{H}_{t}=\begin{cases}\{0\},&h_{t}=0,\\\{0,h_{t}\},&h_{t}>0,\end{cases}\qquad h_{t}=\min(L,\text{number of queued future frames})$$

- 两个端点几何**共用同一个 previous residual $d$** 与**同一个决策增量 $x$**
- **只有当前 target 姿态**贡献二次跟踪代价；中间 target 帧**不做碰撞约束**
- 流式缓冲延迟 = $L/F$ 秒；flush 时 $h_t$ 随队列减少，**不引入外推姿态**
- **首次调用**：在同一供给窗口上跑 $n_{\rm settle}=12$ 个额外内部步

### 深度触发 Urgency（Eq. 38–42）

$$D_{f}=\max\bigl(\{0\}\cup\{[-c_{t+f,k,0}]_{+}:k\in\mathcal{T}_{f}\}\bigr),\qquad q_{f}=\operatorname{clip}_{[0,1]}\frac{D_{f}-d_{0}}{d_{1}-d_{0}}$$

$$u^{(0)}=(1-1/\tau_{u})u_{t-1},\qquad m(u_{t})=1-u_t(1-U_{s}^{-1})$$

$$V_{t}=\frac{\pi V}{180\sqrt{3}F}\bigl(1+u_{t}(U_{v}-1)\bigr),\qquad A_{t}=\frac{\pi A}{180\sqrt{3}F^{2}}\bigl(1+u_{t}(U_{a}-1)\bigr)$$

- 冻结端点 $d_0=0.008$ m，$d_1=0.02$ m，$\tau_u=10$ 帧
- 深度在**软预算、固定余量与 clearance offset 之后**测量，而非原始 signed gap
- **Urgency 不引入任何新的碰撞约束**，只改 Eq. 5 的系数与界

---

## Layer 2 —— 有界皮肤压缩

### Patch 平面与深度（Eq. 43–48）

$$K(z)=(1-z)^{3}(1+3z)\,\mathbf{1}_{0\leq z<1},\qquad z_{j}=\max\left(0,\frac{\|q-c_{j}\|^{2}-d_{*}^{2}}{r_{s}^{2}}\right)$$

$$\bar{c}=\frac{\sum_{j}K(z_{j})c_{j}}{\sum_{j}K(z_{j})},\quad\bar{n}=\frac{\sum_{j}K(z_{j})n_{j}}{\|\sum_{j}K(z_{j})n_{j}\|}$$

$$\lambda_{i}=f_{i}^{2}\mu_{ik},\qquad w_{i}=\exp(-\phi_{i}/t_{d})\lambda_{i},\qquad t_{d}=0.004$$

$$d=\min\left\{1.15\,d_{\rm raw}S(d_{\rm raw}/0.002)\min\left(1,\frac{\sum_{i}\lambda_{i}}{0.05}\right),\rho(\bar{s}_{A}+\bar{s}_{B})\right\}$$

$$d_{A}=d\frac{\bar{s}_{A}}{\bar{s}_{A}+\bar{s}_{B}},\qquad d_{B}=d\frac{\bar{s}_{B}}{\bar{s}_{A}+\bar{s}_{B}}$$

> **更软的材料获得更大的压缩份额**（按 $\bar{s}$ 分配）。此阶段**不更新骨架**。

### 位移场与逐顶点上限（Eq. 49–50）

$$a_{ei}=d_{e}\,\pi_{iP}\mu_{ik}K(\|v_{i}-p_{e}\|^{2}/w_{e}^{2}),\qquad\beta_{ei}=(100\,a_{ei})^{4}$$

$$d_{i}=\widetilde{d}_{i}\min\left(1,\frac{\rho s_{i}}{\max(\|\widetilde{d}_{i}\|,\varepsilon_{d})}\right)$$

> **逐顶点上限在场混合之后施加** —— 这个顺序很重要。

### 三角形折叠控制（Eq. 51–52）🔸

$$B_{f}=\left[-\frac{(e\times w+z\times h)^{\top}n}{\max(\|n\|^{2},\varepsilon_{f})}\right]_{+},\qquad C_{f}=\left[-\frac{(z\times w)^{\top}n}{\max(\|n\|^{2},\varepsilon_{f})}\right]_{+}$$

$$s_{f}=\min\left(1,\frac{2\eta_{f}}{\max(\varepsilon_{b},B_{f}+\sqrt{B_{f}^{2}+4\eta_{f}C_{f}})}\right),\qquad\eta_{f}=1.6/2$$

公共缩放 $s$ 把三角形定向面积比下界保持在 $1-B_fs-C_fs^2$。**最多 16 次 pass**，当某 face scale < 0.9999 时，按其最小关联 $s_f$ 缩放被移动顶点。

> 🔸 **这是本文对几何处理工程最有迁移价值的部分** —— 三角形面积比护栏 + 逐顶点位移上限，是 **deformation-based 几何处理的通用稳定化配方**。

### 层间预算交接（Eq. 53）

$$-g_{ab}\leq B_{ab}+a_{t,k}-\epsilon\quad\text{when }a_{t,k}\geq\epsilon$$

> **这是静态约定，不是"传递剩余余量"。** Layer 1 只在其 part-dependent $B_{ab}$ 与固定 pair 余量花完后才收取 pose 修正代价；Layer 2 **重新检测接触**，用全局 $\rho$ 封顶每个位移，它**不接收** $\rho_h,\rho_f$、pair 余量、行 slack 或 urgency。
>
> ⚠️ **代码不提供两阶段之间的精确预算相等或完全消解保证。**

### 布料厚度与顺应性（Eq. 54–55）

$$\ell_{b}^{\rm cloth}=(1-\kappa)o_{b},\qquad g^{\rm cloth}_{ab}=g_{ab}-\ell_{b}^{\rm cloth}$$

- $\kappa\in[0,1]$ 只修改 arm–torso 与 forearm/hand–leg 两类 pair
- **$\kappa$ 指定存储 offset 的可压缩部分**；它是碰撞面约定，**不是衣物动力学**。$\kappa=1$ 时 lift 消失，恢复 body 形式

---

## 实验结果

### 数据与协议

- **部署运动生成器的录制输出**：64 clips × 752 frames @ 25 fps
- **Seamless Interaction 数据集**（Agrawal et al.）中从对话视频估计的运动：720 clips × 300 frames @ 30 fps
- 身体：**SMPL-H shapes**（SMPL + 双手）
- 设置在最终测试**之前**冻结
- **主结果用 320 个 "unseen" clips**，其 ID 与所有开发/调参/早前评估/urgency 设计集**不相交**；跑在 **3 个 body shapes** 上 → **960 个 clip–body 对**
- 每个 clip 用自己身体作 source

### 🔸 深度测量方法（重要方法论贡献）

- **Body depths 是 raw 的**：无 soft allowance，无 source allowance
- 开发期用的 **surface scan**：取 query 顶点，找另一 part 上最近顶点，沿该顶点法线读深度。**在未变形 skin 上好用**
- **但在最终 skin 上该假设失效** —— 接触凹坑会弯折最近法线，手臂交叉时手在胸前的褶皱会读成"深陷"而实际并未进入
- 因此报告**独立的 solid test**：把躯干网格用每个开放边界上的质心扇形**封闭**；肢体顶点在封闭网格的 **generalized winding number > 0.5** 时算在内；其深度是对网格的**精确 point-to-triangle 距离**。该测试**不用法线、不用运行时的任何部分**
- 🔸 **诚实声明**：该 solid test 是在**第一遍** unseen clips 之后才加入的（当时 final skin 的 scan 最大值看起来不合理，而渲染帧没有显示这种深度）。**它只改变测量方式。**
- 结果：surface scan 在最终 skin 上标出 **97 个 final hand 帧 > 20 mm**，而 solid test 找到**没有一个 final hand 帧超过 9.3 mm**

### Table 5 —— 穿深结果（320 unseen clips，独立 solid test，无 soft allowance）

Layer 1 用 5 帧 lookahead @ 30 fps。

| Body | Region | >20mm Copy | >20mm Pose | **>20mm Final** | >10mm Final | Max Copy (mm) | **Max Final (mm)** |
|---|---|---|---|---|---|---|---|
| Medium | Hand–torso | 9.47 | 0.09 | **0.00** | **0.00** | 115.0 | **5.4** |
| Medium | Forearm–torso | 5.19 | 0.00 | **0.00** | **0.00** | 62.2 | **5.3** |
| Medium | Upper arm–torso | 10.62 | 9.34 | **0.00** | 3.56 | 41.7 | 18.1 |
| Tall heavy | Hand–torso | 16.75 | 0.34 | **0.00** | **0.00** | 133.9 | **6.3** |
| Tall heavy | Forearm–torso | 9.53 | 0.00 | **0.00** | **0.00** | 86.5 | **3.4** |
| Tall heavy | Upper arm–torso | 53.98 | 52.66 | 0.32 | 18.92 | 55.0 | 26.6 |
| Short heavy | Hand–torso | 20.36 | 0.11 | **0.00** | **0.00** | 135.6 | **9.3** |
| Short heavy | Forearm–torso | 16.52 | 0.00 | **0.00** | **0.00** | 90.3 | **4.2** |
| Short heavy | Upper arm–torso | 54.77 | 51.86 | 0.02 | 8.24 | 58.5 | **27.1** |

**汇总（全文引用的 headline 数字）**：
- 手–躯干 >20 mm：Copy **15.53%** → Final **0.00%**；Copy 最大 **135.6 mm** → Final 最大 **9.3 mm**
- 前臂–躯干 >20 mm：**10.41%** → **0.00%**；最大 **5.3 mm**
- **两层分工**：Layer 1 消除深冲突 —— 手部 >20 mm 帧降到 **0.18%**，而 >5 mm 帧仍为 **17.20%**（留给组织的浅层重叠）；Layer 2 吸收该重叠 —— >5 mm 手部帧降到 **0.05%**
- **上臂–躯干是刻意的例外**：pose 修正基本不动它（强行分开会把手臂抬起来），这正是真实软组织会屈服的区域。>20 mm 率：Copy **39.79%** → Layer 1 **37.95%** → Layer 2 **0.11%**；最终仍有 **10.24%** 帧 >10 mm，最大 **27.1 mm**
- Solid test 下：**0 / 2880** clip–body–region 组合的 final 最大值 >10 mm 且超过 audited copy 最大值 5 mm 以上

### Table 6 —— 运动保持（unseen clips，5 帧 lookahead @ 30 fps）

HF ratio = 每 clip 对 10 个臂/腿关节的 corrected-to-copied **≥3 Hz 关节速度能量比**均值（1 = 能量相等）。

| Body | Wrist offset Mean (cm) | Wrist offset P95 (cm) | HF Median | HF P90 | Arm speed | Retained Pull | Retained Contact | Joints <0.5° (%) |
|---|---|---|---|---|---|---|---|---|
| Medium | 0.68 | 1.54 | 1.008 | 1.058 | 1.008 | 0.962 | 0.954 | 83.1 |
| Tall heavy | 0.76 | 1.73 | 1.007 | 1.063 | 1.007 | 0.948 | 0.943 | 83.5 |
| Short heavy | 1.10 | 2.37 | 1.010 | 1.095 | 1.009 | 0.953 | 0.961 | 77.9 |

- 中位 HF ratio **1.008**，P90 **1.079**，**最差单个组合 2.21**
- 平均腕部位移 **0.85 cm**
- Source-labelled contact pair–frames 满足 pose-stage contact criterion 的比例 **0.953**（copied motion 为 **0.976**）
- **81.5%** 的 joint–frame 旋转在输入的 **0.5°** 内；**25.2%** 的帧在每个关节上修正**恰好为零**

### Table 7 —— 部署生成器输出（64 clips × 752 frames @ 25 fps，4 帧 lookahead）

| Body | Hand–torso >20mm Copy | **Final** | max Copy (mm) | Final (mm) | Forearm–torso max Copy | Final | Offset (cm) | HF median |
|---|---|---|---|---|---|---|---|---|
| Medium | 0.76 | **0.00** | 106.8 | **4.0** | 32.9 | **3.7** | 0.15 | 1.002 |
| Tall slim | 0.22 | **0.00** | 87.9 | **3.8** | 14.5 | **3.3** | 0.15 | 1.001 |
| Tall heavy | 5.26 | **0.00** | 127.1 | **4.2** | 34.1 | **5.1** | 0.16 | 1.001 |
| Short heavy | 7.10 | **0.00** | 138.2 | **4.3** | 51.4 | **3.0** | 0.36 | 1.003 |
| Extreme heavy | **35.56** | **0.00** | 173.9 | **5.0** | 95.2 | **4.4** | **3.51** | 1.043 |

> **Extreme heavy** 使用 Short heavy 的 **3 倍** shape 系数，仍无深 hand–torso 帧，但代价是**大得多的手部偏移（3.51 cm）**。

### Table 8 —— Urgency 调度消融（Layer 1 单独，设计集）

| Clips | >20mm Without | **With** | max Without (mm) | **With (mm)** | HF P90 Without | With |
|---|---|---|---|---|---|---|
| Medium | 0.25 | **0.05** | 57.9 | **30.3** | 1.041 | 1.047 |
| Tall heavy | 0.24 | **0.02** | 87.7 | **23.9** | 1.029 | 1.061 |
| Short heavy | 0.29 | **0.03** | 81.0 | **29.1** | 1.047 | 1.081 |
| Tall heavy, hard | 0.31 | **0.03** | 64.6 | **23.5** | 1.094 | 1.113 |

> ⚠️ 这些 clip 参与了调度设计，因此是**设计记录，不是 held-out 结果**。

### Table 9 —— 衣物（6 个生成身体 + 拟合服装，10 个开发 clip，Layer 1 单独）

指标：**调整后衣物 excess > 5 mm 的帧占比**（已扣除 soft 与 source allowance）。

| Body | Copy | κ=1 | κ=0.5 | κ=0 | Offset (cm) | HF |
|---|---|---|---|---|---|---|
| Heavy A | 30.00 | 19.63 | **6.43** | **0.03** | 0.87 | 1.025 |
| Slim | 0.00 | 0.00 | 0.00 | 0.00 | 0.29 | 1.007 |
| Muscular | 1.57 | 1.17 | **0.23** | **0.00** | 0.27 | 1.007 |
| Stocky | 1.53 | **0.00** | **0.00** | **0.00** | 0.45 | 1.009 |
| Tall thin | 0.50 | 0.33 | 0.33 | **0.30** | 0.30 | 1.009 |
| Heavy B (dress) | 2.87 | **0.00** | **0.00** | **0.00** | 0.74 | 1.019 |

> **降低 $\kappa$ 让手臂离开衣物表面，而不是把衣物压平。** 更小的 $\kappa$ = 更硬的衣物。

### 延迟 —— 关键数字

硬件：**AMD EPYC 7K62 的一个 pinned core**（机器上同时有其他 job 跑）。

| 指标 | 数值 |
|------|------|
| **Layer 1 平均** | **1.11 ms** |
| Layer 1 P99（最大 group） | 1.66 ms |
| Layer 1 最大 | 2.16 ms |
| SMPL-X run 离群值 | 23.3 ms（一帧） |
| **Layer 1 因果模式（L=0）** | **0.75 ms** |
| **Layer 2 平均** | **1.18 ms**（6890 顶点网格） |
| Layer 2 P99（最大 group） | 1.80 ms |
| **两阶段总和** | **2.29 ms**（33 ms 帧预算的绝大部分） |
| Lookahead 缓冲延迟 | $L/F$ 秒（L=5 @ 30 fps → 167 ms） |

> **不含 host skinning 与接口开销。**

### 冻结参数（Table 4 摘要）

| 参数 | 值 | 作用 |
|------|-----|------|
| $K$（每端点行数） | **48** | 行选择上限 |
| $n_{\rm sweep}$ | **88** | 循环 sweep 次数 |
| $F$ | **30** | 帧率 |
| $\rho$（软厚度分数） | 0.5 | 默认 part 对 |
| $\rho_h$（手） | 0.1 | 手相关 pair |
| $\rho_f$（前臂–躯干） | 0.1 | 前臂对躯干 |
| $\sigma_{\rm src}$ | **0** | 源深度乘子 |
| QP 维度 | 63 | 21 关节 × 3 |
| Newton 更新 | **88** | safeguarded Newton |

---

## 局限性（论文自述 14 条，摘要）

1. **模型独立不等于无准备** —— 两个 pack 必须提供兼容的语义关节与碰撞对
2. **Layer 1 用采样几何 + 截断的 skin influences**（每顶点 4 个）；host 若用不同 skinning 或额外 shape deformation，表面可能不同
3. **修正是局部的、有界的** —— 采样最近顶点法线平面只是碰撞 surrogate，规定的 part 对不覆盖所有可能相交
4. **穿透与 pull 都是软代价**，solver 用固定工作量，release 与 snapping 在 solve 之后。**没有形式化的可行性证书**
5. **范围外**：根平移、绝对解剖关节限位、平衡、环境接触
6. **不可控局部旋转（含手指）被拷贝**
7. **静态预算约定不传递剩余 slack**
8. **皮肤压缩是纯几何的** —— 没有摩擦、弹性动力学或体积守恒
9. **Cloth thickness/compliance 只改选定的 pose 碰撞测试** —— 不模拟衣物
10. **Short lookahead 增加缓冲延迟**，且只检查 target **端点**而非整条中间轨迹
11. **Frame-exact pass-through 只适用于干净、未激活的零状态帧**
12. 测试用**参数化身体与生成服装**；未评估现场服装
13. **Windows 与 macOS 未验证**；模块**尚未与任何出货的运动模型集成**
14. 未来工作：生产集成、跨平台测试、采集的服装与艺术家制作的 skin 评估；**层间可测量的预算交换**、更丰富的 host-surface 导数、**自适应碰撞覆盖**、**显式轨迹检查**

---

## 开源参考

| 资源 | 链接 |
|------|------|
| **代码** | https://github.com/zhuyifeiabcd1/retarget-guard |
| 依赖 | plain C（无 BLAS/LAPACK）+ Wright 2015 coordinate descent |
| Layer 2 思路来源 | Brunel et al. [8] 时不变弹性接触变形器 |
| 身体模型 | SMPL-H / SMPL-X（需授权）；演示用 MPFB CC0 身体 |

---

## 🥢 可行性分析

### 算法复杂度

| 组件 | 时间复杂度 | 空间复杂度 |
|------|-----------|-----------|
| Layer 1 QP | O($n_{\rm sweep}$ × (63 + rows)) —— 88 sweep × 88 Newton，**实测 1.11 ms 单核** | O(63²) Hessian |
| 间隙检测 | O(Q · C · log C) —— Q 查询点 × C collider，空间索引 | O(Q + C) |
| Layer 2 变形 | O(E · V) —— 事件数 × 顶点数 | O(V) |
| 角色包构建 | O(V log V) —— 一次性离线，**无训练** | O(V) |

### 实现难度

- **算法复杂度**：**中高** —— QP 推导完整、参数齐全、代码开源，但**解析导数（Eq. 12–15）**需仔细推导；Layer 2 的接触变形器细节是"思路复用"而非等价实现
- **数值稳定性**：**好** —— 全程 box-constrained、safeguarded Newton、三角形面积比护栏；论文明确承认**不保证收敛到精确 QP 最优解**，但保证**所有迭代满足硬约束**
- **依赖项**：**纯 C，无 BLAS/LAPACK**（可移植性极佳）；需要 SMPL-H 类身体模型

### 推荐结论

⚠️ **谨慎推荐（分层落地）**

- **Layer 1（QP pose 修正）**：✅ **推荐直接复现** —— 纯 C、单核 1.11 ms、方程完整、参数表齐全、**代码已开源**、在 unseen 集上有可验证的定量结果。这是最有工程价值的部分。
- **Layer 2（皮肤压缩）**：⚠️ **建议作为可选模块** —— 它复用了 Brunel et al. 的既有思路（作者自己也不宣称等价），P99 = 1.80 ms，是 "final 0.00% >20 mm" 的关键（Layer 1 单独还剩 0.18%），但**没有摩擦/体积守恒**，视觉上对布料区域不可用。
- **整个系统**：⚠️ 论文的**测量方法学贡献**（solid test 替代 surface scan）比其算法本身更值得借鉴。

### 落地建议

1. **先复现 Layer 1**：把 QP 求解、角色包构建、采样与间隙检测按论文 Eq. 2–36 实现，验证在自有动作数据上的 HF ratio 与穿深率
2. **建立独立深度测量**：🔸 **这是最重要的前置工作** —— 引入本方法前，先在自己的数据上建立 **generalized winding number + 精确 point-to-triangle 距离**的 solid test。论文自己就因为 surface scan 在最终 skin 上失效而被迫补做这个测试；任何只用"最近顶点 + 法线读深度"的评测都会高估穿深
3. **三角形面积比护栏（Eq. 51–52）可独立移植** —— 这套 `box-constrained squared-hinge + coordinate descent + 逐顶点位移上限 + 三角形折叠护栏` 是 **deformation-based 几何处理的通用稳定化配方**，可考虑用于动态网格去噪、法向平滑等场景
4. **σ_src = 0 的设计值得照抄** —— 源穿模不应成为目标穿模的许可，这是一个克制且正确的建模选择
5. **Frame-exact pass-through 值得照抄** —— 对需要"无修正时逐位一致"保证的管线（如缓存、增量计算），这是实打实的位级正确性
6. **上臂–躯干是已知盲区** —— 若业务涉及肩部/腋下接触，需自行补充碰撞 part 对（论文 future work 提到"自适应碰撞覆盖"）
7. **不要指望它做物理仿真** —— 无摩擦、无弹性动力学、无体积守恒；它只是几何层的接触消解

### 对协作 agent 的提示

- **五花肉（前端 3D 编辑器）**：Layer 1 的"局部 QP + 硬盒约束 + 逐顶点位移上限"是**交互式角色姿态修正**的可用模板（拖动关节时的自穿透实时消解）
- **吊龙（后端几何处理集成）**：三角形面积比护栏 + 逐顶点位移上限配方可直接用于服务端网格变形；solid test 测量方法学建议纳入通用评测工具

---

**已传递给 @墨鱼丸。**

---

## 相关笔记

- [[2026-11-09-TailorRig-Auxiliary-Skeleton-Garment-Aware-Rigging]] — 同日另一篇，蒙皮质量与辅助骨生成
- [[2026-11-08-EDGAR-Diffusion-Driven-Gaussian-Avatar-Refinement]] — 头像精修
