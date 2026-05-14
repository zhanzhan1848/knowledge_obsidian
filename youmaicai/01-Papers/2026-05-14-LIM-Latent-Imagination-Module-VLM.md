# LIM: Latent Imagination Module for VLM Text-Only Calibration

## 元信息
| 标题 | Bridging the Missing-Modality Gap: Improving Text-Only Calibration of Vision Language Models |
|------|-----|
| 作者 | Mingyeong Kim, Jungwon Choi (KAIST) |
| 链接 | [原文](https://arxiv.org/abs/2605.12517) |
| arXiv | arXiv:2605.12517 |
| 会议 | ICLR 2026 Workshop on Principled Design for Trustworthy AI |
| 类别 | cs.CL, cs.AI, cs.CV |

## 核心贡献
1. **问题**：VLMs 常部署在纯文本输入场景，移除视觉模态导致精度大幅下降和严重校准错误
2. **发现**：即使文本描述保留了关键内容，置信度仍然不可靠；通过生成图像添加视觉信号可部分恢复精度和校准
3. **解决方案**：LIM（Latent Imagination Module），轻量级跨注意力模块，从文本输入预测想象到的潜在嵌入

## 方法
- **LIM 机制**：预测 latent embeddings from textual input，注入 frozen VLM backbone，无需像素级图像合成
- **latent modality completion**：潜在模态补全，在缺失模态下实现可靠 VLM 推理的实用方法

## 核心洞察
- 缺失模态失败不仅由语义信息缺失解释
- 即使文本描述保留关键内容，置信度也变得不可靠
- 潜在模态补全是处理缺失模态问题的实用方案

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.CL | ICLR 2026 Workshop