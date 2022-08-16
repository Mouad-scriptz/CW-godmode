--made by Mouad#4819
loadstring(game:HttpGet("https://raw.githubusercontent.com/NukinGang/CW-bypass/main/main.lua"))()
	local events = game:GetService("ReplicatedStorage").Communication.Events
	local functions = game:GetService("ReplicatedStorage").Communication.Functions
	local player = game.Players.LocalPlayer
local function spwn()
	for i=1, 2 do
		events.StartFastRespawn:FireServer()
		functions.CompleteFastRespawn:FireServer()
		wait(.1) 
	end
end
local function cad()
	local lp = game:GetService("Players").LocalPlayer
	local ad = game.Workspace.Airdrops
	for _,v in pairs(ad:GetChildren()) do
		local ad = v
		lp.Character.HumanoidRootPart.CFrame = ad:WaitForChild("Crate").Base.CFrame
		wait(.2)
		fireproximityprompt(ad:WaitForChild("Crate").Hitbox.ProximityPrompt)
	end
end
local function bomb()
	events.TakeFallDamage:FireServer(150)
	spwn()
	functions.SpawnCharacter:FireServer()
	wait(1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,0,0))
	wait(0.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,21,0))
	wait(1)
	local chr = game:GetService("Players").LocalPlayer.Character
	if not chr:FindFirstChild("C4") then
		local bc4 = game:GetService("Players").LocalPlayer.Backpack.C4
		bc4.Parent = chr
	end
	if not chr:FindFirstChild("Frag Grenade") then
		local bfg = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Frag Grenade")
		bfg.Parent = chr
	end
	local args = {
		[1] = game:GetService("Players").LocalPlayer.Character.C4,
		[2] = Vector3.new(0, -10000, 0),
		[3] = Vector3.new(0, 0, 0)
	}

	game:GetService("ReplicatedStorage").Communication.Events.ReplicateThrowable:FireServer(unpack(args)) 
	wait(0.1)
	local args1 = {
		[1] = game:GetService("Players").LocalPlayer.Character.C4
	}
	game:GetService("ReplicatedStorage").Communication.Events.DetonateC4:FireServer(unpack(args1))
	local args2 = {
		[1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Frag Grenade"),
		[2] = Vector3.new(0, -10000, 0),
		[3] = Vector3.new(0, 0, 0)
	}
	game:GetService("ReplicatedStorage").Communication.Events.ReplicateThrowable:FireServer(unpack(args2))
	function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
	local args3 = {
		[1] = false,
		[2] = getNil("Frag Grenade", "Tool")
	}
	game:GetService("ReplicatedStorage").Communication.Events.ToggleThrowableFuse:FireServer(unpack(args3))
	local args1 = {
		[1] = game:GetService("Players").LocalPlayer.Character.C4
	}
	game:GetService("ReplicatedStorage").Communication.Events.DetonateC4:FireServer(unpack(args1))
	wait(0.5)
	events.TakeFallDamage:FireServer(150)
	spwn()
end
repeat
	wait(1)
	bomb()
	bp = game:GetService("Players").LocalPlayer:FindFirstChild("Backpack")
	tools = #bp:GetChildren()
until
	tools == 0 and game:GetService("Players").LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
wait(1)
cad()
