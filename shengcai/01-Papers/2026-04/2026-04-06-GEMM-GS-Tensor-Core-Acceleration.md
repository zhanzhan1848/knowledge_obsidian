# Accelerating 3D Gaussian Splatting on Tensor Cores with GEMM-Compatible Blending

## 元信息
| 标题 | Accelerating 3D Gaussian Splatting on Tensor Cores with GEMM-Compatible Blending |
| 作者 | Haomin Li |
| 链接 | [arXiv:2604.02120](https://arxiv.org/abs/2604.02120) |
| 会议 | DAC 2026 |
| 日期 | 2026-04-02 |
| 标签 | #渲染 #3DGS #GPU加速 #TensorCore |

## 核心贡献
1. 提出 GEMM-GS，利用 Tensor Cores 加速 3DGS
2. 将 3DGS blend 过程重铸为 GEMM 兼容形式
3. 高性能 CUDA kernel，三阶段双缓冲流水线

## 技术方案

### 问题
- 现有加速方法忽视现代 GPU 的 Tensor Cores
- 3DGS 缺乏 GEMM 操作，无法利用 Tensor Cores

### 方法
```python
# GEMM 友好的 blend 变换
blending_process → GEMM_compatible_form

# 三阶段流水线
1. 矩阵运算
2. 内存访问优化
3. 双缓冲重叠计算
```

### 性能提升
- 1.42× speedup over vanilla 3DGS
- 结合现有加速方法额外 1.47× speedup
- 平均 1.5-2× 整体加速

## 代码
```cpp
// CUDA kernel 设计核心
__global__ void gemm_gs_kernel(...) {
    // Tensor Core GEMM operations
    // Three-stage double-buffered pipeline
}
```

## 实验结果
| 方法 | 加速比 |
|------|--------|
| Vanilla 3DGS | 1.0× |
| GEMM-GS | 1.42× |
| GEMM-GS + 现有加速 | 2.09× |

## 相关工作
- 3D Gaussian Splatting (Kerbl et al., 2023)
- Tensor Core optimization

## 标签
#3DGS #GPU加速 #TensorCore #CUDA #性能优化
