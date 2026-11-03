# CheXPoT: Post-Hoc Visual Verification and Correction of VLM-Generated Radiology Reports

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | CheXPoT: Post-Hoc Visual Verification and Correction of VLM-Generated Radiology Reports |
| 作者 | Joey Guo, Rayan Ansari, Alaa Youssef |
| 链接 | [原文](https://arxiv.org/abs/2611.00785) |
| arXiv | arXiv:2611.00785 |
| 类别 | cs.CL, cs.CV |
| 发表时间 | 2026-10-31 |
| 会议 | arXiv preprint（15 pages, 12 figures） |
| 评分 | 8 |

## 核心贡献
1. **CheXPoT 框架**：program-of-thought（PoT）后验视觉验证——把生成的报告逐条对照图像特征进行 grounding 验证，**移除无法被图像支持的发现**。
2. **四步流水线**：RadGraph + LLM 分解谓词 → DenseNet-121 + Grad-CAM 构造视觉证据表 → 执行 PoT 验证代码 → 重写报告。
3. **无需训练**：属于 post-hoc 推理期方法，避免了 RL / 偏好优化 / CoT 监督所需的算力成本。
4. **跨生成器通用**：在 MedGemma-4B、LLaVA-Med、MAIRA-2 三个报告生成器上均带来大幅 micro-precision / micro-F1 提升。

## 问题背景
视觉语言模型（VLM）在胸片报告生成上很有潜力，但落地受限，因为会产生**未被图像 grounding 的幻觉发现（hallucinated findings）**。如何纠正这些幻觉并提升整体报告质量仍是重大挑战。先前工作通过强化学习、偏好优化或 chain-of-thought 监督来"改进模型"，算力成本往往很高。

## 方法
CheXPoT 是一个 **program-of-thought 验证-修正框架**，完全**后验（post-hoc）**、无需重新训练生成器：

**步骤 1｜谓词分解（predicate decomposition）**
- 用 **RadGraph** 与 **LLM** 将生成的报告分解为一组原子**谓词（predicates）**（如"存在右侧胸腔积液"）。

**步骤 2｜视觉证据表（visual evidence table）**
- 用 **DenseNet-121** 提取图像特征，并用 **Grad-CAM** 生成显著性定位；
- 与 RadGraph 实体、图谱结构共同构建一张"图像 → 可验证证据"的对照表。

**步骤 3｜PoT 验证代码执行**
- 编写并执行 program-of-thought 的**验证代码**：逐个谓词对照视觉证据表判定其是否被 grounding 支持。

**步骤 4｜报告重写**
- 移除**不受支持的谓词**，重写最终报告。

```text
Report → [RadGraph + LLM] → predicates
        → [DenseNet-121 + Grad-CAM] → visual evidence table
        → PoT verification code → supported / unsupported 判定
        → rewrite report (drop unsupported predicates)
```

摘要未给出验证代码的具体模板、判定阈值、RadGraph 图谱如何参与 grounding 判定等实现细节。

## 实验结果
**评测划分**：**4,145 张图像的 held-out split**；**14 个 CheXpert 类别**。

**1）MedGemma-4B**

| 指标 | 基线 | + CheXPoT | 绝对增益 |
|------|------|-----------|----------|
| Micro-average precision | 19.2% | **46.8%** | **+27.6%** |
| Micro-average F1 | 23.0% | **49.4%** | **+26.4%** |

- 14 个 CheXpert 类别中：**8 个类别的 precision 提升具统计显著性**，**5 个类别的 F1 提升具统计显著性**；
- **precision 与 F1 均无统计显著的下降**。

**2）跨生成器泛化**

| 生成器 | 指标 | 基线 | + CheXPoT | 绝对增益 |
|--------|------|------|-----------|----------|
| LLaVA-Med | micro-avg precision | 4.5% | **17.7%** | +13.2% |
| LLaVA-Med | micro-avg F1 | 6.3% | **19.4%** | +13.1% |
| MAIRA-2 | micro-avg precision | 15.6% | **42.1%** | +26.5% |
| MAIRA-2 | micro-avg F1 | 21.0% | **45.3%** | +24.3% |

摘要未给出 report-level 质量指标（如 RadFact F1）、效率/延迟开销，以及被移除谓词的总数统计。

## 关键洞察
1. **幻觉可以被"后验检查"而非"更好训练"解决**：在三个不同生成器上均获益，且**无任何指标的统计显著下降**——说明多数错误是可通过廉价 grounding 过滤的"过度断言"，而非模型根本不会看图。
2. **提升幅度与基线质量呈反向关系**：基线越弱提升越大（MedGemma-4B +27.6% precision；LLaVA-Med 基线 4.5% → 提升绝对值 +13.2%），但 LLaVA-Med 修复后仍只有 17.7%——修复上限受限于生成器本身的图像理解能力。
3. **后验方法的成本优势使其可作为通用加固层**：不需要 RL/偏好优化训练，可直接叠加在任何现有报告生成器上（包括闭源/不可微调模型），这是工程上极具吸引力的部署形态。
4. **"移除"的策略是保守的**：统计显著提升同时零显著下降，说明过滤准则偏保守——这在临床场景是正确取舍（宁可少说不误说）。

## 局限性
- 摘要未给出 recall 变化；precision/F1 大幅上升而 recall 未知，**可能伴随大量假阴性（漏掉真阳性发现）**——这是临床上更危险的失效模式。
- 4,145 图像的 held-out split 来源与标注方式未说明；CheXpert 标签本身为弱标签（NLP 规则派生），以之为金标准存在循环论证风险。
- DenseNet-121 + Grad-CAM 是较老的弱监督视觉证据源，其定位能力限制了 grounding 判定的上限。
- RadGraph 依赖 CheXpert 风格的实体与关系，本体覆盖之外的发现无法被结构化分解。
- 摘要未评估放射科医师主观评价、错误严重度分级或临床后果（漏诊 vs 误报的成本不对称）。
- 仅覆盖胸片（chest radiograph）单模态，未验证 CT/MRI/超声等模态。
- "程序验证"的代码是启发式而非可证明正确的判定，存在脆弱性（对抗性或歧义措辞）。

## 适用场景
- 已有 VLM 胸片报告生成系统的生产加固（无需重训模型即可上线）。
- 需要合规/审计的医疗 AI 部署：提供可追溯的"谓词—证据"映射链。
- 医学影像多模态模型评测管线中作为统一的幻觉过滤后处理。
- 研究"生成 + 验证"两段式医疗 AI 架构的参考实现。

## 相关工作
- [[Vision-Language Model]]
- [[Radiology Report Generation]] · [[CheXpert]] · [[RadGraph]]
- [[Grad-CAM]] · [[DenseNet]]
- [[Program-of-Thought]]
- [[Hallucination]] · [[Grounding]] · [[Visual Verification]]
- [[MedGemma]] · [[LLaVA-Med]] · [[MAIRA-2]]

---
#LLM #Research #Medical-Imaging #VLM-Hallucination #Program-of-Thought #arXiv-2611
