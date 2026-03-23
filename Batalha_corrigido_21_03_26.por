programa {
  funcao inicio() {
    inteiro linhaTiro, colunaTiro, opcao
    inteiro rodada, pontos, municao

    faca {
      escreva("\n")
    	escreva("\n")
    	escreva("========= MENU =========\n")
    	escreva("\n")
    	escreva("1- Jogar\n")
    	escreva("2- Regras\n")
    	escreva("3- Sair\n")
    	escreva("\n")
    	escreva("========================\n")
    	escreva("\n")
    	escreva("Digite uma opção: ")
    	leia(opcao)
    	escreva("\n")

      escolha(opcao) {
        caso 1:
          // Resetando o jogo para uma nova partida
          rodada = 1
          pontos = 0
          municao = 5
          // 1. O tabuleiro (onde o "N" é o navio escondido)
          cadeia mapa[4][4] = { 
            {"N", "~", "~", "~"}, 
            {"~", "~", "~", "~"},
            {"~", "N", "~", "~"},
            {"~", "N", "~", "~"}
          }

          enquanto(rodada <= 5) { // Aqui valida rodada/munição
            se(pontos == 3) { //valida se o jogador atingiu a pontuação necessária
              escreva("VOCÊ NAUFRAGOU TODOS OS NAVIOS!!\n")
              escreva("\n")
              escreva("\n")
              escreva("****** VENCEU A BATALHA!! ******\n")
              pare // Sai do 'enquanto' e volta para o menu
          }

            
            escreva("--- TIRO AO ALVO ---\n")
            escreva("\n")
            escreva("Digite a linha (0 a 3): ")
            leia(linhaTiro)
            escreva("\n")
            escreva("Digite a coluna (0 a 3): ")
            leia(colunaTiro)

            limpa()

            // Validação simples para não travar o programa se digitar número errado
            se (linhaTiro < 0 ou linhaTiro > 3 ou colunaTiro < 0 ou colunaTiro > 3) {
                escreva("Coordenadas inválidas! Perdeu o tiro no mar...\n")
            } senao se (mapa[linhaTiro][colunaTiro] == "N") {
                escreva("FOGO!! Você acertou um navio!\n")
                mapa[linhaTiro][colunaTiro] = "*" // "*" de alvo atingido
                pontos++
            } senao se (mapa[linhaTiro][colunaTiro] == "*" ou mapa[linhaTiro][colunaTiro] == "A") {
                escreva("Você já atirou aqui! Perdeu a munição...\n")
            } senao {
                escreva("ÁGUA... tente na próxima!\n") 
                mapa[linhaTiro][colunaTiro] = "A" // "A" de ÁGUA atingido
            }

            // Desenha o mapa atualizado
            escreva("\n")
            para(inteiro i = 0; i < 4; i++) {
                para(inteiro j = 0; j < 4; j++) {
                  // Se ainda for o navio escondido "N", mostramos "~" para o jogador não ver
                    se (mapa[i][j] == "N") {
                        escreva("~  ") 
                    } senao {
                        escreva(mapa[i][j], "  ")
                    }
                }
                escreva("\n")
            }

              rodada++ //acrescenta mais +1 para rodada
    					municao-- //mostra em tela menos uma munição para o jogador ficar esperto
              se(municao == 0) {
              escreva("GAME OVER! Suas munições acabaram.\n")
              escreva("\n")
					    escreva("\n")
					    escreva("Tente novamente!\n")
              pare
            }

              escreva("\n#####  Rodada: ", rodada, "  #####\n")
              escreva("\n")
              escreva("Você tem: ", municao, " Munições!!!\n")
   						escreva("\n")
              escreva("Você tem: ", pontos, " Ponto!!!\n")
   						escreva("\n")
   						escreva("\n")
          }
          pare

        caso 2:
          escreva("-----> REGRAS <-----\n")
			escreva("\n")
			escreva("Você deve escolher uma linha e uma coluna entre 0 e 3. ")
			escreva("Precisará fazer 3 pontos para ganhar, mas cuidado tem apenas 5 munições!\n")
			escreva("Caso você acerte o alvo no mapa ficará marcado com um '*' de < FOGO! > e caso erre terá um 'A' de < ÁGUA! > \n")
			escreva("Caso acerte os 3 navios você < VENCEU!! >, caso perca todas as munições sem afundar, \n")
			escreva("Caso perca todas as munições sem afundar os 3 inimigos você < PERDEU A GUERRA!! > \n")
			escreva("\n")
			escreva("\n")
          pare

        caso 3:
          escreva("Obrigado por jogar...\n")
          escreva("\n")
			    pare

        caso contrario:
          escreva("ERRO: Digite uma opção válida!!!\n")
      }
    } enquanto(opcao != 3)
  }
}