  ---------------------------------------
  -- Advanced Nameplates
  -- Tierney11290 (Stratejacket) - 2017
  ---------------------------------------

ANP = ANP or {}

local FontList = {
	"Adventure",
	"All Hooked Up",
	"Arial Narrow",
	"Black Chancery",
	"Century Gothic",
	"Consolas",
	"Crimson Text",
	"ESO Cartographer",
	"Fitzgerald",
	"Fwntlgudc 70 DB",
	"Fwudc 70 Med",
	"Futura Std Con",
	"Futura Std Con Bold",
	"Futura Std Con Lt",
	"Gentium",
	"Kafupenji Med",
	"Magic Cards Normal",
	"Patrick Hand SC",
	"Permanent Marker",
	"Prose Antique",
	"Skurri",
	"Skyrim Handwritten",
	"Univers LT Std 55",
	"Univers LT Std 57 Cn",
	"Univers Lt Std Con (Default)"
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
	    author = "|cff9b15Sharlikran|r, Tierney11290 (Stratejacket), |c66ccffErian Kalil|r",
	    version = "2.0",
	    slashCommand = "/anp",
		registerForRefresh = true,
        registerForDefaults = true,
}

local LAM2 = LibAddonMenu2

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
	    type = "header",
	    name = "Gamepad Nameplates",
	    registerForRefresh = true,
	    registerForDefaults = true,
	},
	[4] = {
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
}

function ANP:initLAM2()
	LAM2:RegisterAddonPanel(ANP.appName, ANPpanel)
	LAM2:RegisterOptionControls(ANP.appName, ANPoptions)
end
