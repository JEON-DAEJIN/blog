#!/usr/bin/env bash
# 새 블로그 글을 대화형으로 생성하는 스크립트 (PC용)
# 사용법: tools/new_post.sh  (Git Bash에서 실행)
set -euo pipefail

cd "$(dirname "$0")/.."

CATS=("AI 개념정리" "개발 기록" "회고" "아이펠")

echo "=== 새 글 만들기 ==="
read -rp "제목: " TITLE
if [ -z "$TITLE" ]; then
  echo "제목은 필수입니다."
  exit 1
fi

echo "카테고리를 선택하세요:"
for i in "${!CATS[@]}"; do
  echo "  $((i + 1)). ${CATS[$i]}"
done
read -rp "번호 (1-4): " CAT_NUM
if ! [[ "$CAT_NUM" =~ ^[1-4]$ ]]; then
  echo "1~4 사이의 번호를 입력하세요."
  exit 1
fi
CATEGORY="${CATS[$((CAT_NUM - 1))]}"

read -rp "태그 (쉼표로 구분, 예: ai,pytorch): " TAGS_RAW
IFS=',' read -ra TAG_ARR <<<"$TAGS_RAW"
TAGS_YAML=""
for t in "${TAG_ARR[@]}"; do
  t_trim=$(echo "$t" | sed 's/^ *//;s/ *$//')
  [ -z "$t_trim" ] && continue
  TAGS_YAML="${TAGS_YAML}${t_trim}, "
done
TAGS_YAML="${TAGS_YAML%, }"

read -rp "요약 (검색결과/공유 시 보여줄 한두 줄, 생략 가능): " DESCRIPTION

DATE=$(date +"%Y-%m-%d")
DATETIME="$(date +"%Y-%m-%d %H:%M:%S") +0900"

SLUG=$(echo "$TITLE" | sed 's/[[:space:]]\+/-/g' | sed 's/[\/\\:*?"<>|#]//g')
FILENAME="_posts/${DATE}-${SLUG}.md"

if [ -e "$FILENAME" ]; then
  echo "이미 같은 이름의 파일이 있습니다: $FILENAME"
  exit 1
fi

cat >"$FILENAME" <<EOF
---
title: "${TITLE}"
date: ${DATETIME}
categories: [${CATEGORY}]
tags: [${TAGS_YAML}]
description: "${DESCRIPTION}"
---

## 오늘 배운 것



## 겪은 시행착오



> 강조하고 싶은 핵심 내용은 이렇게 인용구로 표시하세요.

## 다음에 할 것

EOF

echo ""
echo "새 글이 생성되었습니다: $FILENAME"
echo ""
echo "다음 단계:"
echo "  1. 위 파일을 에디터로 열어 본문을 작성하세요."
echo "  2. 작성이 끝나면:"
echo "     git add \"$FILENAME\""
echo "     git commit -m \"post: ${TITLE}\""
echo "  3. 검토 후 게시하려면: git push"
