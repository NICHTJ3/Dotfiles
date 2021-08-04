local linters = {
    eslint = {
        lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
        lintSource = 'eslint',
        lintStdin = true,
        lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
        lintIgnoreExitCode = true
    },
    markdownlint_cli = {
        lintCommand = 'markdownlint -s',
        lintSource = 'markdownlint',
        lintStdin = true,
        lintFormats = {'%f:%l %m', '%f:%l:%c %m'},
        lintIgnoreExitCode = true
    }

}

return linters
