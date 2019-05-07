#language: pt

Funcionalidade: Reserva de viagem
  Para que eu possa reservar uma viagem.

  Cenário: Reservando uma passagem
    Dado que acesso o site da ViajaNet
    Quando preencho os campos obrigatórios e realizo a busca
    Então escolho o voo e clico em comprar
    E preencho os dados do passageiro e forma de pagamento
    | email              | name  | lastname | birthdate  | gender    | brand      | cardnumber       | validate_m | validate_y | cvv | holder         | cpf         | cep      | number | phone       |
    | teste@teste.com.br | Pedro | Henrique | 16/08/1992 | Masculino | Mastercard | 5598197845570192 | 05         | 2021       | 619 | Pedro Henrique | 91150655020 | 49075370 | 450    | 67993257408 |    
    Quando finalizo a compra
    Então devo visualizar a mensagem 'Reserva em processamento'
