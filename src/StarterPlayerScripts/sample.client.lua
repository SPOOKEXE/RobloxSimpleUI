
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SimpleUI = require( ReplicatedStorage:WaitForChild('SimpleUI') )

local Elements = SimpleUI.Components.Menu(
	SimpleUI.Components.Dropdown( ),
	SimpleUI.Components.Dropdown( ),
	SimpleUI.Components.Dropdown( )
)

local ScreenGui = SimpleUI.Construct( Elements )
ScreenGui.Parent = LocalPlayer.PlayerGui
