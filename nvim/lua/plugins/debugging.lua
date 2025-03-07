return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local virtual_text = require('nvim-dap-virtual-text')

        -- DAP UI setup
        dapui.setup()
        virtual_text.setup()

        -- Automatically open/close dapui when debugging starts/ends
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

        -- Python configuration
        require('dap-python').setup('python')

        -- Keymappings
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>dB', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = 'Debug: Set Conditional Breakpoint' })
        vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Continue' })
        vim.keymap.set('n', '<leader>de', dapui.eval, { desc = 'Debug: Evaluate' })
        vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<leader>dk', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>dl', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Debug: Open REPL' })
        vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI' })

        -- Python specific keymappings
        vim.keymap.set('n', '<leader>dpr', function()
            require('dap-python').test_method()
        end, { desc = 'Debug: Run Python Test Method' })

        vim.keymap.set('n', '<leader>dpc', function()
            require('dap-python').test_class()
        end, { desc = 'Debug: Run Python Test Class' })
    end,
}
