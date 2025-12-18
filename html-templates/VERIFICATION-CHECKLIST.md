# HTML Template Output Verification Checklist

**Purpose:** Ensure all test-template-output.html files conform exactly to base-template.html patterns. This prevents non-deterministic drift in CSS and HTML structure.

---

## Canonical Patterns (from base-template.html)

### 1. Footer CSS (MUST BE EXACT)

```css
/* === FOOTER === */
footer {
    background: #0a0a0a;
    display: flex;
    justify-content: center;
}

.footer-content {
    max-width: 1600px;
    width: 100%;
    background: #1a1a1a;
    color: #a3a3a3;
    padding: 2rem 4rem;
    font-size: 0.85rem;
    text-align: center;
    border-top: 1px solid rgba(16, 185, 129, 0.2);
}

.footer-content p {
    margin: 0.3rem 0;
}

.footer-content strong {
    color: #10b981;
}
```

**Minified version for test outputs:**
```css
/* FOOTER */
footer { background: #0a0a0a; display: flex; justify-content: center; }
.footer-content { max-width: 1600px; width: 100%; background: #1a1a1a; color: #a3a3a3; padding: 2rem 4rem; font-size: 0.85rem; text-align: center; border-top: 1px solid rgba(16, 185, 129, 0.2); }
.footer-content p { margin: 0.3rem 0; }
.footer-content strong { color: #10b981; }
```

### 2. Footer HTML (MUST BE EXACT)

```html
<footer>
    <div class="footer-content">
        <p><strong>Generated:</strong> {{DATE}} | <strong>Project:</strong> {{PROJECT_NAME}}</p>
        <p style="margin-top: 5px;">StratArts Business Strategy Skills | {{SKILL_NAME}}-v{{VERSION}}</p>
        <p style="margin-top: 5px;">Context Signature: {{CONTEXT_SIGNATURE}} | Final Report ({{ITERATIONS}} iteration{{ITERATIONS_PLURAL}})</p>
    </div>
</footer>
```

**Example with values:**
```html
<footer>
    <div class="footer-content">
        <p><strong>Generated:</strong> November 28, 2025 | <strong>Project:</strong> TaskFlow Pro</p>
        <p style="margin-top: 5px;">StratArts Business Strategy Skills | business-idea-validator-v1.0.0</p>
        <p style="margin-top: 5px;">Context Signature: business-idea-validator-v1.0.0 | Final Report (1 iteration)</p>
    </div>
</footer>
```

---

## Verification Steps

When generating or auditing a test-template-output.html file:

### Step 1: Footer CSS Verification
- [ ] `footer` background is `#0a0a0a` (NOT `#0f0f0f` or other)
- [ ] `footer` uses `display: flex; justify-content: center;`
- [ ] `.footer-content` max-width is `1600px`
- [ ] `.footer-content` width is `100%`
- [ ] `.footer-content` background is `#1a1a1a`
- [ ] `.footer-content` uses `text-align: center;` (NOT flex horizontal)
- [ ] `.footer-content p` has `margin: 0.3rem 0;`
- [ ] `.footer-content strong` color is `#10b981`
- [ ] NO `.footer-brand` or `.footer-meta` classes present

### Step 2: Footer HTML Verification
- [ ] Uses `<footer>` with `<div class="footer-content">`
- [ ] Contains exactly 3 `<p>` tags
- [ ] Line 1: `<p><strong>Generated:</strong> DATE | <strong>Project:</strong> NAME</p>`
- [ ] Line 2: `<p style="margin-top: 5px;">StratArts Business Strategy Skills | SKILL-vVERSION</p>`
- [ ] Line 3: `<p style="margin-top: 5px;">Context Signature: SKILL-vVERSION | Final Report (N iteration)</p>`
- [ ] Version format is `v1.0.0` (NOT `v1.0` or `v2.0.0`)

### Step 3: Header CSS Verification
- [ ] `header` background is `#0a0a0a`
- [ ] `.header-content` background uses `linear-gradient(135deg, #10b981 0%, #14b8a6 100%)`
- [ ] `.header-content` padding is `4rem 4rem 3rem 4rem`

### Step 4: Score Banner CSS Verification
- [ ] `.score-banner` background is `#0a0a0a`
- [ ] `.score-container` background is `#1a1a1a`
- [ ] `.score-number` uses gradient text with `#10b981` to `#14b8a6`

### Step 5: Content Section CSS Verification
- [ ] `.content` or `main` max-width is `1600px`
- [ ] Section backgrounds are `#1a1a1a`
- [ ] Border colors use `rgba(16, 185, 129, 0.2)`

---

## Common Errors to Avoid

| Error | Correct Value |
|-------|---------------|
| `background: #0f0f0f` | `background: #0a0a0a` |
| `display: flex; justify-content: space-between` (in footer-content) | `text-align: center` |
| `.footer-brand`, `.footer-meta` classes | Use only `.footer-content` with `<p>` tags |
| `padding: 3rem 4rem` (in footer) | `padding: 2rem 4rem` |
| `v1.0` or `v2.0.0` | `v1.0.0` |

---

## Audit Command

To find footer pattern issues across all test outputs:

```bash
grep -n "footer-brand\|footer-meta\|#0f0f0f\|space-between" skills/**/test-template-output.html
```

Expected result: No matches

---

**Document Version:** 1.0.0
**Created:** 2025-11-28
**Canonical Source:** base-template.html
