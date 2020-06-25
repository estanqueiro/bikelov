*** Settings ***
Library    Collections
Library    OperatingSystem
Library    RequestsLibrary
Library    lib/mongo.py 

*** Variables ***
${base_url}  http://bikelov-api.herokuapp.com

*** Keywords ***
#### /sessions
Post Session
    [Arguments]    ${payload}
    &{headers}     Create Dictionary    Content-Type=application/json
    ${resp}        Post Request         bikelov    /sessions    data=${payload}   headers=${headers}
    [Return]       ${resp}

Get User Id 
    [Arguments]    ${email}
    ${payload}     To Json              {"email": "${email}"}    
    ${resp}        Post Session         ${payload}
    ${user_id}     Convert To String    ${resp.json()['_id']}
    [Return]       ${user_id}

#### /bikes
Post Bike Ad
    [Arguments]    ${user_id}           ${payload}        ${thumb}
    &{headers}     Create Dictionary    user_id=${user_id}
    ${file_bin}    Get Binary File      ${CURDIR}/images/${thumb}
    &{files}       Create Dictionary    thumbnail=${file_bin}
    ${resp}        Post Request         bikelov    /bikes    data=${payload}    headers=${headers}    files=${files}
    [Return]       ${resp}

Get Bike Ad By Id
    [Arguments]    ${bike_id}    ${user_id}
    &{headers}     Create Dictionary    Content-Type=application/json    user_id=${user_id}
    ${resp}        Get Request          bikelov    /bikes/${bike_id}    headers=${headers}
    [Return]       ${resp}