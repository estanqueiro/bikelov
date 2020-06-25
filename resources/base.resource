*** Settings ***
Library  SeleniumLibrary
Resource  elements.resource

*** Variables ***
${BASE_URL}  https://bikelov-anunciante.herokuapp.com/
${BROWSER}   chrome

*** Keywords ***
Start Session
    Open Browser        about:blank    ${BROWSER}
    Set Selenium Implicit Wait  10
    #Set Window Size     1440           900

End Session
    Close Browser

Logged With "${email}"
    Start Session
    Go To          ${BASE_URL}
    Input Text     ${INPUT_EMAIL}     ${email}
    Click Element  ${BUTTON_LOGIN}   
    Page Should Contain Element       ${DIV_DASHBOARD}

End Test
    Capture Page Screenshot