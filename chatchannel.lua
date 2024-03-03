local frame = CreateFrame("Frame", "chatChannelFrame", UIParent)
frame:SetPoint("CENTER")
frame:SetMovable(true) -- Робимо рамку рухомою

-- Додаємо обробник подій для захоплення руху
frame:SetScript(
  "OnMouseDown",
  function(self, button)
    if button == "LeftButton" then
      self:StartMoving() -- Починаємо рух рамки
    end
  end
)

-- Додаємо обробник подій для завершення руху
frame:SetScript(
  "OnMouseUp",
  function(self, button)
    if button == "LeftButton" then
      self:StopMovingOrSizing() -- Зупиняємо рух рамки
    end
  end
)

local function CreateButton(name, text, point, relativeFrame, relativePoint, xOffset, yOffset)
  local button = CreateFrame("Button", name, frame, "UIPanelButtonTemplate")
  button:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
  button:SetText(text) -- Встановлення тексту кнопки
  button:SetHeight(button:GetTextHeight() + 16) -- Задаємо висоту кнопки з урахуванням тексту та додаткового простору
  button:SetWidth(button:GetTextWidth() + 24) -- Задаємо ширину кнопки з урахуванням тексту та додаткового простору
  return button
end

local button1 = CreateButton("YourAddonButton1", "Guild", "LEFT", frame, "LEFT", 2, 0)
local button2 = CreateButton("YourAddonButton2", "Party", "LEFT", button1, "RIGHT", 2, 0)
local button3 = CreateButton("YourAddonButton3", "Raid", "LEFT", button2, "RIGHT", 2, 0)

-- Зміна колір тексту кнопок
local function SetButtonTextColor(button, r, g, b)
  local normalFont = button:GetFontString()
  normalFont:SetTextColor(r, g, b)
end

-- SetButtonTextColor(button1, 1, 0, 0) -- Червоний колір тексту для першої кнопки
-- SetButtonTextColor(button2, 0, 1, 0) -- Зелений колір тексту для другої кнопки
-- SetButtonTextColor(button3, 0, 0, 1) -- Синій колір тексту для третьої кнопки

-- Відступи для тексту кнопок
local function SetButtonTextInsets(button, left, right, top, bottom)
  local fontString = button:GetFontString()
  fontString:SetWidth(button:GetWidth() - left - right)
  fontString:SetHeight(button:GetHeight() - top - bottom)
  fontString:SetPoint("TOPLEFT", button, "TOPLEFT", left, -top)
end

-- Встановлення відступів для тексту на кнопках
SetButtonTextInsets(button1, 5, 5, 0, 0)
SetButtonTextInsets(button2, 5, 5, 0, 0)
SetButtonTextInsets(button3, 5, 5, 0, 0)

-- Функції, які виконуються при натисканні на кнопки
button1:SetScript(
  "OnClick",
  function()
    ChatFrame_OpenChat("/g ")
  end
)

button2:SetScript(
  "OnClick",
  function()
    ChatFrame_OpenChat("/p ")
  end
)

button3:SetScript(
  "OnClick",
  function()
    ChatFrame_OpenChat("/raid ")
  end
)

frame:SetSize(
  math.max(button1:GetWidth(), button2:GetWidth(), button3:GetWidth()) + 20,
  button1:GetHeight() + button2:GetHeight() + button3:GetHeight() + 20
) -- визначення та створення розміру основного фрейму

-- frame:SetBackdrop(
--   {
--     bgFile = "Interface\\Buttons\\WHITE8x8", -- Фоновий файл
--     edgeFile = "Interface\\Buttons\\WHITE8x8", -- Файл краю
--     edgeSize = 1 -- Розмір краю
--   }
-- )

-- Встановлюємо колір фону
-- frame:SetBackdropColor(1, 0, 0, 0.5) -- Червоний колір фону з прозорістю 0.5

-- Додаткові налаштування рамки, якщо потрібно
-- frame:SetBackdropBorderColor(0, 0, 0) -- Колір краю рамки (необов'язково)
