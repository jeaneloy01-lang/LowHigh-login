-- [[ SISTEMA DE PROTEÇÃO LOWHIGH STORE ]] --
local KeyAuthApp = loadstring(game:HttpGet("https://raw.githubusercontent.com/KeyAuth/roblox-lua-example/main/KeyAuth.lua"))()

KeyAuthApp:init({
    name = "Jeaneloy01's Application",
    ownerid = "bg8cRvXsrd",
    secret = "803735a5e270d0b55245276f24f541361b0065532fb94760c86688ac90ddb9dd", -- <--- PEGA LÁ NO SITE (SETTINGS) E COLA AQUI!
    version = "1.0"
})

KeyAuthApp:login()

-- Trava de exclusividade: Só entra Level 1
if KeyAuthApp.user_data.subscriptions[1].level ~= "1" then
    game.Players.LocalPlayer:Kick("❌ LowHigh Store: Esta key não é para o Script SIMPLES!")
end

print("Acesso Liberado! Carregando Elite Hub (LowHigh Simples)...")

-- [[ ELITE HUB - SIMPLES ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-up-library/master/gui%20v2"))()
local Window = Library:CreateWindow("LowHigh Store - Simples")

local Main = Window:Folder("Combate")

Main:Button("Ativar Aimbot", function()
    -- Lógica do Aimbot Suave que a gente configurou
    local Camera = workspace.CurrentCamera
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local function GetClosestPlayer()
        local Closest = nil
        local Dist = math.huge
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local Pos, OnScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if Magnitude < Dist then
                        Closest = v
                        Dist = Magnitude
                    end
                end
            end
        end
        return Closest
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        local Target = GetClosestPlayer()
        if Target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Target.Character.Head.Position)
        end
    end)
end)

local Visuals = Window:Folder("Visual")

Visuals:Button("Ativar ESP (Boxes)", function()
    -- Função de ESP que a gente usou do Elite Hub
    loadstring(game:HttpGet("https://raw.githubusercontent.com/p00p-shid/ESP/main/ESP.lua"))()
end)

Main:Label("Use com moderação!", Color3.fromRGB(255, 0, 0))
