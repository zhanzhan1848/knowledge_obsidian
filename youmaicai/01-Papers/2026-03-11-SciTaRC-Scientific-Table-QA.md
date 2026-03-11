# SciTaRC: Benchmarking QA on Scientific Tabular Data that Requires Language Reasoning and Complex Computation

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | SciTaRC: Benchmarking QA on Scientific Tabular Data that Requires Language Reasoning and Complex Computation |
| 作者 | Hexuan Wang, Yaxuan Ren, Srikar Bommireddypalli, Shuxian Chen, Adarsh Prabhudesai, Rongkun Zhou, Elina Baral, Philipp Koehn |
| 链接 | [原文](https://arxiv.org/abs/2603.08910) |
| arXiv | arXiv:2603.08910 |
| 类别 | cs.CL |
| 发表时间 | 2026-03-09 |
| 页数 | 18 pages, 11 figures, 7 tables |

## 核心贡献
1. **SciTaRC基准**: 专家编写的科学表格问答基准
2. **双重挑战**: 需要深度语言推理 + 复杂计算
3. **执行瓶颈发现**: 代码和语言模型都难以忠实执行计划

## 基准特点
- 专家编写的问题
- 基于科学论文中的表格数据
- 需要:
  - 深度语言理解
  - 复杂数值计算
  - 多步推理

## 实验结果
### 模型失败率
- **SOTA模型**: 至少23%失败率
- **Llama-3.3-70B-Instruct**: 65.5%失败率
- 即使提供正确策略，模型仍难以执行

## 关键发现: 执行瓶颈
### 代码方法问题
- 在原始科学表格上脆弱
- 表格格式不规范导致解析失败

### 自然语言推理问题
- 初始理解错误
- 计算错误

## 错误分析
```text
1. 理解阶段: 表格结构理解错误
2. 规划阶段: 策略生成不准确
3. 执行阶段: 计算或代码执行失败
4. 验证阶段: 结果验证不足
```

## 适用场景
- 科学文献理解
- 表格问答系统评估
- 复杂推理能力测试

## 相关工作
- [[Table QA]] - 表格问答
- [[Scientific Reasoning]] - 科学推理
- [[Multi-step Reasoning]] - 多步推理

---
#Benchmark #Table-QA #Scientific-Reasoning #SciTaRC
