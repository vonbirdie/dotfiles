
# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

set -gx EDITOR nvim

# PAGER
set -gx PAGER less -FirSwX
set -gx MANPAGER less -FiRswX

# ----------------------------------------------------------------------
# LS
# ----------------------------------------------------------------------

# we always pass these to ls(1)
set -gx LS_COMMON "lhBG"

# -------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# -------------------------------------------------------------------

# source ~/.shenv now if it exists
if test -r ~/.shenv.fish
  source ~/.shenv.fish
end

# A feeble attempt at merging history.
# https://github.com/fish-shell/fish-shell/issues/825
bind -k up 'history --merge ; up-or-search'
