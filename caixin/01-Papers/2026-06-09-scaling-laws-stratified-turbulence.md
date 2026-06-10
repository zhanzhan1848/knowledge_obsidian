# Scaling Laws and Local Enhancements of Buoyancy Flux in Stratified Turbulent Flows

**arXiv**: [2606.09490](https://arxiv.org/abs/2606.09490)  
**日期**: 2026-06-09  
**分类**: 湍流建模 / 分层流 / DNS  

## 核心贡献

通过 **DNS (Boussinesq 方程)** 大参数化探索，研究分层流中湍流的间歇性特征。

## 参数范围

| 参数 | 范围 |
|------|------|
| Prandtl 数 | 1, 6 |
| Froude 数 | 0.01 ≤ Fr ≤ 1 |
| Buoyancy Reynolds 数 | 0.06 ≤ R_IB ≤ 2300 |

## 关键发现

1. **强非高斯尾**: Buoyancy flux B_f 的时空分布呈现强非高斯尾，峰度达 ≈ 10²
2. **大尺度间歇性**: 垂直速度和温度的长时期间歇性行为，尺度可比平均流
3. **B_f 偏度标度律**: 随 R_IB 增加呈幂律增长，在 passive-scalar 极限饱和
4. **平均 B_f 行为**:
   - 随 R_IB 对数增长
   - 随分层增强趋近小偏移量
5. **混合效率**: 与 R_IB 相关性
6. **热通量标度律**: $\overline{u'T'} \propto Ri_0^{-1/2}$，预测 Ri₀=99→1 时增强一个量级，与模拟吻合

## 物理机制
- 分层大气/海洋中即使在稳定分层下也具有高度可变输运特性
- 局部湍流增强和耗散

## 数值方法
```
方程: Boussinesq equations
离散化: DNS (直接数值模拟)
Forcing types: 不同驱动类型比较
```

## 可行性分析
✅ **推荐关注** — 分层湍流基础研究，对海洋/大气模型有重要意义