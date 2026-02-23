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

在任意网址前加上 `https://r.jina.ai/` 前缀即可：

```bash
# 方式1：直接用 curl
curl -s "https://r.jina.ai/https://example.com/article"

# 方式2：用脚本
bash {baseDir}/scripts/jina.sh "https://example.com/article"
```

### 获取帮助

```bash
bash {baseDir}/scripts/jina.sh help
```

## 示例

```bash
# 抓取普通网页
bash {baseDir}/scripts/jina.sh "https://simonwillison.net/2026/Feb/22/raspberry-pi-openclaw/"

# 抓取推文 (Twitter/X)
bash {baseDir}/scripts/jina.sh "https://twitter.com/elonmusk/status/123456789"
bash {baseDir}/scripts/jina.sh "https://x.com/elonmusk/status/2025124840806514916"

# 抓取中文网页
bash {baseDir}/scripts/jina.sh "https://zh.wikipedia.org/wiki/人工智能"

# 抓取付费内容
bash {baseDir}/scripts/jina.sh "https://every.to/your-article"
```

## 输出格式

返回内容包含结构化 meta 信息：

```markdown
Title: 文章标题

URL Source: https://example.com/article

Published Time: Mon, 23 Feb 2026 15:23:57 GMT

Markdown Content:
# 文章正文...
```

## 特点

- ✅ 绕过付费墙
- ✅ 支持 Twitter/X 推文
- ✅ 返回干净 Markdown 格式
- ✅ 免费，无需 API Key
- ✅ 包含结构化 meta（标题、作者、发布时间）
- ✅ 支持任何网页内容抓取

## 测试

```bash
# 运行测试
bash tests/test.sh
```

## 项目结构

```
holo-jina/
├── SKILL.md                      # 技能定义 (OpenClaw 用)
├── README.md                      # 项目说明
├── .gitignore                    # Git 忽略文件
├── openclaw_deploy_skill.sh      # 部署脚本
├── scripts/
│   └── jina.sh                   # 主入口脚本
└── tests/
    └── test.sh                   # 测试脚本
```

## 原理

Jina Reader API 会：

1. 智能提取网页主要内容
2. 移除广告、导航等干扰元素
3. 提取结构化 meta (标题、时间、作者)
4. 转换为 Markdown 格式
5. 绕过常见的付费墙限制

## 相关链接

- [Jina Reader API](https://jina.ai/reader)
- [OpenClaw 文档](https://docs.openclaw.ai)
- [GitHub 仓库](https://github.com/helebest/holo-jina)
