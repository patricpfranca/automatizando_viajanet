#language: pt

Funcionalidade: Reserva de viagem
  Para que eu possa reservar uma viagem.

  Cenário: Reservando uma passagem
    Dado que acesso o site da ViajaNet
    Quando preencho os campos obrigatórios e realizo a busca
    Então escolho o voo e clico em comprar
    E preencho os dados do passageiro e forma de pagamento
    Quando finalizo a compra
    Então devo visualizar a mensagem 'Reserva em processamento'
