#!/bin/bash
# Jina AI Reader 入口脚本
# 用法: bash jina.sh <url>
#       bash jina.sh help

JINA_BASE="https://r.jina.ai"

case "${1:-}" in
  help|--help|-h)
    echo "Holo Jina - Jina AI Reader"
    echo ""
    echo "用法:"
    echo "  bash jina.sh <url>      抓取网页内容"
    echo "  bash jina.sh help       显示帮助"
    echo ""
    echo "示例:"
    echo "  bash jina.sh \"https://example.com/article\""
    echo "  bash jina.sh \"https://twitter.com/elonmusk/status/123456789\""
    echo "  bash jina.sh \"https://zh.wikipedia.org/wiki/人工智能\""
    echo ""
    echo "原理: 在任意网址前加上 https://r.jina.ai/ 前缀"
    exit 0
    ;;
  "")
    echo "错误: 请提供要抓取的 URL"
    echo "用法: bash jina.sh <url>"
    echo "帮助: bash jina.sh help"
    exit 1
    ;;
  *)
    URL="$1"
    # 如果 URL 没有 http 前缀，自动添加
    if [[ ! "$URL" =~ ^https?:// ]]; then
      URL="https://$URL"
    fi
    curl -s "$JINA_BASE/$URL"
    ;;
esac
