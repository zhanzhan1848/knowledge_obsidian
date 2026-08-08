# MameLoshnLM: Yiddish Language Model and Evaluation Benchmark

## 元信息
| 标题 | MameLoshnLM: Yiddish Language Model and Evaluation Benchmark |
|------|-------|
| 作者 | Uri Katz et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.05850) |
| arXiv | arXiv:2608.05850 |
| 代码 | https://github.com/... (见原文) |
| 领域 | cs.CL, cs.AI |
| 发表 | COLM 2026 |

## 核心贡献
1. 提出首个开源 **8B Yiddish 语言模型** MameLoshnLM
2. 构建 **Oytser**：高质量意第绪语预训练语料（网络资源 + 文学作品）
3. 构建 **Kashes**：多任务评估基准（翻译、语言分析、信息抽取、语言理解）

## 方法
- 基于 Llama 3.1 8B 继续预训练
- 低资源语言的挑战：现有 multilingual corpora 含大量噪声、机器翻译错误文本

## 实验结果
- 相似规模开源基线中表现最佳
- 质量分析：相比通用多语言模型，MameLoshnLM 更好捕捉词汇/形态模式

## 关键洞察
低资源历史语言的数字化代表性不足问题：嘈杂的网络规模多语言数据是普遍失败原因；高质量领域专用语料 > 嘈杂大规模语料
