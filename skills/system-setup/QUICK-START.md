# Career Intelligence System Setup

Initialize your career intelligence workspace before using any other skills.

## Interactive Setup (Recommended)

```bash
python3 skills/system-setup/scripts/setup.py --init
```

**Interactive prompts:**
1. **Your name**: Used for resume headers and workspace personalization
2. **Location**: iCloud (default, syncs across devices) or local Documents folder

## Quick Examples

### First-Time Setup
```bash
# Interactive — asks for name and location
python3 skills/system-setup/scripts/setup.py --init

# Or specify everything upfront
python3 skills/system-setup/scripts/setup.py --init --name "Jane Doe" --location icloud
```

### Validate Existing Setup
```bash
# Full validation with dependency checks
python3 skills/system-setup/scripts/setup.py --validate --verbose

# Quick health check
python3 skills/system-setup/scripts/setup.py --health
```

## What Gets Created

```
career-ops/
├── profile/              # Professional identity (encrypted)
├── resumes/              # Resume versions (current, archive, variations)
├── applications/         # Application pipeline (active → interviews → offers → archived)
├── research/             # Companies, roles, salary, industry, skills gap
├── cover-letters/        # Templates and generated letters
├── interview-prep/       # Questions, stories, technical prep, notes
├── networking/           # Contacts and outreach tracking
├── projects/             # Portfolio case studies
├── state/                # Automation state for all skills
├── logs/                 # Activity and error logs
├── config/               # Settings, integrations, schedules
└── README.md             # Workspace documentation
```

**Also created:**
- `~/.mysios-career-intelligence/` — Plugin integration pointer
- State files for application tracking, resume history, job search, interview prep, analytics
- Configuration files for settings, integrations, and automation schedules

## Next Steps After Setup

1. **Set up your profile**: `career-intelligence:profile-setup`
2. **Generate your first resume**: `career-intelligence:resume-optimizer`
3. **Start searching**: `career-intelligence:job-search`
4. **Prepare for interviews**: `career-intelligence:interview-prep`

## Maintenance Commands

```bash
# Backup workspace
python3 skills/system-setup/scripts/setup.py --backup

# Cleanup old data (archive applications >90 days, rotate logs >30 days)
python3 skills/system-setup/scripts/setup.py --cleanup

# Check for outdated dependencies
python3 skills/system-setup/scripts/setup.py --check-updates
```

## Workspace Locations

| Option | Path | Best For |
|--------|------|----------|
| iCloud (default) | `~/Library/Mobile Documents/com~apple~CloudDocs/career-ops/` | Cross-device sync |
| Local | `~/Documents/career-ops/` | Privacy, no sync |
| Custom | Your chosen path | Specific requirements |
