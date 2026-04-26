-- ==============================================================================
--                 LOWHIGH STORE - SISTEMA DE LOGIN
-- ==============================================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- === LISTA DE KEYS ATIVAS ===
local Keys_Ativas = {
    ["Admin123"] = true,
    ["Jean_Premium"] = true,
    ["Teste_24h"] = true
}

-- LINK DO SEU SCRIPT (MANTIVE O SIMPLES COMO BASE)
local Link_Do_Hub = "https://raw.githubusercontent.com/jeaneloy01-lang/Sniperduelssimple/refs/heads/main/Script.lua"

-- === INTERFACE ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LowHighLogin"
if gethui then ScreenGui.Parent = gethui() else ScreenGui.Parent = CoreGui end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 170) -- Aumentei um pouco para caber o nome da loja
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -85)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(230, 15, 15)

-- Nome da Loja no topo
local StoreTitle = Instance.new("TextLabel")
StoreTitle.Size = UDim2.new(1, 0, 0, 30)
StoreTitle.Position = UDim2.new(0, 0, 0, 5)
StoreTitle.BackgroundTransparency = 1
StoreTitle.Text = "LOWHIGH STORE"
StoreTitle.TextColor3 = Color3.fromRGB(230, 15, 15)
StoreTitle.Font = Enum.Font.GothamBold
StoreTitle.TextSize = 16
StoreTitle.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "INSIRA SUA KEY"
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.TextColor3 = Color3.new(1,1,1)
KeyInput.Parent = MainFrame
Instance.new("UICorner", KeyInput)

local LoginBtn = Instance.new("TextButton")
LoginBtn.Size = UDim2.new(0.8, 0, 0, 40)
LoginBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
LoginBtn.Text = "AUTENTICAR"
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.BackgroundColor3 = Color3.fromRGB(230, 15, 15)
LoginBtn.TextColor3 = Color3.new(1,1,1)
LoginBtn.Parent = MainFrame
Instance.new("UICorner", LoginBtn)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0.9, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Aguardando login..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextSize = 10
StatusLabel.Parent = MainFrame

-- === VERIFICAÇÃO ===
LoginBtn.MouseButton1Click:Connect(function()
    if Keys_Ativas[KeyInput.Text] then
        StatusLabel.Text = "ACESSO LIBERADO! BEM-VINDO."
        StatusLabel.TextColor3 = Color3.new(0, 1, 0)
        task.wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet(Link_Do_Hub))()
    else
        StatusLabel.Text = "KEY INVÁLIDA OU EXPIRADA!"
        StatusLabel.TextColor3 = Color3.new(1, 0, 0)
        KeyInput.Text = ""
    end
end)
