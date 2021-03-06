local shapes = {}
function shapes.Panel(ax,ay,az,bx,by,bz,cx,cy,cz,dx,dy,dz,image,Color)
  p = {
    a = {x = ax, y = ay, z = az};
    b = {x = bx, y = by, z = bz};
    c = {x = cx, y = cy, z = cz};
    d = {x = dx, y = dy, z = dz};
    color = Color;
    texture = image;
    display = true;
  } 
  if Color == nil then
      p.color = shapes.Color(255,255,255,2555)
    end
  return p
end
function shapes.cube()
--p = shapes.Panel(0,1,0, 0,1,1, 1,1,1, 1,1,0, "grass_top",shapes.Color(126,190,84,255)) --top
a = shapes.Panel(0,1,0, 0,1,1, 1,1,1, 1,1,0, "grass_top",shapes.Color(math.random()*254,190,84,255)) --top
shapes.movePanel(a,y,0,-x)
scene[#scene+1] = a
        
b = shapes.Panel(0,0,0, 0,0,1, 1,0,1, 1,0,0, "dirt") --bottom
shapes.movePanel(b,y,0,-x)
scene[#scene+1] = b
        
c = shapes.Panel(0,1,0, 0,0,0, 1,0,0, 1,1,0, "grass_side") --side
shapes.movePanel(c,y,0,-x)
scene[#scene+1] = c
        
d = shapes.Panel(0,1,1, 0,0,1, 1,0,1, 1,1,1, "grass_side") --side
shapes.movePanel(d,y,0,-x)
scene[#scene+1] = d
        
e = shapes.Panel(0,1,0, 0,0,0, 0,0,1, 0,1,1, "grass_side") --side
shapes.movePanel(e,y,0,-x)
scene[#scene+1] = e
        
f = shapes.Panel(1,1,0, 1,0,0, 1,0,1, 1,1,1, "grass_side") --side
shapes.movePanel(f,y,0,-x)
scene[#scene+1] = f
end
function shapes.Color(r,g,b,a)
  return {r,g,b,a}
end
function shapes.movePanel(p,x,y,z)
  p.a.x = p.a.x + x;
  p.a.y = p.a.y + y;
  p.a.z = p.a.z + z;
  
  p.b.x = p.b.x + x;
  p.b.y = p.b.y + y;
  p.b.z = p.b.z + z;
  
  p.c.x = p.c.x + x;
  p.c.y = p.c.y + y;
  p.c.z = p.c.z + z;
  
  p.d.x = p.d.x + x;
  p.d.y = p.d.y + y;
  p.d.z = p.d.z + z;
end
function shapes.gradient(colors)
    local direction = colors.direction or "horizontal"
    if direction == "horizontal" then
        direction = true
    elseif direction == "vertical" then
        direction = false
    else
        error("Invalid direction '" .. tostring(direction) "' for gradient.  Horizontal or vertical expected.")
    end
    local result = love.image.newImageData(direction and 1 or #colors, direction and #colors or 1)
    for i, color in ipairs(colors) do
        local x, y
        if direction then
            x, y = 0, i - 1
        else
            x, y = i - 1, 0
        end
        result:setPixel(x, y, color[1], color[2], color[3], color[4] or 255)
    end
    result = love.graphics.newImage(result)
    result:setFilter('linear', 'linear')
    return result
end

return shapes