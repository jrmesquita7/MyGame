function love.draw()
    -- Fundo azul
    love.graphics.setBackgroundColor(0, 204, 204)
    
    -- Sol
    love.graphics.setColor(255, 255, 0)
    love.graphics.circle("fill", 100, 100, 50, 50)

    -- Linha
    love.graphics.line(10, 50, 100, 100)
    love.graphics.line(50, 10, 100, 100)
    love.graphics.line(100, 10, 100, 100)
    
    -- Nuvem
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("fill", 500, 100, 50, 50)
    love.graphics.circle("fill", 550, 100, 50, 50)
    love.graphics.circle("fill", 600, 100, 50, 50)
    love.graphics.circle("fill", 650, 100, 50, 50)
    
    
    -- Extrutura da casa
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 220, 300, 200, 200)
    
    -- Teto
    love.graphics.setColor(125,0,100)
    love.graphics.polygon("fill",200, 300, 430, 300, 320, 150)

    -- Porta
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", 330, 400, 70, 100)

    -- Janela
    love.graphics.rectangle("fill", 240, 400, 70, 70)
 
    -- Gramado
    love.graphics.setColor(0, 128, 0)
    love.graphics.rectangle("fill", 0, 500, 800,100)
    
    -- Tronco
    love.graphics.setColor(1, 0, 0, 9)
    love.graphics.rectangle("fill", 700, 450, 10, 100)
    
    love.graphics.setColor(0, 128, 0)
    love.graphics.circle("fill", 700, 420, 50, 50)
 
 
  end