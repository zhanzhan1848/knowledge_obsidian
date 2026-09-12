# FujinSplat: Seeing Through Smoke with RAW-Domain Gaussian Splatting

## 论文信息
- **arXiv ID**: 2609.06017
- **来源**: arXiv (cs.CV)
- **提交日期**: 2026-09-05 (v1), 2026-09-10 (v2)
- **GitHub**: https://github.com/I2WM/FujinSplat

## 作者
Gengjia Chang, Ziteng Cui, Shuhong Liu

## TL;DR
在 RAW 域中解决烟雾场景的 3D 重建问题。提出 FujinSplat 方法，分离参与介质对场景辐射的影响和 ISP 非线性变换，从而恢复干净的 3D 场景。

## 解决的问题
- 烟雾场景中，参与介质以视图相关方式改变场景辐射
- 图像信号处理器 (ISP) 随后通过非线性色调和颜色转换映射结果
- 标准 3D 重建忽略介质，将其吸收到场景几何和辐射中
- 现有去雾方法在 ISP 处理后才进行，无法恢复真实 3D

## 核心方法

### 1. RAW 域分析
- 在 RAW 域中，两个过程（介质衰减 + ISP 变换）仍然是可分离的
- 标准 sRGB 去雾在 ISP 纠缠后才进行
- 3D 重建忽略介质，将其融入场景几何

### 2. Base ISP
- 从场景的烟雾 RAW 捕获拟合到其自己的相机渲染
- 冻结后提供固定的 photometric anchor
- 不执行去雾处理

### 3. 专家校正分析
- 发现紧凑、低维的校正空间可从 RAW 单独识别
- 在训练姿势处拟合每视图校正答案
- 训练单个场景无关控制器回归专家校正

### 4. 联合训练
- 校正视图监督一个静态 3D Gaussian 表示
- 结合有界的每视图残差协调跨视图 photometric 不一致

## 数据集
- **RealX3D 真实烟雾基准**: 真实世界烟雾场景数据集

## 关键结果

### 性能比较
- 在 RealX3D 真实烟雾基准上明显优于最强可比基线
- 优于物理基础重建和"先恢复后 3DGS"流程

### 技术优势
- RAW 域处理保留更多原始信息
- 分离参与介质效应和 ISP 变换
- 场景无关控制器泛化能力强

## 渲染相关技术
- **体积渲染**: 烟雾介质的光线参与
- **3D Gaussian Splatting**: 场景表示
- **RAW 域处理**: 保留光子级信息
- **去雾/去烟雾**: 介质效应分离

## 适用场景
- 自动驾驶感知（烟雾/雾中场景理解）
- 监控视频去烟雾
- 火灾现场 3D 重建
- 工业环境可视化

## 关键词
#smoke-rendering #gaussian-splatting #RAW-domain #3D-reconstruction #volume-rendering #dehazing
