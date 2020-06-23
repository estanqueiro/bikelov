*** Settings ***
Resource    ../../../resources/services.resource

Test Setup  Create Session  bikelov  ${base_url}

*** Test Cases ***
Create A New Bike Ad
    ${user_id}=    Get User Id     eu@paulo.io
    ${payload}     To Json         {"name": "Vulcan Aro 29", "brand": "Caloi", "price": "10"}
    Remove Bike    ${payload['name']}
    ${resp}        Post Bike Ad    ${user_id}             ${payload}    vulcan.jpg
    Should Be Equal As Strings     ${resp.status_code}    200  

Empty Name
    Required Fields    {"name": "", "brand": "Caloi", "price": "10"}            1001    Bike name is required

Empty Brand
    Required Fields    {"name": "Vulcan Aro 29", "brand": "", "price": "10"}    1002    Brand is required

*** Keywords ***
Required Fields
    [Arguments]    ${json}    ${expected_code}    ${expected_error}
    ${user_id}=    Get User Id        eu@paulo.io
    ${payload}     To Json            ${json}
    Remove Bike    ${payload['name']}
    ${resp}        Post Bike Ad       ${user_id}                ${payload}    vulcan.jpg
    Should Be Equal As Strings        ${resp.status_code}       412
    Should Be Equal As Integers       ${resp.json()['code']}    ${expected_code}
    Should Be Equal As Strings        ${resp.json()['error']}   ${expected_error}
