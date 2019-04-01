-- Add the research times to each research option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeInfoSetting() == 3 or GetProductionTimeInfoSetting() == 4 then
	doscanpath("data:scripts", "localization.lua")
	for i,e in research do
		locLong = localization[e.DisplayedName]
		if locLong then
			research[i].DisplayedName = locLong .. "  <c=888>" .. e.Time .. "s"
		end
		
		if e.ShortDisplayedName then
			locShort = localization[e.ShortDisplayedName]
			if locShort then
				research[i].ShortDisplayedName = locShort .. "  <c=888>" .. e.Time .. "s"
			end
		end
	end
end
