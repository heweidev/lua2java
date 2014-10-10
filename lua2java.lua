--[[
a single lua script convert lua table to a java file
]]
local BEGIN_FORMAT = [[
public class %s {
]]

local STRING_FORMAT = [[
	public static final String %s = "%s";
]]

local INT_FORMAT = [[
	public static final int %s = %s;
]]

local LONG_FORMAT = [[
	public static final long %s = %s;
]]

local BOOL_FORMAT = [[
	public static final boolean %s = %s;
]]

local arg = {...}
for i, v in pairs(arg) do
	print(i, v)
end

local ret = dofile(arg[1])
assert(ret.name, 'java class name not spec!')
local fileName = ret.name .. '.java'
local file, err = io.open(fileName, 'w+')
assert(file, 'open file', fileName, 'error', err)

file:write(string.format(BEGIN_FORMAT, ret.name))

for i, v in ipairs(ret) do
	local mode = v[1]
	local format_ = nil

	if mode == 'S' then
		format_ = STRING_FORMAT
	elseif mode == 'I' then
		format_ = INT_FORMAT
	elseif mode == 'L' then
		format_ = LONG_FORMAT
	elseif mode == 'B' then
		format_ = BOOL_FORMAT
	end

	if format_ then
		file:write(string.format(format_, tostring(v[2]), tostring(v[3])))
	else
		print('skip', i)
	end
end

file:write('}')
file:close()



