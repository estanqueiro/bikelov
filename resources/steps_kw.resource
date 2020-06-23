*** Settings ***
Library   JSONLibrary
Library  ./lib/mongo.py
Resource  base.resource

*** Keywords ***
Dado que acesso a página login
    Go To  ${BASE_URL}

Quando eu submeto minha credencial de login "${email}"
    Input Text      ${INPUT_EMAIL}  ${email}
    Click Button    ${BUTTON_LOGIN}

Então a área logada deve ser exibida
    Wait Until Page Contains Element  ${DIV_DASHBOARD}

Então devo ver a mensagem de alerta "${expected_message}"
    Wait Until Page Contains Element  ${ALERT_DARK}
    Element Text Should Be            ${ALERT_DARK}  ${expected_message}

Então devo ver uma mensagem de erro "${message}"
    Wait Until Page Contains Element  ${ALERT_ERROR}
    Element Text Should Be            ${ALERT_ERROR}    ${message}

Dado que eu tenho uma "${bike_string}" muito bonita
    # pega a massa de teste e converte de string para json de verdade
    ${bike_json}        Convert String To JSON  ${bike_string}
    Log                 ${bike_json}
    Set Test Variable   ${bike_json}
    # Nova bike não pode existir no meu ambiente
    Remove Bike         ${bike_json['name']}

E eu acesso o formulário de cadastro de anúncios
    Click Button        ${BUTTON_ANUNCIAR}

Quando eu faço o anúncio dessa bike
    Run Keyword If      '${bike_json['thumb']}' != ''   Choose File           ${INPUT_THUMBNAIL}   ${CURDIR}\\images\\${bike_json['thumb']}
    Clear Element Text  ${INPUT_NAME}
    Input Text          ${INPUT_NAME}                   ${bike_json['name']}
    Clear Element Text  ${INPUT_BRAND}
    Input Text          ${INPUT_BRAND}                  ${bike_json['brand']}
    Input Text          ${INPUT_PRICE}                  ${bike_json['price']}
    Click Button        ${BUTTON_SUBMIT}

Então devo ver minha bike na lista de anúncios
    Wait Until Element Contains  ${BIKE_LIST}  ${bike_json['name']}

E o valor para locação deve ser igual a "${expected_price}"
    Wait Until Element Contains  ${BIKE_LIST}  ${expected_price}
