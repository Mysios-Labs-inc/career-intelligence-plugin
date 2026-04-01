# Directory Structure Reference

Comprehensive breakdown of the career intelligence workspace organization and file hierarchy.

## Root Structure

Default location: `~/Library/Mobile Documents/com~apple~CloudDocs/career-ops/`
Fallback: `~/Documents/career-ops/`

```
career-ops/
├── profile/                    # Professional identity (encrypted)
├── resumes/                    # Resume version control
├── applications/               # Application pipeline
├── research/                   # Market intelligence
├── cover-letters/              # Cover letter management
├── interview-prep/             # Interview preparation
├── networking/                 # Professional contacts
├── projects/                   # Portfolio documentation
├── state/                      # Persistent automation state
├── logs/                       # Execution and error logs
├── config/                     # System configuration
└── README.md                   # Workspace documentation
```

## Profile Directory (`profile/`)

Core professional data powering all skills:

```
profile/
├── profile_data.json           # Primary profile (Fernet encrypted)
├── skills_matrix.json          # Skills inventory + market demand scores
└── career_goals.yaml           # Target roles, salary range, preferences
```

### Profile Data Schema
```json
{
  "personal": {
    "name": "Jane Doe",
    "email": "jane@example.com",
    "phone": "+1-555-0123",
    "location": "San Francisco, CA",
    "linkedin": "linkedin.com/in/janedoe",
    "portfolio": "janedoe.dev"
  },
  "professional": {
    "title": "Senior Software Engineer",
    "summary": "8 years building scalable systems...",
    "yearsExperience": 8,
    "level": "senior",
    "industries": ["Technology", "Fintech"],
    "specializations": ["Distributed Systems", "React", "Go"]
  },
  "experience": [...],
  "education": [...],
  "preferences": {
    "targetRoles": ["Staff Engineer", "Engineering Manager"],
    "salaryRange": { "min": 180000, "max": 250000 },
    "remote": true,
    "companySize": ["growth", "enterprise"]
  },
  "metadata": {
    "created": "2026-04-01T12:00:00Z",
    "updated": "2026-04-01T12:00:00Z",
    "completeness": 92,
    "workspace_path": "~/Library/Mobile Documents/com~apple~CloudDocs/career-ops"
  }
}
```

## Resumes Directory (`resumes/`)

Version-controlled resume management:

```
resumes/
├── current/                    # Active versions for applications
│   ├── Jane_Doe_Staff_Engineer_2026-04-01.html
│   ├── Jane_Doe_Eng_Manager_2026-03-28.html
│   └── Jane_Doe_General_Resume.pdf
├── archive/                    # Previous versions
│   ├── Jane_Doe_SWE_2026-02-15.html
│   └── Jane_Doe_TechLead_2026-01-10.html
├── variations/                 # Role-specific customizations
│   ├── fintech-focused/
│   └── leadership-focused/
└── sources/                    # Raw materials
    ├── achievements.md         # Quantified achievements bank
    ├── projects_summary.md     # Project impact data
    └── skills_inventory.md     # Complete skills list
```

### File Naming Convention
```
{FirstName}_{LastName}_{TargetRole}_{YYYY-MM-DD}.{ext}
```

## Applications Directory (`applications/`)

Full application lifecycle tracking:

```
applications/
├── active/                     # In-progress applications
│   ├── google-staff-engineer/
│   │   ├── application.md      # Application details
│   │   ├── resume.html         # Resume version used
│   │   ├── cover-letter.md     # Cover letter
│   │   └── research.md         # Company research notes
│   └── stripe-eng-manager/
├── interviews/                 # Interview-stage applications
│   └── meta-production-engineer/
│       ├── application.md
│       ├── prep-notes.md       # Interview preparation
│       └── interview-notes/    # Post-interview notes
│           ├── phone-screen.md
│           └── onsite-day1.md
├── offers/                     # Received offers
│   └── netflix-senior-swe/
│       ├── application.md
│       ├── offer-details.md    # Compensation breakdown
│       └── negotiation.md      # Negotiation strategy
├── archived/                   # Completed applications
│   ├── rejected/
│   └── withdrawn/
└── tracker.json                # Pipeline state (machine-readable)
```

## Research Directory (`research/`)

Market intelligence and company research:

```
research/
├── companies/                  # Target company deep dives
│   ├── google/
│   │   ├── overview.md         # Company analysis
│   │   ├── culture.md          # Culture and values
│   │   ├── tech-stack.md       # Technology landscape
│   │   └── interview-process.md
│   └── stripe/
├── roles/                      # Role analysis
│   ├── staff-engineer.md       # Role expectations and leveling
│   └── eng-manager.md
├── salary/                     # Compensation data
│   ├── market-rates-2026.md    # Current market rates
│   ├── total-comp-analysis.md  # TC breakdowns by company
│   └── negotiation-data.md     # Negotiation benchmarks
├── industry/                   # Industry analysis
│   ├── tech-market-2026.md     # Market conditions
│   └── emerging-roles.md       # New role types
└── skills_gap/                 # Skills demand analysis
    ├── demand-report.md        # In-demand skills
    └── learning-plan.md        # Upskilling roadmap
```

## Interview Prep Directory (`interview-prep/`)

Structured interview preparation:

```
interview-prep/
├── questions/                  # Common questions + answers
│   ├── behavioral.md           # Behavioral questions (STAR format)
│   ├── system-design.md        # System design questions
│   ├── coding.md               # Coding problem patterns
│   └── leadership.md           # Leadership/management questions
├── stories/                    # STAR-format achievement stories
│   ├── technical-leadership.md
│   ├── conflict-resolution.md
│   ├── delivery-under-pressure.md
│   └── cross-team-collaboration.md
├── technical/                  # Technical prep materials
│   ├── algorithms-review.md
│   ├── system-design-patterns.md
│   └── domain-specific/
└── notes/                      # Post-interview notes
    ├── google-2026-03-15.md
    └── stripe-2026-03-22.md
```

## State Directory (`state/`)

Persistent state tracking for automation skills:

```
state/
├── resume-optimizer/
│   └── history.json            # Generation history, ATS scores
├── job-search/
│   └── searches.json           # Saved searches, reviewed/saved/applied jobs
├── applications/
│   └── pipeline.json           # Application pipeline state + stats
├── interview-prep/
│   └── progress.json           # Prep progress, upcoming interviews
└── analytics/
    └── summary.json            # Cross-skill metrics and trends
```

### State File Schemas

#### Application Pipeline (`state/applications/pipeline.json`)
```json
{
  "last_updated": "2026-04-01T12:00:00Z",
  "pipeline": {
    "applied": [
      {
        "id": "app_001",
        "company": "Google",
        "role": "Staff Engineer",
        "applied_date": "2026-03-25",
        "source": "referral",
        "priority": "high"
      }
    ],
    "screening": [],
    "interviewing": [],
    "final_round": [],
    "offer": [],
    "rejected": [],
    "withdrawn": []
  },
  "stats": {
    "total_applications": 12,
    "response_rate": 0.42,
    "interview_conversion": 0.60,
    "active_applications": 5
  }
}
```

#### Analytics Summary (`state/analytics/summary.json`)
```json
{
  "last_updated": "2026-04-01T12:00:00Z",
  "metrics": {
    "applications_sent": 12,
    "interviews_completed": 5,
    "offers_received": 1,
    "resumes_generated": 8,
    "avg_ats_score": 87.5
  },
  "weekly_stats": {
    "2026-W13": {
      "applications": 3,
      "interviews": 2,
      "hours_spent": 12
    }
  }
}
```

## Logs Directory (`logs/`)

Execution tracking for debugging and metrics:

```
logs/
├── daily/                      # Daily activity logs
│   ├── 2026-04-01.log
│   └── 2026-03-31.log
├── errors/                     # Error tracking
│   ├── skill-errors.log        # Skill execution failures
│   └── api-errors.log          # External API errors
└── performance/                # Performance metrics
    └── skill-timing.log        # Execution time per skill
```

### Log Format
```
2026-04-01 09:15:30 [INFO] resume-optimizer - Generated Staff Engineer resume (ATS: 92%)
2026-04-01 09:16:45 [INFO] job-search - Found 15 matching jobs for "Staff Engineer SF"
2026-04-01 10:00:00 [WARNING] premium-api - Rate limit approaching (80/100)
2026-04-01 10:05:12 [ERROR] cover-letter - PDF generation failed: wkhtmltopdf not found
```

## Config Directory (`config/`)

System configuration:

```
config/
├── settings.yaml               # Global workspace settings
├── integrations.yaml           # API keys, service configurations
└── schedules.yaml              # Automation schedules
```

## Integration Pointer (`~/.mysios-career-intelligence/`)

Plugin integration directory connecting skills to the workspace:

```
~/.mysios-career-intelligence/
├── workspace_pointer.json      # Points to active workspace location
└── profile.json                # Symlink or copy for quick plugin access
```

## Storage Estimates

| Component | Size |
|-----------|------|
| Base installation | ~5 MB |
| Profile + config | ~1 MB |
| Per application (with research) | ~500 KB |
| Daily state updates | ~100 KB |
| Logs per week | ~2-5 MB |
| Resume versions (HTML) | ~50-200 KB each |
| Backup (compressed) | ~10-30 MB |

## Cleanup Schedule

| Data | Retention | Action |
|------|-----------|--------|
| Active applications | Until resolved | Move to archived/ |
| Archived applications | 2 years | Manual cleanup |
| Daily logs | 30 days | Auto-rotate |
| Error logs | 90 days | Auto-rotate |
| Resume archive | Indefinite | Manual cleanup |
| State files | Current only | Auto-managed |
| Backups | Weekly for 12 weeks | Auto-rotate |
