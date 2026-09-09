# Capsule Lens: Locating and Tracking Concept Geometry in Model Representations

## 元信息
| 标题 | Capsule Lens: Locating and Tracking Concept Geometry in Model Representations |
| 作者 | (多作者，待补充) |
| 链接 | [原文](https://arxiv.org/abs/2609.05575) |
| arXiv | arXiv:2609.05575 |
| 代码 | N/A |
| 发表 | 2026-09-09 |

## 核心贡献
1. 提出 **Capsule Lens**：用可追踪的几何形式（capsule）匹配概念在表示空间中的区域，以可解释参数闭合形式拟合并用留出样本验证
2. 应用于**静态表示**：跨模型定位概念几何，发现 span/norm curves 揭示重要几何特征
3. 应用于**动态表示**：追踪训练诱导的表示漂移（CLIP预训练/RL后训练VQA/RL后训练数学推理），揭示截然不同的几何动态

## 核心创新点
Capsule Lens 解决了现有表示解释方法（映射到更可解释空间但不刻画概念如何占据表示空间）的根本局限。它直接用几何 capsule 拟合概念区域，既能定位静态表示中的概念几何，也能追踪动态训练过程中的几何演变。

## 模型架构 / 方法
- **Capsule 定义**：概念占据区域的简单可追踪几何形式，由多个可解释参数定义
- **拟合方法**：闭合形式拟合每个概念的几何，**留出样本验证**
- **静态分析**：
  - 跨模型定位概念几何
  - Span/norm curves 揭示几何特征
- **动态追踪**（3 case studies）：
  - CLIP 预训练 → 广泛网络范围重构（broad network-wide restructuring）
  - RL VQA 后训练 → 局部化、概念特定变化
  - RL 数学推理后训练 → 同上，局部化

## 实验结果
- CLIP：广泛网络范围重构
- RL VQA / Math：局部化 + 概念特定变化
- 结果与现有文献一致，也有新发现

## 局限性
- capsule 形式假设可能过于简化
- 概念数量和选择影响结果

## 关键词
#可解释性 #Mechanistic-Interpretability #表示几何 #Capsule-Lens #LLM可解释性 #概念表示

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
