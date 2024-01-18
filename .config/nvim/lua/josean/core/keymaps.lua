-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- remap <Esc> to <Tab>
-- keymap.set("i", "<Tab>", "<Tab>", { desc = "Remap <Esc> to <Tab>" })

-- delete entire word with control + backspace
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { })


-- map H to I
keymap.set("n", "H", "I", { desc = "Remap H to I" })


-- map L to A
keymap.set("n", "K", "A", { desc = "Remap L to A" })

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- remap insert mode from i to t
keymap.set("n", "t", "i", { desc = "Remap i to t" })

-- remap T to I
keymap.set("n", "T", "I", { desc = "Remap T to I" })

-- remap A to I
keymap.set("n", "I", "A", { desc = "Remap A to I" })

-- remap I to N
keymap.set("n", "N", "I", { desc = "Remap I to N" })

-- enter insert mode with control + i
-- keymap.set("n", "<C-i>", "t", { desc = "Enter insert mode with control + i" })

-- remap l to k
keymap.set("n", "k", "l", { desc = "Remap l to k" })

-- remap e to l
keymap.set("n", "l", "e", { desc = "Remap (e)nd to l" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete single character without copying into register" })

keymap.set("n", ";", ':', { desc = "Use ; instead of :" })

-- increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Next match, replaces (n)ext
keymap.set("n", "N", "n", { desc = "Next match" })

-- Previous match, replaces (N) prev
keymap.set("n", "P", "N", { desc = "Previous match" })

-- Assign 'R' to (s)ubstitute
keymap.set("n", "R", "s", { desc = "Assign 's' to Find" })

-- Mapping Search
-- keymap.set("n", "s", "f", { desc = "Assign 'f' to Find" }) -- Assign 's' to Find
-- keymap.set("n", "S", "F", { desc = "Find backwards" }) -- Find backwards
-- keymap.set("n", "<C-s>", "/", { desc = "Remap capital S to search" }) -- Remap control + S to search

-- Append at the end of the line
keymap.set("n", "<C-i>", "la", { desc = "Append at the end of the line" })

keymap.set("n", "<C-z>", "u", { desc = "Remap control-Z to undo" })
keymap.set("n", "u", "gk", { desc = "Move Up" }) -- Move Up
-- keymap.set("n", "u", "gk", { desc = "Move Up" }) -- Move Up

keymap.set("n", "e", "gj", { desc = "Move Down" }) -- Move Down
-- keymap.set("n", "e", "gj", { desc = "Move Down" }) -- Move Down

keymap.set("n", "n", "h", { desc = "Move Left" }) -- Move Left
keymap.set("n", "i", "l", { desc = "Move Right" }) -- Move Right

-- ensure above changes don't affect visual mode
keymap.set("n", "ci", "ci")
keymap.set("n", "di", "di")
keymap.set("n", "vi", "vi")
keymap.set("n", "yi", "yi")

-- remap "delete up, down, left, right" and "yank up, down, left, right"
keymap.set("n", "yu", "yk")
keymap.set("n", "ye", "yj")
keymap.set("n", "du", "dk")
keymap.set("n", "de", "dj")
keymap.set("n", "cu", "ck")
keymap.set("n", "ce", "cj")

-- keymap.set("n", "B", "b", { desc = "Jump Left" }) -- Jump Left

-- remap <Tab> to four spaces
--keymap.set("i", "<Tab>", "    ", { desc = "Remap <Tab> to four spaces" })

-- remap <Esc> to two spaces

-- keymap.set("n", "F", "e", { desc = "Jump Right" }) -- Jump Right

-- Replaces (m)ark
keymap.set("n", "<C-m>", "m", { desc = "Replaces (m)ark" })

-- Exit insert mode with jk
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

keymap.set("v", "n", "h", { desc = "Move Left in visual mode" }) -- Move Left in visual mode

keymap.set("v", "e", "gj", { desc = "Move Down in visual mode" }) -- Move Down in visual mode

keymap.set("v", "u", "gk", { desc = "Move Up in visual mode" }) -- Move Up in visual mode

keymap.set("v", "i", "l", { desc = "Move Right in visual mode" }) -- Move Right in visual mode

-- End of word in visual mode, replaces (e)nd
-- keymap.set("v", "E", "e", { desc = "End of word in visual mode" })

-- Use ; instead of :
-- keymap.set("n", ";", ":", { desc = "Use ; instead of :" })
