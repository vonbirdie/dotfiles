
# ----------------------------------------------------------------------
# Display
# ----------------------------------------------------------------------

fish_config theme choose "Dracula Official"

# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

set -gx EDITOR nvim

# PAGER
set -gx PAGER less -FirSwX
set -gx MANPAGER less -FiRswX

# DIFF
set -gx DIFFPROG "nvim -d"

# -------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# -------------------------------------------------------------------

set -gx fish_prompt_pwd_dir_length 0

# source ~/.shenv now if it exists
if test -r ~/.shenv.fish
  source ~/.shenv.fish
end

