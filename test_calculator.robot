*** Settings ***
Library         RequestsLibrary

Suite Setup     Create Session    flaskapp    http://localhost:8443

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  http://localhost:8443
Calculate Endpoint Test
    &{data}=    Create Dictionary    num1=5    num2=3    operation=add
    ${resp}=    POST On Session    flaskapp    /calculate    data=${data}    expected_status=200

    Status Should Be                   200    ${resp}
