# Making Failure Safe: A Constrained, Verifiable Agent Framework for Open-Web Data Collection

## 元信息
| 标题 | Making Failure Safe: A Constrained, Verifiable Agent Framework for Open-Web Data Collection |
|------|------|
| 作者 | Bo Chen |
| 链接 | [原文](https://arxiv.org/abs/2607.00035) |
| arXiv | arXiv:2607.00035 [cs.AI] |
| 发表 | 2026-06-25 |

## 核心贡献

1. **从 free-form code 到 typed JSON 配置**：将 LLM 输出约束为类型化 JSON collector configurations
2. **六类型 Collector Taxonomy**：系统化网页数据收集任务的分类
3. **零执行阶段 LLM tokens**：运行时不需要 LLM，降低成本提高确定性

## 核心问题

LLM 生成网页爬虫的失败原因：
- Dependency errors（依赖错误）
- Broken selectors（选择器失效）
- Schema mismatches（模式不匹配）
- Heterogeneous page structures（页面结构异构）

## 方法

### 框架组成

1. **六类型 Collector Taxonomy**：分类描述驱动的需求类型
2. **Template + Utility Function Constraints**：模板和工具函数约束
3. **Static Airflow DAG Execution**：静态执行图
4. **Rule-based Quality Checking**：基于规则的质量检查
5. **Structured Feedback Correction**：结构化反馈修正

### 关键约束

- 稳定实例化需要完成 source、field、execution 约束
- 仅靠初始描述不足以保证成功

## 实验结果

- **138 任务**：分类学支持描述驱动需求类型
- **80 独立验证任务**：零执行阶段 LLM tokens，最短平均 wall-clock time
- 适合重复调度的数据收集

## 建议

- **是否推荐使用**：是
- **适用场景**：大规模网页数据收集、生产数据管道
- **使用建议**：适合需要确定性、可重复执行的数据收集任务

## 标签
#LLM-agent #web-scraping #verifiable-AI #data-collection
