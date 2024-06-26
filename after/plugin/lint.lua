require("lint").linters_by_ft = {
    markdown = { "vale" },
    python = { "flake8" },
    javascript = { "eslint" },
    typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
