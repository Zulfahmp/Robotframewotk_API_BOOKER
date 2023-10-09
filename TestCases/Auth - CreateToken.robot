*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Resource    ../env.robot


*** Test Cases ***
Create Token Positive
    ${header}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    username=${username}    password=${password}
    ${response}=    POST    ${Auth}    headers=${header}    json=${body}
    Status Should Be    200
    Log To Console    ${response.json()}[token]

Create Token Negative
    ${header}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    username=${username}    password=${passwordInvalid}
    ${response}=    POST    ${Auth}    headers=${header}    json=${body}
    Status Should Be    200
    Log To Console    ${response.json()}[reason]
    ${respBad}=    Convert Json To String    ${response.json()}[reason]
    Should Be Equal    ${respBad}    "Bad credentials"
