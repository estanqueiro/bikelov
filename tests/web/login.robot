*** Settings ***
Documentation   Login
...             Para que eu possa ter acesso à interface de gestão de anúncios
...             Sendo um usuário que possui um email
...             Quero poder iniciar uma nova sessão

Resource  ../resources/steps_kw.resource

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Usuário consegue logar
    Dado que acesso a página login
    Quando eu submeto minha credencial de login "eu@papito.io"
    Então a área logada deve ser exibida

Usuário não loga com email incorreto
    [Template]    Tentar logar
    eupapito.io   Oops. Informe um email válido!

Usuário não loga com email com caracter inválido
    [Template]    Tentar logar
    eu&papito.io  Oops. Informe um email válido!

Usuário não loga sem email
    [Template]    Tentar logar
    ${EMPTY}      Oops. Informe um email válido!

*** Keywords ***
Tentar logar
    [Arguments]  ${email}   ${expected_message}

    Dado que acesso a página login
    Quando eu submeto minha credencial de login "${email}"
    Então devo ver a mensagem de alerta "${expected_message}"


