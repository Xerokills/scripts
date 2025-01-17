--[[ 
Tartarus is created by SpiralAPI and is not intended for usage within a live game environment. It is created as
a "final hurdle" used in me and my associates personal anti-cheat development. I have designed it (to the best
of my ability) to be as undetectable as possible for the purpose of testing the strength of reach anti-cheats.
If you have received this script, I kindly ask you do not share or spread it without consulting me first.

-----BEGIN PGP MESSAGE-----

hF4DGMYdw4CJfaUSAQdAnLz0uJc/md81oL3e+89gMUA0U0HzGfqKUpd5MGYZn0Mw
qb5jTjO1zH5LXOGyaHiyNXDMJysQX0ePz/QcnefsU4CZaPz8j/n/V9OTXVXG4eLM
1OkBCQIQ2B30yHeWqNFPAi29qBWYhYQzInoCg9JTnQ3EiPpHpFbgJagZhpXSJpQd
/oKmC6ywwWm3bK9OJ4aZis5fDExv5US3pZYPKQ8ubTl2Jl+JQDtxEfZhuiHd4nje
wucn7C6wAn60TLpvcXbohynorPZ17neIhHB5HHNVWgoPs1ms2QxwCwIL0/PY4rfC
WcZssvWe4aCQtfD97Jx1iBz8kmPVYLosRjPPthwODf94UVd8yS4WFj8052Nqkibh
mdAyBZPud0o+PqcNFD0sWwj7/lkt1hEMCepiPQ+r7UDA2KnOVT49oHfvzWngbroN
Gp0F9sEFVGHtnDgSjpaKSRSI9VNVUd5CssXxq4eG5B2jk4cYDs8ku/dRG7uphwQ2
2Fg/gSO8esFFAZjXzhWSw1UfZDPaPKOjWVxu60j5P+Abs8XVUfCH8LJxaB2Rt4yK
/LvqtdILxfewRzY0xhYA7Gd1uzR+J3RzvwzRZ4HgCRC0Y6nn6enJKaICcTlf5vht
NVHGRYdKEFxPHB3wf8MosnUFMip61BBRxvWMYCOuz4mPxYx/zxnps0mfj66u9HC3
4Vmvvy31Zt4LgRa819dDXiFBpJuURFJGBA+lYr1GVC4QKV+A3GVcT0G0j1m/m2nU
raHO8bETlQS3FtyIY3DaulCXzN+tk49JNBd7aCa3GPMNwgd9zPlChchC
=P1I7
-----END PGP MESSAGE-----

https://spiralapi.dev/signature


▄▄▄█████▓ ▄▄▄       ██▀███  ▄▄▄█████▓ ▄▄▄       ██▀███   █    ██   ██████ 
▓  ██▒ ▓▒▒████▄    ▓██ ▒ ██▒▓  ██▒ ▓▒▒████▄    ▓██ ▒ ██▒ ██  ▓██▒▒██    ▒ 
▒ ▓██░ ▒░▒██  ▀█▄  ▓██ ░▄█ ▒▒ ▓██░ ▒░▒██  ▀█▄  ▓██ ░▄█ ▒▓██  ▒██░░ ▓██▄   
░ ▓██▓ ░ ░██▄▄▄▄██ ▒██▀▀█▄  ░ ▓██▓ ░ ░██▄▄▄▄██ ▒██▀▀█▄  ▓▓█  ░██░  ▒   ██▒
  ▒██▒ ░  ▓█   ▓██▒░██▓ ▒██▒  ▒██▒ ░  ▓█   ▓██▒░██▓ ▒██▒▒▒█████▓ ▒██████▒▒
  ▒ ░░    ▒▒   ▓▒█░░ ▒▓ ░▒▓░  ▒ ░░    ▒▒   ▓▒█░░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░
    ░      ▒   ▒▒ ░  ░▒ ░ ▒░    ░      ▒   ▒▒ ░  ░▒ ░ ▒░░░▒░ ░ ░ ░ ░▒  ░ ░
  ░        ░   ▒     ░░   ░   ░        ░   ▒     ░░   ░  ░░░ ░ ░ ░  ░  ░  
               ░  ░   ░                    ░  ░   ░        ░           ░  
                                                                          
                                ( tartarus )


    CLOSET MODE INSPIRATION: Killware (only inspiration, no code skidded)

    NEEDED UNC FUNCTIONS: 
        - firetouchinterest
        - hookmetamethod
        - getnamecallmethod
        - getconnections
        - getgenv
    (if your executor doesn't have this already, its shit)

    KEYBINDS (Defaults, change settings manually to alter keybinds): 
        F = Toggle On/Off
        T = Toggle Mode (Blatant / Closet / AMP)
        E/Q = Increase/Decrease Radius (Default 12, caps at 14 with blatant, 6 with closet)
        X = Toggle Team Whitelist (Doesn't affect AMP)
        CTRL + E/Q = Increase Loop Frequency (Default 0.15, Min 0.05 Max 0.5 | Lower = more damage quicker)
        CTRL + X = Kill Script (Emergency script shutdown)
		CTRL + F = Toggle Notifications
]]

--[[ TESTING
local firetouchinterest = function(...)
	print("fired fti")
end

local hookmetamethod = function(...)
	print("hooked metamethod")
end

local getnamecallmethod = function(...)
	return "random"
end

local getconnections = function(...)
	return {}
end

local getgenv = function(...)
	return _G
end
]]

--Settings
local Tartarus = {
	Active = true,
	Radius = 12,
	LoopFrequency = 0.15,
	TeamWhitelist = true,
	ShowNotifications = true,

	Keybinds = {
		Normal = {
			[] = "Toggle",
			[Enum.KeyCode.T] = "ToggleMode",
			[Enum.KeyCode.E] = "IncreaseRadius",
			[Enum.KeyCode.Q] = "DecreaseRadius",
			[Enum.KeyCode.X] = "ToggleTeamWhitelist",
		},
		CTRL = {
			[Enum.KeyCode.E] = "IncreaseLoop",
			[Enum.KeyCode.Q] = "DecreaseLoop",
			[Enum.KeyCode.X] = "Shutdown",
			[Enum.KeyCode.F] = "ToggleNotifs",
		},
	},
}

--Services
local Players = game:GetService("Players")
local LogService = game:GetService("LogService")
local RunService = game:GetService("RunService")
local ScriptContext = game:GetService("ScriptContext")
local UserInputService = game:GetService("UserInputService")

--Locals
local WhitelistedLimbs = {
	"Head",
	"Torso",
	"HumanoidRootPart",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg",
}

local ActiveMode = "Blatant"
local PossibleModes = setmetatable({ "Blatant", "Closet", "AMP" }, {
	__index = function(tab, ind)
		return tab[1]
	end,
})

local LastLoop = tick()

local Connections = {}

local TouchingOverlapParams = OverlapParams.new()
TouchingOverlapParams.MaxParts = 50
TouchingOverlapParams.RespectCanCollide = false
TouchingOverlapParams.FilterType = Enum.RaycastFilterType.Exclude
TouchingOverlapParams.FilterDescendantsInstances = {}

--Functions
local function Notify(Message: string)
	if not Tartarus.ShowNotifications then
		return
	end

	return game.StarterGui:SetCore("SendNotification", {
		Title = "TARTARUS",
		Text = Message,
		Duration = 3,
	})
end

local function IsTeam(Player: Player)
	if not Tartarus.TeamWhitelist then
		return false
	end

	if not Player.Team then
		return false
	end

	return Player.Team == Players.LocalPlayer.Team
end

local function GetClosestPlayer()
	if not Players.LocalPlayer.Character or not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	local ClosestDistance = math.huge
	local ClosestPlayer = nil
	local HRP = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	for _, Player in ipairs(Players:GetPlayers()) do
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChild("Humanoid")

		if Character and Humanoid and Humanoid.Health > 0 and Character:FindFirstChild("HumanoidRootPart") then
			local pHRP = Character:FindFirstChild("HumanoidRootPart")
			local Distance = (HRP.Position - pHRP.Position).Magnitude

			if Distance < ClosestDistance then
				ClosestDistance = Distance
				ClosestPlayer = Player
			end
		end
	end

	return ClosestPlayer
end

local function GetPlayersInRange(Range)
	if not Players.LocalPlayer.Character or not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return {}
	end

	local PlayersInRange = {}
	local HRP = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	for _, Player in ipairs(Players:GetPlayers()) do
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChild("Humanoid")

		if
			Player ~= Players.LocalPlayer
			and Character
			and Humanoid
			and Humanoid.Health > 0
			and Character:FindFirstChild("HumanoidRootPart")
		then
			local pHRP = Character:FindFirstChild("HumanoidRootPart")
			local Distance = (HRP.Position - pHRP.Position).Magnitude

			if Distance <= Range then
				table.insert(PlayersInRange, Player)
			end
		end
	end

	return PlayersInRange
end

local function GetPlayersInRangeAndFOV(Range, FOV)
	FOV = FOV or 75

	if not Players.LocalPlayer.Character or not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return {}
	end

	local PlayersInRange = {}
	local HRP = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local ForwardVector = HRP.CFrame.LookVector

	for _, Player in ipairs(Players:GetPlayers()) do
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChild("Humanoid")

		if
			Player ~= Players.LocalPlayer
			and Character
			and Humanoid
			and Humanoid.Health > 0
			and Character:FindFirstChild("HumanoidRootPart")
		then
			local pHRP = Character:FindFirstChild("HumanoidRootPart")
			local DirectionToPlayer = (pHRP.Position - HRP.Position).Unit
			local Distance = (HRP.Position - pHRP.Position).Magnitude

			if Distance <= Range then
				local DotProduct = ForwardVector:Dot(DirectionToPlayer)
				local Angle = math.deg(math.acos(DotProduct))

				if Angle <= FOV / 2 then
					table.insert(PlayersInRange, Player)
				end
			end
		end
	end

	return PlayersInRange
end

local function GetFakes(Handle)
	local Fakes = {}

	for _, Connected in pairs(Handle:GetConnectedParts()) do
		if
			Connected:IsA("BasePart")
			and Connected ~= Handle
			and not table.find(WhitelistedLimbs, Connected.Name)
			and (Handle.Position - Connected.Position).Magnitude < 5
		then
			table.insert(Fakes, Connected)
		end
	end

	return Fakes
end

local function ProcessAction(Action)
	if Action == "Toggle" then
		Tartarus.Active = not Tartarus.Active

		Notify(`{Tartarus.Active and "Enabled" or "Disabled"} Tartarus.`)
	elseif Action == "ToggleMode" then
		local CurrentInd
		do
			for i, v in ipairs(PossibleModes) do
				if v == ActiveMode then
					CurrentInd = i
				end
			end
		end

		local Next = PossibleModes[CurrentInd + 1]
		ActiveMode = Next

		local OldRadius = Tartarus.Radius
		Tartarus.Radius = math.clamp(Tartarus.Radius, 1, if ActiveMode == "Blatant" then 14 else 6)

		Notify(
			`Changed to {Next} mode.{OldRadius ~= Tartarus.Radius and ` Radius changed to {Tartarus.Radius}.` or ""}`
		)
	elseif Action == "ToggleTeamWhitelist" then
		Tartarus.TeamWhitelist = not Tartarus.TeamWhitelist

		Notify(`{Tartarus.TeamWhitelist and "Enabled" or "Disabled"} Team Whitelist.`)
	elseif Action == "IncreaseRadius" then
		local OldRadius = Tartarus.Radius
		Tartarus.Radius = math.clamp(Tartarus.Radius + 1, 1, if ActiveMode == "Blatant" then 14 else 6)

		Notify(OldRadius ~= Tartarus.Radius and ` Radius changed to {Tartarus.Radius}.`)
	elseif Action == "DecreaseRadius" then
		local OldRadius = Tartarus.Radius
		Tartarus.Radius = math.clamp(Tartarus.Radius - 1, 1, if ActiveMode == "Blatant" then 14 else 6)

		Notify(OldRadius ~= Tartarus.Radius and ` Radius changed to {Tartarus.Radius}.`)
	elseif Action == "IncreaseLoop" then
		local OldLoop = Tartarus.LoopFrequency
		Tartarus.LoopFrequency = math.clamp(math.floor((Tartarus.LoopFrequency + 0.05) * 100 + 0.5) / 100, 0.05, 0.5)

		Notify(OldLoop ~= Tartarus.LoopFrequency and ` Loop Frequency changed to {Tartarus.LoopFrequency}.`)
	elseif Action == "DecreaseLoop" then
		local OldLoop = Tartarus.LoopFrequency
		Tartarus.LoopFrequency = math.clamp(math.floor((Tartarus.LoopFrequency - 0.05) * 100 + 0.5) / 100, 0.05, 0.5)

		Notify(OldLoop ~= Tartarus.LoopFrequency and ` Loop Frequency changed to {Tartarus.LoopFrequency}.`)
	elseif Action == "Shutdown" then
		for Ind, Conn in pairs(Connections) do
			Conn:Disconnect()
			Connections[Ind] = nil
		end
	elseif Action == "ToggleNotifs" then
		Tartarus.ShowNotifications = not Tartarus.ShowNotifications

		Notify(`Notifications will {Tartarus.ShowNotifications and "" or "NOT"} be shown.`)
	end
end

--Hooking / Connection Spoofing
local OldNameCall
OldNameCall = hookmetamethod(game, "__namecall", function(...)
	local Method = getnamecallmethod()
	local Args = { ... }

	if tostring(Method) == "GetLogHistory" then
		return {}
	end

	if tostring(Method) == "GetTouchingParts" then
		return {}
	end

	return OldNameCall(...)
end)

--Core
Connections.CoreLoop = RunService.RenderStepped:Connect(function()
	if not ((tick() - LastLoop) >= Tartarus.LoopFrequency) then
		return
	end

	if not Tartarus.Active then
		return
	end

	local Handle = Players.LocalPlayer.Character
		and Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
		and Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle")
	if not Handle then
		return
	end

	if ActiveMode == "Blatant" then
		for _, Player in pairs(GetPlayersInRange(math.clamp(Tartarus.Radius, 1, 14))) do
			if not Player.Character then
				continue
			end

			if IsTeam(Player) then
				continue
			end

			for _, Part in pairs(Player.Character:GetChildren()) do
				if not table.find(WhitelistedLimbs, Part.Name) then
					continue
				end

				firetouchinterest(Part, Handle, 0)
				firetouchinterest(Part, Handle, 1)

				local Fakes = GetFakes(Handle)
				if Fakes then
					for _, Fake in pairs(Fakes) do
						firetouchinterest(Part, Fake, 0)
						firetouchinterest(Part, Fake, 1)
					end
				end
			end
		end
	elseif ActiveMode == "Closet" then
		for _, Player in pairs(GetPlayersInRangeAndFOV(math.clamp(Tartarus.Radius, 1, 6))) do
			if not Player.Character then
				continue
			end

			if IsTeam(Player) then
				continue
			end

			if not Player == GetClosestPlayer() then
				continue
			end

			for _, Part in pairs(Player.Character:GetChildren()) do
				if not table.find(WhitelistedLimbs, Part.Name) then
					continue
				end

				firetouchinterest(Part, Handle, 0)
				firetouchinterest(Part, Handle, 1)

				local Fakes = GetFakes(Handle)
				if Fakes then
					for _, Fake in pairs(Fakes) do
						firetouchinterest(Part, Fake, 0)
						firetouchinterest(Part, Fake, 1)
					end
				end
			end
		end
	elseif ActiveMode == "AMP" then
		local TouchingParts = workspace:GetPartBoundsInBox(Handle.CFrame, Handle.Size, TouchingOverlapParams)
		for _, Part in pairs(TouchingParts) do
			if table.find(WhitelistedLimbs, Part.Name) then
				if not Players:GetPlayerFromCharacter(Part.Parent) then
					continue
				end

				if Part.Parent == Players.LocalPlayer.Character then
					continue
				end

				for _ = 1, 10 do
					firetouchinterest(Part, Handle, 0)
					firetouchinterest(Part, Handle, 1)

					local Fakes = GetFakes(Handle)
					if Fakes then
						for _, Fake in pairs(Fakes) do
							firetouchinterest(Part, Fake, 0)
							firetouchinterest(Part, Fake, 1)
						end
					end
				end
			end
		end
	end

	LastLoop = tick()
end)

Connections.KeyListener = UserInputService.InputEnded:Connect(function(Input, GPE)
	if GPE then
		return
	end

	if Input.UserInputType == Enum.UserInputType.Keyboard then
		local IsCtrl = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
			or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)

		local Action = Tartarus.Keybinds[IsCtrl and "CTRL" or "Normal"][Input.KeyCode]
		if not Action then
			return
		end

		ProcessAction(Action)
	end
end)

--LOAD
getgenv().Tartarus = Tartarus
Notify("Initialized | Created by SpiralAPI")
