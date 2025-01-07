local FFA = true
local toggle = true

wait(5)

local PlayerService = game:GetService("Players")
local Run = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = PlayerService.LocalPlayer

local SmallestPart
local SmallestMagnitude = math.huge

local function TeamMateIndictator(Player)
    if Player.Team == LocalPlayer.Team then
        return not FFA
    end

    return false
end

local function Notify(Info)
    StarterGui:SetCore("SendNotification", {Title = "Cheats", Text = Info})
end

local function FindRightGrip(Character)
    local RightArm = Character:FindFirstChild("Right Arm")

    return RightArm and RightArm:FindFirstChild("RightGrip")
end


for i, Part in pairs(workspace:GetDescendants()) do
    if Part:IsA("BasePart") and Part~=workspace.Terrain and Part.Anchored then
        local PartSizeMagnitude = Part.Size.Magnitude

        if SmallestMagnitude >= PartSizeMagnitude then
            SmallestPart = Part
            SmallestMagnitude = PartSizeMagnitude
        end 
    end
end

local SavedSmallPart = {
    SmallestPart.Position,
    SmallestPart.Size,
    SmallestPart.Transparency
}

SmallestPart.Size = Vector3.new(2, 2, 1)
SmallestPart.Transparency = 1

Notify(tostring(toggle))

UIS.InputBegan:Connect(function(Input, gpe)
    if Input.KeyCode == Enum.KeyCode.K and not gpe then
        toggle = not toggle

        Notify(tostring(toggle))

        if toggle then
            SmallestPart.Size = Vector3.new(2, 2, 1)
            SmallestPart.Transparency = 1
        else
            SmallestPart.Position = SavedSmallPart[1]
            SmallestPart.Size = SavedSmallPart[2]
            SmallestPart.Transparency = SavedSmallPart[3]
        end
    end
end)

Run.Stepped:Connect(function()
    local Character = LocalPlayer.Character

    local HRP = Character and Character.HumanoidRootPart

    if HRP and toggle then
        local ClosetDistance = math.huge
        local TargetHRP

        for i, Player in pairs(PlayerService:GetPlayers()) do
            if Player == LocalPlayer then continue end

            --AMP

            local Opponent_Character = Player.Character
            local Opponent_HRP = Opponent_Character and Opponent_Character:FindFirstChild("HumanoidRootPart") 
            local Distance = Opponent_HRP and Opponent_HRP.Position - HRP.Position

            if not TeamMateIndictator(Player) and Distance.Magnitude < ClosetDistance then
                ClosetDistance = Distance.Magnitude
                TargetHRP = Opponent_HRP
            end            
        end

        if TargetHRP then
            SmallestPart.Position = TargetHRP.Position 
        end
    end
end)


while Run.Stepped:Wait() do
    if not toggle then continue end

    for i, Player in pairs(PlayerService:GetPlayers()) do
        if LocalPlayer == Player then continue end

        local Character = Player.Character

        local RightArm = Character and Character:FindFirstChild("Right Arm")

        local RightGrip = RightArm and RightArm:FindFirstChild("RightGrip")

        if RightGrip then
            local Tool = RightGrip.Part1.Parent

            Tool.Parent = Player.Backpack
            RightGrip.Parent = nil

            Run.RenderStepped:Wait()

            if Tool.Parent then
                Tool.Parent = Player.Character
                RightGrip.Parent = RightArm 
            end
        end
    end
end
