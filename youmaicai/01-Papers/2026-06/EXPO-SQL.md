# EXPO-SQL: Execution-based Clause-level Policy Optimization for Text-to-SQL

## 元信息
| 标题 | EXPO-SQL: Execution-based Clause-level Policy Optimization for Text-to-SQL |
|------|------|
| 作者 | Jaehoon Lee, CheolWon Na, Suyoung Bae, Jin-Seop Lee, Jihyung Lee, YunSeok Choi, Jee-Hyong Lee (Sungkyunkwan University) |
| 链接 | [原文](https://arxiv.org/abs/2606.23693) |
| arXiv | arXiv:2606.23693 |
| 代码 | [GitHub](https://github.com/jhn25/EXPO-SQL) |
| 发表 | ACL 2026 Findings |
| 领域 | Text-to-SQL, Reinforcement Learning, Fine-tuning |

---

## 核心贡献

1. **提出 Clause-level Reward（子句级奖励）**：现有 RL 方法对整个 SQL 查询赋予统一奖励，将正确和错误的子句同等对待，导致粗粒度的信用分配。EXPO-SQL 通过分析执行结果识别错误子句，提供细粒度的子句级奖励信号。

2. **三种执行结果分类策略**：
   - **Correct Result**：所有子句正确，奖励 +1.5
   - **Incorrect Result**：通过增量执行 + Diff Type 检测识别错误子句，正确 +0.5，错误 -0.5
   - **Execution Error**：解析错误信息 + 子句级溯源，正确 -0.5，错误 -1.5

3. **Clause-wise Incremental Execution**：按 SQL 逻辑执行顺序（FROM/JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT）逐步添加子句，观察每个子句如何改变结果，定位导致最终差异的子句。

---

## 模型架构

Text-to-SQL 生成被建模为子句级策略优化：
- 生成的 SQL 查询表示为子句序列：$O = (c_1, c_2, \ldots, c_n)$
- 策略模型 $\pi_\theta$ 生成 SQL，执行后比较 $R_{pred}$ 与 $R_{gold}$ 获得奖励
- 识别错误子句 $C_{err} \subseteq \{c_1, \ldots, c_n\}$，对每个子句分配差异化奖励 $r_c$

### Diff Type 分类（10种差异类型）

| Level | Diff Type | 描述 |
|-------|-----------|------|
| Column | col_count | 列数不同 |
| Column | col_name | 列名不同 |
| Row | row_order | 行顺序不同 |
| Row | row_dedup | 重复行数不同 |
| Row | row_subset | 缺少行 |
| Row | row_superset | 多余行 |
| Row | row_emptied | 结果为空但 gold 非空 |
| Row | row_created | 结果有行但 gold 为空 |
| Row | row_disjoint | 结果与 gold 无交集 |
| Value | row_partial | 单元格值不同 |

### 策略优化损失函数

$$\mathcal{L} = -\mathbb{E}\left[\sum_{c \in O} \sum_{t_i \in c}\left(r_c - \beta D_{KL}^{(i)}\right)\log\pi_{\theta}(t_i|t_{<i})\right]$$

---

## 实验结果

### Spider & BIRD 基准

| 方法 | Base Model | Spider-Dev | Spider-Test | BIRD-Dev |
|------|-----------|-----------|-----------|---------|
| EXPO-SQL (Ours) | Qwen2.5-Coder-7B | **88.5** | **89.1** | **71.3** |
| EXPO-SQL (Ours) | Qwen2.5-Coder-14B | **89.2** | **89.5** | **73.0** |
| Arctic-SQL-R1 | Qwen2.5-Coder-7B | 87.3 | 88.8 | 68.9 |
| SQL-R1 | Qwen2.5-Coder-7B | 87.6 | 88.7 | 66.6 |
| MCS-SQL | GPT-4 | 89.5 | 89.6 | 63.4 |
| CHASE-SQL | Gemini-1.5-Pro | - | 87.6 | 73.0 |

### 关键发现
- 在复杂查询（Challenging）上比 GRPO/PPO 高 **5.6%p**
- 7B 模型超越 32B ExCoT 3.1%p
- 训练速度比 GRPO 快 22%，比 PPO 快 7%

---

## 消融实验

| 配置 | BIRD-Dev |
|------|---------|
| EXPO-SQL (完整) | **71.3** |
| w/o Execution Error | 69.6 (-1.7) |
| w/o Incorrect Result | 68.9 (-2.4) |
| w/o Both | 68.5 (-2.8) |

Incorrect Result 场景受益最大，因为需要在部分正确的查询中定位具体错误子句。

---

## 局限性
- 当前实验基于 SQLite，泛化到 PostgreSQL/MySQL 等其他数据库方言需要进一步研究
- 不同数据库系统的错误信息格式不同，需要适配解析方法

---

## 标签
#Text-to-SQL #RL #clause-level-reward #fine-tuning #ACL2026