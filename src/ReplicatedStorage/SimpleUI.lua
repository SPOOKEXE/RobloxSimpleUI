
export type ColorPallete = {
	Background : Color3,
	Primary : Color3,
	Secondary : Color3,
	Text : Color3
}

export type Root = GuiBase & {

}

export type Element = GuiObject & {

}

local function CreateColorPallete( background : Color3, primary : Color3, secondary : Color3, text : Color3 ) : ColorPallete
	return {
		Background = background,
		Primary = primary,
		Secondary = secondary,
		Text = text,
	}
end

-- // Enums // --
local Enums = { }

-- Element Info
Enums.Draggable = { Draggable = 1 }
Enums.Resizable = { FreeResize = 1, LockedRatio = 2, }
-- Component Info
Enums.TextLocations = { OutsideLeft = 1, OutsideRight = 2, InsideLeft = 3, InsideRight = 4, Center = 5, }
Enums.ButtonLocations = { OutsideLeft = 1, OutsideRight = 2, InsideLeft = 3, InsideRight = 4, Center = 5, }
Enums.ButtonTypes = { Square = 1, Diamond = 2, Triangle = 3, Circle = 4, }
Enums.MultiCheckboxMode = { Single = 1, Double = 2, Triple = 3, Free = 4, }
-- Element Themes
Enums.DefaultThemes = { Dark = 1, }
Enums.DefaultColorPalletes = {
	Dark = CreateColorPallete(
		Color3.fromRGB(30, 30, 30),
		Color3.fromRGB(100, 100, 100),
		Color3.fromRGB(61, 61, 61),
		Color3.new(1, 1, 1)
	),
}

-- // Functions // --
local function CreateBaseElement( instance : Instance ) : Element

	--[[
		:Update()

		.OnElementResized:Fire( oldSize, newSize )
		.OnElementMoved:Fire( oldTopLeft, newTopLeft )
		.OnPropertyUpdated:Fire( propertyName, oldPropertyValue, newPropertyValue )
		.OnChildAdded:Fire( child )
		.OnChildRemoved:Fire( child )
	]]

end

-- // Components // --
local Components = {}

function Components.Menu( ... : any ) : Root

end

function Components.Searchbar( properties : { }, reference : Element ) : Element

end

function Components.Dropdown( properties : { }, ... : any ) : Element

end

function Components.TextButton( ) : Element

end

function Components.IconButton( ) : Element

end

function Components.Scroll( ) : Element

end

function Components.LineDivider( ) : Element

end

function Components.TextDivider( ) : Element

end

function Components.TextCheckbox( ) : Element
	-- Components.MultiCheckboxMode
end

function Components.IconCheckbox( ) : Element

end

function Components.ValueSlider( ) : Element

end

function Components.TextLabel( ) : Element

end

function Components.PageFrame( ) : Element

end

function Components.PageButtons( ) : Element

end

-- // Module // --
local Module = {}

Module.Components = Components
Module.Enums = Enums
Module.Themes = Enums.DefaultThemes

Module.DefaultTheme = Enums.DefaultThemes.Dark

function Module.SetTheme( root : Root | Element, theme : string | ColorPallete ) : nil

end

function Module.Construct( root : { } ) : Element

end

return Module
