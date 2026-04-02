-- This file configures typst-preview.nvim, which provides live preview
-- for Typst documents in a browser. Configured with custom port 25566.
return {
	"chomosuke/typst-preview.nvim",
	version = "1.*",

	opts = {
		-- host = '192.168.100.153',
		port = 25566,
		-- dependencies_bin = {
		-- 	['tinymist'] = 'tinymist'
		-- }
	}
}
