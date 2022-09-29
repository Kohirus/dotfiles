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
	-- 是否开启图标
	--  如果设置为'numbers',将只显示 buffer 序号
	--  如果设置为'both',buffer 序号和图标都将显示
	icons = true,
	-- 如果设置, 图标颜色将跟随相应的 buffer 高亮组
	-- 否则, 将使用 devicons 所定义的的默认值
	icon_custom_color = false,
	-- 配置 bufferline 图标
	icon_separator_active = "▎",
	icon_separator_inactive = "│",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "📌", --"車",
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
})
