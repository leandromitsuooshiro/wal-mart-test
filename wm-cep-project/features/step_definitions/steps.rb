# encoding: utf-8

Dado(/^endereço da API para consultar CEP$/) do
  @api = 'http://cep.correiocontrol.com.br/'
end

Quando(/^envio o CEP válido "([^"]*)" para consulta$/) do |cep|
  @response = HTTParty.get(@api + cep + '.json')
end

Então(/^sistema irá retornar o status OK 200$/) do
  expect(@response.code).to eq(200)
end

Então(/^será exibido o bairro "([^"]*)"$/) do |bairro|
  expect(@response.parsed_response["bairro"]).to eq(bairro)
end

Então(/^será exibido o logradouro "([^"]*)"$/) do |logradouro|
  expect(@response.parsed_response["logradouro"]).to eq(logradouro)
end

Então(/^será exibido o CEP "([^"]*)"$/) do |cep|
  expect(@response.parsed_response["cep"]).to eq(cep)
end

Então(/^será exibido o UF "([^"]*)"$/) do |uf|
  expect(@response.parsed_response["uf"]).to eq(uf)
end

Então(/^será exibido a localidade "([^"]*)"$/) do |localidade|
  expect(@response.parsed_response["localidade"]).to eq(localidade)
end

Quando(/^envio o CEP inválido "([^"]*)" para consulta$/) do |cepinvalido|
  @response = HTTParty.get(@api + cepinvalido + '.json')
end

Então(/^sistema irá retornar a mensagem de CEP não encontrado$/) do
  response_extract = /\{(.*?)\}/.match(@response.body).to_s
  response_extract = JSON.parse(response_extract)
  expect(response_extract["erro"]).to eq(true)

end
