# SkillSmith: Compiling Agent Skills into Boundary-Guided Runtime Interfaces

## 元信息
| 标题 | SkillSmith: Compiling Agent Skills into Boundary-Guided Runtime Interfaces |
|------|------|
| 作者 | Duling Xu, Zheng Chen, Zaifeng Pan, Jiawei Guan, Dong Dong, Jialin Li, Bangzheng Pu |
| 链接 | [原文](https://arxiv.org/abs/2605.15215) |
| arXiv | arXiv:2605.15215 |
| 代码 | [GitHub](https://github.com/AetherHeart-AI/Aeloon) |
| 发表 | cs.AI / cs.SE |

## 核心贡献
1. **问题识别**：现有技能执行范式存在两大冗余来源：无关上下文注入 + 重复的技能特定推理和规划。
2. **SkillSmith 框架**：边界优先的编译器-运行时框架，将技能包离线编译为最小可执行接口。
3. **细粒度操作边界提取**：智能体在运行时动态访问和执行仅相关组件，最小化不必要上下文注入。

## 核心问题

### 现有执行范式的冗余
1. **无关上下文注入**：技能作为上下文指导注入推理循环
2. **重复技能特定推理和规划**：每次任务匹配都重新推理

### 解决方案：边界优先编译
- 离线提取细粒度操作边界
- 编译为最小可执行接口
- 运行时动态访问相关组件

## 实验结果（SkillsBench benchmark）

| 指标 | 提升 |
|------|------|
| solve-stage token 使用 | **-57.44%** |
| thinking iterations | **-42.99%** |
| solve time | **-50.57% (2.02x faster)** |
| token-proportional monetary cost | **-57.44%** |

## 关键特性
1. **跨模型编译**：强模型产生的编译产物可被小模型或更高效运行时模型复用
2. **提升任务准确性**：在原始技能解释失败的情况下改善准确率

## 标签
#agent #skill-compilation #efficiency #LLM #runtime #optimization