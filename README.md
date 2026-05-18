# Mario dev workstation dotfiles

Linux-focused dotfiles for the Docker workstation used with the dev-containers setup.

## Active configs

These are linked by the workstation entrypoint when /workspace/projects/.dotfiles exists:

- .zshrc -> shell environment, prompt, aliases, small helpers
- .config/nvim -> LazyVim-based Neovim config for Node.js and Next.js work
- .config/tmux -> tmux terminal/session config
- .config/lazygit -> lazygit theme/config

## Neovim

The Neovim setup is a clean LazyVim starter, not the original upstream config. It uses current LazyVim defaults, including Snacks picker/explorer, plus web-focused extras:

- TypeScript/TSX
- Tailwind
- JSON/YAML/Markdown
- Docker
- Prisma
- ESLint
- Prettier

Hidden files are shown by default in Snacks picker, explorer, and grep. .git directories are excluded.

## tmux

The tmux config enables truecolor, mouse support, useful window/pane indexing, current-path splits, and a workstation statusline.

TPM plugins are installed under ~/.tmux/plugins, not inside this Git repo.

## Origin

This branch started from Lazar Nikolov dotfiles, but it has been trimmed for a Linux Docker workstation. macOS, GUI-terminal, Zed, Kitty, btop, Neo-tree, Telescope, and unused language-specific pieces were removed.
