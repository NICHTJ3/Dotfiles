local eslint = {
    lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
    lintSource = 'eslint',
    lintStdin = true,
    lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
    lintIgnoreExitCode = true
}



local M = { }

M.eslint = eslint

return M