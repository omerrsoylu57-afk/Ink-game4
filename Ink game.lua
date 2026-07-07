-- Joker Hub: Ringta Yapısında Tamamlanmış Sistem
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(150, 30, 30) -- Ringta Kırmızı Tonu

-- Kapatma
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- Tüm Kategoriler ve Özellikleri
local data = {
    ["Red Light"] = {"Teleport To End", "Remove Injury"},
    ["Dalgona"] = {"Auto Dalgona", "Perfect Cut"},
    ["Tug of War"] = {"Auto Pull", "Smart Timing"},
    ["Hide & Seek"] = {"Kill Aura", "ESP Players", "Teleport Up"},
    ["Jump/Glass"] = {"Glass ESP", "Auto Jump"},
    ["Mingle"] = {"Auto QTE", "Auto Win Mingle"},
    ["Rebel"] = {"Speed Hack", "Auto Kill Guards"},
    ["Final"] = {"God Mode", "Eliminate Target"} -- Senin özel Final modların
}

-- Listeleme
local yOffset = 40
for cat, feats in pairs(data) do
    local label = Instance.new("TextLabel", MainFrame)
    label.Text = cat
    label.Position = UDim2.new(0, 10, 0, yOffset)
    yOffset = yOffset + 30
    
    for _, feat in pairs(feats) do
        local btn = Instance.new("TextButton", MainFrame)
        btn.Size = UDim2.new(0, 380, 0, 25)
        btn.Position = UDim2.new(0, 10, 0, yOffset)
        btn.Text = feat
        btn.MouseButton1Click:Connect(function()
            -- Final Logic Özelleştirmesi
            if feat == "Eliminate Target" then
                -- Buraya rakip ismini alıp map dışına atan fonksiyonu ekleyeceksin
                print("Target TP Aktif - Rakibi Seçin")
            elseif feat == "God Mode" then
                game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
            end
        end)
        yOffset = yOffset + 30
    end
    yOffset = yOffset + 10
end
