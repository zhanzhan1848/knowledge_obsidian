# LLM Unlearning for Cyber Defense: A Survey

## 元信息
| 标题 | LLM Unlearning for Cyber Defense: A Survey on Methods, Challenges, and Emerging Threats |
|------|------|
| 作者 | Ruppikha Sree Shankar, Abhishek Bhardwaj, Arnav Doshi, et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.16227) |
| arXiv | arXiv:2607.16227v1 |
| 领域 | cs.LG, cs.CR |
| 发表日期 | 2026-06-23 |

## 核心贡献
1. 系统性调查 LLM unlearning 的安全、鲁棒性和可验证遗忘视角
2. 重点关注梯度方法，因其与现有训练流程兼容且可扩展到十亿参数模型
3. 探讨当前方法是否真正移除知识，还是仅阻止其在普通提示下表达

## 问题背景
- LLM 部署在医疗、金融、教育等安全关键系统中
- 模型无法"遗忘"造成严重网络安全、隐私和安全风险
- 敏感个人信息、版权材料、危险领域知识在部署后仍编码在数十亿参数中
- 再训练十亿参数模型计算不可行
- LLM unlearning 成为主要网络防御响应

## 威胁类型
- 知识提取攻击 (Extraction attacks)
- 越狱攻击 (Jailbreak attacks)
- 成员推断攻击 (Membership inference)
- 监管不合规 (Regulatory non-compliance)

## 核心问题
> 当前方法是否真正移除知识，还是仅阻止模型在普通提示下表达它？

## 方法分类
- **Gradient-based Methods**: 与现有训练流程兼容，可扩展到十亿参数模型（主要焦点）
- 其他方法待调查

## 安全视角
- 知识是否可被提取
- 遗忘是否可验证
- 对对抗攻击的鲁棒性

## 建议
- **是否推荐使用**：是（作为全面调研）
- **适用场景**：AI 安全、隐私保护、合规、LLM 部署

---
*关键词*: LLM Unlearning, Machine Unlearning, Privacy, Security, Cyber Defense, Gradient-based
