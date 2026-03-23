# arXiv 流体力学论文日报
**日期**: 2026-03-23
**来源**: arXiv physics.flu-dyn
**论文数量**: 5

---

## 1. 激波聚焦空化机制 🌊

### 标题
**Cavitation by phase shift of focused shock waves inside a droplet**

### arXiv ID
[2603.19990](https://arxiv.org/abs/2603.19990)

### 作者
Samuele Fiorini et al.

### 核心创新
- **Gouy 相位偏移**：首次识别并验证该机制可将压缩波转换为负压
- **纯压缩激波**：无需外部稀疏波即可在液滴内引发空化
- **同质成核**：通过经典成核理论验证气泡形成机制

### 数值/实验方法
- 数值模拟：激波传播与聚焦
- 实验测量：高速 X 射线相位对比成像 (high-speed x-ray phase-contrast imaging)

### 应用领域
- 生物医学超声治疗
- 药物递送（汽化剂）
- 消融技术

### 技术要点
```
控制方程: 非线性声波方程
边界条件: 聚焦激波边界
稳定性: 激波聚焦稳定性
```

### 关键词
`cavitation` `shock wave` `Gouy phase shift` `ultrasound` `biomedical`

---

## 2. GNN 亚格子模型 (LES) 🤖

### 标题
**Modeling subgrid scale production rates on complex meshes using graph neural networks**

### arXiv ID
[2603.19841](https://arxiv.org/abs/2603.19841)

### 作者
Priyabrat Dash et al.

### 核心创新
- **图神经网络 (GNN)** 在非均匀网格上预测过滤后的化学反应速率
- **跨组分泛化**：在 10% 和 80% 氢气混合物上训练，成功预测 50% 混合物
- **网格无关性**：无需重新训练即可适应不同过滤宽度

### 数值方法
- 数据来源：DNS (湍流预混氢-甲烷射流火焰)
- 过滤方法：Favre 过滤
- 网络结构：子域图 (subdomain graphs)
- 对比基线：CNN (需要重网格化)

### 控制方程
```
LES 过滤后的组分输运方程：
∂(ρ̃Ỹ_k)/∂t + ∇·(ρ̃ũỸ_k) = -∇·(ρ̃ũỸ_k - ρ̃ũỸ_k) + ω̇_k
其中 ω̇_k 需要闭包模型 ← GNN 预测
```

### 验证案例
- 预混氢-甲烷火焰 (10%, 50%, 80% H₂)
- 后台阶流动 (backward facing step)

### 关键词
`LES` `GNN` `turbulent combustion` `subgrid closure` `machine learning`

---

## 3. 冰-海洋边界层 DNS ❄️

### 标题
**Direct Numerical Simulations of Ice-Ocean Boundary Turbulence**

### arXiv ID
[2603.19542](https://arxiv.org/abs/2603.19542)

### 作者
Ken Zhao et al.

### 核心创新
- **真实盐扩散系数**：精确解析溶质边界层 (δS ~ 0.4 mm)
- **对流-剪切竞争**：揭示浮力驱动对流与剪切边界层的相互作用
- **融化速率预测**：与实验室测量结果一致

### 数值方法
- **DNS** (Direct Numerical Simulation)
- 参数空间：温度、盐度、分层、外流速度、界面坡度

### 物理机制
```
融化过程:
1. 热扩散边界层 → 热量输运
2. 溶质边界层 → 盐度梯度
3. 浮力对流 → 融水驱动的对流不稳定性
4. 剪切层 → 外部流动影响 (阈值 ~ 5 cm/s)
```

### 应用领域
- 冰架融化预测
- 海洋终止冰川
- 气候变化建模

### 关键词
`DNS` `ice-ocean interface` `turbulent convection` `phase change` `climate`

---

## 4. 管道扩张湍流相干结构 🌀

### 标题
**Coherent Structure Transport in Turbulent Axisymmetric Pipe Expansions**

### arXiv ID
[2603.19457](https://arxiv.org/abs/2603.19457)

### 作者
Omri Ram et al.

### 核心创新
- **几何效应对比**：90° 突扩 vs 45° 渐扩
- **相干结构传输**：尽管平均拓扑相似，传输组织方式根本不同
- **FTLE 分析**：有限时间 Lyapunov 指数揭示物质输运差异

### 实验方法
- **立体 PIV** (stereo-PIV)
- **时序平面 PIV** (time-resolved planar PIV)
- **Reynolds 数**: 25000 和 35000

### 主要发现
| 特征 | 90° 突扩 | 45° 渐扩 |
|------|---------|---------|
| TKE 分布 | 集中于角部薄层 | 宽剪切层分布 |
| 二次涡 | 存在，削弱动量 | 无明显二次涡 |
| 谱峰值 | 更强的谱集中 | 较弱 |
| 积分时间尺度 | 更长 | 较短 |
| FTLE 场 | 分段模式 | 大而连续的变形区 |

### 关键词
`turbulent separation` `PIV` `coherent structures` `FTLE` `axisymmetric expansion`

---

## 5. 双孔介质流动 PINN 框架 🔬

### 标题
**An Adaptive Machine Learning Framework for Fluid Flow in Dual-Network Porous Media**

### arXiv ID
[2603.19561](https://arxiv.org/abs/2603.19561)

### 作者
Kalyana Babu Nakshatrala et al.

### 核心创新
- **物理信息神经网络 (PINN)** 用于双孔/双渗 (DPP) 模型
- **自适应权重调节**：动态平衡损失函数各项
- **无网格方法**：适用于复杂几何
- **反问题求解**：识别难以直接测量的物理参数

### 控制方程
```
双孔/双渗模型 (Double Porosity/Permeability):
- 双网络：宏观孔隙 + 微观孔隙
- 质量交换项：Γ_m (网络间质量传递)
- 混合形式：同时求解压力和速度

关键参数:
- 质量传递系数 (难以直接测量)
- 各网络渗透率
- 孔隙度
```

### 技术特点
- 自适应配点选择
- 共享主干网络架构
- 层状域间断处理（无伪振荡）

### 应用领域
- 矿物勘探
- 致密页岩油气开采
- 地下水流动

### 关键词
`PINN` `porous media` `dual porosity` `inverse problem` `mesh-free`

---

## 📊 本日论文统计

| 领域 | 数量 |
|------|------|
| 湍流建模 (LES/DNS) | 2 |
| 多相流/相变 | 2 |
| 机器学习 (ML/GNN/PINN) | 3 |
| 实验流体力学 | 1 |
| 多孔介质流动 | 1 |

## 🔄 待跟进

- [ ] 论文 2: GNN 亚格子模型代码是否开源
- [ ] 论文 5: PINN 框架与 OpenFOAM 耦合可能性
- [ ] 论文 1: Gouy 相位偏移数值实现细节

---

**已传递给 @墨鱼丸** ✅
