# Mario dev ws dotfiles

Linux-focused dotfiles for the Docker `ws` service used with the ajedrezlapaz ops setup.

## Active configs

These are linked by the `ws` entrypoint when /alp/dotfiles exists:

- .zshrc -> shell environment, prompt, aliases, small helpers
- .config/nvim -> LazyVim-based Neovim config for Bun, Elysia, Drizzle, and Next.js work
- .config/tmux -> tmux terminal/session config
- .config/lazygit -> lazygit theme/config

## Neovim

The Neovim setup is a clean LazyVim starter, not the original upstream config. It uses current LazyVim defaults, including Snacks picker/explorer, plus web-focused extras:

- TypeScript/TSX
- Tailwind
- JSON/YAML/Markdown
- Docker
- Elysia/Drizzle-ready TypeScript work
- ESLint
- Prettier

Hidden files are shown by default in Snacks picker, explorer, and grep. .git directories are excluded.

## tmux

The tmux config enables truecolor, mouse support, useful window/pane indexing, current-path splits, and a `dev` statusline. The `ws` helper opens web, API, database, dotfiles, and utility windows.

TPM plugins are installed under ~/.tmux/plugins, not inside this Git repo.

## Origin

This branch started from Lazar Nikolov dotfiles, but it has been trimmed for a Linux Docker `ws` service. macOS, GUI-terminal, Zed, Kitty, btop, Neo-tree, Telescope, and unused language-specific pieces were removed.
