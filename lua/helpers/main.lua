local H = {}

--- @param opts   { mode: string, keymap: string, cb: function, desc: string }
--- @return nil
function H.set(opts)
    local local_set = vim.keymap.set
    local_set(opts.mode, opts.keymap, opts.cb, { desc = opts.desc })
end

return H
