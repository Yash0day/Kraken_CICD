*** Settings ***
Documentation     Test cases for the calculator Flask application
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://localhost:8443  # Update this based on your Flask app's URL

*** Test Cases ***
Test Index Page
    ${response}=  Get Request  ${BASE_URL}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.text}  Calculator

Test Calculation
    ${data}=  Create Dictionary  num1=5  num2=3  operation=add
    ${headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response}=  Post Request  ${BASE_URL}/calculate  data=${data}  headers=${headers}
    
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.text}  "result": 8
