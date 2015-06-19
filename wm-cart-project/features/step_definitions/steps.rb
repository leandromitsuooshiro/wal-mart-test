# encoding: utf-8

Dado(/^que visito a pagina do walmart$/) do
  visit 'http://www.walmart.com.br/'
end

Dado(/^busco pela palavra tv$/) do
  fill_in 'suggestion-search', :with=> "tv"
  click_button 'Procurar'
end

Quando(/^sistema exibe os resulados$/) do
  expect(page).to have_content 'Resultados de busca para "tv"'
end

Quando(/^clico em um produto$/) do
  click_link('TV LED 40” Samsung 40H5100 Full HD Função Futebol ConnectShare Movie')
end

Entao(/^sistema exibe os detalhes do produto$/) do
  expect(page).to have_content 'TV LED 40” Samsung 40H5100 Full HD Função Futebol ConnectShare Movie'
end

Entao(/^clico no botão adicionar ao carrinho$/) do
  click_button 'Adicionar ao carrinho'
end

Entao(/^clino no botão continuar$/) do
  click_button 'Continuar'
end

Então(/^clico no botão do carrinho$/) do
  page.find('.cart-link').click
end

Então(/^sistema exibe o produto selecionado$/) do
  expect(page).to have_content 'TV LED 40” Samsung 40H5100 Full HD Função Futebol ConnectShare Movie'
end

