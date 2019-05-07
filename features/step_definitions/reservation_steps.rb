search_pages = SearchPages.new
fly_pages = FlysPages.new
payment_data = PaymentData.new

Dado("que acesso o site da ViajaNet") do
  visit '/'
  search_pages.close_modal
end

Quando("preencho os campos obrigatórios e realizo a busca") do
  search_pages.destination('Salvador', 'Porto Alegre')
  search_pages.choose_date('20/6/2019', '10/7/2019')
  search_pages.search
end

Então("escolho o voo e clico em comprar") do
  fly_pages.choose_fly
  fly_pages.purchase_button
end

Então("preencho os dados do passageiro e forma de pagamento") do |data|
  payment_data.registration_passenger(data.hashes.first)
end

Quando("finalizo a compra") do
  payment_data.complete
end

Então("devo visualizar a mensagem {string}") do |msg|
  payment_data.message(msg)
end
