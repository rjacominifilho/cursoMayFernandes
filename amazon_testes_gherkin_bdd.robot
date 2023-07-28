*** Settings ***
Documentation       Esta suite testa o site amazon.com.br
Resource            amazon_resources.robot
Test Setup          Abrir Browser
Test Teardown       Fechar Browser   

*** Test Cases ***

Acesso ao menu Eletrônicos
    [Documentation]    Esse teste veririca o menu "eletrônicos do site amazon.com.br"
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus   categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    