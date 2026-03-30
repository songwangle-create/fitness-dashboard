#!/bin/bash
# 健身数据自动同步到 GitHub Pages
# 由 fitness_manager.py 写入数据后自动调用

REPO_DIR="$HOME/Documents/fitness-dashboard"
DATA_SOURCE="$HOME/Documents/Fitness Management/fitness_records.json"
DATA_DEST="$REPO_DIR/data.json"

# 复制最新数据
cp "$DATA_SOURCE" "$DATA_DEST"

# 进入仓库目录
cd "$REPO_DIR" || exit 1

# 检查是否有变化
if git diff --quiet data.json 2>/dev/null; then
  exit 0  # 没有变化，不需要同步
fi

# 提交并推送
git add data.json
git commit -m "📊 更新运动数据 $(date '+%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet 2>/dev/null

echo "✅ 数据已同步到 GitHub Pages"
