# Particle Suspension Droplet Transition and Hysteresis

> **元数据**
> - **论文标题**: Role of particle volume fraction on particulate suspension droplet evolution, transition and Hysteresis
> - **arXiv ID**: 2604.09191
> - **作者**: Kishorkumar Sarva
> - **发表时间**: 2026-04
> - **类别**: Fluid Physics / Particle-Laden Flows
> - **标签**: #Particle-Suspension #Droplet #Dripping-Jetting #Hysteresis
> - **领域**: 实验流体力学

---

## 核心研究

### 研究问题
粒子体积分数 $\phi$ 对非布朗粒子牛顿液体射流过渡（dripping-jetting）动力学的影响。

### 实验配置
- $D_n/D_p = 20$ ( nozzle / particle 直径比 )
- 体积分数范围: $\phi = 0, 2\%, 5\%, 10\%, 15\%, 20\%, 25\%, 30\%, 35\%$
- 背景流体: 22% 甘油溶液

### 关键发现

#### 1. 相变特性
- 随着 $\phi$ 增加，dripping 到 jetting 过渡经过混沌 dripping 区域
- 高体积分数 (20-30%) 时，过渡更平滑，消除纯流体的突变

#### 2. 滞回效应
- **正向扫描** (增加流率): 较高 $\phi$ 更早进入 jetting
- **逆向扫描** (减少流率): 较低 $\phi$ 更晚退出 jetting
- 滞回环随 $\phi$ 增加而扩大

#### 3. 液滴动力学
- **液滴频率** 随 $\phi$ 增加而降低
- **液滴尺寸分布** 随 $\phi$ 增加而变窄

#### 4. 射流长度
- 小颗粒 (低浓度): 射流长度约为纯流体的两倍
- 大颗粒: 射流长度约为纯流体的一半

---

## 关键公式

颗粒导致的射流长度修正：

$$L/L_0 = [1 - \tilde{d}(L/L_0)^{1/4}]^{4/3}$$

其中：
$$L_0 = \left( \alpha\eta\sqrt{Uu_0}/\sigma h_0 Z \right)^{4/3} Z$$
$$\tilde{d} = (2U^2L_0/u_0^2Z)^{1/4}(nd/h_0)$$

---

## 与流体渲染的关联

| 研究内容 | 渲染应用 |
|---------|---------|
| 液滴/射流形态 | 喷泉、水花渲染 |
| 颗粒-流体相互作用 | 泥浆、含沙水流 |
| 滞回效应 | 动画过渡曲线 |
| 尺寸分布 | 粒子系统参数化 |

---

## 来源

- **arXiv**: https://arxiv.org/abs/2604.09191
- **HTML**: https://arxiv.org/html/2604.09191