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
	"ESO Cartographer",
	"Fitzgerald",
    "Fwntlgudc 70 DB",
    "Fwudc 70 Med",
    "Kafupenji Med",
	"Futura",
	"Futura Con Book",
	"Futura Con Med",
	"Futura Con Bold",
	"Futura Std Con",
	"Futura Std Con Bold",
	"Futura Std Con Lt",
	"Gentium",
    "Magic Cards Normal",
	"Prose Antique",
	"Skurri",
	"Skyrim Handwritten",
	"Trajan Pro",
	"Univers LT Std 55",
	"Univers LT Std 57 Cn",
	"Univers LT Std 47 Cn Lt",
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