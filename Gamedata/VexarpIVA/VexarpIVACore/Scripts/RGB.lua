x = 0
y = false
fc.SetPersistent("VEX_RGB_RED", 255 )
fc.SetPersistent("VEX_RGB_GREEN", 255)
fc.SetPersistent("VEX_RGB_BLUE", 255)

function onTick()

	if fc.GetPersistentAsNumber("VEX_RGB_ENABLE") == 0 then
		if fc.GetPersistentAsNumber("MAS_VEXARP_RGBComp_On") == 1 then
			local dummyy = 0
		else
			fc.SetPersistent("VEX_RGB_RED", 255 )
			fc.SetPersistent("VEX_RGB_GREEN", 255)
			fc.SetPersistent("VEX_RGB_BLUE", 255)
		end
	end
	
	if x > 5.99 then
		x = -0.3
	end
    
	if x < 0.01 then
		y = false
	end
    
	if y == true then
		x = x - 0.03 --this shouldn't be used
		else
		x = x + 0.03 --change this value to change speed of the RGB       
	end

	if fc.GetPersistentAsNumber("VEX_RGB_ENABLE") == 1 then
		fc.SetPersistent("VEX_RGB_RED", math.sin(x) * 255 )
		fc.SetPersistent("VEX_RGB_GREEN", math.sin(x + 2) * 255)
		fc.SetPersistent("VEX_RGB_BLUE", math.sin(x + -2) * 255)
	end
end

-- Extra french thanks to MOARdV and Sim fro helping me with this lua code