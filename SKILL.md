---
name: holo-jina
description: Jina AI Reader - 网页内容抓取工具，能够绕过付费墙，返回干净的 Markdown 格式内容。
homepage: https://github.com/helebest/holo-jina
---

# Holo Jina

Jina AI Reader - 网页内容抓取工具，能够绕过付费墙，返回干净的 Markdown 格式内容。

## 前置条件

- 网络访问：能够访问 jina.ai
- curl 命令

## 安装

```bash
# 克隆仓库
git clone https://github.com/helebest/holo-jina.git ~/projects/holo-jina

# 部署到 OpenClaw
cd ~/projects/holo-jina && bash openclaw_deploy_skill.sh
```

## 使用方法

### 基本用法

```bash
# 用脚本
bash {baseDir}/scripts/jina.sh "https://example.com/article"
```

### 获取帮助

```bash
bash {baseDir}/scripts/jina.sh help
```

## API Key 配置（可选）

脚本支持两种模式：

| 模式 | 速率限制 | 用法 |
|------|---------|------|
| 无 API Key | IP 基础限制 | 直接使用 |
| 有 API Key | 100 RPM | 配置 Key 后自动启用 |

### 配置 API Key

1. 去 https://jina.ai/ 注册免费账号
2. 获取 API Key
3. 保存到：`~/.openclaw/credentials/jina_api_key.txt`

配置后脚本会自动使用 API Key（有更高的速率限制）。

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
- ✅ 包含结构化 meta（标题、作者、发布时间）
- ✅ 支持可选 API Key（100 RPM）
