local ViewportSize = workspace.CurrentCamera.ViewportSize / 2
local AxisX = Drawing.new("Line")
local AxisY = Drawing.new("Line")
AxisX.Visible = true
AxisY.Visible = true
AxisX.Transparency = 0.3
AxisY.Transparency = 0.3
AxisX.Color = Color3.fromRGB(255, 255, 255)
AxisY.Color = Color3.fromRGB(255, 255, 255)
AxisX.Thickness = 1
AxisY.Thickness = 1
local Cosine = Drawing.new("Line")
local Sine = Drawing.new("Line")
Cosine.Visible = true
Sine.Visible = true
Cosine.Transparency = 1
Sine.Transparency = 1
Cosine.Color = Color3.fromRGB(255, 0, 0)
Sine.Color = Color3.fromRGB(0, 255, 0)
Cosine.Thickness = 2
Sine.Thickness = 2
local Point = Drawing.new("Line")
Point.Visible = true
Point.Transparency = 0.5
Point.Color = Color3.fromRGB(0, 0, 255)
Point.Thickness = 2
local Connection = Drawing.new("Line")
Connection.Visible = true
Connection.Transparency = 1
Connection.Color = Color3.fromRGB(255, 255, 0)
Connection.Thickness = 2
local Circle = Drawing.new("Circle")
Circle.Radius = 90
Circle.Filled = false
Circle.Thickness = 1
Circle.Color = Color3.fromRGB(255, 255, 255)
Circle.Transparency = 0.3
Circle.Position = ViewportSize
Circle.NumSides = 600
Circle.Visible = true
local CirclePoint = Drawing.new("Circle")
CirclePoint.Radius = 2
CirclePoint.Filled = false
CirclePoint.Thickness = 0
CirclePoint.Color = Color3.fromRGB(255, 255, 255)
CirclePoint.Transparency = 0.5
CirclePoint.NumSides = 600
CirclePoint.Visible = true
local Dot = Drawing.new("Circle")
Dot.Radius = 2.5
Dot.Filled = true
Dot.Thickness = 1
Dot.Color = Color3.fromRGB(0, 0, 0)
Dot.Transparency = 0.5
Dot.Position = ViewportSize
Dot.NumSides = 600
Dot.Visible = true
local Square = Drawing.new("Square")
Square.Size = Vector2.new(180, 180)
Square.Filled = false
Square.Thickness = 1
Square.Color = Color3.fromRGB(255, 255, 255)
Square.Transparency = 0.1
Square.Position = Vector2.new(ViewportSize.X - Square.Size.X / 2, ViewportSize.Y - Square.Size.Y / 2)
Square.Visible = true
local Text = Drawing.new("Text")
Text.Center = true
Text.Outline = false
Text.Color = Color3.fromRGB(255, 255, 255)
Text.Position = Vector2.new(ViewportSize.X, ViewportSize.Y - 120)
Text.Size = 25
Text.Visible = true
Text.Transparency = 0.3

AxisX.From = Vector2.new(ViewportSize.X - 90, ViewportSize.Y)
AxisY.From = Vector2.new(ViewportSize.X, ViewportSize.Y - 90)
AxisX.To = Vector2.new(ViewportSize.X + 90, ViewportSize.Y)
AxisY.To = Vector2.new(ViewportSize.X, ViewportSize.Y + 90)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        local CosineAngle = Vector2.new((math.cos(tick()) * 90) + ViewportSize.X, ViewportSize.Y)
        local SineAngle = Vector2.new(ViewportSize.X, (math.sin(tick()) * 90) + ViewportSize.Y)
        local PointAngle = Vector2.new((math.cos(tick()) * 45) + ViewportSize.X, (math.sin(tick()) * 45) + ViewportSize.Y)
        local CirclePointAngle = Vector2.new((math.cos(tick()) * 90) + ViewportSize.X, (math.sin(tick()) * 90) + ViewportSize.Y)
        
        Cosine.From = ViewportSize
        Cosine.To = CosineAngle
        
        Sine.From = ViewportSize
        Sine.To = SineAngle
        
        Point.From = ViewportSize
        Point.To = PointAngle
        
        Connection.From = Cosine.To
        Connection.To = SineAngle
        
        CirclePoint.Position = CirclePointAngle
        
        if math.sin(tick()) >= 0.998 or math.sin(tick()) <= -0.998 then
            CirclePoint.Color = Color3.fromRGB(0, 255, 0)
            CirclePoint.Filled = true
            CirclePoint.Radius = 3
        elseif math.cos(tick()) >= 0.998 or math.cos(tick()) <= -0.998 then
            CirclePoint.Color = Color3.fromRGB(255, 0, 0)
            CirclePoint.Filled = true
            CirclePoint.Radius = 3
        else
            CirclePoint.Color = Color3.fromRGB(255, 255, 255)
            CirclePoint.Filled = false
            CirclePoint.Radius = 2
        end
        
        Text.Text = tostring(math.floor((math.cos(tick()) * 360))).."°"
    end)
end)

wait(9e9)

AxisX:Remove()
AxisY:Remove()
Cosine:Remove()
Sine:Remove()
Point:Remove()
Connection:Remove()
Circle:Remove()
Dot:Remove()
Square:Remove()
Text:Remove()
CirclePoint:Remove()
