*** Settings ***
Documentation       Esta suite testa o site amazon.com.br
Resource            amazon_resources.robot
Test Setup          Abrir Browser
Test Teardown       Fechar Browser   

*** Test Cases ***

Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste veririca o menu "eletrônicos do site amazon.com.br"
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus   categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"