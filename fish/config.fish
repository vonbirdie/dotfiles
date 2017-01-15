
# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

set -gx EDITOR nvim

# PAGER
if command less
  set -gx PAGER "less -FirSwX"
  set -gx MANPAGER "less -FiRswX"
else
  set -gx PAGER more
  set -gx MANPAGER "$PAGER"
end

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

