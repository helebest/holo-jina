#!/bin/bash
# holo-jina 部署脚本
# 将技能部署到 OpenClaw skills 目录

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# OpenClaw skills 目录
SKILLS_DIR="$HOME/.openclaw/skills"
TARGET_DIR="$SKILLS_DIR/holo-jina"

echo "📦 holo-jina 部署脚本"
echo "===================="
echo ""

# 检查 OpenClaw skills 目录
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ 错误: OpenClaw skills 目录不存在: $SKILLS_DIR"
    exit 1
fi

echo "📂 源目录: $PROJECT_DIR"
echo "📂 目标目录: $TARGET_DIR"
echo ""

# 创建目标目录
echo "📁 创建目标目录..."
mkdir -p "$TARGET_DIR"

# 复制文件
echo "📋 复制文件..."

# 复制 SKILL.md
cp "$PROJECT_DIR/SKILL.md" "$TARGET_DIR/"

# 复制 scripts 目录
rm -rf "$TARGET_DIR/scripts"
cp -r "$PROJECT_DIR/scripts" "$TARGET_DIR/"

# 设置权限
chmod +x "$TARGET_DIR/scripts/jina.sh"

echo ""
echo "✅ 部署完成!"
echo ""
echo "使用方式:"
echo "  bash $TARGET_DIR/scripts/jina.sh \"https://example.com\""
