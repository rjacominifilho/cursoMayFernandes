*** Settings ***

Library   SeleniumLibrary

*** Variables ***

${BROWSER}                      chrome
${BASE_URL}                     http://www.google.com.br
${URL}                          http://www.amazon.com.br
${MENU_ELETRONICOS}             //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}           //h1[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}               twotabsearchtextbox
${BOTAO_PESQUISAR}              nav-search-submit-button

*** Keywords ***

Abrir Browser
    Open Browser                     ${BASE_URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar Browser
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                            ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}            10

Entrar no menu "Eletrônicos"
    Click Element                    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         ${FRASE}    10
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}          10

Verificar se o título da página fica "${TITULO}"
    Sleep    1
    Title Should Be                  ${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible        //img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                       ${CAMPO_PESQUISA}    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element                    ${BOTAO_PESQUISAR}

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    (//span[contains(.,'${PRODUTO}')])[3]        10
    
#GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    E um produto da linha "Xbox Series S" deve ser mostrado na página