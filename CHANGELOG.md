# StratArts Changelog

## 2026-02-18 - Plugin Marketplace Compatibility Overhaul

### Changes Made

#### 1. Restructured Plugin for Marketplace Installation
- Moved `skills/` and `.claude-plugin/plugin.json` into `stratarts/` subdirectory
- Marketplace `source` now uses `"./stratarts"` relative path (matches Anthropic's official pattern)
- Previous `"source": "."` caused self-reference conflicts during installation

#### 2. Fixed marketplace.json
- Stripped to minimal schema: `name`, `owner`, `plugins[]` with `name`, `source`, `description`
- Removed extra fields (`version`, `author`, `homepage`, `repository`, `license`, `category`, `tags`) that could interfere with Cowork parser
- Changed `keywords` to `tags` (correct field name), then removed entirely for compatibility
- Changed plugin source from GitHub object / URL object to relative path

#### 3. Fixed plugin.json Validation Errors
- Changed `author` from string (`"Maigent AI"`) to object (`{"name": "Maigent"}`)
- Removed `tags` array (not a valid plugin.json field)
- Removed `minClaudeCodeVersion` (not a recognized field)
- Removed `skills` array (skills are auto-discovered from directory)

#### 4. Fixed SKILL.md Frontmatter (27 files)
- Stripped invalid frontmatter fields: `author`, `version`, `category`, `tags`, `estimatedTime`
- Kept only `name` and `description` (the only recognized fields)

#### 5. Migrated skills/ to commands/
- Moved from `skills/[category]/[name]/SKILL.md` to `commands/[name].md`
- Fixed namespace bug where `name:` field in SKILL.md stripped the `stratarts:` prefix in autocomplete
- Commands use `description:` + `disable-model-invocation: true` frontmatter (no `name:` field)

#### 6. Updated README
- Corrected installation commands to use HTTPS URL format
- Fixed skill invocation syntax from `/skill stratarts:name` to `/stratarts:name`
- Added SSH troubleshooting section for users without GitHub SSH keys
- Updated dev paths for new structure
- Fixed "Interative" typo

### Known Issues (Anthropic Platform Bugs)
- **SSH Clone Bug**: Plugin installer defaults to SSH; users without SSH keys need `git config --global url."https://github.com/".insteadOf "git@github.com:"`
- **Cowork Desktop (Windows)**: "Failed to add marketplace" — Windows path resolution bug ([#24859](https://github.com/anthropics/claude-code/issues/24859))
- **Cowork VM**: EXDEV cross-device rename error ([#25444](https://github.com/anthropics/claude-code/issues/25444))

### Verified Working Installation
```
/plugin marketplace add https://github.com/maigentic/stratarts
/plugin install stratarts@maigent
# Restart Claude Code
/stratarts:business-idea-validator
```

---

## 2024-11-XX - Living Business Schema Architecture Documentation

### Changes Made

#### Created ARCHITECTURE.md
Comprehensive architecture documentation for the Living Business Schema system:

**What It Documents:**
- Multi-project data architecture (per-project pricing model)
- CLAUDE.md: Living Business Operating System (5,000-10,000 token schema)
- Intelligent update logic (semantic diffing with 20%, 10%, 5% thresholds)
- Versioning strategy (auto-version monthly, manual versions, branches)
- Multi-project pricing ($99/month per project = revenue multiplier)
- Manual editing & human override capabilities
- Token budget justification (10K tokens = 30 hours saved)
- 4-phase implementation roadmap

**Key Innovations Documented:**
1. **Project-Based Architecture**: Users pay $99/month per business/project
   - Solo founder with 1 business = $99/month
   - Serial entrepreneur with 3 businesses = $297/month
   - Agency with 10 client projects = $990/month
   - Revenue multiplier effect: +50% MRR from multi-project users

2. **Living CLAUDE.md Schema**: Auto-updating business strategy schema
   - Contains full output from all 35 skills (27 foundation + 8 execution)
   - Updates automatically when skills run with significant changes
   - Eliminates 48 hours/month of manual re-entry
   - Provides perfect context for all AI interactions

3. **Intelligent Diffing**: Only update when changes are significant
   - Foundation skills: 20% threshold (major strategy changes)
   - Execution skills: 10% threshold (monthly planning updates)
   - Metrics updates: 5% threshold (weekly metrics changes)
   - Batch minor changes weekly to prevent file churn

4. **Version Control**: Git-like versioning for business strategy
   - Auto-version at end of each month
   - Manual versions for comparing before/after pivots
   - Branches for scenario planning ("aggressive growth" vs. "sustainable growth")

5. **Human Override**: User can manually edit any section
   - System detects manual edits
   - Offers merge, keep, or overwrite options
   - Preserves user notes while updating AI-generated sections

**Why This Matters:**
- **Competitive moat**: Nearly impossible to replicate (10x moat)
- **Lock-in effect**: User's entire business strategy in our system
- **Revenue multiplier**: Per-project pricing, not per-user
- **Enterprise-grade**: Scales from solo founder to 1,000+ employee companies

**Technical Scope:**
- 50+ pages of comprehensive architecture documentation
- Covers backend, frontend, and business model
- Includes Python code examples for semantic diffing
- 4-phase implementation roadmap (18 months)

---

## 2024-11-XX - Intelligent Output Sizing Update

### Changes Made

#### 1. Removed Artificial Word Count Requirements
**Before:**
- "You will now receive a 3,000-4,000 word document covering..."
- "Generate a 2,000-3,000 word report..."
- Quality checklist: "- [ ] Report is 2,500-3,500 words"

**After:**
- "You will now receive a comprehensive document covering..."
- "Generate a detailed report..."
- Quality checklist: "- [ ] Report is comprehensive and covers all key areas"

**Affected Files:** All 27 foundation skills in:
- foundation-strategy/
- market-product-strategy/
- marketing-growth/
- retention-metrics/
- fundraising-operations/

#### 2. New Output Philosophy
Created `OUTPUT_PHILOSOPHY.md` documenting:
- ✅ Quality over quantity principle
- ✅ "As long as needed, not a word more" approach
- ✅ Examples of good vs. bad outputs
- ✅ How output length adapts to business stage
- ✅ New quality checklist (replaces word count checks)

#### 3. Benefits

**For Users:**
- Faster to read (no artificial padding)
- More actionable (every word has purpose)
- Better UX (matches complexity to their needs)
- Early-stage: Simple, focused outputs
- Growth-stage: Rich, detailed outputs

**For Product:**
- More professional (concise = high quality)
- Automation-friendly (outputs grow with business)
- Premium tier enhancement (intelligent adaptation)
- Better retention (users don't get overwhelmed)

**For Development:**
- Clearer guidelines (quality criteria, not word count)
- Less bloat (skills focus on value, not length)
- Easier maintenance (no arbitrary targets to hit)

---

## 2024-11-XX - Skills Reorganization

### Changes Made

#### Moved All Skills into Category Subfolders
**Before:**
```
skills/
├── customer-persona-builder/
├── revenue-model-builder/
├── go-to-market-planner/
[... 27 skills at root level]
```

**After:**
```
skills/
├── foundation-strategy/          (7 skills)
├── market-product-strategy/      (4 skills)
├── marketing-growth/             (7 skills)
├── retention-metrics/            (4 skills)
├── fundraising-operations/       (5 skills)
└── premium-execution/            (8 skills - to be built)
```

#### User Experience
**No impact on skill invocation:**
- Still use: `/customer-persona-builder`
- NOT: `/foundation-strategy/customer-persona-builder`
- Subfolders are purely organizational

#### Benefits
- Better organization for 35 total skills
- Clear free vs. premium separation
- Easier navigation for developers
- Scalable structure for future skills

---

## 2024-11-XX - Premium Tier Documentation

### New Documentation Files

#### 1. PREMIUM_SKILLS.md
Documents the 8 premium execution skills:
- strategic-priority-analyzer
- monthly-action-planner
- weekly-sprint-designer
- progress-tracker-reviewer
- accountability-checkpoint-builder
- bottleneck-identifier
- quick-win-finder
- adaptive-strategy-optimizer

Key sections:
- Free vs. Premium comparison
- Monthly workflow (how users use premium)
- Pricing justification ($99-199/month)
- Technical architecture

#### 2. AUTOMATION_STRATEGY.md
Documents the automation layer:
- Trigger-based reruns (metrics, tasks, time, external)
- Background iteration intelligence
- Pattern learning (adjusts plans based on execution)
- Proactive alerts (milestones, warnings, opportunities)
- Competitive moat analysis

Key insight: **"Your strategy never gets stale"**
- Manual updates: 48 hours/month
- Premium automation: 5 minutes/month (review only)
- ROI: 24x to 120x vs. manual approach

#### 3. OUTPUT_PHILOSOPHY.md
Documents intelligent output sizing:
- Quality over quantity principle
- Examples (good vs. bad outputs)
- How length adapts to business stage
- Quality checklist (replaces word counts)

---

## File Structure (Current)

```
D:\AI\projects\stratarts\
├── README.md                          [Project overview]
├── ARCHITECTURE.md                    [Living Business Schema architecture]
├── PREMIUM_SKILLS.md                  [Premium tier documentation]
├── AUTOMATION_STRATEGY.md             [Automation & iteration strategy]
├── OUTPUT_PHILOSOPHY.md               [Intelligent output sizing]
├── CHANGELOG.md                       [This file]
│
└── skills/
    ├── foundation-strategy/           (7 skills ✅)
    │   ├── business-idea-validator/
    │   ├── business-model-designer/
    │   ├── competitive-intelligence/
    │   ├── customer-persona-builder/
    │   ├── market-opportunity-analyzer/
    │   ├── product-positioning-expert/
    │   └── value-proposition-crafter/
    │
    ├── market-product-strategy/       (4 skills ✅)
    │   ├── feature-prioritization-framework/
    │   ├── go-to-market-planner/
    │   ├── pricing-strategy-architect/
    │   └── strategic-roadmap-builder/
    │
    ├── marketing-growth/              (7 skills ✅)
    │   ├── brand-identity-designer/
    │   ├── community-building-strategist/
    │   ├── content-marketing-strategist/
    │   ├── email-marketing-architect/
    │   ├── growth-hacking-playbook/
    │   ├── seo-content-planner/
    │   └── social-media-strategist/
    │
    ├── retention-metrics/             (4 skills ✅)
    │   ├── customer-feedback-framework/
    │   ├── metrics-dashboard-designer/
    │   ├── onboarding-flow-optimizer/
    │   └── retention-optimization-expert/
    │
    ├── fundraising-operations/        (5 skills ✅)
    │   ├── financial-model-architect/
    │   ├── fundraising-strategy-planner/
    │   ├── investor-brief-writer/
    │   ├── investor-pitch-deck-builder/
    │   └── operational-playbook-creator/
    │
    └── premium-execution/             (8 skills ⏳ TO BE BUILT)
        [Empty - ready for development]
```

---

## Progress Summary

### Foundation Skills: 27/27 Complete (100%)
- ✅ All skills built
- ✅ Context detection implemented
- ✅ Organized into subfolders
- ✅ Word count requirements removed
- ✅ Quality checklists updated

### Premium Skills: 0/8 Complete (0%)
- ⏳ strategic-priority-analyzer
- ⏳ monthly-action-planner
- ⏳ weekly-sprint-designer
- ⏳ progress-tracker-reviewer
- ⏳ accountability-checkpoint-builder
- ⏳ bottleneck-identifier
- ⏳ quick-win-finder
- ⏳ adaptive-strategy-optimizer

### Documentation: 5/5 Complete (100%)
- ✅ ARCHITECTURE.md
- ✅ PREMIUM_SKILLS.md
- ✅ AUTOMATION_STRATEGY.md
- ✅ OUTPUT_PHILOSOPHY.md
- ✅ CHANGELOG.md

### Next Steps
1. Build 8 premium execution skills
2. Implement backend (hosted storage, context API, trigger system)
3. Build frontend dashboard
4. Launch free tier (27 skills)
5. Launch premium tier (27 + 8 skills + automation)

---

**End of Changelog**
