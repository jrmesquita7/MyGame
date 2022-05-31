-- variáveis de altura e lagura da tela
larguraTela = love.graphics.getWidth() 
alturaTela = love.graphics.getHeight()
-- variáveis de altura e lagura da tela

--Informações do Jogador
local player = {          
 imagem,
pos_pl_x = larguraTela / 2,
pos_pl_y = alturaTela / 2,
veloc = 200
}
--Informações do Jogador

function love.load()
  --Informações dos disparos
  atira = true
  dlDisp = 0.8
  tmpAtirar = dlDisp
  tiros = {}
  imagemTiro = love.graphics.newImage("luva.png")
  --Informações dos disparos
  
  --Informações do Inimigo
  dlInimigo = 0.3
  tmpInimigo = dlInimigo
  imagemInimigo = love.graphics.newImage("gato.png") 
  inimigos = {}
  --Informações do Inimigo

  --Informações sobre vida e pontos
  contVivo = true
  pontos = 0
  nivel = 1
  --Informações sobre vida e pontos
  
  --Informações sobre o cenário
  cenario = love.graphics.newImage("background.png")
  cenarioCont = love.graphics.newImage("background.png") --cria o background infinito
  fundo = {
  x = 0,                    -- posição do primeiro background
  y = 0,                    -- posição do primeiro background
  y2 = 0 - cenario:getHeight(),  -- posição do segundo background
  vel = 30
  }
  --Informações sobre o cenário
  
  --Informações sobre pontuação
  fonte = love.graphics.newFont("Herculanum.ttf")
  --Informações sobre pontuação
  
  --Informações sobre o audio jogo
  audioDisp = love.audio.newSource("audio/disparoluva.mp3", "static")               -- arq de audio do disparos
  audioDisp: setVolume(0.5)                                                         -- volume do audio 
  explosaoPlay = love.audio.newSource("audio/morte_gato.mp3", "static")       -- arq de audio da explosao da nave
  explosaoInim = love.audio.newSource("audio/Miado.mp3", "static")    -- arq de audio da explosão do inimigo 
  musicaFundo = love.audio.newSource("audio/fundo.mp3", "stream")         -- arq de audio da musica de fundo
  musicaFundo: play()   --função para tocar a musica de fundo desde o começo do jogo
  musicaFundo: setLooping(true)  --função que faz a musica de fundo recomeçar ao termino
  musicaFundo: setVolume(0.3)                                                        -- volume do audio  
  --Informações sobre o audio jogo
  
  --atribui uma variável a imagem do jogador
 player.imagem = love.graphics.newImage("rato.png")
 --atribui uma variável a imagem do jogador
end

function love.update(dt)
  movimentacao(dt) --atualiza os movimentos do jogador
  atirar(dt) -- atualiza a função atirar
  inimigo(dt) --atualiza a função inimigo
  colisao()   --atualiza a função colisão
  movfundo(dt)  --dá o sentido de continuidade no cenário
  reincia() -- função para reiniciar o jogo
  
end

function movimentacao(dt)
  --Movimentação do jogador
  if love.keyboard.isDown("right") then
      if player.pos_pl_x < (larguraTela - player.imagem:getWidth() / 2 ) then --Laço para delimitar a movimentação do jogador dentro da tela
      player.pos_pl_x = player.pos_pl_x + player.veloc * dt 
    end
  end
  if love.keyboard.isDown("left") then
    if player.pos_pl_x > (0 + player.imagem:getWidth() / 2 ) then --Laço para delimitar a movimentação do jogador dentro da tela
      player.pos_pl_x = player.pos_pl_x - player.veloc * dt 
    end
  end
  if love.keyboard.isDown("up") then
    if player.pos_pl_y > (0 + player.imagem:getHeight() / 2 ) then --Laço para delimitar a movimentação do jogador dentro da tela
      player.pos_pl_y = player.pos_pl_y - player.veloc * dt
    end
  end
  if love.keyboard.isDown("down") then
    if player.pos_pl_y < (alturaTela - player.imagem:getHeight() / 2 ) then --Laço para delimitar a movimentação do jogador dentro da tela
      player.pos_pl_y = player.pos_pl_y + player.veloc * dt
    end
  end
 end 
  --Movimentação do jogador
  
function atirar(dt)
  --Função para disparar
  tmpAtirar = tmpAtirar - (2 * dt)
  if tmpAtirar < 0 then
      atira = true
  end
  if contVivo then
    if love.keyboard.isDown("space") and atira then
      proxDisp = {x = player.pos_pl_x, y = player.pos_pl_y, img = imagemTiro}
      table.insert(tiros, proxDisp)
      audioDisp:stop()    --responsável por executar o som dos disparos assim que se deixa de apertado o botão de atirar
      audioDisp:play()   --responsável por executar o som dos disparos assim que apertado o botão de atirar
      atira = false
      tmpAtirar = dlDisp
    end
  end  
  for i, tiro in ipairs(tiros) do
      tiro.y = tiro.y - (500 * dt)
      if tiro.y < 0 then
        table.remove(tiros, i)
      end
    end
  end
  --Função para disparar
  
function inimigo(dt)
  --Função Inimigos e suas disposições na tela
   tmpInimigo = tmpInimigo - (0.5 * dt)
   if pontos > 30 then
    tmpInimigo = tmpInimigo - (1 * dt)
    tmpAtirar = tmpAtirar - (2 * dt)
    nivel = 2

  end
  if pontos > 60 then
    tmpInimigo = tmpInimigo - (2 * dt)
    tmpAtirar = tmpAtirar - (3 * dt)
    nivel = 3
  end
   if tmpInimigo < 0 then
     tmpInimigo = dlInimigo
     inimAleatorio = math.random(10, love.graphics.getWidth() - ((imagemInimigo:getWidth() / 2) + 10))
   proxInimigo = {x = inimAleatorio, y = -imagemInimigo:getWidth(), img = imagemInimigo}
   table.insert(inimigos, proxInimigo)
  end
  for i, inimigo in ipairs (inimigos) do  --verifica os inimigos na tabela inimigos e remove
    inimigo.y = inimigo.y + (200 * dt)
    if inimigo.y > 850 then
        table.remove (inimigos, i) -- remove os inimigos da tabela
      end
    end
  end
--Função Inimigos e suas disposições na tela

function colisao()
  for i, inimigo in ipairs(inimigos) do --verifica os inimigos existentes
    for j, tiro in ipairs(tiros) do --verifica os disparos existentes
      if verifColisao (inimigo.x, inimigo.y, imagemInimigo:getWidth(), imagemInimigo:getHeight(),tiro.x, tiro.y,imagemInimigo:getWidth(), imagemInimigo:getHeight()) then -- condição de colisão tirando os disparos e o inimigo da tela
        table.remove (tiros, j)
        table.remove (inimigos, i)
        explosaoInim : stop()  -- deixa o audio parado até que seja executado
        explosaoInim : play()  --executa assim que o inimigo é retirado da tabela
        pontos = pontos + 1
      end
    end
    if verifColisao(inimigo.x, inimigo.y, imagemInimigo:getWidth(), imagemInimigo:getHeight(), player.pos_pl_x - (player.imagem:getWidth() / 2), player.pos_pl_y, player.imagem:getWidth(), player.imagem:getHeight()) and contVivo then
      table.remove(inimigos, i) --verifica a colisão do inimigo com a nave
      explosaoPlay:play()     --executa quando a nave é destruida, se uso o stop pois não é executado repetidamente.
      contVivo = false
    end
  end
end

function verifColisao(pos_col_x1, pos_col_y1, pos_col_w1, pos_col_h1, pos_col_x2, pos_col_y2, pos_col_w2, pos_col_h2) --função para verificar as colisões
  return pos_col_x1 < pos_col_x2 + pos_col_w2 and pos_col_x2 < pos_col_x1 + pos_col_w1 and pos_col_y1 < pos_col_y2 + pos_col_h2 and pos_col_y2 < pos_col_y1 + pos_col_h1
end
--função para verificar as colisões

function movfundo(dt) --movimentação do plano de fundo
  fundo.y = fundo.y + fundo.vel * dt 
  fundo.y2 = fundo.y2 + fundo.vel * dt
 
 if fundo.y >alturaTela then
  fundo.y = fundo.y2 - cenarioCont:getHeight()
 end
 if fundo.y2 > alturaTela then
   fundo.y2 = fundo.y - cenario:getHeight()
 end
end

function reincia()
  --reiniciar o jogo, zera as tabelas, posiciona o rato novamente na posição inicial do jogo, zera os pontos
  if not contVivo and love.keyboard.isDown('return') then
    tiros = {}
    inimigos = {}
    
    atira = tmpAtirar
    tmpInimigo = dlInimigo
    
    player.pos_pl_x = larguraTela / 2
    player.pos_pl_y = alturaTela / 2
    
    pontos = 0
    contVivo = true
  --reiniciar o jogo
  end
end

function love.draw()
  --Imprime o cenario
  love.graphics.draw(cenario, fundo.x, fundo.y)
  love.graphics.draw(cenarioCont, fundo.x, fundo.y2) 
  --Imprime o cenario
  
  --pontuação
  love.graphics.setFont(fonte) --carrega a fonte
  love.graphics.print("Pontuacao: ".. pontos, 10, 10) --o pontuação e suas posições na tela
  --pontuação
  love.graphics.print("Level: ".. nivel, 10, 30)

  --imprime jogador, fim de jogo e reinicio
  if contVivo then
    love.graphics.draw(player.imagem, player.pos_pl_x, player.pos_pl_y, 0, 1, 1, player.imagem:getWidth() / 2, player.imagem:getHeight() / 2)
  else
    love.graphics.print ("Seu record: ".. pontos.." pontos", larguraTela / 3, alturaTela / 3)
    love.graphics.print ("Pressione Enter e tente novamente", larguraTela / 5, alturaTela / 2.8)
  end
  --imprimi jogador, fim de jogo e reinicio
  
  --imprime os disparos
  for i, tiro in ipairs(tiros) do
  love.graphics.draw(tiro.img, tiro.x, tiro.y, 0, 1, 1, imagemTiro:getWidth() / 2, imagemTiro:getHeight())
  --imprime os disparos
end

--imprime os inimigos
for i, inimigo in ipairs(inimigos) do
  love.graphics.draw(inimigo.img, inimigo.x, inimigo.y)
  end
--imprime os inimigos
end