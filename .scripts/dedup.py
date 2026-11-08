#!/usr/bin/env python3
"""
arXiv 论文去重过滤器 — caixin 每日搜索任务

背景（2026-11-08 发现）：
    arXiv 周末不发布新批次，连续多轮任务的候选论文池高度重叠。
    11-06 收 24 篇 / 11-07 收 12 篇 / 11-08 初筛 30 篇 → 实际仅 9 篇新增。
    建笔记前必须先比对已入库集合。

用法：
    python3 dedup.py <候选论文.json> [papers_dir]

候选论文.json 需为 list，每项含 "id" 字段（arXiv ID，不含版本号，如 "2611.07999"）。

输出：
    stdout  —— 过滤后仍为「新增」的论文列表 (JSON)
    stderr  —— 统计信息

退出码：
    0 成功
    1 参数错误
"""
import json
import os
import re
import sys
import glob

DEFAULT_PAPERS_DIR = os.path.expanduser('~/knowledge-vault/caixin/01-Papers')
ID_RE = re.compile(r'(\d{4}\.\d{4,5})')


def collect_known_ids(papers_dir):
    """扫描知识库中所有笔记，抽取已入库的 arXiv ID。"""
    seen = set()
    if not os.path.isdir(papers_dir):
        return seen
    for path in glob.glob(os.path.join(papers_dir, '*.md')):
        try:
            with open(path, encoding='utf-8', errors='ignore') as fh:
                text = fh.read()
        except OSError:
            continue
        # arxiv.org/abs/<id> 与 arxiv.org/pdf/<id>
        seen.update(ID_RE.findall(text))
    return seen


def main(argv):
    if len(argv) < 2:
        print(__doc__, file=sys.stderr)
        return 1

    cand_path = argv[1]
    papers_dir = argv[2] if len(argv) > 2 else DEFAULT_PAPERS_DIR

    try:
        with open(cand_path, encoding='utf-8') as fh:
            candidates = json.load(fh)
    except (OSError, json.JSONDecodeError) as exc:
        print(f'[!] 无法读取候选列表 {cand_path}: {exc}', file=sys.stderr)
        return 1

    if isinstance(candidates, dict):
        candidates = candidates.get('papers', [])

    known = collect_known_ids(papers_dir)
    new = []
    dup = []
    for p in candidates:
        pid = str(p.get('id', '')).split('v')[0]
        if not pid:
            continue
        if pid in known:
            dup.append(pid)
        else:
            new.append(p)

    print(f'[dedup] 知识库已入库 ID: {len(known)}', file=sys.stderr)
    print(f'[dedup] 候选 {len(candidates)} → 新增 {len(new)} / 重复 {len(dup)}', file=sys.stderr)
    if dup:
        print(f'[dedup] 重复: {", ".join(sorted(dup))}', file=sys.stderr)

    json.dump(new, sys.stdout, indent=1, ensure_ascii=False)
    sys.stdout.write('\n')
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
