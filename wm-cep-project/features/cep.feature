# language: pt

Funcionalidade: CEP Correios

Contexto:
	Dado endereço da API para consultar CEP 

Cenário: Pesquisar CEP válido
	Quando envio o CEP válido "06065420" para consulta 
	Então sistema irá retornar o status OK 200
	E será exibido o bairro "Cipava"
	E será exibido o logradouro "Rua Vasco da Gama"
	E será exibido o CEP "06065420"
	E será exibido o UF "SP"
	E será exibido a localidade "Osasco"

Cenário: Pesquisar CEP inválido
	Quando envio o CEP inválido "00000000" para consulta
	Então sistema irá retornar a mensagem de CEP não encontrado 
