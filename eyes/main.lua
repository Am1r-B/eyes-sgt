function love.draw()
  
  -- location of eye
  local eyeX = 200
  local eyeY = 200
  
  -- x distance between cursor and center of eye
  local distanceX = love.mouse.getX() - eyeX
  
  -- y distance between cursor and center of eye
  local distanceY = love.mouse.getY() - eyeY
  
  -- straight-line distance between cursor and eye
  local distance = math.sqrt(distanceX^2 + distanceY^2)
  
  -- angle between cursor and eye
  local angle = math.atan2(distanceY, distanceX)
  
  -- location of pupil
  local pupilX = eyeX + distance * math.cos(angle)
  local pupilY = eyeY + distance * math.sin(angle)
  
  -- draw eye(white part of eye)
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("fill", eyeX, eyeY, 50)
  
  -- draw pupil of eye
  love.graphics.setColor(0, 0, .4)
  love.graphics.circle("fill", pupilX, pupilY, 15)
  
  -- write current info on screen
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(table.concat({
    "Distance X: " .. distanceX,
    "Distance Y: " .. distanceY,
    "Distance: " .. distance,
    "Angle: " .. angle,
    'cos(angle): ' .. math.cos(angle),
    'sin(angle): ' .. math.sin(angle)
  }, "\n"))
end