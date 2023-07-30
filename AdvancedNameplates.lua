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
local LMP = LibMediaProvider

function ANP.SetFont()

  -- If using Keyboard & Mouse mode then do the following
  if IsInGamepadPreferredMode() == false then

    -- Keyboard Font Calls for LAM --
    if ANP.SV.FontsKB == "Adventure" then
      ANP.FontAdventureKB()
    elseif ANP.SV.FontsKB == "Arial Narrow" then
      ANP.FontArialnNarrowKB()
    elseif ANP.SV.FontsKB == "Black Chancery" then
      ANP.BlackChanceryKB()
    elseif ANP.SV.FontsKB == "Century Gothic" then
      ANP.CenturyGothicKB()
    elseif ANP.SV.FontsKB == "Consolas" then
      ANP.FontConsolasKB()
    elseif ANP.SV.FontsKB == "Crimson Regular" then
      ANP.FontCrimsonRegularKB()
    elseif ANP.SV.FontsKB == "ESO Cartographer" then
      ANP.FontCartographerKB()
    elseif ANP.SV.FontsKB == "Fitzgerald" then
      ANP.FontFitzgeraldKB()
    elseif ANP.SV.FontsKB == "Futura Con Book" then
      ANP.FontFuturaCondensedBookKB()
    elseif ANP.SV.FontsKB == "Futura Con Med" then
      ANP.FontFuturaCondensedMedKB()
    elseif ANP.SV.FontsKB == "Futura Con Bold" then
      ANP.FontFuturaCondensedBoldKB()
    elseif ANP.SV.FontsKB == "Futura Std Con" then
      ANP.FontFuturaStandardCondensedKB()
    elseif ANP.SV.FontsKB == "Futura Std Con Bold" then
      ANP.FontFuturaStandardCondensedBoldKB()
    elseif ANP.SV.FontsKB == "Futura Std Con Lt" then
      ANP.FontFuturaStandardCondensedLightKB()
    elseif ANP.SV.FontsKB == "Gentium" then
      ANP.FontGentiumKB()
    elseif ANP.SV.FontsKB == "All Hooked Up" then
      ANP.FontHookedUpKB()
    elseif ANP.SV.FontsKB == "Magic Cards Normal" then
      ANP.MagicCardsNormalKB()
    elseif ANP.SV.FontsKB == "Prose Antique" then
      ANP.FontProseAntiqueKB()
    elseif ANP.SV.FontsKB == "Skurri" then
      ANP.FontSkurriKB()
    elseif ANP.SV.FontsKB == "Skyrim Handwritten" then
      ANP.FontHandwrittenKB()
    elseif ANP.SV.FontsKB == "Trajan Pro" then
      ANP.FontTrajanProKB()
    elseif ANP.SV.FontsKB == "Univers LT Std 55" then
      ANP.FontUnivers55KB()
    elseif ANP.SV.FontsKB == "Univers LT Std 57 Cn" then
      ANP.FontUnivers57KB()
    elseif ANP.SV.FontsKB == "Univers Lt Std Con (Default)" then
      ANP.FontUnivers67KB()
    elseif ANP.SV.FontsKB == "Patrick Hand SC" then
      ANP.FontPatrickHandSCKB()
    else
      ANP.SV.FontsKB = "Permanent Marker"
      ANP.FontPermanentMarkerKB()
    end

    -- If using Gamepad mode then do the following
  elseif IsInGamepadPreferredMode() == true then

    -- Gamepad Font Calls for LAM --
    if ANP.SV.FontsGP == "Adventure" then
      ANP.FontAdventureGP()
    elseif ANP.SV.FontsGP == "Arial Narrow" then
      ANP.FontArialnNarrowGP()
    elseif ANP.SV.FontsGP == "Black Chancery" then
      ANP.BlackChanceryGP()
    elseif ANP.SV.FontsGP == "Century Gothic" then
      ANP.CenturyGothicGP()
    elseif ANP.SV.FontsGP == "Consolas" then
      ANP.FontConsolasGP()
    elseif ANP.SV.FontsGP == "Crimson Regular" then
      ANP.FontCrimsonRegularGP()
    elseif ANP.SV.FontsGP == "ESO Cartographer" then
      ANP.FontCartographerGP()
    elseif ANP.SV.FontsGP == "Fitzgerald" then
      ANP.FontFitzgeraldGP()
    elseif ANP.SV.FontsGP == "Futura Con Book" then
      ANP.FontFuturaCondensedBookGP()
    elseif ANP.SV.FontsGP == "Futura Con Med" then
      ANP.FontFuturaCondensedMedGP()
    elseif ANP.SV.FontsGP == "Futura Con Bold" then
      ANP.FontFuturaCondensedBoldGP()
    elseif ANP.SV.FontsGP == "Futura Std Con" then
      ANP.FontFuturaStandardCondensedGP()
    elseif ANP.SV.FontsGP == "Futura Std Con Bold" then
      ANP.FontFuturaStandardCondensedBoldGP()
    elseif ANP.SV.FontsGP == "Futura Std Con Lt" then
      ANP.FontFuturaStandardCondensedLightGP()
    elseif ANP.SV.FontsGP == "Gentium" then
      ANP.FontGentiumGP()
    elseif ANP.SV.FontsGP == "All Hooked Up" then
      ANP.FontHookedUpGP()
    elseif ANP.SV.FontsGP == "Magic Cards Normal" then
      ANP.MagicCardsNormalGP()
    elseif ANP.SV.FontsGP == "Prose Antique" then
      ANP.FontProseAntiqueGP()
    elseif ANP.SV.FontsGP == "Skurri" then
      ANP.FontSkurriGP()
    elseif ANP.SV.FontsGP == "Skyrim Handwritten" then
      ANP.FontHandwrittenGP()
    elseif ANP.SV.FontsGP == "Trajan Pro" then
      ANP.FontTrajanProGP()
    elseif ANP.SV.FontsGP == "Univers LT Std 55" then
      ANP.FontUnivers55GP()
    elseif ANP.SV.FontsGP == "Univers LT Std 57 Cn" then
      ANP.FontUnivers57GP()
    elseif ANP.SV.FontsGP == "Univers Lt Std Con (Default)" then
      ANP.FontUnivers67GP()
    elseif ANP.SV.FontsGP == "Patrick Hand SC" then
      ANP.FontPatrickHandSCGP()
    else
      ANP.SV.FontsGP = "Permanent Marker"
      ANP.FontPermanentMarkerGP()
    end
  end
end

function ANP:SetFontKB(fontName)
  local fontString = string.format("%s|%d", fontName, ANP.SV.SizeKB)
  SetNameplateKeyboardFont(fontString, 1)
end

function ANP:SetFontGP(fontString, fontSize)
  local fontString = string.format("%s|%d", fontName, ANP.SV.SizeKB)
  SetNameplateGamepadFont(fontString, 1)
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
    SizeKB = 20,
  }

  ANP.SV = ZO_SavedVars:NewAccountWide("AdvancedNameplates_SavedVariables", 1, nil, defaults)

  ANP.SetFont()

  ANP:initLAM2()

end
EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_PLAYER_ACTIVATED, ANP.SetFont)
