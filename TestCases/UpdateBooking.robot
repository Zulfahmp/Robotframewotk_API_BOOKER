*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Resource    ../env.robot
Resource    ../TestCases/Auth - CreateToken.robot
Resource    ../TestCases/CreateBooking.robot
Resource    ../TestCases/GetBooking.robot
Resource    ../TestCases/DeleteBooking.robot


*** Test Cases ***
Update Booking Based Id
    Create Token Positive
    ${json}    Load Json From File    ${CURDIR}/JSON/updateBooking.json
    ${header}    Create Dictionary    Content-Type=application/json    Accept=application/json    Cookie=${token}
    ${response}    PUT    url=${UpdateBooking}/${id}    headers=${header}    json=${json}
    Log To Console    ${response}
    Status Should Be    200
