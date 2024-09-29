local BCT = LibStub("AceAddon-3.0"):GetAddon("BCT")
local category, layout


function BCT:DoesProfileExist(name)
	for k,v in pairs(BCT.db:GetProfiles()) do
		if name == v then return true end
	end
	return false
end

function BCT:ChangeProfile(name)
	if BCT:DoesProfileExist(name) then
		BCT.db:SetProfile(name)
		print("BCT: Profile changed to: " .. name)
	else
		print("BCT: Requested profile does not exist.")
	end
end

SLASH_BCTSC1 = "/BCT"
function SlashCmdList.BCTSC(msg)
	local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
	
	if cmd == "test" then
		for i=1,4 do
			for k, v in pairs(BCT.session.db.auras[i]) do
				if v[6] == nil then print(k) end
			end
		end
		return
	end
	if cmd == "profile" then
		BCT:ChangeProfile(args)
		return
	end
	category, layout = Settings.RegisterCanvasLayoutCategory(BCT.optionsFrames.BCT, BCT.optionsFrames.BCT.name, BCT.optionsFrames.BCT.name);
	category.ID = BCT.optionsFrames.BCT.name
	Settings.RegisterAddOnCategory(category);
	Settings.OpenToCategory(category.ID)

	-- category2, layout2 = Settings.RegisterCanvasLayoutCategory(BCT.optionsFrames.Setup, BCT.optionsFrames.Setup.name, BCT.optionsFrames.Setup.name);
	-- category2.ID = BCT.optionsFrames.Setup.name
	-- Settings.RegisterAddOnCategory(category2)
	-- Settings.OpenToCategory(category2.ID)

	
	-- InterfaceOptionsFrame_OpenToCategory(BCT.optionsFrames.BCT)
	-- InterfaceOptionsFrame_OpenToCategory(BCT.optionsFrames.Setup)
end