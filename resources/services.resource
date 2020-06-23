*** Settings ***
Library     RequestsLibrary

*** Variables ***
${base_url}  http://bikelov-api.herokuapp.com

*** Keywords ***
#### /sessions
Post Session
    [Arguments]  ${payload}
    &{headers}   Create Dictionary  Content-Type=application/json
    ${resp}      Post Request       bikelov    /sessions    data=${payload}   headers=${headers}
    [Return]     ${resp}
