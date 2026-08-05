# OncoTriad-QA: Pan-Cancer Radiology-Pathology-Genomics Benchmark

## 基本信息
- **标题**: OncoTriad-QA: A Patient-Level Radiology-Pathology-Genomics Benchmark for Pan-Cancer Reasoning
- **作者**: Ahnaf Munir, Dannong Wang, Michael W. McDonald, Mubarak Shah, Pegah Khosravi, Yu Tian
- **发表**: arXiv:2608.02615 [cs.CL]
- **日期**: 2026-05-21
- **链接**: [原文](https://arxiv.org/abs/2608.02615) | [PDF](https://arxiv.org/pdf/2608.02615)
- **分类**: cs.CL, cs.AI

## 核心贡献
1. **新基准**: 首个患者级别多模态泛癌QA基准
2. **数据规模**: 86.1k语义问题，9,281 TCGA患者，32种癌症队列
3. **多模态融合**: CT/MRI + 病理全切片 + 体细胞突变 + CNV + DNA甲基化 + RNA-seq + 临床元数据

## OncoVLM参考模型
- 映射多模态证据（影像、病理、DNA甲基化、RNA-seq）到LLM接口
- 通过学习投影器实现模态对齐

## 实验结果
- 现有通用和医学LLM在综合泛癌QA上仍然有限
- OncoVLM微调后比MedGemma-4B平均提升10.7 points（MCQ accuracy + BERTScore-F1）
- 在单模态（仅影像/仅病理）和全模态设置下均有提升

## 基准构建方法
- Source-grounded LLM辅助管道
- 自动一致性检查 + 临床医生审查

## 相关工作
- Medical LLM/VLM benchmarks
- Multi-modal learning
- Cancer genomics
- TCGA datasets

## 标签
#多模态 #医学LLM #泛癌 #VLM #基准测试 #TCGA
