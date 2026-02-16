# StrategicArts (StratArts)

**Business Strategy Skills Library for Claude Code**

> 27 professional and comprehensive AI-powered skills that transform business ideas into fundable ventures

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-blue.svg)](https://claude.ai)

---

## What is StrategicArts?

StrategicArts is a comprehensive Claude Code skills library that guides entrepreneurs through the complete business-building journey—from initial idea validation to investor pitch deck—using proven methodologies and professional HTML report outputs.

**Transform vague ideas into structured business plans in days, not months.**

---

## Features

- **27 Professional Skills** covering the entire startup lifecycle
- **Framework-Driven** — Built on Business Model Canvas, JTBD, OKRs, RICE, AARRR, and more
- **Beautiful HTML Reports** — Dark-themed, Chart.js-powered visualizations
- **Intelligent Context Chaining** — Skills detect and reuse previous outputs
- **Interactive Skill Flow** — Skills allow for detail overviews
- **Quantitative Scoring** — Go/no-go recommendations backed by data

---

## Skills Library (27 Skills)

### Foundation Strategy (7 skills)
| Skill | Description |
|-------|-------------|
| `business-idea-validator` | 10-dimension scoring framework for idea validation |
| `market-opportunity-analyzer` | TAM/SAM/SOM with Porter's Five Forces |
| `business-model-designer` | Business Model Canvas implementation |
| `customer-persona-builder` | Data-driven buyer personas with JTBD |
| `value-proposition-crafter` | Jobs-to-be-Done value proposition design |
| `product-positioning-expert` | April Dunford positioning canvas |
| `competitive-intelligence` | Porter's Five Forces and SWOT analysis |

### Market & Product Strategy (4 skills)
| Skill | Description |
|-------|-------------|
| `feature-prioritization-framework` | RICE/ICE scoring with value-effort matrix |
| `go-to-market-planner` | 90-day GTM strategy and channel selection |
| `pricing-strategy-architect` | Van Westendorp pricing with tier design |
| `strategic-roadmap-builder` | OKR-driven 18-month roadmap |

### Marketing & Growth (7 skills)
| Skill | Description |
|-------|-------------|
| `brand-identity-designer` | Brand pyramid and visual identity |
| `content-marketing-strategist` | Content pillars and editorial calendar |
| `growth-hacking-playbook` | Traction Bullseye Framework |
| `social-media-strategist` | Platform-specific strategies |
| `email-marketing-architect` | Drip campaigns and automation |
| `seo-content-planner` | Keyword clusters and technical SEO |
| `community-building-strategist` | Community engagement framework |

### Retention & Metrics (4 skills)
| Skill | Description |
|-------|-------------|
| `metrics-dashboard-designer` | North Star Metric with AARRR |
| `retention-optimization-expert` | Cohort analysis and win-back campaigns |
| `onboarding-flow-optimizer` | Activation funnels and product tours |
| `customer-feedback-framework` | NPS/CSAT/CES with RICE prioritization |

### Fundraising & Operations (5 skills)
| Skill | Description |
|-------|-------------|
| `financial-model-architect` | 3-5 year projections with scenarios |
| `fundraising-strategy-planner` | Investor targeting and term sheets |
| `investor-brief-writer` | One-pagers and cold email templates |
| `investor-pitch-deck-builder` | 12-15 slide pitch deck framework |
| `operational-playbook-creator` | Org structure, OKRs, and processes |

---

## Installation

### From GitHub (Recommended)

```bash
# Step 1: Add the marketplace
/plugin marketplace add https://github.com/maigentic/stratarts

# Step 2: Install the plugin
/plugin install stratarts@maigent

# Step 3: Restart Claude Code to load the plugin
```

### Local Installation (Development)

```bash
git clone https://github.com/maigentic/stratarts.git

# Add the local marketplace
/plugin marketplace add ./stratarts

# Install the plugin
/plugin install stratarts@maigent
```

### Verify Installation

```bash
# Open the plugin manager
/plugin

# Navigate to the Installed tab — you should see stratarts listed
```

### Troubleshooting: SSH Permission Denied

If you see this error during plugin installation:

```
Error: Failed to install: Failed to clone repository...
git@github.com: Permission denied (publickey).
```

Claude Code's plugin installer uses SSH by default when cloning plugin sources. If you don't have SSH keys configured for GitHub, run this in your terminal to redirect SSH requests through HTTPS:

```bash
git config --global url."https://github.com/".insteadOf "git@github.com:"
```

Then retry the install. To undo this later:

```bash
git config --global --unset url."https://github.com/".insteadOf
```

This is a [known issue](https://github.com/anthropics/claude-code/issues/25444) in Claude Code's plugin installer.

---

## Usage

Invoke any skill directly using the plugin namespace:

```bash
# Validate a business idea
/stratarts:business-idea-validator

# Create a pitch deck
/stratarts:investor-pitch-deck-builder

# Build a financial model
/stratarts:financial-model-architect
```

Or simply ask Claude to use a skill:

```
"Use the business-idea-validator skill to analyze my startup idea"
```

### Recommended Workflow

1. **Start with validation** → `business-idea-validator`
2. **Size your market** → `market-opportunity-analyzer`
3. **Design your model** → `business-model-designer`
4. **Build personas** → `customer-persona-builder`
5. **Craft positioning** → `product-positioning-expert`
6. **Plan your GTM** → `go-to-market-planner`
7. **Create your pitch** → `investor-pitch-deck-builder`

Skills automatically detect and reuse outputs from previous skills.

---

## Output Examples

Each skill generates professional HTML reports with:
- Score banners with key metrics
- Chart.js visualizations (bar, line, doughnut, radar)
- Actionable recommendations
- Framework-specific analysis
- Next steps guidance

Reports use a dark emerald theme (#10b981 accent on #0a0a0a background).

---

## Contributing

We welcome contributors! If you're interested in improving StratArts, please reach out at stratarts@maigent.com.

### Development
```bash
git clone https://github.com/maigentic/stratarts.git
cd stratarts
# Skills are in /stratarts/skills directory
# HTML templates are in /html-templates
```

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Links

- **Website:** https://stratarts.ai
- **Documentation:** https://docs.stratarts.ai
- **GitHub:** https://github.com/maigentic/stratarts
- **Issues:** https://github.com/maigentic/stratarts/issues

---

## Author

**Maigent** - Building tools for the AI-powered entrepreneur

---

*StratArts — From Idea to Fundable Business*
