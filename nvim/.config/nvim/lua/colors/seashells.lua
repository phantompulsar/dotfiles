local M = {}

M.colors = {
  bg        = "#09141b",
  bg_dim    = "#0d1c25",
  bg_dark   = "#17384c",
  fg        = "#deb88d",
  fg_bright = "#fee4ce",
  comment   = "#434b53",
  selection = "#1e4962",

  red       = "#d15123",
  red_soft  = "#d48678",
  green     = "#027c9b",
  green_soft= "#628d98",
  yellow    = "#fca02f",
  yellow_soft="#fdd39f",
  blue      = "#1e4950",
  blue_soft = "#1bbcdd",
  magenta   = "#68d4f1",
  magenta_soft="#bbe3ee",
  cyan      = "#50a3b5",
  cyan_soft = "#87acb4",
  cursor    = "#fca02f",
}

function M.setup()
  local c = M.colors

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "seashells"

  local groups = {
    -- Base UI
    Normal            = { bg = c.bg,       fg = c.fg },
    NormalFloat       = { bg = c.bg_dim,   fg = c.fg },
    CursorLine        = { bg = c.bg_dim },
    CursorLineNr      = { fg = c.cursor },
    LineNr            = { fg = c.comment },
    SignColumn        = { bg = c.bg },
    ColorColumn       = { bg = c.bg_dim },
    Visual            = { bg = c.selection, fg = c.fg_bright },
    VertSplit         = { fg = c.bg_dark },
    WinSeparator      = { fg = c.bg_dark },
    FloatBorder       = { fg = c.cyan,     bg = c.bg_dim },
    EndOfBuffer       = { fg = c.bg_dark },
    Folded            = { bg = c.bg_dim,   fg = c.comment },

    -- Syntax
    Comment           = { fg = c.comment,  italic = true },
    String            = { fg = c.green },
    Constant          = { fg = c.yellow },
    Number            = { fg = c.yellow },
    Boolean           = { fg = c.yellow },
    Float             = { fg = c.yellow },
    Identifier        = { fg = c.fg },
    Function          = { fg = c.blue_soft },
    Keyword           = { fg = c.magenta },
    Statement         = { fg = c.magenta },
    Conditional       = { fg = c.magenta },
    Repeat            = { fg = c.magenta },
    Operator          = { fg = c.cyan },
    Type              = { fg = c.magenta_soft },
    Special           = { fg = c.magenta },
    PreProc           = { fg = c.cyan_soft },
    Todo              = { fg = c.yellow,   bold = true },
    Error             = { fg = c.red },
    Underlined        = { underline = true },

    -- Search
    Search            = { bg = c.blue,     fg = c.fg_bright },
    IncSearch         = { bg = c.cursor,   fg = c.bg },
    CurSearch         = { bg = c.cursor,   fg = c.bg },

    -- Diagnostics
    DiagnosticError              = { fg = c.red },
    DiagnosticWarn               = { fg = c.yellow },
    DiagnosticInfo               = { fg = c.blue_soft },
    DiagnosticHint               = { fg = c.cyan },
    DiagnosticUnderlineError     = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn      = { undercurl = true, sp = c.yellow },
    DiagnosticUnderlineInfo      = { undercurl = true, sp = c.blue_soft },
    DiagnosticUnderlineHint      = { undercurl = true, sp = c.cyan },

    -- Git (gitsigns)
    GitSignsAdd       = { fg = c.green },
    GitSignsChange    = { fg = c.yellow },
    GitSignsDelete    = { fg = c.red },

    -- Completion menu
    Pmenu             = { bg = c.bg_dim,   fg = c.fg },
    PmenuSel          = { bg = c.selection, fg = c.fg_bright },
    PmenuSbar         = { bg = c.bg_dark },
    PmenuThumb        = { bg = c.cyan },

    -- Status line
    StatusLine        = { bg = c.bg_dim,   fg = c.fg },
    StatusLineNC      = { bg = c.bg,       fg = c.comment },

    -- Tabs
    TabLine           = { bg = c.bg_dim,   fg = c.comment },
    TabLineSel        = { bg = c.selection, fg = c.fg },
    TabLineFill       = { bg = c.bg },

    -- Treesitter (these override the base syntax groups for parsed files)
    ["@comment"]           = { fg = c.comment, italic = true },
    ["@string"]            = { fg = c.green },
    ["@number"]            = { fg = c.yellow },
    ["@boolean"]           = { fg = c.yellow },
    ["@float"]             = { fg = c.yellow },
    ["@function"]          = { fg = c.blue_soft },
    ["@function.call"]     = { fg = c.blue_soft },
    ["@method"]            = { fg = c.blue_soft },
    ["@method.call"]       = { fg = c.blue_soft },
    ["@keyword"]           = { fg = c.magenta },
    ["@keyword.function"]  = { fg = c.magenta },
    ["@keyword.return"]    = { fg = c.magenta },
    ["@conditional"]       = { fg = c.magenta },
    ["@repeat"]            = { fg = c.magenta },
    ["@type"]              = { fg = c.magenta_soft },
    ["@type.builtin"]      = { fg = c.magenta_soft },
    ["@variable"]          = { fg = c.fg },
    ["@variable.builtin"]  = { fg = c.red_soft },
    ["@constant"]          = { fg = c.yellow },
    ["@constant.builtin"]  = { fg = c.yellow },
    ["@parameter"]         = { fg = c.fg_bright },
    ["@field"]             = { fg = c.cyan_soft },
    ["@property"]          = { fg = c.cyan_soft },
    ["@operator"]          = { fg = c.cyan },
    ["@punctuation"]       = { fg = c.fg },
    ["@tag"]               = { fg = c.blue_soft },
    ["@tag.attribute"]     = { fg = c.cyan },

    -- LSP semantic tokens
    ["@lsp.type.function"]    = { fg = c.blue_soft },
    ["@lsp.type.method"]      = { fg = c.blue_soft },
    ["@lsp.type.variable"]    = { fg = c.fg },
    ["@lsp.type.parameter"]   = { fg = c.fg_bright },
    ["@lsp.type.keyword"]     = { fg = c.magenta },
    ["@lsp.type.string"]      = { fg = c.green },
    ["@lsp.type.number"]      = { fg = c.yellow },
    ["@lsp.type.type"]        = { fg = c.magenta_soft },
    ["@lsp.type.class"]       = { fg = c.magenta_soft },
    ["@lsp.type.interface"]   = { fg = c.magenta_soft },
  }

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
