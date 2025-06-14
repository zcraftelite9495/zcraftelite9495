#!/bin/bash
set -e

# Path to tips file and README
TIPS_FILE="dailyTips.txt"
README_FILE="README.md"

# Pick a random tip
TIP=$(shuf -n 1 "$TIPS_FILE")

# Escape slashes and ampersands for sed
ESCAPED_TIP=$(printf '%s\n' "$TIP" | sed -e 's/[\/&]/\\&/g')

# Replace the section in README.md
sed -i "/<!--START_SECTION:zDailyTip-->/, /<!--END_SECTION:zDailyTip-->/c\
<!--START_SECTION:zDailyTip-->\n$ESCAPED_TIP\n<!--END_SECTION:zDailyTip-->" "$README_FILE"