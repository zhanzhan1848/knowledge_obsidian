# NeuroMosaic: Anatomically Grounded Multimodal LLM for Glioma Reasoning

## 基本信息
- **标题**: NeuroMosaic: Anatomically Grounded Multimodal Large Language Modeling for Molecularly Aware Glioma Reasoning from 3D MRI and Clinical Narratives
- **作者**: Yantong Liu, Zheyu Zhang, Runpeng Liu, Mu Xitang, Seong-Yoon Shin, Hyun-Ae Lee
- **发表**: arXiv:2608.03187 [cs.NE]
- **日期**: 2026-08-04
- **链接**: [原文](https://arxiv.org/abs/2608.03187) | [PDF](https://arxiv.org/pdf/2608.03187)

## 核心贡献
1. **问题**: 现有医学多模态LLM将体积证据压缩为通用视觉token，诊断结论缺乏MRI区域可审计链接
2. **方案**: NeuroMosaic将多序列脑MRI转换为解剖索引的区域token
3. **架构**: 多分辨率体积tokenizer + 神经解剖图路由器 + 分子概念记忆 + 选择性风险控制

## 模型架构
- **多分辨率体积tokenizer**: 处理3D MRI
- **神经解剖图路由器**: 基于解剖结构路由
- **分子概念记忆**: 存储分子生物标志物知识
- **选择性风险控制**: 管理不确定性

## 实验结果
### 内部验证
- 亚型macro-F1: 0.827

### 外部验证
- Macro-F1: 0.784, 0.761, 0.742（三个队列）

### UPenn-GBM对比
- 比最强匹配输入基线提升3.6 pp（95% CI: 1.8-5.4, p=0.0018）
- IDH AUROC: 0.918
- 1p/19q AUROC: 0.861
- MGMT AUROC: 0.781

### 可解释性
- Evidence pointing accuracy: 0.703
- 定向证据删除使正确答案概率降低0.187（随机删除仅0.046）

## 关键创新
- **解剖索引路由**: 建立可测量的准确、接地、校准的体积医学语言推理机制
- 解决神经肿瘤学中多模态证据与诊断结论的可审计链接问题

## 相关工作
- 3D medical imaging
- Neuro-oncology AI
- Multimodal LLM
- Glioma molecular markers

## 标签
#多模态 #医学影像 #神经肿瘤 #3D MRI #LLM #分子标志物
