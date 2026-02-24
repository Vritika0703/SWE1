#!/bin/bash
# Force-push rewritten history to GitHub (removes other contributors from display)
# Usage: GITHUB_TOKEN=your_token ./push_to_github.sh
#    or: ./push_to_github.sh
#        (will prompt for token if not set)

cd "$(dirname "$0")"

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Enter your GitHub Personal Access Token (create at https://github.com/settings/tokens):"
  read -s GITHUB_TOKEN
  echo
fi

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: No token provided."
  exit 1
fi

# Push using token (token is not stored in git config)
git push https://Vritika0703:${GITHUB_TOKEN}@github.com/Vritika0703/swe1-app.git main --force

echo ""
echo "Done. If successful, GitHub Contributors will show only Vritika0703."
echo "Revoke this token after use if it was a one-time token."
