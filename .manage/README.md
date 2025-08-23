# Project Management Utility

A portable bash script for managing project development workflow, archiving work sessions, and maintaining a clean codebase.

## Installation

Make the script executable:
```bash
chmod +x .manage/manage
```

## Usage

```bash
./manage <command> [options]
```

## Commands

### 📦 `archive` - Archive management files
```bash
# Archive with default message
./manage archive

# Archive with custom message
./manage archive "Sprint 1 completed"
```
Archives all management files (except ROADMAP.md) to `.archive/.manage.YYYY.MM.DD.HH.MM.SS/`

### 🧹 `clean` - Clean temporary files
```bash
# Preview what will be deleted
./manage clean --dry-run

# Clean temporary files and caches
./manage clean

# Deep clean (includes node_modules, venv, etc.)
./manage clean --all
```

### 📊 `status` - Project health check
```bash
# Basic status
./manage status

# Detailed status
./manage status --verbose
```

### ℹ️ `help` - Show help
```bash
./manage help
```

### 🔖 `version` - Show version
```bash
./manage version
```

## Directory Structure

```
.manage/
├── manage            # All-in-one management script
└── ROADMAP.md       # Project roadmap (never archived)

.archive/            # Archived work sessions
└── .manage.YYYY.MM.DD.HH.MM.SS/
    ├── ISSUES.md
    ├── PROJECT.md
    ├── SOLUTION_SUMMARY.md
    ├── TASKS.json
    └── ARCHIVE_SUMMARY.md
```

## Examples

### End of Work Session
```bash
# Check project status
./manage status

# Archive current work
./manage archive "Feature X implemented"

# Clean temporary files
./manage clean
```

### Starting New Sprint
```bash
# Archive previous sprint
./manage archive "Sprint 2 completed"

# Deep clean for fresh start
./manage clean --all

# Check status
./manage status
```

### Regular Maintenance
```bash
# Weekly cleanup
./manage clean --dry-run
./manage clean

# Monthly deep clean
./manage clean --all
```

## Features

- **Portable**: Single bash script that works on any Unix-like system
- **No Dependencies**: Pure bash, no external tools required
- **Color Output**: Automatic detection of terminal capabilities
- **Git Integration**: Shows branch, commit status, and changes
- **Smart Archiving**: Preserves ROADMAP.md for continuity
- **Dry Run Mode**: Preview changes before applying them
- **Size Tracking**: Reports space saved during cleanup

## Compatibility

- Works on Linux, macOS, and WSL
- Requires Bash 4.0+
- Automatically detects and adapts to different environments

## Best Practices

1. **Regular Archiving**: Archive at the end of each work session or sprint
2. **Clean Commits**: Run `status` before committing to check for issues
3. **Disk Management**: Use `clean --all` periodically to free up space
4. **Documentation**: Keep ROADMAP.md updated - it's never archived

## Extending

The script is designed to be easily extended. To add new commands:

1. Add a new `cmd_<name>()` function
2. Add the command to the case statement in `main()`
3. Update the help text in `cmd_help()`

## License

Part of the formuli-mcp project