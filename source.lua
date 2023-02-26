repeat task.wait() until game:IsLoaded() and game.ContentProvider.RequestQueueSize == 0;
local loadtime = os.time()
local lplr = game.Players.LocalPlayer
local chlplr = lplr.Character.Humanoid
local name = lplr.Name
local dname = lplr.DisplayName
local userid = lplr.UserId 
local version = "2.8"
local light = game:GetService("Lighting")
local RunService = game:GetService("RunService")
getgenv().fps = nil;
function fpss()
if getgenv().fps then
    setfpscap(999)
    else
        setfpscap(60)
end
end
getgenv().headless = nil
function headless()
if getgenv().headless then
    lplr.Character.Head.Transparency = 1
   lplr.Character.Head.face.Transparency = 1
  else
      lplr.Character.Head.Transparency = 0 
      lplr.Character.Head.face.Transparency = 0
end
end
getgenv().render = nil;
function render()
if getgenv().render then
    RunService:Set3dRenderingEnabled(false)
    else
            RunService:Set3dRenderingEnabled(true)
end
end

	getgenv().infjump = nil; --reworked.
	function infjump() 
	        game:GetService("UserInputService").JumpRequest:connect(function()
	    if getgenv().infjump then
	        		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
end
end)
end

getgenv().spinbot = nil;
getgenv().spinspeed = math.rad(50)
function spin()
while getgenv().spinbot do
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, getgenv().spinspeed, 0)
end
end

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local link = "https://raw.githubusercontent.com/AnAvaragelilmemer/scripts/main/discord%20lib"

local Discord = loadstring(game:HttpGetAsync(link))();
local settings = "https://raw.githubusercontent.com/AnAvaragelilmemer/homebrew/main/toggler"
loadstring(game:HttpGetAsync(settings))()
local window = Discord:Window("discord")

local Iridium = window:Server("Homebrew "..version, "")

local welcome = Iridium:Channel("[👋] Welcome")
welcome:Label("Everyone welcome drmr!")
welcome:Label("man with no brin just slid into the server.") 
welcome:Label("A wild memerboy9 appeared.")
welcome:Label("Angel just showed up!")
welcome:Label("Welcome Bloxy, Say hi!")
welcome:Label("Good to see you, skiddie!")
welcome:Label("Someone hopped into the server.")
welcome:Label("catzx joined the party.")
welcome:Label("Glad your here, "..dname..".")

local update = Iridium:Channel("[❗️] Update-Logs")

update:Label("Update 2.8, i used another method of speed")
update:Label("organized things, added more things on #[👀] Misc, enjoy!")
update:Label("Added anti anti cheat, this is only on one game, more will come soon!")
update:Seperator()
update:Label("made pissware : mobile a thing now.")

local main = Iridium:Channel("————MAIN————")

local info = Iridium:Channel("[❓] Info")

info:Label("Name: "..name.."//"..dname.."//"..userid)
info:Label("Executor: "..identifyexecutor() or "unknown")
info:Label("Game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local req = http_request or request or (syn and syn.request)
local HS = game:GetService("HttpService")
local response = HS:JSONDecode(
    req({
    Url = "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/friends/count"
})
.Body)
info:Label("Friends: "..response.count)

local localplayer = Iridium:Channel("[🧍] Local-Player")

localplayer:Label("Mobile")

localplayer:Textbox("Speed", " ", true, function(v)
TargetWalkspeed = v
end)

localplayer:Textbox("Jump", " ", true, function(v)
chlplr.JumpPower = v
end)

localplayer:Textbox("Field of view", " ", true, function(v)
    game.Workspace.Camera.FieldOfView = v
end)

localplayer:Seperator()

localplayer:Label("PC")

    localplayer:Slider(
    "Speed",
    1,
    1000,
    16,
    function(v)
    TargetWalkspeed = v
    end
)

    localplayer:Slider(
    "Jump",
    1,
    1000,
    50,
    function(v)
       chlplr.JumpPower = v
    end
)
    localplayer:Slider(
    "fov",
    0,
    120,
    70,
    function(v)
       game.Workspace.Camera.FieldOfView = v
    end
)

localplayer:Button("Reset speed, jump, FOV.", function()
    TargetWalkspeed = v
    chlplr.JumpPower = 50
    game.Workspace.Camera.FieldOfView = 70
    Notification:Notify(
    {Title = "Notification", Description = "Resetted settings!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 3, Type = "default"}
)
end)


localplayer:Seperator()

localplayer:Button("Hard reset", function()
    lplr.Character:Destroy()
    Notification:Notify(
    {Title = "Refreshing", Description = "This wont take long, please wait..."},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
)
end)

localplayer:Button("Reset", function()
    lplr.Character.Head:Destroy()
    Notification:Notify(
    {Title = "Resetting...", Description = "This wont take long, please wait."},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
)
end)

localplayer:Button("Rejoin", function()
game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService('Players').LocalPlayer)
Notification:Notify(
    {Title = " ", Description = "Rejoining..."},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 2, Type = "default"}
)
end)

local client = Iridium:Channel("[👀] Misc")

client:Button("Fire Click Detector", function()
    for i,v in pairs(game:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end)


client:Seperator()


client:Button("Open ESP (SOON)", function()
    Notification:Notify(
    {Title = "Coming soon", Description = "this will be released soon."},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
)
end)

client:Seperator()

client:Button(
    "Fps boost/Low quality",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/scripts/main/fps%20booster"))()
    end
)

client:Button(
    "Graphic enchancer",
    function(v)
        loadstring(game:HttpGet("https://github.com/AnAvaragelilmemer/scripts/blob/main/graphic%20enchancer"))()
    end
)

client:Toggle("Enable/Disable rendering",false, function(v)
    getgenv().render = v
    render()
    end)


client:Button(
	"FullBright",
	function()
--not mine
	light.Ambient = Color3.new(1, 1, 1)
    light.ColorShift_Bottom = Color3.new(1, 1, 1)
    light.ColorShift_Top = Color3.new(1, 1, 1)
    game.Lighting.FogEnd = 100000
    game.Lighting.FogStart = 0
    game.Lighting.ClockTime = 14
    game.Lighting.Brightness = 2
    game.Lighting.GlobalShadows = false
    end
)

client:Toggle("Fps unlock",false, function(v)
getgenv().fps = v 
fpss()
end)

client:Seperator()


client:Toggle("Spinbot",false, function(v)
    getgenv().spinbot = v 
    spin()
end)

client:Textbox("Spinbot speed", " ", true, function(v)
getgenv().spinspeed = math.rad(v)
end)

client:Seperator()

client:Button(
    "Chat logger",
    function(v)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/scripts/main/Chat%20logger"))()
			Notification:Notify(
    {Title = "Sucess!", Description = "Press F9 or type /console to see chat"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "default"}
)
    end
)

client:Button(
    "Join/Leave Logger",
    function()
     local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
 print(player.DisplayName .. " Joined.")
end)

Players.PlayerRemoving:Connect(function(player)
print(player.DisplayName .. " Left.")
end)
Notification:Notify(
{Title = "Sucess!", Description = "Press F9 or type /console to see join logger"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "default"}
)
end)
    
client:Button(
    "Audio Logger",
    function()
        loadstring(game:HttpGet('https://pastebin.com/raw/v7Usg709', true))()
    end)
    

client:Seperator()


client:Toggle("Client sided Headless",false, function(v)
getgenv().headless = v 
headless()
end)

client:Toggle("Infinite jump",false, function(v)
    getgenv().infjump = v 
    infjump()
end)

client:Button("sit", function()
    lplr.Character.Humanoid.Sit = true
    end)

client:Button("Server hop", function()
    --not bothered to make a serverhop script cause its litterally the same as the script below
    local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

module:Teleport(game.PlaceId)
end)




--more soon

local Scripts = Iridium:Channel("[📜] Scripts")


Scripts:Button("Fly gui V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

Scripts:Button("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    
Scripts:Button("Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

Scripts:Button("Netless", function() 
    --didnt made this
    for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(-30,0,0)
end)
end
end
Notification:Notify(
    {Title = "Hey there!", Description = "Netless is loaded, re-execute if you die."},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
)
end)


Scripts:Button("Project Bullshit V3", function()
loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()
end)

Scripts:Button("Hydro hub (Hydrogen Built in)", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub"))()
end)



Scripts:Label("more will come soon")


Notification:Notify(
    {Title = "Loaded!", Description = "Homebrew "..version.." loaded in "..os.time() - loadtime.." seconds!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
)
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnAvaragelilmemer/scripts/main/toggler"))()

--anti anti cheats

--fe2, fe2cm, fe2 auto
pcall(function() if game.PlaceId == 738339342 or 2198503790 or 11951199229 then 
	game.ReplicatedStorage.Remote.ReqCharVars.OnClientInvoke = function()
	return {}
end
	Notification:Notify(
    {Title = "Anti cheat", Description = "Bypassed anti cheat!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "default"}
)
end
end)

--method of walkspeed
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)
