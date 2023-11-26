local ls = require('luasnip')
local ismath = require('snippets.utils').ismath
local regex_cap_group = require('snippets.utils').regex_cap_group
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

-- Function for defining environment snippets
local function environment(trigger, name)
  return s(
    { trig = "^(%s*)" .. trigger, regTrig = true },
    {
      f(regex_cap_group(1), {}),
      t({ "\\begin{" .. name .. "}", "  " }),
      f(regex_cap_group(1), {}),
      i(0),
      t({ "", "" }),
      f(regex_cap_group(1), {}),
      t({ "\\end{" .. name .. "}" }),
    }
  )
end

-- Function for defining \ref{trig:} snippets
local function ref(trigger, name)
  local command
  if trigger == "eq" then
    command = '\\eqref'
  else
    command = '\\ref'
  end
  return s(
    'ref' .. trigger,
    {
      t(name .. '~' .. command .. '{' .. trigger .. ':'), i(1),
      t('}'), i(0)
    }
  )
end

-- Function for defining \label{trig:} snippets
local function label(trigger)
  return s(
    'lab' .. trigger,
    {
      t('\\label{' .. trigger .. ':'), i(0),
      t('}')
    }
  )
end

-- Function for defining snippets as \mathbb{X}, triggered by XX
local function mathbb(content)
  return s(
    content .. content,
    {
      t('\\mathbb{' .. content .. '}'), i(0)
    },
    { condition = ismath }
  )
end

-- Function for defining snippets as command -> \command{}
-- args can be either a trigger or a table with fields:
-- trigger='...', command='...', noargs = true|false, condition = function()
-- If only trigger or command is given, they are taken to be both equal
-- noargs defaults to false
-- condition is passed to s(), defaults to a function returning true
local function command(args)
  local trigger
  local command

  if type(args) == type({}) then
    trigger = args.trigger or args.command
    command = args.command or args.trigger
  else
    trigger = args
    command = args
  end

  local condition = args.condition or (function() return true end)
  local snip
  if args.noargs then
    snip = s(
      trigger,
      {
        t('\\' .. command),
        i(0)
      },
      { condition = condition }
    )
  else
    snip = s(
      trigger,
      {
        t('\\' .. command .. '{'),
        i(1),
        t('}'),
        i(0)
      },
      { condition = condition }
    )

  end
  return snip
end

-- Function for defining snippets as wordtrig -> \trig{word}
-- args can be either a trigger or {trigger='...', command='...'}
local function wrap(args)
  local trigger
  local command

  if type(args) == type({}) then
    trigger = args.trigger
    command = args.command
  else
    trigger = args
    command = args
  end

  return s(
    { trig = '([^${} ]+)' .. trigger, regTrig = true },
    {
      t("\\" .. command .. "{"),
      f(regex_cap_group(1), {}),
      t("}"),
      i(0),
    },
    { condition = ismath }
  )
end

local function imap(trigger, command)
  return s(
    { trig = '´' .. trigger, wordTrig = false },
    {
      t('\\' .. command),
      i(0)
    },
    { condition = ismath }
  )
end

local tex = {}
tex.snippets = {
  s(
    "article",
    {
      t({
        [[\documentclass[oneside]{amsart}]],
        [[%\usepackage{amsaddr}]],
        '',
        [[\makeatletter]],
        [[\g@addto@macro{\endabstract}{\@setabstract}]],
        [[\newcommand{\authorfootnotes}{\renewcommand\thefootnote{\@fnsymbol\c@footnote}}%]],
        [[\makeatother]],
        '',
        [[\usepackage{url}]],
        [[\def\UrlFont{\rmfamily}]],
        '',
        [[\usepackage[utf8]{inputenc}]],
        [[\usepackage{cite}]],
        [[\usepackage{amsthm}]],
        [[\usepackage{mathtools}%Coloneqq]],
        [[\usepackage{amsfonts}%Caracteres matemáticos.]],
        [[\usepackage{amsmath}]],
        [[\usepackage{amssymb}]],
        [[\usepackage{xfrac}]],
        [[\usepackage{enumitem} % customizable list environments]],
        [[\usepackage{graphicx}]],
        [[\usepackage{mathrsfs}]],
        [[\usepackage{subcaption}]],
        '',
        [[% QED at the end of proofs]],
        [[\usepackage{etoolbox}% http://ctan.org/pkg/etoolbox for AtEndEnvironment]],
        '',
        [[\usepackage[unicode=true,]],
        [[bookmarks=true,bookmarksopen=false,]],
        [[breaklinks=false,pdfborder={0 0 0},colorlinks=false]{hyperref}]],
        '',
        [[%short -------------------------------------------------------------------]],
        '',
        [[\DeclareMathOperator{\dom}{dom}]],
        [[\DeclareMathOperator{\form}{form}]],
        [[\DeclareMathOperator{\range}{range}]],
        [[\DeclareMathOperator{\diag}{diag}]],
        '',
        [[\renewcommand{\Re}{\mathrm{Re}\,}]],
        [[\renewcommand{\Im}{\mathrm{Im}\,}]],
        '',
        [[% THEOREM Environments ---------------------------------------------------]],
        [[%]],
        [[% \theoremstyle{plain}]],
        [[\newtheorem{theorem}{Theorem}[section] ]],
        [[\newtheorem{corollary}[theorem]{Corollary}]],
        [[\newtheorem{lemma}[theorem]{Lemma}]],
        [[\newtheorem{proposition}[theorem]{Proposition}]],
        [[\theoremstyle{definition}]],
        [[\newtheorem{definition}[theorem]{Definition}]],
        [[\newtheorem{assumption}[theorem]{Assumption}]],
        [[\theoremstyle{remark}]],
        [[\newtheorem{remark}[theorem]{Remark}]],
        [[\newtheorem{notation}[theorem]{Notation}]],
        [[\numberwithin{equation}{section}]],
        [[\newtheorem{example}{Example}]],
        [[\newcommand{\triang}{\hfill$\triangle$}]],
        [[\AtEndEnvironment{example}{\triang}]],
        '',
        [[% Edition commands ------------------------------------------------------------]],
        [[%\usepackage[notref, notcite]{showkeys}% Showing labels in the manuscript]],
        [[\usepackage{color}]],
        [[\newcommand{\rev}[1]{{\color{blue} #1}}]],
        [[\newcommand{\REV}[1]{{\color{red} #1}}]],
        [[\usepackage{marginnote}]],
        [[\newcommand{\note}[1]{\marginnote{\REV{#1}}}]],
        '',
        [[% =============================================================================]],
        '',
        [[\title{]],
      }),
      i(1),
      t({
        '}',
        '',
        [[%%----------classification, keywords, date]],
        '',
        [[%\subjclass[2010]{81Q93, 81Q35, 35Q41, 35J10}]],
        '',
        [[%\keywords{Groups of symmetry; Self-adjoint extensions; Quantum circuits}]],
        '',
        [[\begin{document}]],
        '  ',
      }),
      i(0),
      t({
        '',
        '',
        [[  % References ==============================================================]],
        [[  \bibliographystyle{plain}]],
        [[  \bibliography{]],
      }),
      i(2, 'bibliography.bib'),
      t({
        '}',
        [[  %\addcontentsline{toc}{section}{References}]],
        '',
        [[\end{document}]],
      })
    }
  ),
  s(
    "enum",
    {
      t({ "\\begin{enumerate}[label=\\textit{(\\roman*)},nosep,leftmargin=*]", "  \\item " }),
      i(0),
      t({ "", "\\end{enumerate}" })
    }
  ),
  s(
    "item",
    {
      t({ "\\begin{itemize}", "  \\item" }),
      i(0),
      t({ "", "\\end{itemize}" })
    }
  ),
  s("i", t("\\item")),
  s(
    "beg",
    {
      t("\\begin{"), i(1, "env"), t({ "}", "  " }),
      i(0),
      t({ "", "" }),
      f(function(args, snip) return "\\end{" .. args[1][1] .. "}" end, { 1 }),
    }
  ),
}

tex.autosnippets = {
  -- Math regions
  s(
    "$",
    {
      t("$"),
      i(1),
      t("$"),
      i(0),
    }
  ),
  s(
    "eqq",
    {
      t({ "\\begin{equation*}", "  " }),
      i(1),
      t({ "", "\\end{equation*}" }),
      i(0),
    }
  ),
  -- Environments
  s(
    { trig = "^(%s*)beg", regTrig = true },
    {
      f(regex_cap_group(1), {}),
      t("\\begin{"), i(1, "env"), t({ "}", "  " }),
      f(regex_cap_group(1), {}),
      i(0),
      t({ "", "" }),
      f(regex_cap_group(1), {}),
      f(function(args, snip) return "\\end{" .. args[1][1] .. "}" end, { 1 }),
    }
  ),
  -- Theorem-like environments
  environment('proof', 'proof'),
  environment('thm', 'theorem'),
  environment('prop', 'proposition'),
  environment('lemma', 'lemma'),
  environment('corol', 'corollary'),
  environment('def', 'definition'),
  environment('example', 'example'),
  environment('remark', 'remark'),
  environment('assump', 'assumption'),
  -- References
  ref('sec', 'Section'),
  ref('subsec', 'Subsection'),
  ref('thm', 'Theorem'),
  ref('prop', 'Proposition'),
  ref('lemma', 'Lemma'),
  ref('corol', 'Corollary'),
  ref('def', 'Definition'),
  ref('example', 'Example'),
  ref('remark', 'Remark'),
  ref('assump', 'Assumption'),
  ref('eq', 'Equation'),
  -- Eqref without Equation~ in front
  s(
    'eqref',
    {
      t('\\eqref{eq:'), i(1),
      t('}'), i(0)
    }
  ),
  -- Labels
  label('sec'),
  label('subsec'),
  label('thm'),
  label('prop'),
  label('lemma'),
  label('corol'),
  label('def'),
  label('example'),
  label('remark'),
  label('assump'),
  label('eq'),
  -- Sets
  mathbb('R'),
  mathbb('C'),
  mathbb('Q'),
  mathbb('Z'),
  mathbb('N'),
  -- shorthands
  s(
    "<<",
    {
      t("\\langle "),
      i(1),
      t(", "),
      i(2),
      t("\\rangle"),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    "\\|",
    {
      t("\\|"),
      i(1),
      t("\\|"),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    "set",
    {
      t("\\{"),
      i(1),
      t("\\}"),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    { trig = '^^', wordTrig = false },
    {
      t("^{"),
      i(1),
      t("}"),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    { trig = '__', wordTrig = false },
    {
      t("_{"),
      i(1),
      t("}"),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    { trig = '([^$ ]+)//', regTrig = true },
    {
      t("\\frac{"),
      f(regex_cap_group(1), {}),
      t("}{"),
      i(1),
      t('}'),
      i(0),
    },
    { condition = ismath }
  ),
  s(
    '//',
    {
      t("\\frac{"),
      i(1),
      t("}{"),
      i(2),
      t('}'),
      i(0),
    },
    { condition = ismath }
  ),
  -- wrappers
  wrap({ trigger = 'hatt', command = 'hat' }),
  wrap({ trigger = 'dott', command = 'dot' }),
  wrap({ trigger = 'tildee', command = 'tilde' }),
  wrap({ trigger = 'over', command = 'overline' }),
  -- commands
  command({ trigger = "citee", command = 'cite' }),
  command({ trigger = ':=', command = 'coloneqq', condition = ismath, noargs = true }),
  command({ trigger = '!=', command = 'neq', condition = ismath, noargs = true }),
  command({ trigger = '<=', command = 'leq', condition = ismath, noargs = true }),
  command({ trigger = '>=', command = 'geq', condition = ismath, noargs = true }),
  command({ trigger = 'cc', command = 'subset', condition = ismath, noargs = true }),
  command({ trigger = 'xx', command = 'times', condition = ismath, noargs = true }),
  command({ trigger = 'too', command = 'to', noargs = true, condition = ismath }),
  command({ trigger = 'mapss', command = 'mapsto', noargs = true, condition = ismath }),
  command({ trigger = 'inn', command = 'in', noargs = true, condition = ismath }),
  command({ trigger = 'ninn', command = 'notin', noargs = true, condition = ismath }),
  command({ command = 'hat', condition = ismath }),
  command({ command = 'dot', condition = ismath }),
  command({ trigger = 'over', command = 'overline', condition = ismath }),
  command({ trigger = 'bb', command = 'mathbb', condition = ismath }),
  command({ trigger = 'cal', command = 'mathcal', condition = ismath }),
  command({ trigger = 'bold', command = 'boldsymbol', condition = ismath }),
  command({ trigger = 'tt', command = 'text', condition = ismath }),
  command({ trigger = 'sq', command = 'sqrt', condition = ismath }),
  -- Greek letters (imaps from vimtex are now removed)
  imap('a', 'alpha'),
  imap('A', 'Alpha'),
  imap('b', 'beta'),
  imap('B', 'Beta'),
  imap('c', 'chi'),
  imap('d', 'delta'),
  imap('D', 'Delta'),
  imap('e', 'varepsilon'),
  imap('E', 'exists'),
  imap('f', 'phi'),
  imap('F', 'Phi'),
  imap('g', 'gamma'),
  imap('G', 'Gamma'),
  imap('h', 'eta'),
  imap('i', 'ipsilon'),
  imap('j', 'varphi'),
  imap('k', 'kappa'),
  imap('l', 'lambda'),
  imap('L', 'Lambda'),
  imap('m', 'mu'),
  imap('n', 'nu'),
  imap('o', 'omega'),
  imap('O', 'Omega'),
  imap('p', 'pi'),
  imap('P', 'Pi'),
  imap('q', 'theta'),
  imap('Q', 'Theta'),
  imap('r', 'rho'),
  imap('s', 'sigma'),
  imap('S', 'Sigma'),
  imap('t', 'tau'),
  imap('u', 'upsilon'),
  imap('v', 'vartheta'),
  imap('x', 'xi'),
  imap('X', 'Xi'),
  imap('y', 'psi'),
  imap('Y', 'Psi'),
  imap('z', 'zeta'),
  imap('8', 'infty'),
  imap('6', 'partial'),
  imap('+', 'dagger'),
}

return tex
