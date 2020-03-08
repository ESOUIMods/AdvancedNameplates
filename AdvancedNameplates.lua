  ---------------------------------------
  -- Advanced Nameplates
  -- Tierney11290 (Stratejacket) - 2017
  ---------------------------------------
  
ANP = ANP or {}
ANP.appName = "AdvancedNameplates"
local LMP = LibStub:GetLibrary("LibMediaProvider-1.0")

function ANP.Fonts()

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
	elseif ANP.SV.FontsKB == "Fwntlgudc 70 DB" then
		ANP.fwntlgudc70_dbKB()
	elseif ANP.SV.FontsKB == "Fwudc 70 Med" then
		ANP.fwudc_70_mKB()
	elseif ANP.SV.FontsKB == "Kafupenji Med" then
		ANP.kafupenji_mKB()
	elseif ANP.SV.FontsKB == "ESO Cartographer" then
		ANP.FontCartographerKB()
	elseif ANP.SV.FontsKB == "Fitzgerald" then
		ANP.FontFitzgeraldKB()
	elseif ANP.SV.FontsKB == "Futura" then
		ANP.FontFuturaKB()
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
	else ANP.SV.FontsKB = "Univers LT Std 47 Cn Lt"
		ANP.FontUnivers67KB()
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
	elseif ANP.SV.FontsGP == "Fwntlgudc 70 DB" then
		ANP.fwntlgudc70_dbGP()
	elseif ANP.SV.FontsGP == "Fwudc 70 Med" then
		ANP.fwudc_70_mGP()
	elseif ANP.SV.FontsGP == "Kafupenji Med" then
		ANP.kafupenji_mGP()
	elseif ANP.SV.FontsGP == "ESO Cartographer" then
		ANP.FontCartographerGP()
	elseif ANP.SV.FontsGP == "Fitzgerald" then
		ANP.FontFitzgeraldGP()
	elseif ANP.SV.FontsGP == "Futura" then
		ANP.FontFuturaGP()
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
	else ANP.SV.FontsGP = "Univers LT Std 47 Cn Lt"
		ANP.FontUnivers67GP()
	end
  end
end

function ANP.SizeKB()
	-- No current function available for Nameplate sizes
end

function OnAddOnLoaded(eventCode, addOnName)
    if (ANP.appName ~= addOnName) then return end
	
    LMP:Register("font", "Adventure",               [[AdvancedNameplates/fonts/Adventure.ttf]]              )
    LMP:Register("font", "Arialn",         			[[AdvancedNameplates/fonts/arialn.ttf]]                 )
    LMP:Register("font", "Black Chancery",  		[[AdvancedNameplates/fonts/BlackChancery.ttf]]          )
    LMP:Register("font", "Century Gothic",  		[[AdvancedNameplates/fonts/CenturyGothic.ttf]]          )
    LMP:Register("font", "ESO Cartographer",  		[[AdvancedNameplates/fonts/esocartographer-bold.otf]]   )
    LMP:Register("font", "Fitzgerald",      		[[AdvancedNameplates/fonts/Fitzgerald.ttf]]             )
    LMP:Register("font", "Futura Condensed Medium", [[AdvancedNameplates/fonts/fcm.ttf]]                    )
    LMP:Register("font", "Gentium",         		[[AdvancedNameplates/fonts/Gentium.ttf]]                )
    LMP:Register("font", "HookedUp",             	[[AdvancedNameplates/fonts/HookedUp.ttf]]               )
    LMP:Register("font", "Magic Cards Normal",      [[AdvancedNameplates/fonts/MagicCardsNormal.ttf]]       )
    LMP:Register("font", "Skurri",                  [[AdvancedNameplates/fonts/Skurri.ttf]]                 )
	
	local defaults = {
		FontsKB = "Univers 67",
		FontsGP = "Futura Condensed",
	}
	
	ANP.SV = ZO_SavedVars:NewAccountWide("AdvancedNameplates_SavedVariables", 1, nil, defaults)
	
 -- ANP.SizeKB()
	ANP.Fonts()
	
    ANP:initLAM2()
	
end

EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(ANP.appName, EVENT_PLAYER_ACTIVATED, ANP.Fonts)