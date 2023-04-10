-- https://github.com/romgrk/barbar.nvim

local status_ok, barbar = pcall(require, "bufferline")
if not status_ok then
	vim.notify("Not found barbar plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

barbar.setup({
	-- 是否开启动画
	animation = true,
	-- 当只有一个标签时是否自动隐藏
	auto_hide = false,
	-- 是否显示 当前/所有的 标签页指示器
	tabpages = true,
	-- 是否显示关闭按钮
	closable = true,
	-- 是否开启鼠标操作: 左键(跳转) 右键(关闭)
	clickable = true,
	-- 标签页去除的文件类型
	exclude_ft = { "alpha" },
	exclude_name = { "alpha" },
  -- 当关闭当前缓冲区时，如果左侧存在则聚焦左侧缓冲区
  focus_on_close = 'left',
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = false, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = false},
    },
    filetype = {
      custom_colors = false,
      enable = true,
    },
    separator = {left = '▎', right = ''},
    modified = {button = '●'},
    pinned = {button = '📌', filename = true, separator = {right = ''}},
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },
	-- 如果为 true, 新的 buffers 将插入到列表头部/尾部
	-- 默认插入到当前 buffer 的后面
	insert_at_end = false,
	insert_at_start = false,
	-- 设置围绕每个选项卡的最大填充宽度
	maximun_padding = 1,
	-- 设置 buffer 名称的最大长度
	maximum_length = 30,
	-- 如果设置, 在缓冲区选择模式下, 每个缓冲区的字母将根据它们的名称分配。
	-- 否则, 在所有字母都已经分配的情况下, 按照可用性的顺序分配字母
	semantic_letters = true,
	-- 新的缓冲区字母按此顺序分配。这个顺序是最佳的qwerty键盘布局.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	-- 设置未命名 buffers 的名称. 默认情况下格式化为 "[Buffer X]"
	-- 其中 x 表示 buffer 序号. 但是它仅仅是一个静态文本.
	no_name_title = "[No Name]",
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {text = 'undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },
})
