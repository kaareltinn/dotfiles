Fetch ALL pull request (PR) review comments for: $ARGUMENTS
- including review comments attached to review objects
- all inline comments (not attached to review)
- including issue-level (conversation) comments
- use `gh` CLI with `jq` filtering

Then write two files into the repo root:
- `review.json` — the raw structured data: `{pr, repo, fetched_at, reviews, inline_comments, issue_comments}`, each comment with id, author, path/line (for inline), timestamps, and full body.
- `review.md` — a human-readable digest: comments deduplicated and grouped by theme, each theme listing severity, the reviewers/comment ids behind it, the affected file:line, and the suggested fix. Separate actionable findings from meta/non-actionable noise.

Finish by summarizing the themes in chat.
