  ---------------------------------------
  -- Advanced Nameplates
  -- Tierney11290 (Stratejacket) - 2017
  ---------------------------------------

ANP = ANP or {}


local FontList = {
	"Adventure",
	"Arialn",
    "Black Chancery",
    "Century Gothic",
	"Consolas",
	"ESO Cartographer",
	"Fitzgerald",
	"Futura Condensed",
	"Futura Condensed Medium",
	"Gentium",
	"Hooked Up",
    "Magic Cards Normal",
	"ProseAntique",
	"Skurri",
	"Skyrim Handwritten",
	"Trajan Pro",
	"Univers 55",
	"Univers 57",
	"Univers 67",
}

local StyleList = {
    "none",
    "outline",
    "thin-outline",
    "thick-outline",
    "shadow",
    "soft-shadow-thin",
    "soft-shadow-thick",
}

local ANPpanel = {
	    type = "panel",
	    name = "Advanced Nameplates",
	    displayName = ZO_HIGHLIGHT_TEXT:Colorize("Advanced Nameplates"),
	    author = "Tierney11290 (Stratejacket), |c66ccffErian Kalil|r",
	    version = "1.3",
	    slashCommand = "/anp",
		registerForRefresh = true,
        registerForDefaults = true,
}

local LAM2 = LibStub:GetLibrary("LibAddonMenu-2.0")
	if ( not LAM2 ) then return end

local ANPoptions = { 
	[1] = {
	    type = "header",
		name = "Keyboard Nameplates",
		registerForRefresh = true,
        registerForDefaults = true,
	},
	[2] = {
		type = "dropdown",
		name = "Font",
		tooltip = "Changes the look of the text in Keyboard Mode.",
		choices = FontList,
		default = "Univers 57",
		getFunc = function() return ANP.SV.FontsKB end,
		setFunc = function(val) 
			ANP.SV.FontsKB = val 
			ANP.Fonts(val)
		end,
	},
	[3] = {
		type = "dropdown",
		name = "Style",
		tooltip = "This does not work yet. Changes the style of the text in Keyboard Mode.",
		choices = StyleList,
		getFunc = function() return ANP.SV.StylesKB end,
		setFunc = function(val) ANP.SV.StylesKB = val end,
	},
	[4] = {
	 	type = "slider",
		name = "Size",
		tooltip = "This does not work yet. Move the slider to change the text size",
		min = 1,
		max = 100,
		step = 1,
		getFunc = function() return ANP.SV.SizeKB end,
		setFunc = function(val) 
			ANP.SV.SizeKB = val
            ANP.SizeKB(val)
        end,
	},	
	[5] = {
	    type = "header",
		name = "Gamepad Nameplates",
		registerForRefresh = true,
        registerForDefaults = true,
	},
	[6] = {
		type = "dropdown",
		name = "Font",
		tooltip = "Changes the look of the text in Gamepad Mode.",
		choices = FontList,
		defaults = "Futura Condensed",
		getFunc = function() return ANP.SV.FontsGP end,
		setFunc = function(val) ANP.SV.FontsGP = val 
		  ANP.Fonts(val)
		end,
	},
	[7] = {
		type = "dropdown",
		name = "Style",
		tooltip = "This does not work yet. Changes the style of the text in Gamepad Mode.",
		choices = StyleList,
		getFunc = function() return ANP.SV.StylesGP end,
		setFunc = function(val) ANP.SV.StylesGP = val end,
	},
	[8] = {
	 	type = "slider",
		name = "Size",
		tooltip = "This does not work yet. Move the slider to change the text size",
		min = 1,
		max = 100,
		step = 1,
		getFunc = function() return ANP.SV.SizeKB end,
		setFunc = function(val) 
			ANP.SV.SizeGP = val
            ANP.SizeGP(val)
        end,
	},
}

function ANP:initLAM2()
	LAM2:RegisterAddonPanel(ANP.appName, ANPpanel)
	LAM2:RegisterOptionControls(ANP.appName, ANPoptions)
end