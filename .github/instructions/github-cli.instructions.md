---
description: "GitHub CLI (gh) best practices and usage guidelines"
applyTo: "**"
---

# GitHub CLI (gh) Instructions

## Output Handling - CRITICAL

**MANDATORY: Always use JSON output with jq for gh commands**

When you need to see or process output from `gh` commands, you MUST:

1. Use the `--json` flag to get structured output
2. Pipe the output through `jq` to make it readable
3. Never rely on the default human-readable format for programmatic processing

### Examples

```bash
# ✅ CORRECT - Get pull request data
gh pr view 123 --json title,body,state,createdAt | jq '.'

# ✅ CORRECT - List pull requests with specific fields
gh pr list --json number,title,state,author | jq '.[]'

# ✅ CORRECT - Get repository information
gh repo view --json name,description,defaultBranch,visibility | jq '.'

# ✅ CORRECT - List workflow runs
gh run list --json status,conclusion,workflowName,createdAt | jq '.[]'

# ❌ INCORRECT - Default output is not reliable for processing
gh pr view 123
gh pr list
```

### Common jq Patterns

```bash
# Extract specific fields
gh pr list --json number,title | jq '.[] | "\(.number): \(.title)"'

# Filter by condition
gh pr list --json number,state | jq '.[] | select(.state == "open")'

# Get array length
gh pr list --json number | jq 'length'

# Pretty print with colors
gh pr view --json title,body | jq -C '.'
```

## General Guidelines

### Authentication

- Always ensure `gh auth status` passes before running commands
- Use `gh auth login` if authentication is needed
- For CI/CD, use `GITHUB_TOKEN` environment variable

### Error Handling

- Always check exit codes when using gh commands in scripts
- Use `--json` output for consistent error parsing
- Handle rate limiting gracefully

### Performance

- Use specific field selection with `--json` to reduce payload size
- Cache results when making multiple calls for the same data
- Use pagination parameters for large datasets

### Security

- Never log sensitive information from gh command outputs
- Use secure token handling in automated environments
- Validate permissions before performing destructive operations

## Prohibited Patterns

- **Never parse human-readable output** - Always use `--json` with `jq`
- **Never hardcode tokens** - Use environment variables or gh auth
- **Never ignore error codes** - Always handle failures appropriately
- **Never bypass rate limits** - Respect GitHub API constraints

## Integration with Other Tools

### With fastlane

```ruby
# In Fastlane, capture gh output as JSON
result = sh("gh pr view --json title,number | jq -r '.title'", capture: true)
```

### With CI/CD

```yaml
- name: Get PR info
  run: |
    PR_DATA=$(gh pr view ${{ github.event.number }} --json title,body)
    echo "PR_TITLE=$(echo "$PR_DATA" | jq -r '.title')" >> $GITHUB_ENV
```

## Troubleshooting

### Common Issues

1. **No output visible**: Always pipe through `jq` to see JSON structure
2. **Authentication failures**: Check `gh auth status` first
3. **Permission errors**: Verify repository access and token scopes
4. **Rate limiting**: Implement retry logic with exponential backoff

### Debug Commands

```bash
# Check authentication status
gh auth status

# Verify API access
gh api user | jq '.'

# Test repository access
gh repo view --json name | jq '.'
```
