*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Resource    ../env.robot


*** Variables ***
${firstname}


*** Keywords ***
Create Booking
    ${json}    Load Json From File    ${CURDIR}/JSON/createBooking.json
    ${header}    Create Dictionary    Content-Type=application/json
    ${response}    POST    ${CreateBooking}    headers=${header}    json=${json}
    Log To Console    ${response.content}
    ${bookingId}    Convert To String    ${response.json()}[bookingid]
    Set Global Variable    ${firstname}    ${response.json()}[booking][firstname]
    Set Global Variable    ${id}    ${response.json()}[bookingid]
    Log To Console    ${bookingId}
    Status Should Be    200
