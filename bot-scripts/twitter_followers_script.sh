#!/usr/bin/env bash
set -ex
fetch_twitter_followers.py

GIT_DIFF_FILES=$(git diff --name-only)

if [[ "$GIT_DIFF_FILES" =~ "bot-scripts/twitter_followers_count.json" ]]; then
    git add bot-scripts/twitter_follower_count.json
    git commit -m "[MY-BOT] Updating twitter followers count"
    git push origin master
else
    echo "Follower count unchanged"
fi