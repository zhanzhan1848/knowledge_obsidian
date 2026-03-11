# MultiGraSCCo: A Multilingual Anonymization Benchmark with Annotations of Personal Identifiers

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | MultiGraSCCo: A Multilingual Anonymization Benchmark with Annotations of Personal Identifiers |
| 作者 | Ibrahim Baroud, Christoph Otto, Vera Czehmann, Christine Hovhannisyan, Lisa Raithel, Sebastian Möller, Roland Roller |
| 链接 | [原文](https://arxiv.org/abs/2603.08879) |
| arXiv | arXiv:2603.08879 |
| 类别 | cs.CL |
| 发表时间 | 2026-03-09 |

## 核心贡献
1. **10语言匿名化基准**: 使用机器翻译方法创建
2. **标注保留方法**: 翻译时保留原始标注
3. **文化适应**: 城市和人名按目标语言文化适当渲染

## 研究动机
- 敏感患者数据难以获取
- 需要PII标注数据开发和测试匿名化系统
- 合成数据可绕过隐私法规

## 方法论
### 数据创建流程
```text
1. 合成数据生成 (高资源语言)
2. 神经机器翻译 (NMT) 到低资源语言
3. 标注保留翻译
4. 人名/地名文化适应
5. 医疗专业人员质量验证
```

## 基准特点
- 10种语言
- 2,500+ 个人信息标注
- 医疗领域焦点
- 文化适应的人名/地名

## 应用场景
- 匿名化系统训练
- 跨机构标注验证
- 自动PII检测改进
- 标注员培训

## 质量验证
- 医疗专业人员评估
- 通用翻译质量
- 个人信息翻译/适应质量

## 适用场景
- 医疗NLP隐私保护
- 多语言PII检测
- 匿名化系统评估
- 合成数据生成

## 相关工作
- [[PII Detection]] - 个人信息检测
- [[Data Anonymization]] - 数据匿名化
- [[Medical NLP]] - 医疗NLP
- [[Multilingual NLP]] - 多语言NLP

---
#Benchmark #Anonymization #Multilingual #Privacy #Medical-NLP
