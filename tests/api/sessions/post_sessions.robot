*** Settings ***
Resource    ../../../resources/services.resource

Test Setup  Create Session  bikelov  ${base_url}

*** Test Cases ***
New Session
    ${payload}  To Json         {"email": "jason.toddy@dc.com"}  
    ${resp}     Post Session    ${payload}
    Should Be Equal As Strings  ${resp.status_code}  200  

Wrong Email
    ${payload}  To Json         {"email": "jason.toddy&dc.com"}  
    ${resp}     Post Session    ${payload}
    Should Be Equal As Strings  ${resp.status_code}  409

Empty Email
    ${payload}  To Json         {"email": ""}  
    ${resp}     Post Session    ${payload}
    Should Be Equal As Strings  ${resp.status_code}  412

Without Data
    ${payload}  To Json         {}  
    ${resp}     Post Session    ${payload}
    Should Be Equal As Strings  ${resp.status_code}  412 
