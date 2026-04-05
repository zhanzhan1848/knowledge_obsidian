# Small-Scale Dynamo for Full Spectrum of Hydrodynamic Turbulence

## 论文信息

- **ID**: [arXiv:2604.01718](https://arxiv.org/abs/2604.01718)
- **作者**: Leonid Kitchatinov
- **发表**: 2026-04-02
- **分类**: physics.flu-dyn, astro-ph.SR
- **期刊**: JETP (待发表)

---

## 研究问题

### Kazantsev 模型

用于小尺度发电机 (small-scale dynamo) 的统计模型，描述湍流中磁场增强机制。

### 研究目标

计算包含**惯性范围 + 粘性耗散范围**的**完整湍流谱**的 Kazantsev 方程系数。

---

## 核心参数范围

| 参数 | 范围 |
|---|---|
| 磁 Reynolds 数 (Rm) | $10^2$ - $10^8$ |
| 流体 Reynolds 数 (Re) | $10^2$ - $10^8$ |
| Prandtl 数 (Pm) | Rm/Re |

---

## 关键发现

### 1. 发电机阈值

- 阈值 $Rm_c$ 随 Re 增加而上升
- 在 $Re \geq 10^5$ 时饱和到常数 $Rm_c \simeq 300$

### 2. 小 Prandtl 数情况 (Pm << 1)

- 场增长率小
- 依赖 Rm 的对数关系
- 磁能谱峰值在 Ohmic 耗散尺度附近

### 3. Pm → 1 时

- 增长率急剧增加
- 饱和值略低于最短寿命涡旋的倒数

---

## 📊 可行性分析：[小尺度发电机湍流]

## 控制方程
- Kazantsev 方程 (湍流发电机模型)
- 磁流体动力学

## 数值方法
- 离散化：湍流谱方法
- 求解器：数值积分

## 计算成本
- Re, Rm 到 $10^8$
- 需高分辨率谱

## 推荐结论
✅ 理论有价值（发表在 JETP）
