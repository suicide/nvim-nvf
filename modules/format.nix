{
  lib,
  pkgs,
  config,
  options,
  ...
}: {
  config = {
    vim = {
      formatter.conform-nvim = {
        enable = true;

        setupOpts = {
          # wrap/reflow git commit messages (COMMIT_EDITMSG, MERGE_MSG, ...)
          # with Vim's own formatter so the subject wraps on word boundaries
          # and the "#" comment block is left untouched
          formatters_by_ft.gitcommit = ["gitcommit_wrap"];

          formatters.gitcommit_wrap.format = lib.generators.mkLuaInline ''
            function(self, ctx, lines, callback)
              local comment_char = (vim.bo[ctx.buf].comments:match("^:(%S)") or "#")

              local function is_comment(line)
                return line:sub(1, 1) == comment_char
              end

              local out = {}
              local chunk = {}

              local function flush()
                if #chunk == 0 then
                  return
                end

                local buf = vim.api.nvim_create_buf(false, true)
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, chunk)
                vim.bo[buf].textwidth = 72
                vim.bo[buf].formatoptions = "tn"
                vim.bo[buf].formatlistpat = [[^\s*\d\+[\]:.)}]\s\+\|^\s*[-*+]\s\+]]
                vim.api.nvim_buf_call(buf, function()
                  vim.cmd("normal! gggqG")
                end)

                for _, formatted in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
                  table.insert(out, formatted)
                end
                vim.api.nvim_buf_delete(buf, { force = true })

                chunk = {}
              end

              for _, line in ipairs(lines) do
                if is_comment(line) then
                  flush()
                  table.insert(out, line)
                else
                  table.insert(chunk, line)
                end
              end
              flush()

              callback(nil, out)
            end
          '';
        };
      };

      # use conform as the quasi default for formatting
      keymaps = [
        {
          key = "<leader>F";
          mode = ["n"];
          lua = true;
          action = ''
            function()
              require("conform").format({ async = true })
            end
          '';
          desc = "Format with conform-nvim";
        }
      ];
    };
  };
}
