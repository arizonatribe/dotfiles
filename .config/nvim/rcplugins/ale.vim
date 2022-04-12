" Plug 'w0rp/ale'

let b:ale_linters = {
  \ 'python': ['flake8', 'pylint'],
  \ 'javascript': ['flow', 'flow-language-server', 'eslint'],
  \ 'css': ['stylelint']
\}
let g:ale_fixers = {
  \ 'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
  \ 'css': ['stylelint']
\}

let g:ale_fix_on_save = 1
let g:ale_sign_warning = '⚡️'
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 1
let g:ale_statusline_format = ['{%d} error(s)', '{%d} warning(s)', '']
let g:ale_lint_on_text_changed = 'normal' " Slows down things if it's always linting
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%: "%code%"] %s [%severity%]'

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --parser typescript --semi false --print-width 120 --tab-width 2'
