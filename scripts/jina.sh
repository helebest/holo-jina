#!/bin/bash
# Jina AI Reader 入口脚本
# 用法: bash jina.sh <url>
#       bash jina.sh help

# 检查是否有 API Key
JINA_API_KEY_FILE="${HOME}/.openclaw/credentials/jina_api_key.txt"
if [ -f "$JINA_API_KEY_FILE" ]; then
    JINA_API_KEY=$(cat "$JINA_API_KEY_FILE")
    USE_API_KEY=true
else
    USE_API_KEY=false
fi

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
    echo "API Key: $([ "$USE_API_KEY" = true ] && echo "已配置 (100 RPM)" || echo "未配置")"
    exit 0
    ;;
  "")
    echo "错误: 请提供要抓取的 URL"
    echo "用法: bash jina.sh <url>"
    exit 1
    ;;
  *)
    URL="$1"
    # 如果 URL 没有 http 前缀，自动添加
    if [[ ! "$URL" =~ ^https?:// ]]; then
      URL="https://$URL"
    fi
    
    if [ "$USE_API_KEY" = true ]; then
      # 有 API Key - 加 Authorization header（100 RPM）
      curl -s "https://r.jina.ai/$URL" \
        -H "Authorization: Bearer $JINA_API_KEY"
    else
      # 无 API Key - 不用 header（有限制）
      curl -s "https://r.jina.ai/$URL"
    fi
    ;;
esac
