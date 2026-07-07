-- Joker Hub: Final Sürüm (Kapatılabilir ve Modüler)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Kapatma Butonu
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- Açma/Kapama için basit bir kısayol (Örn: 'J' tuşu ile açıp kapatma)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.J then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Alt menü oluşturucu (Daha önce yaptığımız gibi)
local function createSubMenu(title, features)
    local SubFrame = Instance.new("Frame", MainFrame)
    SubFrame.Size = UDim2.new(0, 200, 0, 300)
    SubFrame.Position = UDim2.new(1.1, 0, 0, 0)
    SubFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SubFrame.Visible = false
    
    for name, func in pairs(features) do
        local btn = Instance.new("TextButton", SubFrame)
        btn.Size = UDim2.new(0, 180, 0, 30)
        btn.Text = name
        btn.MouseButton1Click:Connect(func)
    end
    return SubFrame
end

-- Tüm Modlar (Eksiksiz liste)
local allMenus = {
    ["Red Light"] = createSubMenu("RLGL Ayarları", {["TP Bitiş"] = function() end, ["Freeze Bypass"] = function() end}),
    ["Dalgona"] = createSubMenu("Dalgona Ayarları", {["Auto Clicker"] = function() end, ["Çakmak"] = function() end}),
    ["Hide Seek"] = createSubMenu("Hide Seek", {["ESP Aç"] = function() end, ["Speed"] = function() end}),
    ["Glass Bridge"] = createSubMenu("Glass Ayarları", {["Doğru Yolu Gör"] = function() end}),
    ["Jump Rope"] = createSubMenu("Jump Rope", {["Auto Jump"] = function() end}),
    ["Tug Of War"] = createSubMenu("Tug Ayarları", {["Auto Click"] = function() end}),
    ["Rebel"] = createSubMenu("Rebel Ayarları", {["Speed Hack"] = function() end}),
    ["Final"] = createSubMenu("Final Ayarları", {["God Mode"] = function() end, ["Target TP"] = function() end})
}

-- Ana butonlar
local count = 0
for name, menu in pairs(allMenus) do
    local btn = Instance.new("TextButton", MainFrame)
    btn.Position = UDim2.new(0, (count % 4) * 120 + 10, 0, math.floor(count / 4) * 50 + 50)
    btn.Size = UDim2.new(0, 110, 0, 40)
    btn.Text = name
    btn.MouseButton1Click:Connect(function()
        for _, m in pairs(allMenus) do m.Visible = false end
        menu.Visible = true
    end)
    count = count + 1
end
