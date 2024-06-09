local status, db = pcall(require, "dashboard")
if not status then 
    return
end

db.setup({
    theme = 'Doom',
            --'Hyper'
    config = {
        --shortcut = 
        --{
        --    { desc = '[  Github]', group = 'DashboardShortCut' },
        --},
        --project = 
        --{

        --},
        header = {
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '⣿⣿⣿⣿⣯⣿⣿⠄⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠈⣿⣿⣿⣿⣿⣿⣆⠄',
            '⢻⣿⣿⣿⣾⣿⢿⣢⣞⣿⣿⣿⣿⣷⣶⣿⣯⣟⣿⢿⡇⢃⢻⣿⣿⣿⣿⣿⢿⡄',
            '⠄⢿⣿⣯⣏⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⣾⢿⣮⣿⣿⣿⣿⣾⣷',
            '⠄⣈⣽⢾⣿⣿⣿⣟⣄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⣯⢿⣿⣿⣿⣿',
            '⣿⠟⣫⢸⣿⢿⣿⣾⣿⢿⣿⣿⢻⣿⣿⣿⢿⣿⣿⣿⢸⣿⣼⣿⣿⣿⣿⣿⣿⣿',
            '⡟⢸⣟⢸⣿⠸⣷⣝⢻⠘⣿⣿⢸⢿⣿⣿⠄⣿⣿⣿⡆⢿⣿⣼⣿⣿⣿⣿⢹⣿',
            '⡇⣿⡿⣿⣿⢟⠛⠛⠿⡢⢻⣿⣾⣞⣿⡏⠖⢸⣿⢣⣷⡸⣇⣿⣿⣿⢼⡿⣿⣿',
            '⣡⢿⡷⣿⣿⣾⣿⣷⣶⣮⣄⣿⣏⣸⣻⣃⠭⠄⠛⠙⠛⠳⠋⣿⣿⣇⠙⣿⢸⣿',
            '⠫⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣹⢷⣿⡼⠋',
            ' ⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿  ',
            '  ⢻⢹⣿⠸⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣼⣿⣿⣿⣿⡟  ',
            '  ⠈⢸⣿ ⠙⢿⣿⣿⣹⣿⣿⣿⣿⣟⡃⣽⣿⣿⡟⠁⣿⣿⢻⣿⣿⢿  ',
            '   ⠘⣿⡄  ⠙⢿⣿⣿⣾⣿⣷⣿⣿⣿⠟⠁  ⣿⣿⣾⣿⡟⣿  ',
            '    ⢻⡇⠸⣆  ⠈⠻⣿⡿⠿⠛⠉    ⢸⣿⣇⣿⣿⢿⣿  ', 
            '',
            '',
            '',
            '',
            '',
            '',
        },
        center =
        {
            {
                icon = '♟     ',
                desc = 'Find Files                           ',
                action = 'Telescope file_browser',
                key = 'space ff',  
            },
            {
                icon = '♣     ',
                desc = 'Open Neo-Tree                        ',
                action = 'Neo-Tree tree_directory',
                key = 'space e',  
            },
            {
                icon = '⚜     ',
                desc = 'Open Terminal                        ',
                action = 'Terminal',
                key = 'space th',  
            },
            {
                icon = '⛬     ',
                desc = 'File Directory                       ',
                action = 'Oil file_directory',
                key = '-',  
            },
            {
                icon = '☯     ',
                desc = 'Git Status                           ',
                action = 'Telescope git status',
                key = 'space fs',  
            },
            {
                icon = '♦     ',
                desc = 'Git list commits                     ',
                action = 'Telescope git commits',
                key = 'space fc',  
            },
            -- Some others:
            -- ✾ ♟  ♣  🂡  🃏 ☯  ♦
            
        },
        footer = {
            "",
            "",
            "",
            "Welcome home Kyuri",
            "",
            "",
            "",
        }
    }
}) 
