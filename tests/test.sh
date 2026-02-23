#!/bin/bash
# holo-jina 测试脚本
# 用法: bash test.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "🧪 holo-jina 测试"
echo "=================="
echo ""

# 测试函数
test_jina() {
    local name="$1"
    local url="$2"
    local expected="$3"
    
    echo "📋 测试: $name"
    echo "   URL: $url"
    
    result=$(curl -s "https://r.jina.ai/$url" | head -c 100)
    
    if echo "$result" | grep -q "$expected"; then
        echo "   ✅ 通过"
    else
        echo "   ❌ 失败"
        echo "   预期包含: $expected"
        echo "   实际结果: $result"
        exit 1
    fi
    echo ""
}

# 测试1: 普通网页
test_jina "Wikipedia 中文" \
    "https://zh.wikipedia.org/wiki/人工智能" \
    "人工智能"

# 测试2: 英文网页
test_jina "Simon Willison Blog" \
    "https://simonwillison.net/2026/Feb/22/raspberry-pi-openclaw/" \
    "Raspberry Pi"

# 测试3: 推文
test_jina "Twitter 推文" \
    "https://x.com/elonmusk/status/2025124840806514916" \
    "Elon Musk"

echo "=================="
echo "✅ 所有测试通过!"
