-- Lua scripts for an onboard computer control of RGB
-- This script is public domain.
-- MOARdV is the original author of this script, i just modified the Mechjeb script to control RGB

--All NUMPIMPUT keys

function MAS_VEXARP_RGBComp_NumKey(key, autoId)
	fc.TogglePersistent(autoId)

	if fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_On") > 0 then
		fc.AppendPersistent("MAS_VEXARP_RGBComp_Buffer", key, 6)
	end
end

-- The clear key

-- function MAS_VEXARP_RGBComp_Clear(autoId)
	-- fc.TogglePersistent(autoId)
	
	-- if fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_On") > 0 then
		-- fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", 0)
	-- end
-- end

-- Don't have a "delete last character" function yet.
function MAS_VEXARP_RGBComp_Delete(autoId)
	fc.TogglePersistent(autoId)
	if fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_On") > 0 then
		fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", 0)
	end
end

-- Enter button

function MAS_VEXARP_RGBComp_Enter()

	fc.SetPersistent("MAS_VEXARP_RGBComp_Exec", 1)

	local RGBComp_mode = fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_Mode")

	-- mode 0 = OFF
	-- mode 1 = RED
	-- mode 2 = GREEN
	-- mode 3 = BLUE

	if RGBComp_mode == 0 then
		fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 0)
		return
	end

	if fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_WriteEnable") == 0 then
		-- READ MODE
		if RGBComp_mode == 1 then
			fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", fc.GetPersistentAsNumber("VEX_RGB_RED"))
			fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
		elseif RGBComp_mode == 2 then
			fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", fc.GetPersistentAsNumber("VEX_RGB_GREEN"))
			fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
		elseif RGBComp_mode == 3 then
			fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", fc.GetPersistentAsNumber("VEX_RGB_BLUE"))
			fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
			end
	else
		-- WRITE MODE
		local color = fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_Buffer")
		if RGBComp_mode == 1 then
			if color < 256 then
				fc.SetPersistent("VEX_RGB_RED", fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_Buffer"))
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
				fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", 0 )
			else
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 2)
			end
		elseif RGBComp_mode == 2 then
			if color < 256 then
				fc.SetPersistent("VEX_RGB_GREEN", fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_Buffer"))
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
				fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", 0 )
			else
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 2)
			end
		elseif RGBComp_mode == 3 then
			if color < 256 then
				fc.SetPersistent("VEX_RGB_BLUE", fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_Buffer"))
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 1)
				fc.SetPersistent("MAS_VEXARP_RGBComp_Buffer", 0 )
			else
				fc.SetPersistent("MAS_VEXARP_RGBComp_Status", 2)
			end
		end
	end
end