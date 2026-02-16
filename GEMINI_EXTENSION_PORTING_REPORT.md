# Porting StratArts Skills to Gemini CLI Extension

This report outlines the strategy for porting the StratArts Claude Code Skills into a Gemini CLI Extension.

## 1. Source Analysis
The StratArts library consists of:
*   **27 Skills** in `skills/`: Markdown files (`SKILL.md`) acting as "System Prompts" with embedded logic, workflows, and scoring rubrics.
*   **HTML Templates** in `html-templates/`: Handlebars/Mustache-style templates for generating professional reports.
*   **Structure**: Each skill follows a strict 14-step workflow, from context detection to file generation.

## 2. Target Architecture: Gemini CLI Extension
A Gemini CLI Extension typically consists of:
*   A dedicated directory in `.gemini/extensions/` (e.g., `.gemini/extensions/stratarts/`).
*   A `GEMINI.md` file: The "Brain" that directs the model on how to use the extension.
*   Support files: The `skills/` and `html-templates/` directories must be bundled with the extension to make it portable.

## 3. Porting Strategy

### A. Asset Migration
We must copy the core logic assets to the extension directory so the extension is self-contained and works in any project.
*   **Source**: `D:\AI\projects\stratarts\skills` → **Dest**: `.gemini/extensions/stratarts/skills`
*   **Source**: `D:\AI\projects\stratarts\html-templates` → **Dest**: `.gemini/extensions/stratarts/html-templates`

### B. The `GEMINI.md` System Prompt
This is the core component. It needs to:
1.  **Catalog Capabilities**: List all 27 skills and their descriptions.
2.  **Dispatch Logic**: Instruct Gemini to:
    *   Recognize natural language requests (e.g., "Validate my business idea").
    *   Load the specific `SKILL.md` for that task.
    *   "Context Switch" into that skill's persona.
3.  **Path Management (CRITICAL)**:
    *   **Read** assets (skills/templates) from the *Extension Directory*.
    *   **Write** outputs (reports/.strategy folder) to the *Current Working Directory*.

### C. UX Adaptation
The original skills use text-based menus (A/B/C). In Gemini CLI, we can streamline this:
*   **Automation**: Instead of asking "Where is the project?", default to the current directory and just ask for confirmation.
*   **Tools**: Use `read_file`, `write_file`, and `run_shell_command` to execute the file operations described in "Step 0" and "Step 13".

## 4. Implementation Plan

I have prepared a `extension-preflight` folder in your current directory containing:
1.  **`GEMINI.md`**: The master system prompt for the extension.
2.  **`install.ps1`**: A PowerShell script to automatically install the extension (copy files and setup configuration).

### Next Steps
1.  Review the `extension-preflight/GEMINI.md` file.
2.  Run `extension-preflight/install.ps1` to install the extension to your `.gemini` folder.
3.  Restart your session or reload configuration to start using StratArts skills.
