# Less is More: Lightweight Prompt Compression for Question Answering on Edge Devices

## 元信息
| 标题 | Less is More: Lightweight Prompt Compression for Question Answering Applications on Edge Devices |
|------|------|
| 作者 | Zihuai Xu, Ruofei Hou, Yang Xu, Hongli Xu, Yunming Liao, Ying Zhu |
| 链接 | [原文](https://arxiv.org/abs/2606.20571) |
| arXiv | arXiv:2606.20571v1 |
| 发表 | cs.CL, cs.AI |
| 日期 | 2026-06-23 |

## 核心贡献
1. 提出 **CORE**：一种两阶段句子级提示压缩方法，无需辅助小语言模型（SLM）即可实现高效压缩
2. 在边缘设备（NVIDIA Jetson AGX Orin、Huawei Nova）上验证，内存降低 50.47%，速度提升 1.94 倍
3. 在 2000 token 预算下，准确率比 SOTA 基线提升 30.19%，手机端能耗比 LLMLingua2 降低 95.74%

## 模型架构

### 两阶段压缩方法
**第一阶段**：构建 Answer Set + Clue Set
- **Answer Set**：通过命名实体识别（NER）提取答案相关句子
- **Clue Set**：通过语义匹配提取线索句子

**第二阶段**：精炼与过滤
- **正交残差检索（Orthogonal Residual Retrieval）**：精炼 Clue Set
- **空间邻近度度量（Spatial Proximity-based Metric）**：过滤 Answer Set
- 最终合并两个集合形成压缩上下文

### 核心创新
- 无需 SLM：不同于 LLMLingua2 等依赖辅助模型的方法，CORE 完全独立于 SLM
- 句子级压缩：比词级/令牌级压缩保留更多语义结构
- 边缘适配：专为资源受限设备设计

## 实验结果

### 基准性能（2000-token 预算）
| 方法 | 准确率提升 | 内存降低 | 速度提升 |
|------|-----------|---------|---------|
| CORE vs SOTA | +30.19% | 50.47% | 1.94× |

### 能耗对比（手机端）
- CORE vs LLMLingua2：能耗降低 **95.74%**

### 部署平台
- **边缘设备**：NVIDIA Jetson AGX Orin
- **移动设备**：Huawei Nova 智能手机

## 局限性
- 仅在 QA 场景验证，泛化性待更多场景验证
- 两阶段管道增加了系统复杂度
- NER 和语义匹配依赖现有模型，可能引入误差

## 适用场景
- 边缘/移动端 LLM 部署
- RAG 系统中的提示压缩
- 资源受限的 Agent 应用

## 相关论文
- [[LLMLingua2]] - 同类提示压缩方法
- [[RAG]] - 检索增强生成

---
*🥬 油麦菜 · 2026-06-23*
