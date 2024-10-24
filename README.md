---

# Gato Luva de Pedreiro

Este é um jogo 2D desenvolvido em **Lua** usando o framework **Love2D**. O jogador controla um rato que precisa se defender de inimigos (gatos) atirando neles com luvas. O jogo possui vários níveis de dificuldade que aumentam conforme a pontuação do jogador.

## Como Jogar

- **Movimentação**: 
  - Use as **setas direcionais** (`↑`, `↓`, `→`, `←`) para mover o rato pela tela.
  
- **Atirar**:
  - Pressione **barra de espaço** para atirar luvas nos inimigos (gatos).

- **Objetivo**:
  - Atingir os inimigos para ganhar pontos.
  - Evitar que os inimigos colidam com o jogador.

- **Níveis**:
  - O jogo aumenta de dificuldade conforme a pontuação do jogador. Novos níveis são atingidos após a pontuação de 30 e 60 pontos.

- **Reiniciar Jogo**:
  - Se o jogador for atingido por um inimigo, o jogo termina. Pressione **Enter** para reiniciar o jogo.

## Instalação

### Pré-requisitos

1. **Love2D**: Certifique-se de que o Love2D está instalado no seu sistema.
   - [Baixe o Love2D](https://love2d.org/)

2. **Código-fonte**: Faça o download do código-fonte e todos os recursos de mídia (imagens e sons).

### Como Executar

1. Coloque todos os arquivos do jogo (imagens, sons e o código `main.lua`) na mesma pasta.
2. Abra o terminal ou prompt de comando.
3. Navegue até o diretório do jogo.
4. Execute o comando:
   ```bash
   love .
   ```

Isso abrirá o jogo no Love2D.

## Recursos Utilizados

### Imagens
- **rato.png**: Imagem do jogador (rato).
- **gato.png**: Imagem dos inimigos.
- **luva.png**: Imagem do disparo.
- **background.png**: Cenário do jogo (com movimento infinito).

### Sons
- **disparoluva.mp3**: Som do disparo.
- **morte_gato.mp3**: Som de explosão ao ser atingido.
- **Miado.mp3**: Som de explosão do inimigo.
- **fundo.mp3**: Música de fundo (em loop).

### Fontes
- **PressStart2.ttf**: Fonte usada para exibir a pontuação e o nível.

## Controles

- **Movimento**: Setas direcionais (`←`, `→`, `↑`, `↓`)
- **Atirar**: Barra de espaço (`space`)
- **Reiniciar Jogo**: Pressione `Enter` após o fim do jogo.

## Funcionalidades Futuras

- Melhoria nos níveis de dificuldade.
- Adição de novos tipos de inimigos.
- Implementação de poderes especiais para o jogador.

---
