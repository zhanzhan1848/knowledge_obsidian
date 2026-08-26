# LLM Agents Perform Controlled Experiments Using Simulation Models

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | LLM Agents Perform Controlled Experiments Using Simulation Models |
| 作者 | Yuchen Xia, Michael Weyrich, Nasser Jazdi, Johannes Stumpfle, et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.23622) |
| arXiv | arXiv:2608.23622 [cs.AI] |
| 发表 | 2026-08-22 |
| 会议 | IEEE ETFA 2026 |

## 核心贡献

1. **问题**: LLM 在推理、规划和工具使用方面表现强大，但许多科学和工程任务需要理解系统对干预的反应——这依赖于**受控实验**，而不仅仅是生成看似合理的文本和代码。

2. **框架**: 多智能体框架，使 LLM Agent 能够进行**受控实验**：
   - 给定用户查询和基线配置
   - 构建结构化任务表示
   - 设计实验
   - 执行比较仿真
   - 解释结果
   - 综合证据推荐过程参数优化

3. **核心创新**: 
   - 将语言模型与高保真仿真模型耦合在交互式 Agent 框架中
   - 支持通过**干预、比较和观察**进行推理
   - 产生比纯语言推理更具体和可操作的输出

4. **应用场景**: 制药过程设计

5. **结果**:
   - 在工业应用设置中，更高的输出具体性以及改进的用户评分正确性和有用性
   - 消融研究和可视化案例分析证明了仿真集成实验推理的有效性和实用性

## 建议

- **是否推荐**: ⭐⭐⭐⭐
- **适用场景**: 科学 Agent 系统；LLM+仿真集成；自动化科学发现
- **必读理由**: 首个展示 LLM Agent 进行真实受控实验的系统性工作；ETFA 2026 接收论文
