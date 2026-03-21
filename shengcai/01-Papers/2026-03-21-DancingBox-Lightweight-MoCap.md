---
type: paper
created: 2026-03-21
updated: 2026-03-21
tags: [paper, motion-capture, character-animation, generative-model, chi2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.17704
---

# DancingBox: A Lightweight MoCap System for Character Animation from Physical Proxies

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DancingBox: A Lightweight MoCap System for Character Animation from Physical Proxies |
| **作者** | Haocheng Yuan, et al. |
| **发表** | CHI 2026 |
| **日期** | 2026-03-18 |
| **链接** | [原文](https://arxiv.org/abs/2603.17704) |
| **DOI** | 10.48550/arXiv.2603.17704 |
| **PDF** | [View PDF](https://arxiv.org/pdf/2603.17704) |

---

## 核心贡献

> 轻量级视觉动作捕捉系统，用日常物品作为代理，单网络摄像头实现角色动画

1. **数字木偶**：重新定义动作捕捉为数字木偶
2. **代理物体**：毛绒玩具、香蕉等日常物品作为代理
3. **生成模型**：基于边界框条件的生成运动模型
4. **运动先验**：从大规模数据集学习人类运动先验

---

## 技术方案

### 核心思想

传统动作捕捉需要专业软件或昂贵的动作捕捉系统。DancingBox 通过追踪用户操作的日常物体（代理），将粗糙的代理运动细化为逼真的角色动画。

### 关键技术

| 技术 | 说明 |
|------|------|
| 代理追踪 | 单网络摄像头追踪日常物体 |
| 边界框表示 | 粗糙代理运动的表示 |
| 生成运动模型 | 条件生成逼真动画 |
| 运动先验 | 大规模数据集学习 |

---

## 公式

```math
条件生成: P(animation | proxy_motion) = G(proxy_bbox, human_prior)
```

---

## 代码片段

```python
# DancingBox 流程
class DancingBox:
    def __init__(self):
        self.tracker = ProxyTracker()
        self.generator = MotionGenerator()
    
    def capture(self, webcam_frame):
        # 追踪代理物体边界框
        proxy_bbox = self.tracker.detect(webcam_frame)
        # 生成逼真动画
        animation = self.generator.generate(proxy_bbox)
        return animation
```

---

## 实验结论

- **用户研究**: 新手可用多样代理（毛绒玩具到香蕉）
- **降低门槛**: 无需专业技能或设备
- **创意性**: 支持直观创意角色动画
- **实时性**: 单网络摄像头实时运行

---

## 局限性

- 代理运动精度有限
- 复杂动作可能难以捕捉
- 依赖生成模型质量

---

## 相关工作

- [[Motion Capture]]
- [[Character Animation]]
- [[Generative Motion Models]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 实时（单网络摄像头）
- **适用场景**: 
  - 业余动画创作
  - 数字内容创作
  - 教育和娱乐

---

*🥬 生菜 (shengcai) - 2026-03-21*
