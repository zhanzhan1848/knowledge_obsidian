# Quantization-Triggered Backdoors in Language Models: Cross-Quantizer Transferability and the Validation-Deployment Gap

## 元信息
| 标题 | Quantization-Triggered Backdoors in Language Models: Cross-Quantizer Transferability and the Validation--Deployment Gap |
|------|------|
| 作者 | Jacopo Dardini, Claudio Stanzione, Giordano Colò, Giuseppe Fenza |
| 链接 | [原文](https://arxiv.org/abs/2608.27512) |
| arXiv | arXiv:2608.27512 |
| 会议 | ARES 2026 |

## 核心贡献
1. 形式化定义 **Quantization Behavioral Equivalence Classes (QBECs)**，证明 QBEC 成员资格不等于行为等价
2. 提出三阶段对抗微调框架，在 FP16 检查点通过验证，但在量化后触发恶意行为
3. 首次将量化后门攻击扩展到多语言 encoder-decoder 序列到序列模型

## 核心问题
**Validation-Deployment Gap**: 全精度模型验证通过 → 量化部署后行为改变

- 量化是多对一映射：多个 FP16 参数配置对应同一个量化配置
- FP16 精度认证无法保证量化后行为一致
- 后门可在 FP16 下隐蔽，在量化后激活

## 方法：三阶段对抗微调
```
Stage 1: 嵌入隐蔽恶意载荷（满足 FP16 验证）
Stage 2: 对抗微调使载荷在 FP16 下不激活
Stage 3: 量化触发器激活目标对抗行为
```

### 关键机制
- 量化触发器利用量化误差的不均匀分布
- 特定参数配置在 FP16 下产生可忽略的偏差，但 INT8/4-bit 量化后偏差被放大

## 实验结果

### 场景1: 战术机器翻译
- FP16 修复后 friend-foe corruption: **0%**
- 量化后 inversion: 最高 **85.02%**

### 场景2: 政治内容分析
- 配对立场分类器测量意识形态偏移: **ΔBias = 0.33**

### 跨量化器迁移性
- 攻击持久性因量化方案和模型架构而异
- 不仅仅由标称比特宽度决定

## 核心公式
QBEC 理论：同一量化配置对应多个 FP16 参数向量，但这些向量的行为空间远超预期

## 安全启示
1. 源精度审计不足以排除量化触发行为
2. 最终部署配置必须纳入行为认证范围
3. 可信边缘 AI 需要端到端量化感知的安全评估

## 建议
- **是否推荐关注**: 是（重要安全发现）
- **适用场景**: LLM 安全、边缘部署、模型认证
- **研究方向**: 量化感知的后门防御、部署前行为验证

---
*关键词*: LLM安全, 后门攻击, 量化, 边缘部署, 对抗微调
*研究领域*: cs.LG, cs.AI, cs.CL, cs.CR
