-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--[[
-- Python Provider Fix for Nix + Virtual Environments
--
-- ## The Problem
-- By default, a Nix-managed Neovim (via home-manager or nixpkgs) sets the
-- `g:python3_host_prog` variable to a hardcoded Python executable in the
-- /nix/store. This is done to ensure Neovim always has a reproducible,
-- working Python provider (`pynvim`).
--
-- ## The Conflict
-- This hardcoded path causes Neovim to IGNORE our active project-specific
-- virtual environments (like those created by `uv` or `venv`).
--
-- This means plugins (like `molten-nvim`) running inside Neovim's "Nix Python"
-- cannot find packages (like `jupyter-client`) that are installed in our
-- project's venv.
--
-- ## The Solution
-- This code checks if Neovim was launched from a shell where a `$VIRTUAL_ENV`
-- is active.
--
-- - If YES: It dynamically overrides `g:python3_host_prog` to point to the
--           venv's Python.
-- - If NO:  It does nothing, and Neovim falls back to the reliable Nix default.
--
-- This gives us the best of both worlds: project-specific tools when we're in
-- a project, and a stable global provider when we're not.
--]]

local venv = os.getenv("VIRTUAL_ENV")

if venv then
  vim.g.python3_host_prog = venv .. "/bin/python"
end
