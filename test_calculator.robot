*** Settings ***
Documentation     Test cases for the calculator Flask application
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:8443  # Update this based on your Flask app's URL

*** Test Cases ***
Test Index Page
    Open Browser  ${BASE_URL}  chrome
    Wait Until Page Contains  Calculator
    Close Browser

Test Calculation
    [Setup]  Open Browser  ${BASE_URL}  chrome
    Input Text  id=num1  5
    Input Text  id=num2  3
    Select From List by Value  id=operation  add
    Click Button  id=calculate
    Wait Until Element Is Visible  id=result
    ${result}=  Get Text  id=result
    Should Be Equal As Numbers  ${result}  8
    [Teardown]  Close Browser
