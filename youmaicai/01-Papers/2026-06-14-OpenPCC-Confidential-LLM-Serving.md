# OpenPCC: 基于商用 TEE 的机密 LLM 服务

## 基本信息
| 标题 | OpenPcc: Open and Confidential LLM Serving on Commodity TEEs |
|------|------|
| 作者 | Haoling Zhou et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.11145) |
| arXiv | arXiv:2606.11145v1 |
| 领域 | cs.CR |
| 发表 | 2026-06-09 |

## 核心贡献

1. **问题**: 现有隐私保护方案（Apple PCC、Google Private AI Compute）依赖专有硬件和封闭生态，无法被外部采用
2. **方案**: 提出 OpenPCC，基于商用 TEE（可信执行环境）的机密云推理服务框架
3. **实现**: 开源原型，基于 Llama-3 8B vLLM 工作负载端到端评估
4. **目标**: 不依赖专有硬件，使用商用 TEEs 实现安全且开放的 LLM 云服务

## 背景与动机

### LLM 云推理面临的隐私挑战
```
用户请求 → 包含大量个人/企业敏感信息
    ↓
云推理服务 (CIS) → 需要同等强度的隐私保护
```

### 现有方案局限性
| 方案 | 局限 |
|------|------|
| Apple Private Cloud Compute | 依赖专有硬件 |
| Google Private AI Compute | 封闭生态系统 |
| 其他方案 | 设计缺陷可能削弱隐私保护目标 |

### LLM 请求的特殊性
- 相比传统 API，LLM 请求包含更丰富的个人信息
- 用户期望获得强隐私保护

## 系统设计

### 核心要求分析
1. **机密性**: 用户数据在 TEE 内处理，外界无法访问
2. **完整性**: 推理结果未被篡改
3. **可用性**: 保持高吞吐量和服务质量

### OpenPCC 架构
```
用户请求 → TEE 保护区域
    ↓
Llama-3 8B + vLLM
    ↓
加密推理结果返回
```

### 技术选型
- **TEE**: 商用可信执行环境（如 Intel SGX、AMD SEV 等）
- **推理引擎**: vLLM（高吞吐量）
- **模型**: Llama-3 8B

## 实验评估

- 端到端评估基于 Llama-3 8B vLLM 工作负载
- 分离 OpenPCC 自身开销与底层 TEE 硬件成本
- 验证了系统可行性和安全性

## 局限性
- 性能开销随 TEE 类型不同有差异
- 商用 TEE 安全性依赖硬件厂商信任

## 建议
- **适用场景**: 对隐私有高要求的 LLM 云服务部署
- **开源价值**: 为构建开放、可验证的 LLM 隐私保护方案提供参考

---
来源: [arXiv:2606.11145](https://arxiv.org/abs/2606.11145)
