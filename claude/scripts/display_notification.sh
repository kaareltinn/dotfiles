#!/bin/bash

branch=$(git branch --show-current 2>/dev/null || echo "unknown")
dir=$(basename "$PWD")

osascript -e "display notification \"$dir ($branch)\" with title \"Claude Code\" sound name \"Glass\""
