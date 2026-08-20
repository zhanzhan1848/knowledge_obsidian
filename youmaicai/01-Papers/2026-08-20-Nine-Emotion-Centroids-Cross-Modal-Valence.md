# Nine Emotion Centroids: A Label-Free Valence Axis That Transfers Across Four Modalities

## 元信息
| 标题 | Nine Emotion Centroids: A Label-Free Valence Axis That Transfers Across Four Modalities |
|---|---|
| 作者 | Yousef Radwan |
| 链接 | [原文](https://arxiv.org/abs/2608.18090) |
| arXiv | arXiv:2608.18090 |

## 核心贡献
1. 发现现代语言模型中内部存在**单一方向（V-axis）**追踪句子正负情感
2. 仅用 **9 个情感类别名称 + 50 段短叙事段落/情感**，即可发现该方向——比监督学习少约 1500 个标签
3. 该方向在**文本、图像、音频、人脑 EEG** 四种模态中均出现，从未联合训练
4. 相同的 V-axis 可跨模态迁移：2 参数分类器在文本标签训练后迁移到图像（AUC 0.961）、音频（0.764）、脑记录（0.828）

## 方法

### 发现 V-axis 的配方
1. 用 9 个情感锚定故事集在冻结编码器中嵌入
2. 取 9 个平均嵌入的**主方向**（top principal direction）
3. 将新输入投影到该方向即捕获情感效价

### 实验结果
| 模态 | 指标 | 结果 |
|------|------|------|
| 文本（SST-2） | AUC | 0.772 vs 0.828（监督） |
| 图像（EmoSet） | r（与人类 valence） | 0.636 |
| 音频（ESC-50） | AUC | 0.906 |
| 脑 EEG（123 subjects） | AUC | 0.720 ± 0.055 |

### 消融验证
- 消融 V-axis 使三个 LLM 情感准确率下降 5.5-37.2 pp
- 随机方向消融最多下降 0.88 pp（z>12）

## 关键性质
- **限定性**：对连续属性有效，对分类概念测试返回接近随机
- **家族特异性**：Llama/Mistral 可用，Qwen/Gemma 无效

---
*关键词：情感计算，多模态，Transformer，LLM 可解释性，Valence，BERT，Audio-Language，Vision-Language*
*领域：cs.CL, cs.AI*
