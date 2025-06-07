local wk = require("which-key")
wk.setup({
	preset = "helix",
	plugins = {
		presets = {
			motions = true,
			operators = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		}
	}
})
wk.add({
--	{ "<leader>c", desc = "bebebe" },
})
