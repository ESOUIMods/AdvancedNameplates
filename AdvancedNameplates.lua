---------------------------------------
-- Advanced Nameplates
-- Tierney11290 (Stratejacket) - 2017
---------------------------------------

ANP = ANP or {}
-------------------------------------------------
----- early helper                          -----
-------------------------------------------------

local function is_in(search_value, search_table)
  for k, v in pairs(search_table) do
    if search_value == v then return true end
    if type(search_value) == "string" then
      if string.find(string.lower(v), string.lower(search_value)) then return true end
    end
  end
  return false
end

-------------------------------------------------
----- lang setup                            -----
-------------------------------------------------

ANP.client_lang = GetCVar("Language.2")
ANP.effective_lang = nil
ANP.supported_lang = { "en", "es", }
if is_in(ANP.client_lang, ANP.supported_lang) then
  ANP.effective_lang = ANP.client_lang
else
  ANP.effective_lang = "en"
end
ANP.supported_lang = ANP.client_lang == ANP.effective_lang

-------------------------------------------------
----- mod                                   -----
-------------------------------------------------

ANP.appName = "AdvancedNameplates"
ANP.fontStyleChoices = {}
ANP.fontStyleValues = {}
local LMP = LibMediaProvider

function ANP.SetFont()
  if not IsInGamepadPreferredMode() then
    ANP:SetKeyboardFont(ANP.SV.FontsKB)
  elseif IsInGamepadPreferredMode() then
    ANP:SetGamepadFont(ANP.SV.FontsGP)
  end
end

function ANP:SetKeyboardFont(fontName)
  local fontFilename = LMP:Fetch("font", fontName)
  local fontString = string.format("%s|%d", fontFilename, ANP.SV.SizeKB)
  SetNameplateKeyboardFont(fontString, ANP.SV.StylesKB - 1)
end

function ANP:SetGamepadFont(fontName)
  local fontFilename = LMP:Fetch("font", fontName)
  local fontString = string.format("%s|%d", fontFilename, ANP.SV.SizeKB)
  SetNameplateGamepadFont(fontString, ANP.SV.StylesKB - 1)
end

local ANP_FONT_STYLE_NORMAL = 1
local ANP_FONT_STYLE_OUTLINE = 2
local ANP_FONT_STYLE_OUTLINE_THICK = 3
local ANP_FONT_STYLE_SHADOW = 4
local ANP_FONT_STYLE_SOFT_SHADOW_THICK = 5
local ANP_FONT_STYLE_SOFT_SHADOW_THIN = 6

local StyleList = {
  [ANP_FONT_STYLE_NORMAL] = "Normal",
  [ANP_FONT_STYLE_OUTLINE] = "Outline",
  [ANP_FONT_STYLE_OUTLINE_THICK] = "Thin-Outline",
  [ANP_FONT_STYLE_SHADOW] = "Shadow",
  [ANP_FONT_STYLE_SOFT_SHADOW_THICK] = "Soft-Shadow-Thick",
  [ANP_FONT_STYLE_SOFT_SHADOW_THIN] = "Soft-Shadow-Thin",
}

function ANP:CreateFontStyleChoices()
  for styleConstant, styleString in pairs(StyleList) do
    ANP.fontStyleChoices[styleConstant] = styleString
    ANP.fontStyleValues[styleConstant] = styleConstant
  end
end

function OnAddOnLoaded(eventCode, addOnName)
  if (ANP.appName ~= addOnName) then return end

  LMP:Register("font", "Adventure", "$(AN_ADVENTURE_FONT)")
  LMP:Register("font", "Arial Narrow", "$(AN_ARIAL_NARROW_FONT)")
  LMP:Register("font", "Black Chancery", "$(AN_BLACK_CHANCERY_FONT)")
  LMP:Register("font", "Century Gothic", "$(AN_CENTURY_GOTHIC_FONT)")
  LMP:Register("font", "Crimson Regular", "$(AN_CRIMSON_REGULAR_FONT)")
  LMP:Register("font", "ESO Cartographer", "$(AN_ESO_CARTOGRAPHER_FONT)")
  LMP:Register("font", "Fitzgerald", "$(AN_FITZGERALD_FONT)")
  LMP:Register("font", "Futura Std Con", "$(AN_FUTURA_STD_CON_FONT)")
  LMP:Register("font", "Futura Std Con Bold", "$(AN_FUTURA_STD_CON_BOLD_FONT)")
  LMP:Register("font", "Futura Std Con Lt", "$(AN_FUTURA_STD_CON_LT_FONT)")
  LMP:Register("font", "Gentium", "$(AN_GENTIUM_FONT)")
  LMP:Register("font", "All Hooked Up", "$(AN_ALL_HOOKED_UP_FONT)")
  LMP:Register("font", "Magic Cards Normal", "$(AN_MAGIC_CARDS_NORMAL_FONT)")
  LMP:Register("font", "Patrick Hand SC", "$(AN_PATRICK_HAND_SC_FONT)")
  LMP:Register("font", "Permanent Marker", "$(AN_PERMANENT_MARKER_FONT)")
  LMP:Register("font", "Skurri", "$(AN_SKURRI_FONT)")

  local defaults = {
    FontsKB = "Univers Lt Std Con (Default)",
    FontsGP = "Futura Std Con",
    StylesKB = ANP_FONT_STYLE_NORMAL - 1,
    SizeKB = 20,
  }

  ANP.SV = ZO_SavedVars:NewAccountWide("AdvancedNameplates_SavedVariables", 1, nil, defaults)

  ANP:CreateFontStyleChoices()

  if type(ANP.SV.StylesKB) ~= 'number' then ANP.SV.StylesKB = ANP_FONT_STYLE_NORMAL end

  if not IsInGamepadPreferredMode() then
    ANP:SetKeyboardFont(ANP.SV.FontsKB)
  elseif IsInGamepadPreferredMode() then
    ANP:SetGamepadFont(ANP.SV.FontsGP)
  end

  ANP:initLAM2()

end
EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_PLAYER_ACTIVATED, ANP.SetFont)
