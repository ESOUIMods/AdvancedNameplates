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
  "Crimson Regular",
  "ESO Cartographer",
  "Fitzgerald",
  "Futura Std Con",
  "Futura Std Con Bold",
  "Futura Std Con Lt",
  "Gentium",
  "Magic Cards Normal",
  "Patrick Hand SC",
  "Permanent Marker",
  "Prose Antique",
  "Skurri",
  "Skyrim Handwritten",
  "Trajan Pro",
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
  website = "https://www.esoui.com/downloads/info2558-AdvancedNameplatesFlamesofAmbition.html",
  version = "2.30",
  slashCommand = "/anp",
  registerForRefresh = true,
  registerForDefaults = true,
}

local ANPLocalization = {
  ["en"] = {
    fontSizeHeader = "Font Size",
    keyboardHeader = "Keyboard Nameplates",
    gamepadHeader = "Gamepad Nameplates",
    fontName = "Font",
    fontKeyboardTip = "Changes the look of the text in Keyboard Mode.",
    fontGamepadTip = "Changes the look of the text in Gamepad Mode.",
  },
  ["es"] = {
    fontSizeHeader = "Font Size",
    keyboardHeader = "Nombres flotantes (teclado)",
    gamepadHeader = "Nombres flotantes (mando)",
    fontName = "Fuente",
    fontKeyboardTip = "Cambia la apariencia del texto en el modo teclado.",
    fontGamepadTip = "Cambia la apariencia del texto en el modo mando.",
  },
}

local LAM2 = LibAddonMenu2

local ANPoptions = {}
ANPoptions[#ANPoptions + 1] = {
  type = "header",
  name = ANPLocalization[ANP.effective_lang].fontSizeHeader,
}
ANPoptions[#ANPoptions + 1] = {
  type = "slider",
  name = "Size",
  tooltip = "Move the slider to change the text size",
  min = 20,
  max = 48,
  step = 1,
  getFunc = function() return ANP.SV.SizeKB end,
  setFunc = function(val)
    ANP.SV.SizeKB = val
    ANP.SetFont()
  end,
}

ANPoptions[#ANPoptions + 1] = {
  type = "dropdown",
  name = "Style",
  tooltip = "This does not work yet. Changes the style of the text in Keyboard Mode.",
  choices = ANP.fontStyleChoices,
  choicesValues = ANP.fontStyleValues,
  getFunc = function() return ANP.SV.StylesKB end,
  setFunc = function(val)
    ANP.SV.StylesKB = val
    ANP.SetFont()
  end,
}

ANPoptions[#ANPoptions + 1] = {
  type = "header",
  name = ANPLocalization[ANP.effective_lang].keyboardHeader,
}
ANPoptions[#ANPoptions + 1] = {
  type = "dropdown",
  name = ANPLocalization[ANP.effective_lang].fontName,
  tooltip = ANPLocalization[ANP.effective_lang].fontKeyboardTip,
  choices = FontList,
  default = "Univers 57",
  getFunc = function() return ANP.SV.FontsKB end,
  setFunc = function(val)
    ANP.SV.FontsKB = val
    ANP:SetKeyboardFont(ANP.SV.FontsKB)
  end,
}
ANPoptions[#ANPoptions + 1] = {
  type = "header",
  name = ANPLocalization[ANP.effective_lang].gamepadHeader,
}
ANPoptions[#ANPoptions + 1] = {
  type = "dropdown",
  name = ANPLocalization[ANP.effective_lang].fontName,
  tooltip = ANPLocalization[ANP.effective_lang].fontGamepadTip,
  choices = FontList,
  defaults = "Futura Condensed",
  getFunc = function() return ANP.SV.FontsGP end,
  setFunc = function(val)
    ANP.SV.FontsGP = val
    ANP:SetGamepadFont(ANP.SV.FontsGP)
  end,
}

function ANP:initLAM2()
  LAM2:RegisterAddonPanel(ANP.appName, ANPpanel)
  LAM2:RegisterOptionControls(ANP.appName, ANPoptions)
end
