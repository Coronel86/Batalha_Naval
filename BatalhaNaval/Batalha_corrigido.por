programa {
  funcao inicio() {
    // 1. O tabuleiro (onde o "X" é o navio escondido)
    cadeia mapa[4][4] = { 
      {"N", "~", "~", "~"}, 
      {"~", "~", "~", "~"},
      {"~", "N", "~", "~"},
      {"~", "N", "~", "~\n"}
    }

    inteiro linhaTiro, colunaTiro, opcao
    inteiro rodada = 1	
    inteiro pontos = 0
    inteiro municao = 5
    
    faca{
    	escreva("========= MENU =========\n")
    	escreva("1- Jogar\n")
    	escreva("2- Regras\n")
    	escreva("3- Sair\n")
    	escreva("Digite uma opção: ")
    	leia(opcao)
    	escreva("\n")

	escolha(opcao){
		caso 1:
			enquanto(rodada <= 5){ // Aqui valida rodada/munição
				escreva("\nRODADA: ", rodada, "\n\n")
				se(pontos == 3){ //valida se o jogador atingiu a pontuação necessária
					escreva("VOCÊ NAUFRAGOU TODOS OS NAVIOS!!!")
					rodada = 5
				}senao{ // continua o jogo se ainda não atingiu os 3 ponto e tem munição
					escreva("--- TIRO AO ALVO ---\n")
    					escreva("Digite a linha (0 a 3): ")
    					leia(linhaTiro)
    					escreva("Digite a coluna (0 a 3): ")
    					leia(colunaTiro)

   					limpa()

   					 se (mapa[linhaTiro][colunaTiro] == "N") {
        					escreva("FOGO!! Você acertou o navio!\n\n")
        					mapa[linhaTiro][colunaTiro] = "*" // "X" de alvo atingido
        					pontos++
    					} senao {
        					escreva("ÁGUA... tente na próxima!\n\n")
        					mapa[linhaTiro][colunaTiro] = "A"
    					}

					para(inteiro i = 0; i < 4; i++) {
      					para(inteiro j = 0; j < 4; j++) {
        			// Se ainda for o navio escondido "X", mostramos "~" para o jogador não ver
        						se (mapa[i][j] == "N") {
          						escreva("~  ")
        						} senao {
          						escreva(mapa[i][j], " ")
        						}
      					}
      					escreva("\n")
    					}

    					

				}
					
   				rodada++ //acrescenta mais +1 para rodada 
   				municao-- //mostra em tela menos uma munição para o jogador ficar esperto
   				escreva("Você tem ", municao, " munições ainda...\n")
   				se(rodada > 5){
					escreva("GAME OVER!!!\n")
					escreva("Tente novamente!\n")
   				}

			}
			
			pare
		caso 2:
			escreva("-----> REGRAS <-----\n")
			escreva("Você deve escolher uma linha e uma coluna entre 0 e 3, ")
			escreva("precisará fazer 3 pontos para ganhar, mas cuidado tem apenas 5 munições!.\n")
			escreva("Caso você acerte o alvo no mapa ficará marcado com um '*' e caso erre terá um 'A' \n")
			escreva("Caso acerte os 3 navios você venceu, caso perca todas as munições sem afundar, ")
			escreva(" os 3 inimigos você perdeu(PERDEU A GUERRA)\n")
			pare
		caso 3:
			escreva("Obrigado por jogar...")
			pare
		caso contrario:
			escreva("Digite uma opção válida!!!")
			pare
	}
    }enquanto(opcao != 3)

    

    
  }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 637; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */