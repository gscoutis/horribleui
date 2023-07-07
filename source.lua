local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")


local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local lp = players.LocalPlayer
local mouse = lp:GetMouse()




local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Init(options)
	options = Library:validate({
		name = "Censori"	
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
		
	}
	
	-- main 
	do	
		-- StarterGui.MyLibrary
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[MyLibrary]];
		GUI["1"]["IgnoreGuiInset"] = true


		-- StarterGui.MyLibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(39, 40, 45);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 500, 0, 425);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2) )
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.MyLibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 10);




		-- StarterGui.MyLibrary.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.MyLibrary.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);





		-- StarterGui.MyLibrary.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(21, 20, 26);
		GUI["6"]["Size"] = UDim2.new(0, 150, 0, 32);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];

		-- StarterGui.MyLibrary.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.MyLibrary.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(0, 150, 0.5, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["Name"] = [[Extension]];

		-- StarterGui.MyLibrary.Main.TopBar.HideCorner
		GUI["9"] = Instance.new("Frame", GUI["6"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
		GUI["9"]["Size"] = UDim2.new(0, 50, 0, 20);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Position"] = UDim2.new(0, 100, 0, 0);
		GUI["9"]["Name"] = [[HideCorner]];

		-- StarterGui.MyLibrary.Main.TopBar.Title
		GUI["a"] = Instance.new("TextLabel", GUI["6"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["a"]["TextSize"] = 28;
		GUI["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["Text"] = options["name"];
		GUI["a"]["Name"] = [[Title]];
		GUI["a"]["BackgroundTransparency"] = 100;

		-- StarterGui.MyLibrary.Main.TopBar.Title.UIPadding
		GUI["b"] = Instance.new("UIPadding", GUI["a"]);
		GUI["b"]["PaddingLeft"] = UDim.new(0, 12);
		-- StarterGui.MyLibrary.Main.ContentContainer
		GUI["c"] = Instance.new("Frame", GUI["2"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(40, 41, 46);
		GUI["c"]["Size"] = UDim2.new(0, 340, 1, -12);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Position"] = UDim2.new(0, 155, 0, 10);
		GUI["c"]["Name"] = [[ContentContainer]];


	end
	
	-- navi
	do 
		-- StarterGui.MyLibrary.Main.Navigation
		GUI["47"] = Instance.new("Frame", GUI["2"]);
		GUI["47"]["BorderSizePixel"] = 0;
		GUI["47"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
		GUI["47"]["Size"] = UDim2.new(0, 150, 1, -31);
		GUI["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["47"]["Position"] = UDim2.new(0, 0, 0, 31);
		GUI["47"]["Name"] = [[Navigation]];

		-- StarterGui.MyLibrary.Main.Navigation.UICorner
		GUI["48"] = Instance.new("UICorner", GUI["47"]);
		GUI["48"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.MyLibrary.Main.Navigation.HideCorner
		GUI["49"] = Instance.new("Frame", GUI["47"]);
		GUI["49"]["BorderSizePixel"] = 0;
		GUI["49"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
		GUI["49"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["49"]["Name"] = [[HideCorner]];

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder
		GUI["4a"] = Instance.new("Frame", GUI["47"]);
		GUI["4a"]["BorderSizePixel"] = 0;
		GUI["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4a"]["BackgroundTransparency"] = 1;
		GUI["4a"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4a"]["Name"] = [[ButtonHolder]];

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIPadding
		GUI["4b"] = Instance.new("UIPadding", GUI["4a"]);
		GUI["4b"]["PaddingTop"] = UDim.new(0, 8);
		GUI["4b"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIListLayout
		GUI["4c"] = Instance.new("UIListLayout", GUI["4a"]);
		GUI["4c"]["Padding"] = UDim.new(0, 1);
		GUI["4c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	end
	
	
	
	function GUI:CreateTab(options)
		options = Library:validate({
			name = "Preview Tab"	,
			icon = "rbxassetid://10723407389"
		}, options or {})
		
		
		local Tab = {
			Hover = false,
			Active = false
		}

		-- render
		do
			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive
			Tab["50"] = Instance.new("TextLabel", GUI["4a"]);
			Tab["50"]["ZIndex"] = 2;
			Tab["50"]["BorderSizePixel"] = 0;
			Tab["50"]["BackgroundColor3"] = Color3.fromRGB(8, 117, 164);
			Tab["50"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["50"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["50"]["TextSize"] = 18;
			Tab["50"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["50"]["Size"] = UDim2.new(1, 0, 0, 25);
			Tab["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["50"]["Text"] = options.name;
			Tab["50"]["Name"] = [[Inactive]];
			Tab["50"]["BackgroundTransparency"] = 100;

			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["51"] = Instance.new("UIPadding", Tab["50"]);
			Tab["51"]["PaddingLeft"] = UDim.new(0, 36);

			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["52"] = Instance.new("ImageLabel", Tab["50"]);
			Tab["52"]["ZIndex"] = 2;
			Tab["52"]["BorderSizePixel"] = 0;
			Tab["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["52"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["52"]["Image"] = [[rbxassetid://10723407389]];
			Tab["52"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["52"]["Name"] = options.icon;
			Tab["52"]["BackgroundTransparency"] = 1;
			Tab["52"]["Position"] = UDim2.new(0, -24, 0.5, 0);

			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab
			Tab["d"] = Instance.new("ScrollingFrame", GUI["c"]);
			Tab["d"]["BorderSizePixel"] = 0;
			Tab["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["d"]["BackgroundTransparency"] = 100;
			Tab["d"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["d"]["Selectable"] = false;
			Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["d"]["ScrollBarThickness"] = 3;
			Tab["d"]["Name"] = [[HomeTab]];
			Tab["d"]["ClipsDescendants"] = true;
			Tab["d"]["SelectionGroup"] = false;
			Tab["d"]["Visible"] = false;
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.UIListLayout
			Tab["14"] = Instance.new("UIListLayout", Tab["d"]);
			Tab["14"]["Padding"] = UDim.new(0, 15);
			Tab["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.UIPadding
			Tab["13"] = Instance.new("UIPadding", Tab["d"]);
			Tab["13"]["PaddingTop"] = UDim.new(0, 1);
			Tab["13"]["PaddingRight"] = UDim.new(0, 1);
			Tab["13"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["13"]["PaddingLeft"] = UDim.new(0, 1);
		end
		
		-- methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				Tab.Active = true
				Library:tween(Tab["50"], {BackgroundTransparency = .8})
				Library:tween(Tab["50"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["52"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				Tab["d"].Visible = true
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["50"], {TextColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["52"], {ImageColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["50"], {BackgroundTransparency = 1})
				Tab["d"].Visible = false

			end
		end
		
		-- logic
		do 
			Tab["50"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:tween(Tab["50"], {TextColor3 = Color3.fromRGB(255,255,255)})
					Library:tween(Tab["52"], {ImageColor3 = Color3.fromRGB(255,255,255)})

				end
			end)
			Tab["50"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then 
					Library:tween(Tab["50"], {TextColor3 = Color3.fromRGB(200,200,200)})
					Library:tween(Tab["52"], {ImageColor3 = Color3.fromRGB(200,200,200)})

				end
			end)
			uis.InputBegan:Connect(function(input, gpe)
				
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if gpe then return end
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				name = "Preview Tab"	,
				callback = function() end
			}, options or {})
			local Button = {
				Hover = false,
				MouseDown = false
			}	
			-- render
			do
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button
				Button["e"] = Instance.new("Frame", Tab["d"]);
				Button["e"]["BorderSizePixel"] = 0;
				Button["e"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
				Button["e"]["Size"] = UDim2.new(1, -7, 0, 40);
				Button["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["e"]["Name"] = [[Button]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.UICorner
				Button["f"] = Instance.new("UICorner", Button["e"]);


				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.Title
				Button["10"] = Instance.new("TextLabel", Button["e"]);
				Button["10"]["TextWrapped"] = true;
				Button["10"]["BorderSizePixel"] = 0;
				Button["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["10"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["10"]["TextSize"] = 24;
				Button["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["10"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["10"]["Text"] = options.name;
				Button["10"]["Name"] = [[Title]];
				Button["10"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["11"] = Instance.new("UIPadding", Button["e"]);
				Button["11"]["PaddingTop"] = UDim.new(0, 6);
				Button["11"]["PaddingRight"] = UDim.new(0, 6);
				Button["11"]["PaddingBottom"] = UDim.new(0, 6);
				Button["11"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Button.ImageLabel
				Button["12"] = Instance.new("ImageLabel", Button["e"]);
				Button["12"]["BorderSizePixel"] = 0;
				Button["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["12"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["12"]["Image"] = [[rbxassetid://10734898592]];
				Button["12"]["Size"] = UDim2.new(0, 30, 0, 30);
				Button["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["12"]["BackgroundTransparency"] = 100;
				Button["12"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			-- methods
			function Button:SetText(Text)
				Button["e"].Text = Text
				options.name = Text
			end
			function Button:SetCallback(fn)
			end
			-- logic 
			do 
				Button["e"].MouseEnter:Connect(function()
					Button.Hover = true
					
					if not Button.MouseDown then
					end
				end)
				Button["e"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
					end
				end)
				
				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["e"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
						options.callback()
					end
				end)
					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						if Button.Hover then
						Library:tween(Button["e"], {BackgroundColor3 = Color3.fromRGB(22, 21, 27)})	-- reset-- hover state
						else 
						Library:tween(Button["e"], {BackgroundColor3 = Color3.fromRGB(22, 21, 27)})	-- reset
						end
					end
				end)
			end
			return Button
		end
		
		function Tab:Warning(options)
			options = Library:validate({
				message = "Preview Warning"
			}, options or {})

			local Warning = {}

			
			
			-- render
			do 
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning
				Warning["1c"] = Instance.new("Frame", Tab["d"]);
				Warning["1c"]["BorderSizePixel"] = 1;
				Warning["1c"]["BackgroundColor3"] = Color3.fromRGB(44, 37, 4);
				Warning["1c"]["Size"] = UDim2.new(1, -7, 0, 40);
				Warning["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["1c"]["Name"] = [[Warning]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UICorner
				Warning["1d"] = Instance.new("UICorner", Warning["1c"]);


				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.Warning
				Warning["1e"] = Instance.new("TextLabel", Warning["1c"]);
				Warning["1e"]["TextWrapped"] = true;
				Warning["1e"]["BorderSizePixel"] = 0;
				Warning["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Warning["1e"]["TextSize"] = 24;
				Warning["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
				Warning["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["1e"]["Text"] = options.message;
				Warning["1e"]["Name"] = [[Warning]];
				Warning["1e"]["BackgroundTransparency"] = 1;
				Warning["1e"]["TextWrapped"] = true;
				Warning["1e"]["TextYAlignment"] = Enum.TextYAlignment.Top


				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.Warning.UIPadding
				Warning["1f"] = Instance.new("UIPadding", Warning["1e"]);
				Warning["1f"]["PaddingLeft"] = UDim.new(0, 40);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UIPadding
				Warning["20"] = Instance.new("UIPadding", Warning["1c"]);
				Warning["20"]["PaddingTop"] = UDim.new(0, 6);
				Warning["20"]["PaddingRight"] = UDim.new(0, 6);
				Warning["20"]["PaddingBottom"] = UDim.new(0, 6);
				Warning["20"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Warning.UIStroke
				Warning["21"] = Instance.new("UIStroke", Warning["1c"]);
				Warning["21"]["Color"] = Color3.fromRGB(226, 226, 0);
				Warning["21"]["Thickness"] = 1;
				-- StarterGui.bitch.Main.ContentContainer.HomeTab.Warning.Warning.ImageLabel
				Warning["22"] = Instance.new("ImageLabel", Warning["1e"]);
				Warning["22"]["BorderSizePixel"] = 0;
				Warning["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["22"]["ImageColor3"] = Color3.fromRGB(255, 205, 0);
				Warning["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Warning["22"]["Image"] = [[rbxassetid://10723374276]];
				Warning["22"]["Size"] = UDim2.new(0, 34, 0, 34);
				Warning["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["22"]["BackgroundTransparency"] = 100;
				Warning["22"]["Position"] = UDim2.new(0, -22, 0, 14);
				-- uipadding for stroke
				Warning["20"] = Instance.new("UIPadding", Warning["21"]);
				Warning["20"]["PaddingTop"] = UDim.new(0, 3);
				Warning["20"]["PaddingRight"] = UDim.new(0, 3);
				Warning["20"]["PaddingBottom"] = UDim.new(0, 3);
				Warning["20"]["PaddingLeft"] = UDim.new(0, 3);

			end
			
			-- methods 
			function Warning:SetText(text)
				options.message = text
				Warning:_update()
			end
			
			function Warning:_update()
				Warning["1e"].Text = options.message 
				Warning["1e"].Size = UDim2.new(Warning["1e"].Size.X.Scale, Warning["1e"].Size.X.Offset, 0, math.huge)
				Warning["1e"].Size = UDim2.new(Warning["1e"].Size.X.Scale, Warning["1e"].Size.X.Offset, 0, Warning["1e"].TextBounds.Y)
				Library:tween(Warning["1c"], {Size = UDim2.new(Warning["1c"].Size.X.Scale, Warning["1c"].Size.X.Offset, 0, Warning["1e"].TextBounds.Y + 12)})

			end
			Warning:_update()
			return Warning
		end
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Preview Toggle",
				callback = function() end
			}, options or {})

			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			-- render
			do 
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle
				Toggle["3d"] = Instance.new("Frame", Tab["d"]);
				Toggle["3d"]["BorderSizePixel"] = 0;
				Toggle["3d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
				Toggle["3d"]["Size"] = UDim2.new(1, -7, 0, 40);
				Toggle["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3d"]["Name"] = [[Toggle]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle.UICorner
				Toggle["3e"] = Instance.new("UICorner", Toggle["3d"]);


				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle.Title
				Toggle["3f"] = Instance.new("TextLabel", Toggle["3d"]);
				Toggle["3f"]["TextWrapped"] = true;
				Toggle["3f"]["BorderSizePixel"] = 0;
				Toggle["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["3f"]["TextSize"] = 24;
				Toggle["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3f"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3f"]["Text"] = [[Toggle]];
				Toggle["3f"]["Name"] = [[Title]];
				Toggle["3f"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle.UIPadding
				Toggle["40"] = Instance.new("UIPadding", Toggle["3d"]);
				Toggle["40"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["40"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["40"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["40"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle.CheckmarkHolder
				Toggle["41"] = Instance.new("Frame", Toggle["3d"]);
				Toggle["41"]["BorderSizePixel"] = 0;
				Toggle["41"]["BackgroundColor3"] = Color3.fromRGB(82, 82, 82);
				Toggle["41"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["41"]["Size"] = UDim2.new(0, 26, 0, 26);
				Toggle["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["41"]["Position"] = UDim2.new(1, 0, 0.5, 0);
				Toggle["41"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Toggle.CheckmarkHolder.UICorner
				Toggle["42"] = Instance.new("UICorner", Toggle["41"]);



			end
			-- Methods
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end

					if Toggle.State then
						Library:tween(Toggle["41"], {BackgroundColor3 = Color3.fromRGB(7, 116, 163)})
					else
						Library:tween(Toggle["41"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
					end


					options.callback(Toggle.State)
				end
			end

			-- Logic
			do
				Toggle["3d"].MouseEnter:Connect(function()
					Toggle.Hover = true

				end)

				Toggle["3d"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["3d"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Toggle:Toggle()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Library:tween(Toggle["3d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						else
							Library:tween(Toggle["3d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						end
					end
				end)				
			end

			return Toggle
		end
		function Tab:Slider(options)
			options = Library:validate({
				title = "Preview Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) print(v) end
			}, options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			--render
			do 
				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider
				Slider["23"] = Instance.new("Frame", Tab["d"]);
				Slider["23"]["BorderSizePixel"] = 0;
				Slider["23"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
				Slider["23"]["Size"] = UDim2.new(1, -7, 0, 55);
				Slider["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["23"]["Name"] = [[Slider]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["24"] = Instance.new("UICorner", Slider["23"]);


				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.Title
				Slider["25"] = Instance.new("TextLabel", Slider["23"]);
				Slider["25"]["TextWrapped"] = true;
				Slider["25"]["BorderSizePixel"] = 0;
				Slider["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["25"]["TextSize"] = 24;
				Slider["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["25"]["Size"] = UDim2.new(1, -20, 1, -20);
				Slider["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["25"]["Text"] = [[Slider]];
				Slider["25"]["Name"] = [[Title]];
				Slider["25"]["BackgroundTransparency"] = 1;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["26"] = Instance.new("UIPadding", Slider["23"]);
				Slider["26"]["PaddingTop"] = UDim.new(0, 6);
				Slider["26"]["PaddingRight"] = UDim.new(0, 6);
				Slider["26"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["26"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.Value
				Slider["27"] = Instance.new("TextLabel", Slider["23"]);
				Slider["27"]["TextWrapped"] = true;
				Slider["27"]["BorderSizePixel"] = 0;
				Slider["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["27"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["27"]["TextSize"] = 14;
				Slider["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["27"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["27"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["27"]["Text"] = [[100]];
				Slider["27"]["Name"] = [[Value]];
				Slider["27"]["BackgroundTransparency"] = 1;
				Slider["27"]["Position"] = UDim2.new(1, 0, 0, -10);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["28"] = Instance.new("Frame", Slider["23"]);
				Slider["28"]["BorderSizePixel"] = 0;
				Slider["28"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["28"]["Size"] = UDim2.new(1, 0, 0, 6);
				Slider["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["28"]["Position"] = UDim2.new(0, 0, 1, -10);
				Slider["28"]["Name"] = [[SliderBack]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["29"] = Instance.new("UICorner", Slider["28"]);
				Slider["29"]["CornerRadius"] = UDim.new(0, 15);

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["2a"] = Instance.new("UIStroke", Slider["28"]);
				Slider["2a"]["Color"] = Color3.fromRGB(8, 117, 164);
				Slider["2a"]["Thickness"] = 0.5;

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["2b"] = Instance.new("Frame", Slider["28"]);
				Slider["2b"]["BorderSizePixel"] = 0;
				Slider["2b"]["BackgroundColor3"] = Color3.fromRGB(8, 117, 164);
				Slider["2b"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2b"]["Name"] = [[Draggable]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["2c"] = Instance.new("UICorner", Slider["2b"]);
				Slider["2c"]["CornerRadius"] = UDim.new(0, 15);
			end
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["28"].AbsolutePosition.X) / (Slider["28"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)

					Slider["27"].Text = tostring(value)
					Slider["2b"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["27"].Text = tostring(v)
					Slider["2b"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end

			function Slider:GetValue()
				return tonumber(Slider["27"].Text)				
			end
			-- Logic
			do
				Slider["23"].MouseEnter:Connect(function()
					Slider.Hover = true

					Library:tween(Slider["2a"], {Color = Color3.fromRGB(102, 102, 102)})
					Library:tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
				end)

				Slider["23"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["2a"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Slider["2a"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})

						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Slider["2a"], {Color = Color3.fromRGB(102, 102, 102)})
							Library:tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
						else
							Library:tween(Slider["23"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
							Library:tween(Slider["2a"], {Color = Color3.fromRGB(82, 82, 82)})
							Library:tween(Slider["2b"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						end

						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end

			return Slider
		end
		function Tab:Dropdown(options)
			options = Library:validate({
				title = "Preview Slider",
				callback = function(v) print(v) end,
				items = {}
			}, options or {})

			local Dropdown = {
				Items = {
					["id"] = { 
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
			-- render
		do
			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown
			Dropdown["2d"] = Instance.new("Frame", Tab["d"]);
			Dropdown["2d"]["BorderSizePixel"] = 0;
			Dropdown["2d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 27);
			Dropdown["2d"]["Size"] = UDim2.new(1, -7, 0, 37);
			Dropdown["2d"]["ClipsDescendants"] = true;
			Dropdown["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Dropdown["2d"]["Name"] = [[Dropdown]];

			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.UICorner
			Dropdown["2e"] = Instance.new("UICorner", Dropdown["2d"]);


			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.Title
			Dropdown["2f"] = Instance.new("TextLabel", Dropdown["2d"]);
			Dropdown["2f"]["TextWrapped"] = true;
			Dropdown["2f"]["BorderSizePixel"] = 0;
			Dropdown["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Dropdown["2f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Dropdown["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Dropdown["2f"]["TextSize"] = 22;
			Dropdown["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Dropdown["2f"]["Size"] = UDim2.new(1, 0, 0, 20);
			Dropdown["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Dropdown["2f"]["Text"] = [[Dropdown]];
			Dropdown["2f"]["Name"] = [[Title]];
			Dropdown["2f"]["BackgroundTransparency"] = 1;

			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.UIPadding
			Dropdown["30"] = Instance.new("UIPadding", Dropdown["2d"]);
			Dropdown["30"]["PaddingTop"] = UDim.new(0, 6);
			Dropdown["30"]["PaddingRight"] = UDim.new(0, 6);
			Dropdown["30"]["PaddingBottom"] = UDim.new(0, 6);
			Dropdown["30"]["PaddingLeft"] = UDim.new(0, 6);

			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.ImageLabel
			Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2d"]);
			Dropdown["31"]["BorderSizePixel"] = 0;
			Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Dropdown["31"]["AnchorPoint"] = Vector2.new(1, 0);
			Dropdown["31"]["Image"] = [[rbxassetid://10709767827]];
			Dropdown["31"]["Size"] = UDim2.new(0, 27, 0, 27);
			Dropdown["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Dropdown["31"]["BackgroundTransparency"] = 100;
			Dropdown["31"]["Position"] = UDim2.new(1, 0, 0, 0);

			-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder
				Dropdown["32"] = Instance.new("Frame", Dropdown["2d"]);
				Dropdown["32"]["BorderSizePixel"] = 0;
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["32"]["BackgroundTransparency"] = 100;
				Dropdown["32"]["Size"] = UDim2.new(1, 0, 1, -24);
				Dropdown["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["32"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["32"]["Visible"] = false;
				Dropdown["32"]["Name"] = [[OptionHolder]];

				-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
				Dropdown["33"]["Padding"] = UDim.new(0, 5);
				Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			-- Methods
			do
				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false
					}

					if Dropdown.Items[id] ~= nil then
						return
					end

					Dropdown.Items[id] = {
						instance = {},
						value = value
					}
					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.Items[id].instance.OptionHolder.Inactive Option
					Dropdown.Items[id].instance["34"] = Instance.new("TextLabel", Dropdown["32"]);
					Dropdown.Items[id].instance["34"]["BorderSizePixel"] = 0;
					Dropdown.Items[id].instance["34"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
					Dropdown.Items[id].instance["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Dropdown.Items[id].instance["34"]["TextSize"] = 14;
					Dropdown.Items[id].instance["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown.Items[id].instance["34"]["Size"] = UDim2.new(1, 0, 0, 18);
					Dropdown.Items[id].instance["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown.Items[id].instance["34"]["Text"] = id;
					Dropdown.Items[id].instance["34"]["Name"] = [[Inactive Option]];

					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.Inactive Option.UIStroke
					Dropdown.Items[id].instance["35"] = Instance.new("UIStroke", Dropdown.Items[id].instance["34"]);
					Dropdown.Items[id].instance["35"]["Color"] = Color3.fromRGB(44, 44, 44);
					Dropdown.Items[id].instance["35"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.MyLibrary.Main.ContentContainer.HomeTab.Dropdown.OptionHolder.Inactive Option.UICorner
					Dropdown.Items[id].instance["36"] = Instance.new("UICorner", Dropdown.Items[id].instance["34"]);
					Dropdown.Items[id].instance["36"]["CornerRadius"] = UDim.new(0, 3);
					Dropdown.Items[id].instance["34"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true

						Library:tween(Dropdown.Items[id].instance["35"], {Color = Color3.fromRGB(102, 102, 102)})
					end)

					Dropdown.Items[id].instance["34"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if not Item.MouseDown then
							Library:tween(Dropdown.Items[id].instance["35"], {Color = Color3.fromRGB(82, 82, 82)})
						end
					end)

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							Library:tween(Dropdown.Items[id].instance["34"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
							Library:tween(Dropdown.Items[id].instance["35"], {Color = Color3.fromRGB(200, 200, 200)})
							options.callback(value)
							Dropdown:Toggle()
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false

							if Item.Hover then
								Library:tween(Dropdown.Items[id].instance["34"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
								Library:tween(Dropdown.Items[id].instance["35"], {Color = Color3.fromRGB(102, 102, 102)})
							else
								Library:tween(Dropdown.Items[id].instance["34"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
								Library:tween(Dropdown.Items[id].instance["35"], {Color = Color3.fromRGB(82, 82, 82)})
							end
						end
					end)
				end

				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							for i, v in pairs(Dropdown.Items[id].instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[id] = nil
					end
				end

				function Dropdown:Clear()
					for i, v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown:Toggle()
					Dropdown.Open = not Dropdown.Open

					if not Dropdown.Open then
						Library:tween(Dropdown["2d"], {Size = UDim2.new(1, 0, 0, 32)}, function()
							Dropdown["32"].Visible = false
						end)
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end

						Dropdown["32"].Visible = true
						Library:tween(Dropdown["2d"], {Size = UDim2.new(1, 0, 0, 32 + (count * 20) + 2)})
					end
				end
			end

			-- Logic
			do
				Dropdown["2d"].MouseEnter:Connect(function()
					Dropdown.Hover = true

				end)

				Dropdown["2d"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["2d"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})

						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Library:tween(Dropdown["2d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						else
							Library:tween(Dropdown["2d"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						end
					end
				end)
			end


			return Dropdown
		end
			
					
		return Tab
	end
	
	return GUI
end
