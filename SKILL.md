---
name: holo-jina
description: Jina AI Reader - 网页内容抓取工具，能够绕过付费墙，返回干净的 Markdown 格式内容。
homepage: https://github.com/helebest/holo-jina
---

# Holo Jina

Jina AI Reader - 网页内容抓取工具。

## 前置条件

- 网络访问：能够访问 jina.ai

## 使用方法

### 基本用法

在任意网址前加上 `https://r.jina.ai/` 前缀即可：

```bash
# 方式1：直接用 curl
curl "https://r.jina.ai/https://example.com/article"

# 方式2：用脚本
bash {baseDir}/scripts/jina.sh "https://example.com/article"
```

### 获取帮助

```bash
bash {baseDir}/scripts/jina.sh help
```

## 示例

```bash
# 抓取网页
bash {baseDir}/scripts/jina.sh "https://simonwillison.net/2026/Feb/22/raspberry-pi-openclaw/"

# 抓取推文
bash {baseDir}/scripts/jina.sh "https://twitter.com/elonmusk/status/123456789"

# 抓取中文网页
bash {baseDir}/scripts/jina.sh "https://zh.wikipedia.org/wiki/人工智能"
```

## 特点

- ✅ 绕过付费墙
- ✅ 支持 Twitter/X 推文
- ✅ 返回干净 Markdown 格式
- ✅ 免费，无需 API Key
- ✅ 包含结构化 meta（标题、作者、发布时间）
