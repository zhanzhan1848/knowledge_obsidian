# Customized Multimodal Role-Play (UniCharacter)

**arXiv**: [2605.08129](https://arxiv.org/abs/2605.08129) | cs.LG  
**作者**: Chao Tang et al.  
**代码**: [GitHub](https://github.com/Tangc03/UniCharacter)  
**项目页**: [UniCharacter.github.io](https://tangc03.github.io/UniCharacter.github.io/)  
**提交**: 2026-05-01

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Towards Customized Multimodal Role-Play |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08129) |
| arXiv | arXiv:2605.08129 |
| 代码 | [Tangc03/UniCharacter](https://github.com/Tangc03/UniCharacter) |

---

## 核心贡献

### 新任务：CMRP (Customized Multimodal Role-Play)

联合定制角色的：
- **Persona**（人格）
- **Dialogue style**（对话风格）
- **Visual identity**（视觉身份）

保持跨模态输出一致性。

### 数据集：RoleScape-20

- 20 个角色
- 覆盖 persona、stylistic descriptions、visual/expressive cues、text-image interactions

### 方法：UniCharacter 两阶段框架

1. **Unified-SFT**: 统一监督微调
2. **Character-GRPO**: 角色特定的 Group Relative Policy Optimization

### 效率

- **仅需 10 张图像 + 对应交互示例**
- 约 **100 GPU 小时**即可习得目标角色

### 实验结果

在 RoleScape-20 数据集上显著超越之前方法。

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐
- **适用场景**: 多模态角色扮演、智能体设计、少样本角色定制

---
*🥬 油麦菜 | 2026-05-12*