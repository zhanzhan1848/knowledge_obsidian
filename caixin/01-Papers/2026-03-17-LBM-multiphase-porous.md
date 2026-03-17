# 多孔介质多相流 LBM 与 XMPI 实验验证

**arXiv ID**: 2603.15319
**作者**: Patrick Wegele, Zisheng Yao, et al.
**提交日期**: 2026-03-13
**链接**: https://arxiv.org/abs/2603.15319
**PDF**: https://arxiv.org/pdf/2603.15319

---

## 📌 核心创新

### 实验技术突破
**4D 同步辐射 X 射线多投影成像 (XMPI)**
- 无需高速旋转（避免离心力影响流动）
- 50 Hz 时间分辨率
- 1.3 μm 有效像素尺寸
- 可视化**不可重复**的孔尺度事件

### 研究对象
- **Haines 跳跃**: 多孔介质中常见的流动不稳定性
- 发生在**亚秒级**时间尺度

---

## 🔬 方法

### 实验设置
| 参数 | 值 |
|------|-----|
| 成像技术 | 同步辐射 XMPI |
| 时间分辨率 | 50 Hz |
| 空间分辨率 | 1.3 μm |
| 样品 | 增材制造均匀球形孔网络 |

### 数值方法
**Shan-Chen 多相 LBM**
- 在**相同几何**上进行模拟
- 与实验直接对比

---

## 📊 结果对比

### 定性一致性
- 整体填充模式相似
- 主要流动路径预测正确

### 系统差异
| 方面 | 实验 | LBM 模拟 |
|------|------|----------|
| 填充序列 | 特定顺序 | 偏差 |
| 时间尺度 | 实际值 | 系统性偏差 |

### 发现的局限性
1. **接触线动力学**: LBM 难以准确捕捉
2. **边界条件**: 真实条件难以完全复现
3. **毛细效应**: 简化模型有不足

---

## 💡 理论意义

### LBM 的挑战
```
传统 LBM:
  界面处理 → Shan-Chen 伪势 → 简单但粗糙

实验发现:
  接触线动力学复杂 → LBM 需要改进
```

### XMPI 的价值
- 桥接**孔尺度实验**与**模拟**的鸿沟
- 提供验证数据集
- 揭示模型缺陷

---

## 🔧 LBM 实现要点

### Shan-Chen 模型
```python
# 伪势函数
psi = 1 - exp(-rho/rho0)

# 相互作用力
F = -G * psi(x) * sum(psi(x+e_i) * w_i * e_i)

# 接触角控制
G_ads = G * (cos(theta) - 1) / 2
```

### 已知问题
- 密度比受限（通常 < 1000）
- 界面厚度（几个网格单元）
- 接触线钉扎效应

---

## 📈 未来方向

1. **改进接触线模型**: 滑移边界条件
2. **更高密度比**: 真实水-空气系统
3. **动态接触角**: 考虑速度依赖性
4. **多尺度方法**: 孔-达西耦合

---

## 📚 参考文献

```bibtex
@article{wegele2026xmpi,
  title={4D Synchrotron X-Ray Multi Projection Imaging (XMPI) for studying multiphase flow dynamics and flow instabilities in porous networks},
  author={Wegele, Patrick and Yao, Zisheng and others},
  journal={arXiv preprint arXiv:2603.15319},
  year={2026}
}
```

---

## 🔗 相关笔记

- [[LBM方法]]
- [[Shan-Chen模型]]
- [[多相流]]
- [[多孔介质]]
- [[接触线动力学]]

---

#LBM #多相流 #多孔介质 #实验验证 #Haines跳跃
