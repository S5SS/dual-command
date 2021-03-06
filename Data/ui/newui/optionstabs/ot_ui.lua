dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

--Load expanded options
--dofilepath("data:ui/PlayersPatch_UI_Util.lua") --already loaded in scope by ot_gameplay.lua
RefBuildResearchLaunchPanelsScale = GetBuildResearchLaunchPanelsScale()

-- Resets the additional slider positions
-- This properly handles the Options>Change Sliders>Cancel>Options>Accept scenario
UI_AnchorSetScale('PlayersPatch_BuildResearchLaunchPanelsScale', RefBuildResearchLaunchPanelsScale, 1);


----------- Command Panel Buttons ----------
	-- SPACER
FE_UISPACER = {
	type = "Frame",
	size = {600, 13},
}

------- Custom Commands
FE_UI_HUDSCALE				=	Option_LabeledSlider("UIHUDSCALE",				"$4983",	"lblHudScale",					"$4985",	"m_sbarHUDScale",					"$4985", 1, -10, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_RB_Scale', %spos, 1);]])

FE_UI_SELECTION_HUDSCALE	=	Option_LabeledSlider("UI_SELECTION_HUDSCALE",	"$4980",	"lblSelectionHudScale",			"$4980",	"m_sbarSelectionHUDScale",			"$4980", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_Selection_Scale', %spos, 1);]])
FE_UI_COMMAND_HUDSCALE		=	Option_LabeledSlider("UI_COMMAND_HUDSCALE",		"$4978",	"lblCommandHudScale",			"$4978",	"m_sbarCommandHUDScale",			"$4978", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_Cmd_Scale', %spos, 1);]])
FE_UI_TOPMENUS_HUDSCALE		=	Option_LabeledSlider("UI_TOPMENUS_HUDSCALE",	"$4982",	"lblTopMenusHudScale",			"$4982",	"m_sbarTopMenusHUDScale",			"$4982", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_TopMenus_Scale', %spos, 1);]])
FE_UI_UTILITYICONS_HUDSCALE	=	Option_LabeledSlider("UI_UTILITYICONS_HUDSCALE","$4981",	"lblUtilityIconsHudScale",		"$4981",	"m_sbarUtilityIconsHUDScale",		"$4981", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_UtilityIcons_Scale', %spos, 1);]])
FE_UI_BOTTOMMIDDLE_HUDSCALE	=	Option_LabeledSlider("UI_BOTTOMMIDDLE_HUDSCALE","$5395",	"lblBottomMiddleHudScale",		"$5395",	"m_sbarBottomMiddleHUDScale",		"$5395", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_BottomMiddle_Scale', %spos, 1);]])
FE_UI_RESOURCE_HUDSCALE		=	Option_LabeledSlider("UI_RESOURCE_HUDSCALE",	"$4984",	"lblResourceHudScale",			"$4984",	"m_sbarResourceHUDScale",			"$4984", 1, 1, 0.5, 2.5, [[UI_AnchorSetScale('Taskbar_ResourceHud_Scale', %spos, 1);]])

------- Additional Sliders
--Build, Research, & Launch Panels
FE_UI_BRL_HUDSCALE				=	Option_LabeledSlider("UI_BRL_HUDSCALE",	"Build, Research, and Launch Panels",	"lblBRLHudScale",			"Build, Research, and Launch Panels",	"m_sbarBRLHUDScale",			"Adjust Build, Research, and Launch Panels. Default is 1. Must restart game to take effect.", 1, 1, 0.5, 1.5, [[UI_AnchorSetScale('PlayersPatch_BuildResearchLaunchPanelsScale', %spos, 1);]])


FE_UI_SHOWTIMER		=	NewCheckBoxButton("m_showtimer",		"$4991",	"$4991", nil,  nil, 1 )
FE_UI_NOTIFICATIONS	=	NewCheckBoxButton("m_notifications",	"$3075",	"$3076", nil,  nil, 1 )

dropDownSpacing = -4
sliderSpacing = -1

FE_UI_CURSORSKIN = { 
	type = "Frame",

	visible = 1,
	ignored = 1,
	
	Layout = {									
		size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
		pad_LT = { l = 4, t = dropDownSpacing, lr = "px", tr = "px" },
		pad_RB = { r = 4, b = dropDownSpacing, rr = "px", br = "px" },
	},
	
	autosize = 1,
	
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	;
							
	{
		type = "TextLabel",
		
		Layout = {	
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
			pivot_XY = { 0, 0.5 },	
		},

		Text = {
			textStyle = "RM_GenericLabelLarge_TextStyle",
			text = "$3061", 
		},
		autosize=1,
	},
													
	{
		type = "DropDownListBox",
		name = "m_cursorSkin",
		enabled = 1,
		Layout = {		
			size_WH = {w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr",},
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			pivot_XY = { 0, 0.5 },	
		
			--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
		},

		dropDownListBoxStyle = "FEDropDownListBoxStyle",
								
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$3061", -- "SPECIFY SCREEN RESOLUTION",

		ListBox = {
			type = "ListBox",
			width = 400,
			listBoxStyle = "FEListBoxStyle_Bordered",
			backgroundColor = {0,0,0,255},
			;
		},
	},
}

FE_UI_ATISKIN = { 
	type = "Frame",

	visible = 1,
	ignored = 1,
	
	Layout = {									
		size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
		pad_LT = { l = 4, t = dropDownSpacing, lr = "px", tr = "px" },
		pad_RB = { r = 4, b = dropDownSpacing, rr = "px", br = "px" },
	},
	
	autosize = 1,
	
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	;
							
	{
		type = "TextLabel",
		
		Layout = {	
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
			pivot_XY = { 0, 0.5 },	
		},

		Text = {
			textStyle = "RM_GenericLabelLarge_TextStyle",
			text = "$4102", 
		},
		autosize=1,
		helpTip = "$4103", -- ,
	},
													
	{
		type = "DropDownListBox",
		name = "m_atiSkin",
		enabled = 1,
		Layout = {		
			size_WH = {w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr",},
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			pivot_XY = { 0, 0.5 },	
		
			--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
		},

		dropDownListBoxStyle = "FEDropDownListBoxStyle",								

		helpTip = "$4103",
		
		ListBox = {
			type = "ListBox",
			width = 400,
			listBoxStyle = "FEListBoxStyle_Bordered",
			backgroundColor = {0,0,0,255},
			;
		},
	},
}

FE_UI_DEFAULTTO = {
	type = "Frame",

	visible = 1,
	ignored = 1,
	
	Layout = {									
		size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
		pad_LT = { l = 4, t = dropDownSpacing, lr = "px", tr = "px" },
		pad_RB = { r = 4, b = dropDownSpacing, rr = "px", br = "px" },
	},
	
	autosize = 1,
	
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	;
	
	{
		type = "TextLabel",
		
		Layout = {	
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
			pivot_XY = { 0, 0.5 },	
		},

		Text = {
			textStyle = "RM_GenericLabelLarge_TextStyle",
			text = "Default Tactical Overlay Setting", 
		},
		autosize=1,
		helpTip = "You must restart the game for this to take affect",
	},
	{
		type = "DropDownListBox",	
		name = "defaultToSetting",
		selected = GetDefaultToSetting() - 1,
		
		Layout = {		
			size_WH = {w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr",},
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			pivot_XY = { 0, 0.5 },	
		
			--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
		},
		
		ListBox = {
			type = "ListBox",
			width = 400,
			backgroundColor = {0,0,0,255},
			listBoxStyle = "FEListBoxStyle_Bordered",
			;
			-- 1
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Low",
				},
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_DefaultToSetting', 1.0, 1)";
			},
			-- 2
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Normal",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_DefaultToSetting', 2.0, 1)";
			},
			-- 3
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "High",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_DefaultToSetting', 3.0, 1)";
			},
			-- 4
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Maximum",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_DefaultToSetting', 4.0, 1)";
			},
		},
		helpTipTextLabel = "helpTip",
		helpTip = "Set the default tactical overlay setting",
	},
}

FE_UI_SHOWTIME = {
	type = "Frame",

	visible = 1,
	ignored = 1,
	
	Layout = {									
		size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
		pad_LT = { l = 4, t = dropDownSpacing, lr = "px", tr = "px" },
		pad_RB = { r = 4, b = dropDownSpacing, rr = "px", br = "px" },
	},
	
	autosize = 1,
	
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	;
	
	{
		type = "TextLabel",
		
		Layout = {	
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
			pivot_XY = { 0, 0.5 },	
		},

		Text = {
			textStyle = "RM_GenericLabelLarge_TextStyle",
			text = "Show Base Production Time", 
		},
		autosize=1,
		helpTip = "Shows the base build/research time - must restart the game to take affect",
	},
	{
		type = "DropDownListBox",	
		name = "defaultToSetting",
		selected = GetProductionTimeInfoSetting() - 1,
		
		Layout = {		
			size_WH = {w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr",},
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
			pivot_XY = { 0, 0.5 },	
		
			--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
		},
		
		ListBox = {
			type = "ListBox",
			width = 400,
			backgroundColor = {0,0,0,255},
			listBoxStyle = "FEListBoxStyle_Bordered",
			;
			-- 1
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Off",
				},
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_ProductionTimeSetting', 1.0, 1)";
			},
			-- 2
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Build Only",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_ProductionTimeSetting', 2.0, 1)";
			},
			-- 3
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Research Only",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_ProductionTimeSetting', 3.0, 1)";
			},
			-- 4
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Build & Research",
				},	
				onMouseClicked = "UI_AnchorSetScale('PlayersPatch_ProductionTimeSetting', 4.0, 1)";
			},
		},
		helpTipTextLabel = "helpTip",
		helpTip = "Set the default tactical overlay setting",
	},
}

--------------------------------------------------
FE_UIOPTION_TAB = {
	type = "TabPage",
	name = "m_tabUI",
	text = "$4976",
	helpTip = "$4990", -- "CHANGE UI SETTINGS",

	Layout = {
		pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
		size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
		pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
		pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
	},
	;
					
	{
		type = "Frame",
		Layout = {
			pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
								
		},

		arrangeSep = {	x=0, y=4/600, xr="px", yr="scr",},	
		autoarrange = 1,
		;
						
		-- OPTION FRAMES
		
		FE_UI_CURSORSKIN,
		FE_UI_ATISKIN,
		FE_UI_DEFAULTTO,
		FE_UI_SHOWTIME,

		{
			type = "TextLabel",
		
			Layout = {						
				size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
				--pivot_XY = { 0, 0.5 },	
			},

			Text = {
				color = {255,215,0,255},
				textStyle = "RM_GenericLabelLarge_TextStyle",
				text = "$4977", 
			},
			autosize=1,

		},



		--FE_UI_HUDSCALE,
		FE_UI_SELECTION_HUDSCALE,
		FE_UI_COMMAND_HUDSCALE,
		FE_UI_TOPMENUS_HUDSCALE,
		FE_UI_UTILITYICONS_HUDSCALE,
		FE_UI_BOTTOMMIDDLE_HUDSCALE,
		--FE_UI_RESOURCE_HUDSCALE,
		
		-- Additional Sliders
		FE_UI_BRL_HUDSCALE,

		--FE_UISPACER,
		FE_UI_SHOWTIMER,
		FE_UI_NOTIFICATIONS,

		-- SPACER
		{
			type = "Frame",
			size = {600, 13},
		},
	},
}

--sets position for the additional sliders
FE_UIOPTION_TAB[1][11][2][1].Text.text = RefBuildResearchLaunchPanelsScale --default text in the label
FE_UIOPTION_TAB[1][11][2][2].scrollPosition = RefBuildResearchLaunchPanelsScale --default position for the scrollbar button

-- Reduce spacing between sliders
for i=6,11 do
	FE_UIOPTION_TAB[1][i].Layout.pad_LT.t = -4
	FE_UIOPTION_TAB[1][i].Layout.size_WH.h = FE_UIOPTION_TAB[1][i].Layout.size_WH.h * 0.8
end
