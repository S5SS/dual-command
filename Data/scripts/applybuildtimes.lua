-- Add the build times to each build option
doscanpath("data:scripts", "buildtimes.lua")
doscanpath("data:scripts", "localization.lua")
for i,e in build do
	if e.DisplayedName and e.ThingToBuild then
		loc = localization[e.DisplayedName]
		buildtime = buildtimes[e.ThingToBuild]
		if loc and buildtime then
			build[i].DisplayedName = loc .. "  <c=888>" .. buildtime .. "s"
		end
	end
end
