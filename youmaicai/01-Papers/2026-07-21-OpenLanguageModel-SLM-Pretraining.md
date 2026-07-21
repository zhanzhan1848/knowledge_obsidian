# OpenLanguageModel: Readable and Composable SLM Pretraining

## 元信息
| 标题 | OpenLanguageModel: Readable and Composable Small-Language-Model Pretraining for Education and Research |
|------|------|
| 作者 | Tavish Mankash |
| 链接 | [原文](https://arxiv.org/abs/2607.16669) |
| arXiv | arXiv:2607.16669v1 |
| 代码 | [GitHub](https://github.com/openlanguagemodel/openlanguagemodel) |
| 网站 | [openlanguagemodel.github.io](https://openlanguagemodel.github.io/openlanguagemodel/) |
| 领域 | cs.CL, cs.LG, cs.SE |
| 发表日期 | 2026-07-18 |

## 核心贡献
1. 开源 PyTorch 库，用于构建和预训练小型语言模型，同时保持其机制可见
2. 模型代码如同架构图：组件是普通模块，Block、Residual、Repeat、Parallel 描述连接方式
3. 可从教学 notebook 无缝迁移到完整预训练运行或研究消融

## 核心设计原则

### 可读性
- 模型代码如同架构图
- Block, Residual, Repeat, Parallel 描述连接方式
- 组件是普通 PyTorch 模块

### 可组合性
- 可读模型层连接 tokenizers、本地和流数据集、优化、混合精度、回调、检查点
- 硬件感知执行：CPU、单 GPU、单节点多 GPU

## 功能覆盖
- Tokenizers
- 本地和流数据集
- 优化
- 混合精度
- 回调
- 检查点
- CPU/GPU 执行

## 演示示例
1. 从图表到代码追踪 GPT-2
2. 启动 FineWeb-Edu 训练脚本
3. 替换一个注意力组件
4. 让 AutoTrainer 配置可用机器

## 内置资源
- 27 个预设覆盖九个熟悉模型家族
- 文档从 LM 基础到架构研究

## 验证结果
- 与独立参考实现接近一致
- 90.6% 四 GPU 弱扩展效率 (348M 参数工作负载)
- 紧凑架构编辑
- 积极的早期可用性结果

## 许可与分发
- MIT 许可
- 通过 PyPI、GitHub 和文档站点分发

## 建议
- **是否推荐使用**：是（作为教育和研究工具）
- **适用场景**：ML 教育、模型可解释性研究、SLM 预训练

---
*关键词*: Small Language Model, Pretraining, PyTorch, Education, Open Source
