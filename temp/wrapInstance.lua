local wrappercache = setmetatable({}, {__mode = "k"})

local function unwrap(wrapped)
	if type(wrapped) == "table" then
		local real = {}
		for k,v in next,wrapped do
			real[k] = unwrap(v)
		end
		return real
	else
		local real = wrappercache[wrapped]
		if real == nil then
			return wrapped
		end
		return real
	end
end

local function wrap(real)
	for w,r in next,wrappercache do
		if r == real then
			return w
		end
	end
	if type(real) == "userdata" then
		local fake = newproxy(true)
		local meta = getmetatable(fake)
		meta.__index = function(s,k)
			if k == "TellMeAJoke" then
				return function(self)
					print(self.Name .. " here, to tell you a joke:")
					print("Q: What do you call a fly with no wings?")
					print("A: A walk.")
				end
			end
			return wrap(real[k])
		end
		meta.__newindex = function(s,k,v)
			real[k] = v
		end
		meta.__tostring = function(s)
			return tostring(real)
		end
		wrappercache[fake] = real
		return fake
	elseif type(real) == "function" then
		local fake = function(...)
			local args = unwrap({...})
			local results = wrap({real(unpack(args))})
			return unpack(results)
		end
		wrappercache[fake] = real
		return fake
	elseif type(real) == "table" then
		local fake = {}
		for k,v in ipairs(real) do
			fake[k] = wrap(v)
		end
		return fake
	else
		return real
	end
end

-- Example --
local Baseplate = wrap(game.Workspace.Baseplate)

print(Baseplate, Baseplate.Name, Baseplate.ClassName)
Baseplate.Anchored = false

Baseplate:TellMeAJoke()

Baseplate = Baseplate.Parent.Baseplate
Baseplate:TellMeAJoke()

Baseplate = Baseplate.Parent:FindFirstChild("Baseplate")
Baseplate:TellMeAJoke()

local NewBaseplate = -Baseplate
NewBaseplate.Parent = game.Workspace
NewBaseplate.Name = "Otherplate"
NewBaseplate:TellMeAJoke()

NewBaseplate.Anchored = true
NewBaseplate.Size = Vector3.new(50,50,50)

Baseplate:Destroy()
