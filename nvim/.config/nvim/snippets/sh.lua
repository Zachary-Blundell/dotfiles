local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("shebang", {
    t("#!/bin/bash"),

    t({ "", "" }),
    i(0),
  }),

  s("seteuo", {
    t("set -euo pipefail"),
  }),

  s("ifmain", {
    t({ 'if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then', "  " }),
    i(1, 'main "$@"'),
    t({ "", "fi" }),
  }),

  s("fori", {
    t("for "),
    i(1, "item"),
    t(" in "),
    i(2, '"${items[@]}"'),
    t({ "; do", "  " }),
    i(0),
    t({ "", "done" }),
  }),

  s("case", {
    t("case "),
    i(1, '"$1"'),
    t({ " in", "  " }),
    i(2, "start"),
    t({ ")", "    " }),
    i(3, 'echo "start"'),
    t({ "", "    ;;", "  *)", "    " }),
    i(4, 'echo "unknown option"'),
    t({ "", "    ;;", "esac" }),
  }),

  s("echoerr", {
    t('echo "'),
    i(1, "error"),
    t('" >&2'),
  }),
  s(
    "bashcolors",
    t({
      "# -----------------------------",
      "# Colors",
      "# -----------------------------",
      "RED=$'\\e[31m'",
      "GREEN=$'\\e[32m'",
      "YELLOW=$'\\e[33m'",
      "BLUE=$'\\e[34m'",
      "BOLD=$'\\e[1m'",
      "RESET=$'\\e[0m'",
      "",
      'info() { echo "${BLUE}${BOLD}==>${RESET} $*"; }',
      'success() { echo "${GREEN}${BOLD}✔${RESET}  $*"; }',
      'warn() { echo "${YELLOW}${BOLD}⚠ Warning:${RESET}  $*"; }',
      'error() { echo "${RED}${BOLD}✖ Error:${RESET}  $*" >&2; }',
    })
  ),
}
