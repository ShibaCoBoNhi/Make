local Library = {}

--// Service
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TweenInfo = TweenInfo.new

--// Init
local LocalizationService = game:GetService("LocalizationService");
local http = game:GetService("HttpService");
local LocalPlayer = game:GetService("Players").LocalPlayer;
local NameID = LocalPlayer.Name;
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;

local utility = {};
local Objects = {};

function utility:Tween(instance, properties, duration, ...)
    TweenService:Create(instance, TweenInfo(duration, ...), properties):Play()
end;

local SettingToggle = {}

local Name = "BTConfig.JSON"

pcall(function()
    if not pcall(function() readfile(Name) end) then
    writefile(Name, game:service'HttpService':JSONEncode(SettingToggle))
    end

    Settings = game:service'HttpService':JSONEncode(readfile(Name))
end)

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100));

function Library:ToggleUI()
    if game.CoreGui[LibName].Enabled then
        game.CoreGui[LibName].Enabled = false
    else
        game.CoreGui[LibName].Enabled = true
    end
end

function Library:DestroyGui()
    if game.CoreGui[LibName] then
        game.CoreGui[LibName]:Destroy()
    end
end

function Library:CreateWindow(hubname)

    table.insert(Library, hubname);
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == hubname then
            v:Destroy();
        end;
    end;

    -- Instances:
    local ScreenGui = Instance.new("ScreenGui")
    local Body = Instance.new("Frame")
    local Body_Corner = Instance.new("UICorner")
    local Title_Hub = Instance.new("TextLabel")
    local MInimize_Button = Instance.new("TextButton")
    local Discord = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local Disc_Logo = Instance.new("ImageLabel")
    local Disc_Title = Instance.new("TextLabel")
    local Server_Time = Instance.new("TextLabel")
    local Server_ID = Instance.new("TextLabel")
    local List_Tile = Instance.new("Frame")
    local Tile_Gradient = Instance.new("UIGradient")
    local Toggle = Instance.new("Frame")
    local toggle_corner = Instance.new("UICorner")
    local toggle_Image = Instance.new("ImageButton")

    -- Properties:
    ScreenGui.Name = LibName
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    game:GetService("UserInputService").InputBegan:connect(function(input) 
        if input.KeyCode == Enum.KeyCode.LeftControl then
            Library:ToggleUI()
        end
    end)

    Body.Name = "Body"
    Body.Parent = ScreenGui
    Body.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Body.BorderColor3 = Color3.fromRGB()
    Body.BorderSizePixel = 0
    Body.Position = UDim2.new(0.258427024, 0, 0.217948765, 0)
    Body.Size = UDim2.new(0, 600, 0, 350)
    Body.ClipsDescendants = true

    Body_Corner.CornerRadius = UDim.new(0, 5)
    Body_Corner.Name = "Body_Corner"
    Body_Corner.Parent = Body

    Title_Hub.Name = "Title_Hub"
    Title_Hub.Parent = Body
    Title_Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Hub.BackgroundTransparency = 1.000
    Title_Hub.BorderColor3 = Color3.fromRGB(40,40,40)
    Title_Hub.BorderSizePixel = 0
    Title_Hub.Position = UDim2.new(0, 6, 0, 0)
    Title_Hub.Size = UDim2.new(0, 558, 0, 30)
    Title_Hub.Font = Enum.Font.BuilderSansMediumBold
    Title_Hub.Text = hubname
    Title_Hub.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_Hub.TextSize = 15.000
    Title_Hub.TextXAlignment = Enum.TextXAlignment.Left

    MInimize_Button.Name = "MInimize_Button"
    MInimize_Button.Parent = Body
    MInimize_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MInimize_Button.BackgroundTransparency = 1.000
    MInimize_Button.BorderColor3 = Color3.fromRGB()
    MInimize_Button.BorderSizePixel = 0
    MInimize_Button.Position = UDim2.new(0, 568, 0, 0)
    MInimize_Button.Rotation = -315
    MInimize_Button.Size = UDim2.new(0, 30, 0, 30)
    MInimize_Button.AutoButtonColor = false
    MInimize_Button.Font = Enum.Font.BuilderSansMedium
    MInimize_Button.Text = "+"
    MInimize_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    MInimize_Button.TextSize = 40.000
    MInimize_Button.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

    Discord.Name = "Discord"
    Discord.Parent = Body
    Discord.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Discord.BorderColor3 = Color3.fromRGB()
    Discord.BorderSizePixel = 0
    Discord.Position = UDim2.new(0, 245, 0, 320)
    Discord.Size = UDim2.new(0, 85, 0, 25)
    Discord.AutoButtonColor = false
    Discord.Font = Enum.Font.BuilderSansMedium
    Discord.Text = ""
    Discord.TextColor3 = Color3.fromRGB()
    Discord.TextSize = 14.000

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Discord

    Disc_Logo.Name = "Disc_Logo"
    Disc_Logo.Parent = Discord
    Disc_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Logo.BackgroundTransparency = 1.000
    Disc_Logo.BorderColor3 = Color3.fromRGB()
    Disc_Logo.BorderSizePixel = 0
    Disc_Logo.Position = UDim2.new(0, 5, 0, 1)
    Disc_Logo.Size = UDim2.new(0, 23, 0, 23)
    Disc_Logo.Image = "http://www.roblox.com/asset/?id=12058969086"

    Disc_Title.Name = "Disc_Title"
    Disc_Title.Parent = Discord
    Disc_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Title.BackgroundTransparency = 1.000
    Disc_Title.BorderColor3 = Color3.fromRGB()
    Disc_Title.BorderSizePixel = 0
    Disc_Title.Position = UDim2.new(0, 35, 0, 0)
    Disc_Title.Size = UDim2.new(0, 40, 0, 25)
    Disc_Title.Font = Enum.Font.BuilderSansMedium
    Disc_Title.Text = "Discord"
    Disc_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Title.TextSize = 14.000
    Disc_Title.TextXAlignment = Enum.TextXAlignment.Left

    Discord.MouseEnter:Connect(function()
        utility:Tween(Discord, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
        utility:Tween(Disc_Logo, {ImageTransparency = 0.7}, .15)
        utility:Tween(Disc_Title, {TextTransparency = 0.7}, .15)
    end)

    Discord.MouseLeave:connect(function()
        utility:Tween(Discord, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15)
        utility:Tween(Disc_Logo, {ImageTransparency = 0}, .15)
        utility:Tween(Disc_Title, {TextTransparency = 0}, .15)
    end)

    Discord.MouseButton1Click:Connect(function()
        (setclipboard or toclipboard)("https://discord.gg/6dpgANRc3k")
        wait(.1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Discord",
            Text = "copied Matune hub server link",
            Button1 = "Okay",
            Duration = 20
        })
    end)

    Server_Time.Name = "Server_Time"
    Server_Time.Parent = Body
    Server_Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Server_Time.BackgroundTransparency = 1.000
    Server_Time.BorderColor3 = Color3.fromRGB()
    Server_Time.BorderSizePixel = 0
    Server_Time.Position = UDim2.new(0, 230, 0, 0)
    Server_Time.Size = UDim2.new(0, 120, 0, 25)
    Server_Time.Font = Enum.Font.BuilderSansMedium
    Server_Time.Text = ""
    Server_Time.TextColor3 = Color3.fromRGB(255, 255, 255)
    Server_Time.TextSize = 14.000
    Server_Time.TextXAlignment = Enum.TextXAlignment.Left

    local ServerTimeFunc = {};
    function ServerTimeFunc:Refresh(textadd)
        Server_Time.Text = textadd;
    end;

    function UpdateOS()
        local date = os.date("*t")
        local hour = (date.hour) % 24
        local ampm = hour < 24 and "PM" or "AM"
        local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
        local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
        local LocalizationService = game:GetService("LocalizationService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local name = player.Name
        local result, code = pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
        end)
       ServerTimeFunc:Refresh(datetime.." - "..timezone.." [" .. code .. "]")
       end
      spawn(function()
      while true do
      UpdateOS()
       game:GetService("RunService").RenderStepped:Wait()
      end
      end)

    spawn(function()
        while game:GetService('RunService').Heartbeat:Wait() do
            UpdateTime()
        end
    end)

    Server_ID.Name = "Server_ID"
    Server_ID.Parent = Body
    Server_ID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Server_ID.BackgroundTransparency = 1.000
    Server_ID.BorderColor3 = Color3.fromRGB()
    Server_ID.BorderSizePixel = 0
    Server_ID.Position = UDim2.new(0, 999999999799, 0, 0)
    Server_ID.Size = UDim2.new(0, 365, 0, 25)
    Server_ID.Font = Enum.Font.BuilderSansMedium
    Server_ID.Text = "User : " .. NameID .. "     [CTRL = Hide Gui]";
    Server_ID.TextColor3 = Color3.fromRGB(255, 255, 255)
    Server_ID.TextSize = 14.000
    Server_ID.TextXAlignment = Enum.TextXAlignment.Right

    List_Tile.Name = "List_Tile"
    List_Tile.Parent = Body
    List_Tile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    List_Tile.BorderColor3 = Color3.fromRGB()
    List_Tile.BorderSizePixel = 0
    List_Tile.Position = UDim2.new(0, 0, 0, 30)
    List_Tile.Size = UDim2.new(1, 0, 0, 2)

    Tile_Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB()),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB()),
    })
    Tile_Gradient.Name = "Tile_Gradient"
    Tile_Gradient.Parent = List_Tile
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------      
local IconMapping = {
  ["lucide-accessibility"] = "rbxassetid://10709751939",
  ["lucide-activity"] = "rbxassetid://10709752035",
  ["lucide-air-vent"] = "rbxassetid://10709752131",
  ["lucide-airplay"] = "rbxassetid://10709752254",
  ["lucide-alarm-check"] = "rbxassetid://10709752405",
  ["lucide-alarm-clock"] = "rbxassetid://10709752630",
  ["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
  ["lucide-alarm-minus"] = "rbxassetid://10709752732",
  ["lucide-alarm-plus"] = "rbxassetid://10709752825",
  ["lucide-album"] = "rbxassetid://10709752906",
  ["lucide-alert-circle"] = "rbxassetid://10709752996",
  ["lucide-alert-octagon"] = "rbxassetid://10709753064",
  ["lucide-alert-triangle"] = "rbxassetid://10709753149",
  ["lucide-align-center"] = "rbxassetid://10709753570",
  ["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
  ["lucide-align-center-vertical"] = "rbxassetid://10709753421",
  ["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
  ["lucide-align-end-vertical"] = "rbxassetid://10709753808",
  ["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
  ["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
  ["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
  ["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
  ["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
  ["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
  ["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
  ["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
  ["lucide-align-justify"] = "rbxassetid://10709759610",
  ["lucide-align-left"] = "rbxassetid://10709759764",
  ["lucide-align-right"] = "rbxassetid://10709759895",
  ["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
  ["lucide-align-start-vertical"] = "rbxassetid://10709760244",
  ["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
  ["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
  ["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
  ["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
  ["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
  ["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
  ["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
  ["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
  ["lucide-anchor"] = "rbxassetid://10709761530",
  ["lucide-angry"] = "rbxassetid://10709761629",
  ["lucide-annoyed"] = "rbxassetid://10709761722",
  ["lucide-aperture"] = "rbxassetid://10709761813",
  ["lucide-apple"] = "rbxassetid://10709761889",
  ["lucide-archive"] = "rbxassetid://10709762233",
  ["lucide-archive-restore"] = "rbxassetid://10709762058",
  ["lucide-armchair"] = "rbxassetid://10709762327",
  ["lucide-arrow-big-down"] = "rbxassetid://10747796644",
  ["lucide-arrow-big-left"] = "rbxassetid://10709762574",
  ["lucide-arrow-big-right"] = "rbxassetid://10709762727",
  ["lucide-arrow-big-up"] = "rbxassetid://10709762879",
  ["lucide-arrow-down"] = "rbxassetid://10709767827",
  ["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
  ["lucide-arrow-down-left"] = "rbxassetid://10709767656",
  ["lucide-arrow-down-right"] = "rbxassetid://10709767750",
  ["lucide-arrow-left"] = "rbxassetid://10709768114",
  ["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
  ["lucide-arrow-left-right"] = "rbxassetid://10709768019",
  ["lucide-arrow-right"] = "rbxassetid://10709768347",
  ["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
  ["lucide-arrow-up"] = "rbxassetid://10709768939",
  ["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
  ["lucide-arrow-up-down"] = "rbxassetid://10709768538",
  ["lucide-arrow-up-left"] = "rbxassetid://10709768661",
  ["lucide-arrow-up-right"] = "rbxassetid://10709768787",
  ["lucide-asterisk"] = "rbxassetid://10709769095",
  ["lucide-at-sign"] = "rbxassetid://10709769286",
  ["lucide-award"] = "rbxassetid://10709769406",
  ["lucide-axe"] = "rbxassetid://10709769508",
  ["lucide-axis-3d"] = "rbxassetid://10709769598",
  ["lucide-baby"] = "rbxassetid://10709769732",
  ["lucide-backpack"] = "rbxassetid://10709769841",
  ["lucide-baggage-claim"] = "rbxassetid://10709769935",
  ["lucide-banana"] = "rbxassetid://10709770005",
  ["lucide-banknote"] = "rbxassetid://10709770178",
  ["lucide-bar-chart"] = "rbxassetid://10709773755",
  ["lucide-bar-chart-2"] = "rbxassetid://10709770317",
  ["lucide-bar-chart-3"] = "rbxassetid://10709770431",
  ["lucide-bar-chart-4"] = "rbxassetid://10709770560",
  ["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
  ["lucide-barcode"] = "rbxassetid://10747360675",
  ["lucide-baseline"] = "rbxassetid://10709773863",
  ["lucide-bath"] = "rbxassetid://10709773963",
  ["lucide-battery"] = "rbxassetid://10709774640",
  ["lucide-battery-charging"] = "rbxassetid://10709774068",
  ["lucide-battery-full"] = "rbxassetid://10709774206",
  ["lucide-battery-low"] = "rbxassetid://10709774370",
  ["lucide-battery-medium"] = "rbxassetid://10709774513",
  ["lucide-beaker"] = "rbxassetid://10709774756",
  ["lucide-bed"] = "rbxassetid://10709775036",
  ["lucide-bed-double"] = "rbxassetid://10709774864",
  ["lucide-bed-single"] = "rbxassetid://10709774968",
  ["lucide-beer"] = "rbxassetid://10709775167",
  ["lucide-bell"] = "rbxassetid://10709775704",
  ["lucide-bell-minus"] = "rbxassetid://10709775241",
  ["lucide-bell-off"] = "rbxassetid://10709775320",
  ["lucide-bell-plus"] = "rbxassetid://10709775448",
  ["lucide-bell-ring"] = "rbxassetid://10709775560",
  ["lucide-bike"] = "rbxassetid://10709775894",
  ["lucide-binary"] = "rbxassetid://10709776050",
  ["lucide-bitcoin"] = "rbxassetid://10709776126",
  ["lucide-bluetooth"] = "rbxassetid://10709776655",
  ["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
  ["lucide-bluetooth-off"] = "rbxassetid://10709776344",
  ["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
  ["lucide-bold"] = "rbxassetid://10747813908",
  ["lucide-bomb"] = "rbxassetid://10709781460",
  ["lucide-bone"] = "rbxassetid://10709781605",
  ["lucide-book"] = "rbxassetid://10709781824",
  ["lucide-book-open"] = "rbxassetid://10709781717",
  ["lucide-bookmark"] = "rbxassetid://10709782154",
  ["lucide-bookmark-minus"] = "rbxassetid://10709781919",
  ["lucide-bookmark-plus"] = "rbxassetid://10709782044",
  ["lucide-bot"] = "rbxassetid://10709782230",
  ["lucide-box"] = "rbxassetid://10709782497",
  ["lucide-box-select"] = "rbxassetid://10709782342",
  ["lucide-boxes"] = "rbxassetid://10709782582",
  ["lucide-briefcase"] = "rbxassetid://10709782662",
  ["lucide-brush"] = "rbxassetid://10709782758",
  ["lucide-bug"] = "rbxassetid://10709782845",
  ["lucide-building"] = "rbxassetid://10709783051",
  ["lucide-building-2"] = "rbxassetid://10709782939",
  ["lucide-bus"] = "rbxassetid://10709783137",
  ["lucide-cake"] = "rbxassetid://10709783217",
  ["lucide-calculator"] = "rbxassetid://10709783311",
  ["lucide-calendar"] = "rbxassetid://10709789505",
  ["lucide-calendar-check"] = "rbxassetid://10709783474",
  ["lucide-calendar-check-2"] = "rbxassetid://10709783392",
  ["lucide-calendar-clock"] = "rbxassetid://10709783577",
  ["lucide-calendar-days"] = "rbxassetid://10709783673",
  ["lucide-calendar-heart"] = "rbxassetid://10709783835",
  ["lucide-calendar-minus"] = "rbxassetid://10709783959",
  ["lucide-calendar-off"] = "rbxassetid://10709788784",
  ["lucide-calendar-plus"] = "rbxassetid://10709788937",
  ["lucide-calendar-range"] = "rbxassetid://10709789053",
  ["lucide-calendar-search"] = "rbxassetid://10709789200",
  ["lucide-calendar-x"] = "rbxassetid://10709789407",
  ["lucide-calendar-x-2"] = "rbxassetid://10709789329",
  ["lucide-camera"] = "rbxassetid://10709789686",
  ["lucide-camera-off"] = "rbxassetid://10747822677",
  ["lucide-car"] = "rbxassetid://10709789810",
  ["lucide-carrot"] = "rbxassetid://10709789960",
  ["lucide-cast"] = "rbxassetid://10709790097",
  ["lucide-charge"] = "rbxassetid://10709790202",
  ["lucide-check"] = "rbxassetid://10709790644",
  ["lucide-check-circle"] = "rbxassetid://10709790387",
  ["lucide-check-circle-2"] = "rbxassetid://10709790298",
  ["lucide-check-square"] = "rbxassetid://10709790537",
  ["lucide-chef-hat"] = "rbxassetid://10709790757",
  ["lucide-cherry"] = "rbxassetid://10709790875",
  ["lucide-chevron-down"] = "rbxassetid://10709790948",
  ["lucide-chevron-first"] = "rbxassetid://10709791015",
  ["lucide-chevron-last"] = "rbxassetid://10709791130",
  ["lucide-chevron-left"] = "rbxassetid://10709791281",
  ["lucide-chevron-right"] = "rbxassetid://10709791437",
  ["lucide-chevron-up"] = "rbxassetid://10709791523",
  ["lucide-chevrons-down"] = "rbxassetid://10709796864",
  ["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
  ["lucide-chevrons-left"] = "rbxassetid://10709797151",
  ["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
  ["lucide-chevrons-right"] = "rbxassetid://10709797382",
  ["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
  ["lucide-chevrons-up"] = "rbxassetid://10709797622",
  ["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
  ["lucide-chrome"] = "rbxassetid://10709797725",
  ["lucide-circle"] = "rbxassetid://10709798174",
  ["lucide-circle-dot"] = "rbxassetid://10709797837",
  ["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
  ["lucide-circle-slashed"] = "rbxassetid://10709798100",
  ["lucide-citrus"] = "rbxassetid://10709798276",
  ["lucide-clapperboard"] = "rbxassetid://10709798350",
  ["lucide-clipboard"] = "rbxassetid://10709799288",
  ["lucide-clipboard-check"] = "rbxassetid://10709798443",
  ["lucide-clipboard-copy"] = "rbxassetid://10709798574",
  ["lucide-clipboard-edit"] = "rbxassetid://10709798682",
  ["lucide-clipboard-list"] = "rbxassetid://10709798792",
  ["lucide-clipboard-signature"] = "rbxassetid://10709798890",
  ["lucide-clipboard-type"] = "rbxassetid://10709798999",
  ["lucide-clipboard-x"] = "rbxassetid://10709799124",
  ["lucide-clock"] = "rbxassetid://10709805144",
  ["lucide-clock-1"] = "rbxassetid://10709799535",
  ["lucide-clock-10"] = "rbxassetid://10709799718",
  ["lucide-clock-11"] = "rbxassetid://10709799818",
  ["lucide-clock-12"] = "rbxassetid://10709799962",
  ["lucide-clock-2"] = "rbxassetid://10709803876",
  ["lucide-clock-3"] = "rbxassetid://10709803989",
  ["lucide-clock-4"] = "rbxassetid://10709804164",
  ["lucide-clock-5"] = "rbxassetid://10709804291",
  ["lucide-clock-6"] = "rbxassetid://10709804435",
  ["lucide-clock-7"] = "rbxassetid://10709804599",
  ["lucide-clock-8"] = "rbxassetid://10709804784",
  ["lucide-clock-9"] = "rbxassetid://10709804996",
  ["lucide-cloud"] = "rbxassetid://10709806740",
  ["lucide-cloud-cog"] = "rbxassetid://10709805262",
  ["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
  ["lucide-cloud-fog"] = "rbxassetid://10709805477",
  ["lucide-cloud-hail"] = "rbxassetid://10709805596",
  ["lucide-cloud-lightning"] = "rbxassetid://10709805727",
  ["lucide-cloud-moon"] = "rbxassetid://10709805942",
  ["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
  ["lucide-cloud-off"] = "rbxassetid://10709806060",
  ["lucide-cloud-rain"] = "rbxassetid://10709806277",
  ["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
  ["lucide-cloud-snow"] = "rbxassetid://10709806374",
  ["lucide-cloud-sun"] = "rbxassetid://10709806631",
  ["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
  ["lucide-cloudy"] = "rbxassetid://10709806859",
  ["lucide-clover"] = "rbxassetid://10709806995",
  ["lucide-code"] = "rbxassetid://10709810463",
  ["lucide-code-2"] = "rbxassetid://10709807111",
  ["lucide-codepen"] = "rbxassetid://10709810534",
  ["lucide-codesandbox"] = "rbxassetid://10709810676",
  ["lucide-coffee"] = "rbxassetid://10709810814",
  ["lucide-cog"] = "rbxassetid://10709810948",
  ["lucide-coins"] = "rbxassetid://10709811110",
  ["lucide-columns"] = "rbxassetid://10709811261",
  ["lucide-command"] = "rbxassetid://10709811365",
  ["lucide-compass"] = "rbxassetid://10709811445",
  ["lucide-component"] = "rbxassetid://10709811595",
  ["lucide-concierge-bell"] = "rbxassetid://10709811706",
  ["lucide-connection"] = "rbxassetid://10747361219",
  ["lucide-contact"] = "rbxassetid://10709811834",
  ["lucide-contrast"] = "rbxassetid://10709811939",
  ["lucide-cookie"] = "rbxassetid://10709812067",
  ["lucide-copy"] = "rbxassetid://10709812159",
  ["lucide-copyleft"] = "rbxassetid://10709812251",
  ["lucide-copyright"] = "rbxassetid://10709812311",
  ["lucide-corner-down-left"] = "rbxassetid://10709812396",
  ["lucide-corner-down-right"] = "rbxassetid://10709812485",
  ["lucide-corner-left-down"] = "rbxassetid://10709812632",
  ["lucide-corner-left-up"] = "rbxassetid://10709812784",
  ["lucide-corner-right-down"] = "rbxassetid://10709812939",
  ["lucide-corner-right-up"] = "rbxassetid://10709813094",
  ["lucide-corner-up-left"] = "rbxassetid://10709813185",
  ["lucide-corner-up-right"] = "rbxassetid://10709813281",
  ["lucide-cpu"] = "rbxassetid://10709813383",
  ["lucide-croissant"] = "rbxassetid://10709818125",
  ["lucide-crop"] = "rbxassetid://10709818245",
  ["lucide-cross"] = "rbxassetid://10709818399",
  ["lucide-crosshair"] = "rbxassetid://10709818534",
  ["lucide-crown"] = "rbxassetid://10709818626",
  ["lucide-cup-soda"] = "rbxassetid://10709818763",
  ["lucide-curly-braces"] = "rbxassetid://10709818847",
  ["lucide-currency"] = "rbxassetid://10709818931",
  ["lucide-database"] = "rbxassetid://10709818996",
  ["lucide-delete"] = "rbxassetid://10709819059",
  ["lucide-diamond"] = "rbxassetid://10709819149",
  ["lucide-dice-1"] = "rbxassetid://10709819266",
  ["lucide-dice-2"] = "rbxassetid://10709819361",
  ["lucide-dice-3"] = "rbxassetid://10709819508",
  ["lucide-dice-4"] = "rbxassetid://10709819670",
  ["lucide-dice-5"] = "rbxassetid://10709819801",
  ["lucide-dice-6"] = "rbxassetid://10709819896",
  ["lucide-dices"] = "rbxassetid://10723343321",
  ["lucide-diff"] = "rbxassetid://10723343416",
  ["lucide-disc"] = "rbxassetid://10723343537",
  ["lucide-divide"] = "rbxassetid://10723343805",
  ["lucide-divide-circle"] = "rbxassetid://10723343636",
  ["lucide-divide-square"] = "rbxassetid://10723343737",
  ["lucide-dollar-sign"] = "rbxassetid://10723343958",
  ["lucide-download"] = "rbxassetid://10723344270",
  ["lucide-download-cloud"] = "rbxassetid://10723344088",
  ["lucide-droplet"] = "rbxassetid://10723344432",
  ["lucide-droplets"] = "rbxassetid://10734883356",
  ["lucide-drumstick"] = "rbxassetid://10723344737",
  ["lucide-edit"] = "rbxassetid://10734883598",
  ["lucide-edit-2"] = "rbxassetid://10723344885",
  ["lucide-edit-3"] = "rbxassetid://10723345088",
  ["lucide-egg"] = "rbxassetid://10723345518",
  ["lucide-egg-fried"] = "rbxassetid://10723345347",
  ["lucide-electricity"] = "rbxassetid://10723345749",
  ["lucide-electricity-off"] = "rbxassetid://10723345643",
  ["lucide-equal"] = "rbxassetid://10723345990",
  ["lucide-equal-not"] = "rbxassetid://10723345866",
  ["lucide-eraser"] = "rbxassetid://10723346158",
  ["lucide-euro"] = "rbxassetid://10723346372",
  ["lucide-expand"] = "rbxassetid://10723346553",
  ["lucide-external-link"] = "rbxassetid://10723346684",
  ["lucide-eye"] = "rbxassetid://10723346959",
  ["lucide-eye-off"] = "rbxassetid://10723346871",
  ["lucide-factory"] = "rbxassetid://10723347051",
  ["lucide-fan"] = "rbxassetid://10723354359",
  ["lucide-fast-forward"] = "rbxassetid://10723354521",
  ["lucide-feather"] = "rbxassetid://10723354671",
  ["lucide-figma"] = "rbxassetid://10723354801",
  ["lucide-file"] = "rbxassetid://10723374641",
  ["lucide-file-archive"] = "rbxassetid://10723354921",
  ["lucide-file-audio"] = "rbxassetid://10723355148",
  ["lucide-file-audio-2"] = "rbxassetid://10723355026",
  ["lucide-file-axis-3d"] = "rbxassetid://10723355272",
  ["lucide-file-badge"] = "rbxassetid://10723355622",
  ["lucide-file-badge-2"] = "rbxassetid://10723355451",
  ["lucide-file-bar-chart"] = "rbxassetid://10723355887",
  ["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
  ["lucide-file-box"] = "rbxassetid://10723355989",
  ["lucide-file-check"] = "rbxassetid://10723356210",
  ["lucide-file-check-2"] = "rbxassetid://10723356100",
  ["lucide-file-clock"] = "rbxassetid://10723356329",
  ["lucide-file-code"] = "rbxassetid://10723356507",
  ["lucide-file-cog"] = "rbxassetid://10723356830",
  ["lucide-file-cog-2"] = "rbxassetid://10723356676",
  ["lucide-file-diff"] = "rbxassetid://10723357039",
  ["lucide-file-digit"] = "rbxassetid://10723357151",
  ["lucide-file-down"] = "rbxassetid://10723357322",
  ["lucide-file-edit"] = "rbxassetid://10723357495",
  ["lucide-file-heart"] = "rbxassetid://10723357637",
  ["lucide-file-image"] = "rbxassetid://10723357790",
  ["lucide-file-input"] = "rbxassetid://10723357933",
  ["lucide-file-json"] = "rbxassetid://10723364435",
  ["lucide-file-json-2"] = "rbxassetid://10723364361",
  ["lucide-file-key"] = "rbxassetid://10723364605",
  ["lucide-file-key-2"] = "rbxassetid://10723364515",
  ["lucide-file-line-chart"] = "rbxassetid://10723364725",
  ["lucide-file-lock"] = "rbxassetid://10723364957",
  ["lucide-file-lock-2"] = "rbxassetid://10723364861",
  ["lucide-file-minus"] = "rbxassetid://10723365254",
  ["lucide-file-minus-2"] = "rbxassetid://10723365086",
  ["lucide-file-output"] = "rbxassetid://10723365457",
  ["lucide-file-pie-chart"] = "rbxassetid://10723365598",
  ["lucide-file-plus"] = "rbxassetid://10723365877",
  ["lucide-file-plus-2"] = "rbxassetid://10723365766",
  ["lucide-file-question"] = "rbxassetid://10723365987",
  ["lucide-file-scan"] = "rbxassetid://10723366167",
  ["lucide-file-search"] = "rbxassetid://10723366550",
  ["lucide-file-search-2"] = "rbxassetid://10723366340",
  ["lucide-file-signature"] = "rbxassetid://10723366741",
  ["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
  ["lucide-file-symlink"] = "rbxassetid://10723367098",
  ["lucide-file-terminal"] = "rbxassetid://10723367244",
  ["lucide-file-text"] = "rbxassetid://10723367380",
  ["lucide-file-type"] = "rbxassetid://10723367606",
  ["lucide-file-type-2"] = "rbxassetid://10723367509",
  ["lucide-file-up"] = "rbxassetid://10723367734",
  ["lucide-file-video"] = "rbxassetid://10723373884",
  ["lucide-file-video-2"] = "rbxassetid://10723367834",
  ["lucide-file-volume"] = "rbxassetid://10723374172",
  ["lucide-file-volume-2"] = "rbxassetid://10723374030",
  ["lucide-file-warning"] = "rbxassetid://10723374276",
  ["lucide-file-x"] = "rbxassetid://10723374544",
  ["lucide-file-x-2"] = "rbxassetid://10723374378",
  ["lucide-files"] = "rbxassetid://10723374759",
  ["lucide-film"] = "rbxassetid://10723374981",
  ["lucide-filter"] = "rbxassetid://10723375128",
  ["lucide-fingerprint"] = "rbxassetid://10723375250",
  ["lucide-flag"] = "rbxassetid://10723375890",
  ["lucide-flag-off"] = "rbxassetid://10723375443",
  ["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
  ["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
  ["lucide-flame"] = "rbxassetid://10723376114",
  ["lucide-flashlight"] = "rbxassetid://10723376471",
  ["lucide-flashlight-off"] = "rbxassetid://10723376365",
  ["lucide-flask-conical"] = "rbxassetid://10734883986",
  ["lucide-flask-round"] = "rbxassetid://10723376614",
  ["lucide-flip-horizontal"] = "rbxassetid://10723376884",
  ["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
  ["lucide-flip-vertical"] = "rbxassetid://10723377138",
  ["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
  ["lucide-flower"] = "rbxassetid://10747830374",
  ["lucide-flower-2"] = "rbxassetid://10723377305",
  ["lucide-focus"] = "rbxassetid://10723377537",
  ["lucide-folder"] = "rbxassetid://10723387563",
  ["lucide-folder-archive"] = "rbxassetid://10723384478",
  ["lucide-folder-check"] = "rbxassetid://10723384605",
  }
--------------------------------------------------------------------------------------------------------------------------------------------------------------------      
Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Toggle.BorderColor3 = Color3.fromRGB()
    Toggle.BorderSizePixel = 0
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 53.5, 0, 53.5)

    toggle_corner.Name = "toggle_corner"
    toggle_corner.Parent = Toggle

    toggle_Image.Name = "toggle_Image"
    toggle_Image.Parent = Toggle
    toggle_Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle_Image.BackgroundTransparency = 1.000
    toggle_Image.BorderColor3 = Color3.fromRGB()
    toggle_Image.BorderSizePixel = 0
    toggle_Image.Size = UDim2.new(0, 53.5, 0, 53.5)
    toggle_Image.Image = "http://www.roblox.com/asset/?id=100666805146072"

    local minimizetog = false
    MInimize_Button.MouseButton1Click:Connect(function()
        if minimizetog then
            utility:Tween(Body, {Size = UDim2.new(0, 600, 0, 350)}, .3)
            utility:Tween(MInimize_Button, {Rotation = -315}, .3)
        else
            utility:Tween(Body, {Size = UDim2.new(0, 600, 0, 32)}, .3)
            utility:Tween(MInimize_Button, {Rotation = 360}, .3)
        end
        minimizetog =  not minimizetog
    end)

    local togimage = false
    toggle_Image.MouseEnter:Connect(function()
        utility:Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
    end)

    toggle_Image.MouseLeave:Connect(function()
        utility:Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, .15)
    end)

    toggle_Image.MouseButton1Click:Connect(function()
        if togimage then
            Body.Visible = true
        else
            Body.Visible = false
        end
        togimage = not togimage;
    end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
    local function HJUAU_fake_script() -- Body.BodyObject 
        local script = Instance.new('LocalScript', Body)
        
        local gui = script.Parent
        local dragging = false
        local dragInput, dragStart, startPos
        
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
        
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end
    coroutine.wrap(HJUAU_fake_script)()

    -- Instances:
    local Tab_Container = Instance.new("Frame")
    local Tab_List = Instance.new("Frame")
    local TabList_Gradient = Instance.new("UIGradient")
    local Tab_Scroll = Instance.new("ScrollingFrame")
    local Tab_Scroll_Layout = Instance.new("UIListLayout")
    local Main_Container = Instance.new("Frame")
    local Container = Instance.new("Folder")

    -- Properties:
    Tab_Container.Name = "Tab_Container"
    Tab_Container.Parent = Body
    Tab_Container.BackgroundColor3 = Color3.fromRGB(64, 64, 95)
    Tab_Container.BackgroundTransparency = 1.000
    Tab_Container.BorderColor3 = Color3.fromRGB()
    Tab_Container.BorderSizePixel = 0
    Tab_Container.ClipsDescendants = true
    Tab_Container.Position = UDim2.new(0, 0, 0, 36)
    Tab_Container.Size = UDim2.new(1, 0, 0, 30)

    Tab_List.Name = "Tab_List"
    Tab_List.Parent = Tab_Container
    Tab_List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_List.BorderColor3 = Color3.fromRGB()
    Tab_List.BorderSizePixel = 0
    Tab_List.Position = UDim2.new(0, 0, 0, 28)
    Tab_List.Size = UDim2.new(1, 0, 0, 2)

    TabList_Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB()),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB()),
    })
    TabList_Gradient.Name = "TabList_Gradient"
    TabList_Gradient.Parent = Tab_List

    Tab_Scroll.Name = "Tab_Scroll"
    Tab_Scroll.Parent = Tab_Container
    Tab_Scroll.Active = true
    Tab_Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_Scroll.BackgroundTransparency = 1.000
    Tab_Scroll.BorderColor3 = Color3.fromRGB()
    Tab_Scroll.BorderSizePixel = 0
    Tab_Scroll.Position = UDim2.new(0, 10, 0, 0)
    Tab_Scroll.Size = UDim2.new(1, -20, 0, 30)
    Tab_Scroll.CanvasPosition = Vector2.new(0, 150)
    Tab_Scroll.ScrollBarImageColor3 = Color3.fromRGB()
    Tab_Scroll.ScrollBarThickness = 0

    Tab_Scroll_Layout.Name = "Tab_Scroll_Layout"
    Tab_Scroll_Layout.Parent = Tab_Scroll
    Tab_Scroll_Layout.FillDirection = Enum.FillDirection.Horizontal
    Tab_Scroll_Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    Tab_Scroll_Layout.VerticalAlignment = Enum.VerticalAlignment.Top
    Tab_Scroll_Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Tab_Scroll_Layout.Padding = UDim.new(0, 5)

    Tab_Scroll_Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Tab_Scroll.CanvasSize = UDim2.new(0, 0 + Tab_Scroll_Layout.Padding.Offset + Tab_Scroll_Layout.AbsoluteContentSize.X, 0, 0)
    end)

    Tab_Scroll.ChildAdded:Connect(function()
        Tab_Scroll.CanvasSize = UDim2.new(0, 0 + Tab_Scroll_Layout.Padding.Offset + Tab_Scroll_Layout.AbsoluteContentSize.X, 0, 0)
    end)

    Main_Container.Name = "Main_Container"
    Main_Container.Parent = Body
    Main_Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main_Container.BackgroundTransparency = 1.000
    Main_Container.BorderSizePixel = 0
    Main_Container.Position = UDim2.new(0, 5, 0, 70)
    Main_Container.Size = UDim2.new(0, 590, 0, 245)

    local ContainerGradients = Instance.new("UIGradient")
    ContainerGradients.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 245, 15)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0)),
    })
    ContainerGradients.Name = "ContainerGradients"
    ContainerGradients.Parent = Main_Container

    Container.Name = "Container"
    Container.Parent = Main_Container


    local Tabs = {}
    local is_first_tab = true
    function Tabs:addTab(title_tab)

        -- Instances:
        local Tab_Items = Instance.new("TextButton")
        local Tab_Item_Corner = Instance.new("UICorner")

        -- Properties:
        Tab_Items.Name = "Tab_Items"
        Tab_Items.Parent = Tab_Scroll
        Tab_Items.BackgroundColor3 = Color3.fromRGB(176, 245, 15)
        Tab_Items.BackgroundTransparency = 1.000
        Tab_Items.BorderColor3 = Color3.fromRGB()
        Tab_Items.BorderSizePixel = 0
        Tab_Items.Size = UDim2.new(0, 0, 0, 0)
        Tab_Items.AutoButtonColor = false
        Tab_Items.Font = Enum.Font.BuilderSansMedium
        Tab_Items.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab_Items.TextSize = 14.000
        Tab_Items.Text = title_tab

        Tab_Item_Corner.Name = "Tab_Item_Corner"
        Tab_Item_Corner.CornerRadius = UDim.new(0, 4)
        Tab_Item_Corner.Parent = Tab_Items

        utility:Tween(Tab_Items, {Size = UDim2.new(0, 25 + Tab_Items.TextBounds.X, 0, 24)}, .15)

        -- Instances:
        local ScrollingFrame = Instance.new("ScrollingFrame")
        local Scrolling_Layout = Instance.new("UIListLayout")

        -- Properties:
        ScrollingFrame.Name = "ScrollingFrame"
        ScrollingFrame.Parent = Container
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.BorderColor3 = Color3.fromRGB()
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
        ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
        ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB()
        ScrollingFrame.ScrollBarThickness = 0
        ScrollingFrame.Visible = false

        Scrolling_Layout.Name = "Scrolling_Layout"
        Scrolling_Layout.Parent = ScrollingFrame
        Scrolling_Layout.FillDirection = Enum.FillDirection.Horizontal
        Scrolling_Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Scrolling_Layout.Padding = UDim.new(0, 19)

        Scrolling_Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ScrollingFrame.CanvasSize = UDim2.new(0, Scrolling_Layout.AbsoluteContentSize.X, 0, 0)
        end)
    
        ScrollingFrame.ChildAdded:Connect(function()
            ScrollingFrame.CanvasSize = UDim2.new(0, Scrolling_Layout.AbsoluteContentSize.X, 0, 0)
        end)

        if is_first_tab then
            is_first_tab = false
            utility:Tween(Tab_Items, {BackgroundTransparency = 0.5}, .3);
            ScrollingFrame.Visible = true
        end

        Tab_Items.MouseButton1Click:Connect(function()
            for _,v in next, Tab_Scroll:GetChildren() do
                if v:IsA("TextButton") then
                    utility:Tween(v, {BackgroundTransparency = 1.000}, .3);
                end;
            end;
            utility:Tween(Tab_Items, {BackgroundTransparency = 0.5}, .3);

            for _,v in next, Container:GetChildren() do
                if v.Name == "ScrollingFrame" then
                    v.Visible = false
                end;
            end;
            ScrollingFrame.Visible = true
        end)

        local Section = {}
        function Section:addSection()

            -- Instances:
            local SectionScroll = Instance.new("ScrollingFrame")
            local UIListLayout_Section = Instance.new("UIListLayout")

            -- Properties:
            SectionScroll.Name = "SectionScroll"
            SectionScroll.Parent = ScrollingFrame
            SectionScroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SectionScroll.BackgroundTransparency = 1.000
            SectionScroll.BorderColor3 = Color3.fromRGB()
            SectionScroll.BorderSizePixel = 0
            SectionScroll.Size = UDim2.new(0, 285, 0, 245)
            SectionScroll.ScrollBarImageColor3 = Color3.fromRGB(176, 245, 15)
            SectionScroll.ScrollBarThickness = 4

            UIListLayout_Section.Parent = SectionScroll
            UIListLayout_Section.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_Section.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_Section.Padding = UDim.new(0, 6)

            UIListLayout_Section:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                SectionScroll.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_Section.Padding.Offset + UIListLayout_Section.AbsoluteContentSize.Y)
            end)
            
            SectionScroll.ChildAdded:Connect(function()
                SectionScroll.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_Section.Padding.Offset + UIListLayout_Section.AbsoluteContentSize.Y)
            end)

            local Menus = {}
            function Menus:addMenu(title_menu)

                -- Instances:
                local Section = Instance.new("Frame")
                local Section_Inner = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local UICorner = Instance.new("UICorner")
                local List = Instance.new("Frame")
                local UIGradient = Instance.new("UIGradient")
                local UIGradient_2 = Instance.new("UIGradient")
                local TextLabel = Instance.new("TextLabel")

                -- Properties:
                Section.Name = "Section" or title_menu
                Section.Parent = SectionScroll
                Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Section.BackgroundTransparency = 1.000
                Section.BorderColor3 = Color3.fromRGB()
                Section.BorderSizePixel = 0
                Section.Size = UDim2.new(1, 0, 0, 25)

                Section_Inner.Name = "Section_Inner"
                Section_Inner.Parent = Section
                Section_Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Section_Inner.BorderColor3 = Color3.fromRGB()
                Section_Inner.BorderSizePixel = 0
                Section_Inner.Position = UDim2.new(0, 5, 0, 0)
                Section_Inner.Size = UDim2.new(1, -10, 0, 25)

                UIGradient_2.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB()),
                    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(20, 20, 20)),
                    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(20, 20, 20)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB()),
                })
                UIGradient_2.Parent = Section_Inner

                UIListLayout.Parent = Section_Inner
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 3)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Section_Inner

                TextLabel.Parent = Section_Inner
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderColor3 = Color3.fromRGB()
                TextLabel.BorderSizePixel = 0
                TextLabel.Size = UDim2.new(1, 0, 0, 20)
                TextLabel.Font = Enum.Font.BuilderSansMedium
                TextLabel.Text = title_menu
                TextLabel.TextColor3 = Color3.fromRGB(176, 245, 15)
                TextLabel.TextSize = 14.000

                List.Name = "List"
                List.Parent = Section_Inner
                List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                List.BorderColor3 = Color3.fromRGB()
                List.BorderSizePixel = 0
                List.Size = UDim2.new(1, 0, 0, 1)

                UIGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
                    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(176, 245, 15)),
                    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 245, 15)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
                })
                UIGradient.Parent = List

                Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                    Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                end)

                local function SectionScrollChanged()
                    local SCL = 0
                    SCL = UIListLayout.AbsoluteContentSize.Y
                    SectionScroll.CanvasSize = UDim2.new(0, 0, 0, SCL + UIListLayout.Padding.Offset + 5)
                end
                local function SectionInnerChanged()
                    Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                    Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                end

                SectionScrollChanged()
                SectionInnerChanged()
                
                local Menu_Item = {}
                function Menu_Item:addButton(button_tile, callback)

                    callback = callback or function () end

                    -- Instances:
                    local TextButton = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    TextButton.Parent = Section_Inner
                    TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    TextButton.BorderColor3 = Color3.fromRGB()
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, -10, 0, 25)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.BuilderSansMedium
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 12.000
                    TextButton.Text = button_tile

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = TextButton

                    TextButton.MouseEnter:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(180, 180, 180)}, .15)
                    end)

                    TextButton.MouseLeave:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15)
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                    end)

                    TextButton.MouseButton1Down:Connect(function()
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .15)
                        utility:Tween(TextButton, {Size = UDim2.new(1, -25, 0, 15)}, .15)
                    end)

                    TextButton.MouseButton1Up:Connect(function()
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1)
                        utility:Tween(TextButton, {Size = UDim2.new(1, -10, 0, 25)}, .15)
                    end)

                    TextButton.MouseButton1Click:Connect(function()
                        callback()
                    end)
                end

                function Menu_Item:addToggle(toggle_title, default, callback)

                    callback = callback or function(Value) end
                    default = default or false

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local TextLabel = Instance.new("TextLabel")
                    local ImageButton = Instance.new("ImageButton")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB()
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB()
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -30, 0, 25)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = toggle_title

                    ImageButton.Parent = Frame
                    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageButton.BackgroundTransparency = 1.000
                    ImageButton.BorderColor3 = Color3.fromRGB(40,40,40)
                    ImageButton.BorderSizePixel = 0
                    ImageButton.Position = UDim2.new(0, 242, 0, 2)
                    ImageButton.Size = UDim2.new(0, 20, 0, 20)
                    ImageButton.Image = "rbxassetid://3926311105"
                    ImageButton.ImageRectOffset = Vector2.new(940, 784)
                    ImageButton.ImageRectSize = Vector2.new(48, 48)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    local CheckToggle = false
                    if default then
                        ImageButton.ImageRectOffset = Vector2.new(4, 836);
                        ImageButton.ImageColor3 = Color3.fromRGB(168, 237, 7);
                        TextLabel.TextColor3 = Color3.fromRGB(168, 237, 7);
                        CheckToggle = not CheckToggle;
                        callback(CheckToggle);
                    end

                    ImageButton.MouseEnter:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0.5}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0.5}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15);
                    end);
    
                    ImageButton.MouseLeave:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15);
                    end);

                    ImageButton.MouseButton1Click:Connect(function ()
                        if not CheckToggle then
                            ImageButton.ImageRectOffset = Vector2.new(4, 836);
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(168, 237, 7)}, .3);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .3);
                        else
                            ImageButton.ImageRectOffset = Vector2.new(940, 784);
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .3);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .3);
                        end;
                        CheckToggle = not CheckToggle;
                        callback(CheckToggle);
                    end)
                end

                function Menu_Item:addDropdown(dropdown_tile, default, list, callback)
                    default = default or ""
                    list = list or {}
                    callback = callback or function(Value) end

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local ImageButton = Instance.new("ImageButton")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(40,40,40)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -40, 0, 25)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = dropdown_tile

                    ImageButton.Parent = Frame
                    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageButton.BackgroundTransparency = 1.000
                    ImageButton.BorderColor3 = Color3.fromRGB(40,40,40)
                    ImageButton.BorderSizePixel = 0
                    ImageButton.Position = UDim2.new(0, 242, 0, 1)
                    ImageButton.Size = UDim2.new(0, 21, 0, 22)
                    ImageButton.Image = "rbxassetid://14834203285"

                    if default then
                        for i,v in pairs(list) do
                            if v == default then
                                TextLabel.Text = dropdown_tile  ..' - ' .. v
                                callback(v)
                            end
                        end
                    end

                    ImageButton.MouseEnter:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0.5}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0.5}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15);
                    end);
    
                    ImageButton.MouseLeave:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15);
                    end);

                    -- Instances:
                    local ScrollDown = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    ScrollDown.Name = "ScrollDown"
                    ScrollDown.Parent = Section_Inner
                    ScrollDown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    ScrollDown.BorderColor3 = Color3.fromRGB(40,40,40)
                    ScrollDown.BorderSizePixel = 0
                    ScrollDown.ClipsDescendants = true
                    ScrollDown.Size = UDim2.new(1, -10, 0, 0)

                    UIListLayout.Parent = ScrollDown
                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 3)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = ScrollDown

                    local dropdown_toggle = false
                    ImageButton.MouseButton1Click:Connect(function()
                        if dropdown_toggle then
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                        else
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0 + UIListLayout.AbsoluteContentSize.Y + 5)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(168, 237, 7)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .15)
                        end
                        dropdown_toggle = not dropdown_toggle
                    end)

                    for i,v in pairs(list) do
                        local TextButton = Instance.new('TextButton')

                        TextButton.Parent = ScrollDown
                        TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        TextButton.BackgroundTransparency = 1.000
                        TextButton.BorderSizePixel = 0
                        TextButton.Size = UDim2.new(1, 0, 0, 25)
                        TextButton.Position = UDim2.new(0, 5, 0, 0)
                        TextButton.Font = Enum.Font.BuilderSansMedium
                        TextButton.AutoButtonColor = false
                        TextButton.TextSize = 12.000
                        TextButton.Text = v
                        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    
                        TextButton.MouseEnter:Connect(function()
                            utility:Tween(TextButton, {TextSize = 9.000}, 0.15)
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(168, 237, 7)}, 0.15)
                        end)
    
                        TextButton.MouseLeave:Connect(function()
                            utility:Tween(TextButton, {TextSize = 12.000}, 0.15)
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
                        end)
    
                        TextButton.MouseButton1Click:Connect(function()
                            dropdown_toggle = false
                            TextLabel.Text = dropdown_tile  ..' - ' .. v
                            callback(v)
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                        end)
                    end

                    local updatedropfunc = {}
                    function updatedropfunc:Clear()
                        for i,v in pairs(ScrollDown:GetChildren()) do
                            if v:IsA("TextButton") then
                                v:Destroy()
                                dropdown_toggle = false
                                TextLabel.Text = dropdown_tile
                                callback(v)
                                utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            end
                        end
                    end

                    function updatedropfunc:Refresh(newlist)
                        newlist = newlist or {}

                        for i,v in pairs(newlist) do
                            local TextButton = Instance.new('TextButton')
    
                            TextButton.Parent = ScrollDown
                            TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            TextButton.BackgroundTransparency = 1.000
                            TextButton.BorderSizePixel = 0
                            TextButton.Size = UDim2.new(1, 0, 0, 25)
                            TextButton.Position = UDim2.new(0, 5, 0, 0)
                            TextButton.Font = Enum.Font.BuilderSansMedium
                            TextButton.AutoButtonColor = false
                            TextButton.TextSize = 12.000
                            TextButton.Text = v
                            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        
                            TextButton.MouseEnter:Connect(function()
                                utility:Tween(TextButton, {TextSize = 9.000}, 0.15)
                                utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(168, 237, 7)}, 0.15)
                            end)
        
                            TextButton.MouseLeave:Connect(function()
                                utility:Tween(TextButton, {TextSize = 12.000}, 0.15)
                                utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
                            end)
        
                            TextButton.MouseButton1Click:Connect(function()
                                dropdown_toggle = false
                                TextLabel.Text = dropdown_tile  ..' - ' .. v
                                callback(v)
                                utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                                utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                                utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            end)
                        end
                    end
                    return updatedropfunc
                end

                function Menu_Item:addTextbox(text_tile, default, callback)

                    callback = callback or function(Value) end
                    
                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local TextBox = Instance.new("TextBox")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(40,40,40)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(0, 150, 0, 25)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = text_tile

                    TextBox.Parent = Frame
                    TextBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    TextBox.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextBox.BorderSizePixel = 0
                    TextBox.Position = UDim2.new(0, 190, 0, 2)
                    TextBox.Size = UDim2.new(0, 70, 0, 20)
                    TextBox.Font = Enum.Font.BuilderSansMedium
                    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextBox.TextSize = 12.000
                    TextBox.Text = default or "Type Here"

                    local function onFocusLost(enterPressed, default)
                        if enterPressed then
                            callback(TextBox.Text)
                            utility:Tween(TextBox, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .1);
                            wait(.1);
                            utility:Tween(TextBox, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .5);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .5);
                        end;
                    end;
                    TextBox.FocusLost:Connect(onFocusLost);
                end

                function Menu_Item:addKeybind(keybind_tile, preset, callback)

                    callback = callback or function(Value) end;

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local TextButton = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(40,40,40)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(0, 150, 0, 25)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = keybind_tile

                    TextButton.Parent = Frame
                    TextButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
                    TextButton.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextButton.BorderSizePixel = 0
                    TextButton.Position = UDim2.new(0, 190, 0, 3)
                    TextButton.Size = UDim2.new(0, 70, 0, 20)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.BuilderSansMedium
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    TextButton.Text = preset.Name

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = TextButton

                    TextButton.MouseButton1Click:Connect(function()
                        TextButton.Text = ". . .";
                        local inputwait = UserInputService.InputBegan:wait();
                        if inputwait.KeyCode.Name == preset.Name then
                            TextButton.Text = inputwait.KeyCode.Name;
                            Key = inputwait.KeyCode.Name;
                            callback(Key);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(168, 237, 7)}, .1);
                            wait(.1);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                        else
                            TextButton.Text = "Invald...";
                            Key = inputwait.KeyCode.Name;
                            callback();
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(176, 245, 15)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(176, 245, 15)}, .1);
                            wait(.1);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                        end;
                    end)
                end

                function Menu_Item:addLabel(label_text)

                    local LabelFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Size = UDim2.new(1, -20, 0, 15)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = label_text

                    function LabelFunc:Refresh(newLabel)
                        if TextLabel.Text ~= newLabel then
                            TextLabel.Text = newLabel;
                        end;
                    end;
                    return LabelFunc;
                end
                
                function Menu_Item:addChangelog(changeloogtext)

                    local ChangelogFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Size = UDim2.new(1, -20, 0, 15)
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = changeloogtext

                    function ChangelogFunc:Refresh(newchangelog)
                        if TextLabel.Text ~= newchangelog then
                            TextLabel.Text = newchangelog;
                        end;
                    end;
                    return ChangelogFunc;
                end

                function Menu_Item:addLog(log_text)

                    local LogFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(40,40,40)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Font = Enum.Font.BuilderSansMedium
                    TextLabel.Text = log_text
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextYAlignment = Enum.TextYAlignment.Top

                    TextLabel.Size = UDim2.new(1, -20, 0, TextLabel.Text:len() + 15)
                    TextLabel:GetPropertyChangedSignal("Text"):Connect(function()
                        TextLabel.Size = UDim2.new(1, -20, 0, TextLabel.Text:len() + 15)
                    end)

                    function LogFunc:Refresh(newLog)
                        if TextLabel.Text ~= newLog then
                            TextLabel.Text = newLog
                        end
                    end
                    return LogFunc
                end
                return Menu_Item
            end
            return Menus
        end
        return Section
    end
    return Tabs
end
return Library