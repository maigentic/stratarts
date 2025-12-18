# HTML Template Assembly Workflow

## Overview
This workflow minimizes regeneration by separating assembly (file copying) from customization (placeholder replacement).

## Directory Structure
```
.claude/html-templates/
├── base-header.html       # Lines 1-735: DOCTYPE through <div class="content">
├── base-footer.html       # Lines 736-800: closing </div> through </html>
├── skill-bodies/          # Skill-specific CSS, HTML, and JS
│   ├── business-idea-validator.html
│   ├── market-opportunity-analyzer.html
│   ├── business-model-designer.html
│   ├── customer-persona-builder.html
│   ├── value-proposition-crafter.html
│   ├── product-positioning-expert.html
│   └── competitive-intelligence.html
└── ASSEMBLY-WORKFLOW.md   # This file
```

## Skill-Body File Format
Each skill-body file contains three sections marked with delimiters:

```html
<!-- ═══ SKILL CSS START ═══ -->
[Skill-specific CSS rules]
<!-- ═══ SKILL CSS END ═══ -->

<!-- ═══ SKILL HTML START ═══ -->
[Skill-specific HTML sections]
<!-- ═══ SKILL HTML END ═══ -->

<!-- ═══ SKILL JS START ═══ -->
[Skill-specific Chart.js code]
<!-- ═══ SKILL JS END ═══ -->
```

## Assembly Workflow (5 Steps)

### Step 1: Copy base-header.html to output
```bash
cp .claude/html-templates/base-header.html target-directory/skill-output.html
```

### Step 2: Replace {{SKILL_SPECIFIC_CSS}} with skill CSS
Use Edit tool to find `{{SKILL_SPECIFIC_CSS}}` and replace with content between SKILL CSS START/END delimiters.

### Step 3: Replace closing content div with skill HTML + footer
Use Edit tool to:
1. Find the placeholder `</div>` that closes `.content`
2. Replace with: skill HTML content (from SKILL HTML START/END) + base-footer.html content

### Step 4: Replace {{CHART_SCRIPTS}} with skill JS
Use Edit tool to find `{{CHART_SCRIPTS}}` and replace with content between SKILL JS START/END delimiters.

### Step 5: Replace remaining placeholders
Use Edit tool to replace metadata placeholders:
- `{{DATE}}` - Generation date
- `{{PROJECT_NAME}}` - Project name
- `{{SKILL_NAME}}` - Skill name (kebab-case)
- `{{VERSION}}` - Skill version
- `{{CONTEXT_SIGNATURE}}` - Context signature
- `{{ITERATIONS}}` - Number of iterations
- `{{ITERATIONS_PLURAL}}` - "s" if iterations > 1, else empty
- `{{PRIMARY_SCORE}}` - Main composite score
- `{{SUBTITLE}}` - Project subtitle

## Placeholders in base-header.html
Line 679: `{{SKILL_SPECIFIC_CSS}}`

## Placeholders in base-footer.html
- Footer metadata (lines 8-10): `{{DATE}}`, `{{PROJECT_NAME}}`, `{{SKILL_NAME}}`, `{{VERSION}}`, `{{CONTEXT_SIGNATURE}}`, `{{ITERATIONS}}`, `{{ITERATIONS_PLURAL}}`
- Chart scripts (line 53): `{{CHART_SCRIPTS}}`

## Key Benefits
1. **No regeneration of base styles** - Headers/footers are copied verbatim
2. **Surgical edits only** - Edit tool replaces specific placeholders
3. **Consistent styling** - All files use identical base CSS
4. **Maintainable** - Update base-header/footer once, affects all skills

## Example Assembly Command Sequence
```bash
# Step 1: Copy header
cp base-header.html output.html

# Step 2-5: Use Edit tool for each replacement
# (See skill-body file for specific CSS/HTML/JS content)
```
