
--[[
	I for int
	L for long
	S for String
	
	other types are skipped.
]]
local config = {
	name = 'Test',
	{'I', 'a', 1},
	{'S', 'b', "Hello World!"},
	{'L', 'c', 1234},
	{'B', 'd', false}
}

-- you must return a table like config,
-- have a field 'name' for you class name
return config