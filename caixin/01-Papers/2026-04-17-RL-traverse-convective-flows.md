# 2604.14553: Learning to Traverse Convective Flows at Moderate to High Rayleigh Numbers

## 论文信息
- **arXiv**: [2604.14553](https://arxiv.org/abs/2604.14553)
- **领域**: physics.flu-dyn, physics.comp-ph
- **提交日期**: Thu, 16 Apr 2026

## 核心创新点

### 研究问题
研究自推动惯性粒子在二维 Rayleigh-Bénard 对流中的导航能力，Pr = 0.71，纵横比 Γ = 4，Ra = 10⁷ ~ 10¹¹。

### 方法：强化学习（RL）控制器
使用 RL 控制器选择推进加速度（受上限约束）以实现指定的水平位移。

### 关键发现

#### 成功率与 Ra 的关系
- **中等 Ra**: 成功率随 A_max 急剧跃升
- **高 Ra**: 过渡更平缓，转移至更大的 A_max

#### 完成时间和能量
- 完成时间随 Ra **增加**
- 成功穿越所需的推进能量随 Ra **减少**

#### 流动重组导致性能差异
- **中等 Ra**: 大尺度环流主导，域被稳健的输运屏障划分，需要有限推力盈余才能穿越
- **高 Ra**: 能量分布在多个模态，屏障碎裂，出现瞬态羽流辅助路径

#### 策略分析
- RL 策略与当地流对齐，显著节能（相比恒定航向基准）
- RL agent 本质地学会穿越排斥性障碍并沿吸引性路径冲浪
- 可通过 Voronoi 镶嵌和 Q-criterion 映射到局部欧拉流拓扑，提炼出可解释的基于物理的启发式策略

### 分析工具
1. **POD（Proper Orthogonal Decomposition）**: 流动结构分解
2. **LCS（Lagrangian Coherent Structures）**: 拉格朗日相干结构分析
3. **Q-criterion**: 涡旋识别
4. **Voronoi tessellation**: 空间拓扑映射

## 对湍流研究的意义
- ✅ 展示了 AI/RL 在理解高 Ra 对流湍流中的应用
- ✅ LCS 分析揭示了湍流输运的隐性几何结构
- ✅ 为自主导航和最优控制提供理论基础

## 标签
#convection-turbulence #Rayleigh-Bénard #reinforcement-learning #LCS #POD #turbulent-transport #navigation
