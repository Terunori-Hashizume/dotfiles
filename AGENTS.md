# Dotfiles Agent Guide (GNU Stow)

## Overview
This repository manages dotfiles using GNU Stow. Packages live at the repo root (e.g., `bat/`, `fish/`, `ghostty/`, `starship/`), and each package mirrors the target file layout under the home directory. Stow creates symlinks into `$HOME` so actual sources live in this repo.

- Platform: macOS
- Stow target: `$HOME` (use `-t ~`)
- Do not add wrapper scripts; Stow is the source of truth.

## Layout & Conventions
- One package per tool. Examples:
  - `bat/.config/bat/...`
  - `ghostty/.config/ghostty/config`
  - `starship/.config/starship.toml`
  - `fish/.config/fish/{config.fish,fish_plugins}` (see special rules)
- Mirror the exact path under `$HOME` inside each package (e.g., anything under `~/.config/foo` goes in `foo/.config/foo`).
- Keep changes minimal and scoped: never reorganize unrelated files.

## Managed Set (current)
- bat: all files under `~/.config/bat`
- ghostty: `~/.config/ghostty/config`
- starship: `~/.config/starship.toml`
- fish: ONLY `~/.config/fish/config.fish` and `~/.config/fish/fish_plugins`

Anything else in `~/.config` is not managed unless explicitly approved by the user first.

## Rules of Engagement
- Always ask the user before adopting or linking any new app/config. Triage per item (y/n) rather than bulk adoption.
- Never adopt backups or temporary data (e.g., `nvim.bak`, caches, `configstore`, etc.) without explicit approval.
- Do not force-overwrite real files in `$HOME`. Prefer `stow --adopt` when approved, or restore originals before restowing if the target should remain unmanaged.
- Be careful with filenames containing spaces or non-ASCII characters; quote paths when scripting.

## Common Workflows

### Add a new package (approved by user)
1. Create skeleton directories that mirror `$HOME` paths.
   - Example for `alacritty`: `mkdir -p alacritty/.config/alacritty`
2. Adopt existing files from `$HOME` (if approved):
   - `stow --adopt -v -t ~ alacritty`
3. Verify links:
   - `test -L ~/.config/alacritty/alacritty.toml`
4. Stage and commit:
   - `git add alacritty`
   - `git commit -m "Manage alacritty via stow"`

### Adjust what a package manages (example: fish)
- fish must only manage two files:
  - `fish/.config/fish/config.fish`
  - `fish/.config/fish/fish_plugins`
- If other files were accidentally linked via Stow:
  1) Unstow the package: `stow -D -t ~ fish`
  2) Restore non-managed files as real files back into `~/.config/fish` (copy from repo, then remove from repo)
  3) Keep only the two allowed files in the `fish` package
  4) Restow: `stow -S -t ~ fish`

### Unstow / Restore
- To remove links for one package: `stow -D -t ~ <pkg>`
- If a file should no longer be managed, ensure the real file exists at the target path before deleting the repo copy and restowing.

## Git Hygiene
- Review with `git status` before staging.
- Stage only relevant packages/files.
- Commit messages:
  - Add: `Manage <pkg> via stow`
  - Update scope: `Adjust <pkg> managed files: ...`
  - Remove obsolete scripts or files: concise reason
- Do not modify unrelated files or introduce bulk formatting changes.

## Safety & Approvals
- This repo directly affects `$HOME`. Always get explicit user confirmation before:
  - Running `stow --adopt` or `stow -D`
  - Moving or deleting files under `~/.config`
- Prefer dry verification and small, reversible steps.

## Quick Commands
- Show `~/.config` top-level items: `find ~/.config -mindepth 1 -maxdepth 1 -print | sort`
- Stow packages: `stow -v -t ~ <pkg> [<pkg2> ...]`
- Adopt existing files: `stow --adopt -v -t ~ <pkg>`
- Unstow: `stow -D -t ~ <pkg>`
- Verify a link: `test -L ~/.config/foo/bar && readlink ~/.config/foo/bar`

## Notes
- Avoid reintroducing legacy scripts like `install.sh` or `symlink.sh`; Stow commands replace them.
- If unsure about a file’s suitability (cache, machine-specific, secret), ask the user before managing it.

