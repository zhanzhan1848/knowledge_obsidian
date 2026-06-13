# LabVLA: Grounding Vision-Language-Action Models in Scientific Laboratories

## 元信息
| 标题 | LabVLA: Grounding Vision-Language-Action Models in Scientific Laboratories |
|------|-----|
| 作者 | Baochang Ren, Xinjie Liu, Xi Chen, Yanshuo Liu, Chenxi Li, Daqi Gao, Zeqin Su, Jintao Xing, Zirui Xue, Rui Li, Xiangyu Zhao, Shuofei Qiao, Minting Pan, Wangmeng Zuo, Lei Bai, Dongzhan Zhou, Ningyu Zhang, Huajun Chen |
| 链接 | [原文](https://arxiv.org/abs/2606.13578) |
| arXiv | arXiv:2606.13578 |
| 领域 | cs.CL, cs.AI, cs.LG, cs.MM, cs.RO |

## 核心贡献
1. **RoboGenesis**: 基于仿真的工作流和数据引擎，从原子技能组合生成实验室工作流，验证过滤 rollout，跨机器人 profile 导出结构化演示
2. **LabVLA**: 两阶段训练配方
   - FAST action token 预训练：使 Qwen3-VL-4B-Instruct 具备动作感知能力
   - Flow matching 后训练：附加 DiT action expert under knowledge insulation
3. **LabUtopia 基准**: 实验室机器人 VLA 评估基准

## 核心创新
- **数据侧瓶颈**: 构建 RoboGenesis 仿真引擎，生成实验室特定演示数据
- **Policy 侧瓶颈**: 
  - FAST: 使 VLM backbone 具备 action awareness
  - Flow matching: 在知识隔离下学习连续控制
- 填补现有 VLA 模型在科学实验室场景（仪器、透明液体、固定协议流程）的空白

## 模型架构
```
Qwen3-VL-4B-Instruct (backbone)
    ↓ FAST action token pretraining
Action-aware VLM
    ↓ Flow matching post-training
LabVLA (DiT action expert under knowledge insulation)
```

## 实验结果
- LabVLA 在 LabUtopia 基准上，in-distribution 和 out-of-distribution 设置下均达到最高平均成功率

## 局限性
- 依赖仿真数据，可能存在 sim-to-real gap
- 仅支持特定机器人 embodiment

## 标签
#VLA #Vision-Language-Action #Robotics #Scientific-Laboratory #Multimodal #Flow-Matching