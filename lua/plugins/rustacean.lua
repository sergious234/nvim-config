-- This file configures rustaceanvim, a comprehensive Rust LSP integration.
-- Provides rust-analyzer support with enhanced features beyond standard LSP.
-- Additional configuration is in options.lua.
return {
	-- Config is in options.lua
	{
		'mrcjkb/rustaceanvim',
		version = '^9', -- 
		lazy = false, -- This plugin is already lazy
	},
}
