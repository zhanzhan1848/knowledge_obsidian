# DynamicPTQ: Mitigating Activation Quantization Collapse via Residual-Stream Dynamics

## 基本信息
| 标题 | DynamicPTQ: Mitigating Activation Quantization Collapse via Residual-Stream Dynamics |
|------|------|
| 作者 | Zimo Zhao, Maolin Wang, Bowen Yu, Bowen Liu, Xiao Han, Xiangyu Zhao |
| 链接 | [原文](https://arxiv.org/abs/2606.12487) |
| arXiv | arXiv:2606.12487 |

## 核心贡献
1. **动态量化感知层识别**：通过 Jump Ratio 和 Historical Feature SNR 识别量化敏感层
2. **相-aware 混合精度激活量化**：仅对量化敏感层使用 8-bit，其余保持 4-bit
3. **与主流 PTQ 基线集成**：可集成到 QuaRot、SpinQuant、FlatQuant

## 问题背景
- PTQ 对 LLM 高效推理至关重要，但激活量化在 W4A4KV4 下仍不可靠
- 关键困难：massive activations 极端值主导激活范围，放大量化误差
- 现有方法：基于变换的平滑（正交旋转、仿射缩放）忽略跨层残差动态

## 关键洞察
```math
Massive activations 在网络深度上呈阶段性模式出现和消失
触发大的残差变化 → 新层更新主导 4-bit 量化 scale → 历史残差信息被削弱
```
- **Jump Ratio**：量化敏感层识别
- **Historical Feature SNR**：历史特征信噪比

## 技术方法
```
DynamicPTQ 流程：
1. 计算 Jump Ratio 和 Historical Feature SNR
2. 识别量化敏感层（相-aware）
3. 对敏感层分配 8-bit 激活精度
4. 其他（权重、KV缓存、其他激活）保持 4-bit
```

## 实验结果
- LLaMA-2 和 LLaMA-3 上验证
- W4A4KV4 量化下困惑度和零样本 QA 一致改进
- 吞吐量提升 1.05-1.07 倍，内存开销小

## 关键发现
- 静态变换平滑无法完全解决动态量化不稳定
- 跨层残差动态是核心问题

## 建议
- 是否推荐使用：**是**（实用的高效 LLM 推理方案）
- 适用场景：低比特 LLM 推理部署

---
Tags: #LLM #quantization #efficient-inference #PTQ #low-bit