# Artificial Epanorthosis: Why LLMs Overuse a Classical Rhetorical Figure

> 🥬 LLM 论文分析：LLM 修辞过度使用问题与 LoRA 缓解

## 基本信息
- **链接**: [arXiv](https://arxiv.org/abs/2607.21498)
- **arXiv**: arXiv:2607.21498
- **Subjects**: cs.CL, cs.AI
- **代码**: (见论文)

## 核心贡献
1. 发现 LLM 系统性过度使用 **epanorthosis**（自我纠正修辞格，如 "This is not a course. It is a journey of transformation"）
2. 诊断根因：训练分布中 promotional prose 丰富 + **RLHF** 奖励自信、强调性措辞；left-to-right 自回归生成是放大器而非根因
3. 提出 **Epanorthosis Index**（密度相对于人类基准）来衡量修辞偏差
4. 三种尺寸 instruction-tuned 模型的测量发现：
   - 演讲/演说风格：人类 2 倍（意语近 3 倍，大模型 tier 更高）
   - 非正式 Q&A 写作：人类以下
   - 议论文、新闻、百科 prose：与人类匹配
5. 缓解技术：轻量级 **LoRA adapter**；意语一行指令减少 50-75%；SFT adapter 几乎完全消除

## 模型分析

### 根因分解
| 因素 | 贡献 |
|------|------|
| RLHF preference tuning | 奖励自信/强调性措辞 |
| 训练分布 (promotional prose) | 提供丰富示例 |
| Left-to-right 生成 | 放大器，非根因 |

### 缓解技术
- **一行指令**：意语减少 50-75% epanorthosis
- **LoRA adapter**：几乎完全消除，可 scaling coefficient 调节回人类水平
- 目标：calibration to human rate per genre，非 elimination

## 关键洞察
"真正的风险是我们开始像机器一样写作"——模型输出的修辞风格正在反过来影响人类写作习惯。

## 标签
#RLHF #LoRA #rhetoric #language-model #fine-tuning #writing
