-- This file configures rustaceanvim, a comprehensive Rust LSP integration.
-- Provides rust-analyzer support with enhanced features beyond standard LSP.
-- Additional configuration is in options.lua.
return {
	-- Config is in options.lua
	{
		'mrcjkb/rustaceanvim',
		version = '^7', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
