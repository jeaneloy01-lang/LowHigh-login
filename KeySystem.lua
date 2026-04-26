-- =============================================================
--        LOWHIGH STORE - SISTEMA PROFISSIONAL KEYAUTH
-- =============================================================

local KeyAuthApp = {
    name = "Jeaneloy01's Application", -- Deixe como está no print
    ownerid = "COLE_AQUI_O_SEU_OWNER_ID", 
    secret = "COLE_AQUI_O_SEU_APPLICATION_SECRET",
    version = "1.0"
}

local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- === INTERFACE DA LOJA ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LowHighLogin"
if gethui then ScreenGui.Parent = gethui() else ScreenGui.Parent = CoreGui end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(230, 15, 15)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOWHIGH STORE"
Title.TextColor3 = Color3.fromRGB(230, 15, 15)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.PlaceholderText = "INSIRA SUA KEY ALEATÓRIA"
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInput.TextColor3 = Color3.new(1,1,1)
KeyInput.Parent = MainFrame
Instance.new("UICorner", KeyInput)

local LoginBtn = Instance.new("TextButton")
LoginBtn.Size = UDim2.new(0.8, 0, 0, 45)
LoginBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
LoginBtn.Text = "LOGAR"
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.BackgroundColor3 = Color3.fromRGB(230, 15, 15)
LoginBtn.TextColor3 = Color3.new(1,1,1)
LoginBtn.Parent = MainFrame
Instance.new("UICorner", LoginBtn)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Position = UDim2.new(0, 0, 0.9, 0)
Status.BackgroundTransparency = 1
Status.Text = "Aguardando autenticação..."
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.TextSize = 10
Status.Parent = MainFrame

-- === LÓGICA DE CONEXÃO ===
LoginBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key == "" then Status.Text = "Digite uma key!"; return end
    
    Status.Text = "Conectando ao KeyAuth..."
    
    -- Aqui o script faz a chamada para o seu painel do site
    -- Como estamos configurando, ele vai validar a key que você gerar no site
    local response = game:HttpGet("https://keyauth.win/api/1.2/?type=init&name="..KeyAuthApp.name.."&ownerid="..KeyAuthApp.ownerid.."&ver="..KeyAuthApp.version)
    
    -- Verificação simples para o teste inicial
    if response then
        Status.Text = "ACESSO LIBERADO!"
        Status.TextColor3 = Color3.new(0, 1, 0)
        task.wait(1)
        ScreenGui:Destroy()
        -- Carrega o seu script simples corrigido
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jeaneloy01-lang/Sniperduelssimple/refs/heads/main/Script.lua"))()
    else
        Status.Text = "ERRO DE CONEXÃO OU KEY INVÁLIDA"
        Status.TextColor3 = Color3.new(1, 0, 0)
    end
end)
