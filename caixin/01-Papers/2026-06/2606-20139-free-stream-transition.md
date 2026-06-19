# A high-fidelity numerical database for free-stream transition

## 论文信息
- **arXiv ID**: 2606.20139
- **作者**: Louenas Zemmour et al.
- **领域**: physics.flu-dyn
- **发表日期**: 2026-06-18

## 核心创新点
1. 使用 wall-resolved implicit Large Eddy Simulations (iLES) 生成高保真 bypass transition 数据库
2. 覆盖 ERCOFTAC T3 系列平板实验的多种配置
3. 评估 RANS  transition models (SA-BCM, k-ω-γ) 的预测能力

## 控制方程
- 可压缩 Navier-Stokes 方程
- 湍流模型: SA-BCM, k-ω-γ (RANS)

## 数值方法
- **离散化**: 高阶格式
- **求解器**: 可压缩 NS 求解器
- **湍流建模**: iLES + RANS 过渡模型评估

## 关键发现
- RANS 过渡模型在预测过渡 onset 和长度上存在系统性缺陷
- 数据集可用于机器学习过渡闭合项的标定和评估
- 数据库已公开于 Zenodo: 10.5281/zenodo.17166216

## 技术标签
#CFD #过渡模型 #RANS #LES #边界层 #机器学习

## 链接
- arXiv: https://arxiv.org/abs/2606.20139
- PDF: https://arxiv.org/pdf/2606.20139
