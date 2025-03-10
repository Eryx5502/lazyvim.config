return {
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "Gmove",
      "GDelete",
      "GRemove",
      "GBrowse",
    },
    keys = {
      { "<leader>gl", "<cmd>G blame<CR>", desc = ":G blame" },
      { "<leader>gO", "<cmd>G difftool HEAD~1<CR>", desc = "Changes in last commit" },
    },
  },
  -- PR and Issue edit from nvim
  -- {
  --   "pwntester/octo.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup({
  --       enable_builtin = true,
  --       use_local_fs = true,
  --       mappings = {
  --         issue = {
  --           close_issue = { lhs = "<localleader>ic", desc = "close issue" },
  --           reopen_issue = { lhs = "<localleader>io", desc = "reopen issue" },
  --           list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },
  --           reload = { lhs = "<C-r>", desc = "reload issue" },
  --           open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
  --           copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
  --           add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },
  --           remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },
  --           create_label = { lhs = "<localleader>lc", desc = "create label" },
  --           add_label = { lhs = "<localleader>la", desc = "add label" },
  --           remove_label = { lhs = "<localleader>ld", desc = "remove label" },
  --           goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
  --           add_comment = { lhs = "<localleader>ca", desc = "add comment" },
  --           delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
  --           next_comment = { lhs = "<localleader>cj", desc = "go to next comment" },
  --           prev_comment = { lhs = "<localleader>ck", desc = "go to previous comment" },
  --           react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
  --           react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
  --           react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
  --           react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
  --           react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
  --           react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
  --           react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
  --           react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
  --         },
  --         pull_request = {
  --           checkout_pr = { lhs = "<localleader>po", desc = "checkout PR" },
  --           merge_pr = { lhs = "<localleader>pm", desc = "merge commit PR" },
  --           squash_and_merge_pr = { lhs = "<localleader>psm", desc = "squash and merge PR" },
  --           list_commits = { lhs = "<localleader>pc", desc = "list PR commits" },
  --           list_changed_files = { lhs = "<localleader>pf", desc = "list PR changed files" },
  --           show_pr_diff = { lhs = "<localleader>pd", desc = "show PR diff" },
  --           add_reviewer = { lhs = "<localleader>va", desc = "add reviewer" },
  --           remove_reviewer = { lhs = "<localleader>vd", desc = "remove reviewer request" },
  --           close_issue = { lhs = "<localleader>ic", desc = "close PR" },
  --           reopen_issue = { lhs = "<localleader>io", desc = "reopen PR" },
  --           list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },
  --           reload = { lhs = "<C-r>", desc = "reload PR" },
  --           open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
  --           copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
  --           goto_file = { lhs = "gf", desc = "go to file" },
  --           add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },
  --           remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },
  --           create_label = { lhs = "<localleader>lc", desc = "create label" },
  --           add_label = { lhs = "<localleader>la", desc = "add label" },
  --           remove_label = { lhs = "<localleader>ld", desc = "remove label" },
  --           goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
  --           add_comment = { lhs = "<localleader>ca", desc = "add comment" },
  --           delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
  --           next_comment = { lhs = "<localleader>cj", desc = "go to next comment" },
  --           prev_comment = { lhs = "<localleader>ck", desc = "go to previous comment" },
  --           react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
  --           react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
  --           react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
  --           react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
  --           react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
  --           react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
  --           react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
  --           react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
  --         },
  --         review_thread = {
  --           goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
  --           add_comment = { lhs = "<localleader>ca", desc = "add comment" },
  --           add_suggestion = { lhs = "<localleader>sa", desc = "add suggestion" },
  --           delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
  --           next_comment = { lhs = "<localleader>cj", desc = "go to next comment" },
  --           prev_comment = { lhs = "<localleader>ck", desc = "go to previous comment" },
  --           select_next_entry = { lhs = "<localleader>k", desc = "move to previous changed file" },
  --           select_prev_entry = { lhs = "<localleader>k", desc = "move to next changed file" },
  --           close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
  --           react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
  --           react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
  --           react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
  --           react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
  --           react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
  --           react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
  --           react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
  --           react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
  --         },
  --         submit_win = {
  --           approve_review = { lhs = "<C-a>", desc = "approve review" },
  --           comment_review = { lhs = "<C-m>", desc = "comment review" },
  --           request_changes = { lhs = "<C-r>", desc = "request changes review" },
  --           close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
  --         },
  --         review_diff = {
  --           add_review_comment = { lhs = "<localleader>ca", desc = "add a new review comment" },
  --           add_review_suggestion = { lhs = "<localleader>sa", desc = "add a new review suggestion" },
  --           focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },
  --           toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },
  --           next_thread = { lhs = "<localleader>tj", desc = "move to next thread" },
  --           prev_thread = { lhs = "<localleader>tk", desc = "move to previous thread" },
  --           select_next_entry = { lhs = "<localleader>j", desc = "move to previous changed file" },
  --           select_prev_entry = { lhs = "<localleader>k", desc = "move to next changed file" },
  --           close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
  --           toggle_viewed = { lhs = "<localleader><localleader>", desc = "toggle viewer viewed state" },
  --           goto_file = { lhs = "gf", desc = "go to file" },
  --         },
  --         file_panel = {
  --           next_entry = { lhs = "j", desc = "move to next changed file" },
  --           prev_entry = { lhs = "k", desc = "move to previous changed file" },
  --           select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
  --           refresh_files = { lhs = "R", desc = "refresh changed files panel" },
  --           focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },
  --           toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },
  --           select_next_entry = { lhs = "<localleader>j", desc = "move to previous changed file" },
  --           select_prev_entry = { lhs = "<localleader>k", desc = "move to next changed file" },
  --           close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
  --           toggle_viewed = { lhs = "<localleader><localleader>", desc = "toggle viewer viewed state" },
  --         },
  --       },
  --     })
  --     vim.cmd([[hi OctoEditable guibg=none]])
  --   end,
  --   keys = {
  --     { "<leader>o", "<cmd>Octo<cr>", desc = "Octo.nvim" },
  --   },
  --   cmd = { "Octo" },
  -- },
  -- completion with cmp of issues, mentions, PRs...
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "petertriho/cmp-git",
  --       opts = {
  --         -- remotes = { "upstream" },
  --       },
  --     },
  --   },
  --   opts = function(_, opts)
  --     table.insert(opts.sources, #opts.sources + 1, {
  --       name = "git",
  --       priority = 500,
  --       group_index = 1,
  --     })
  --   end,
  -- },
  -- see diffview on a nice interface
  {
    "sindrets/diffview.nvim",
    opts = {
      view = {
        merge_tool = {
          layout = "diff4_mixed",
        },
      },
    },
    -- event = "BufRead",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    },
  },
  { "tpope/vim-rhubarb" }, -- For enabling GBrowse for github
  { "shumphrey/fugitive-gitlab.vim" }, -- For enabling GBrowse for gitlab
  -- Enable virtual text blame for current line
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    module = "git-worktree",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gwc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "[G]it [W]orktree [C]reate",
      },
      {
        "<leader>gws",
        function()
          require("telescope").extensions.git_worktree.git_worktree()
        end,
        desc = "[G]it [W]orktree [S]witch",
      },
    },
    config = function()
      local wk_ok, wk = pcall(require, "which-key")
      if wk_ok then
        wk.add({
          mode = { "n", "v" },
          ["<leader>gw"] = { name = "+worktrees" },
        })
      end
      local status_ok, gwt = pcall(require, "git-worktree")
      if not status_ok then
        return
      end

      local config = {}

      local hooks = require("git-worktree.hooks")
      hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)
      require("telescope").load_extension("git_worktree")
    end,
  },
}
