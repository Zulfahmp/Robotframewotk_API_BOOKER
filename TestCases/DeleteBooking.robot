*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Resource    ../env.robot


*** Keywords ***
Delete Booking
    ${header}    Create Dictionary    Content-Type=application/json    Cookie=${token}
    ${response}    DELETE    url=${DeleteBooking}/${id}    headers=${header}
    Log To Console    ${response.content}
    Status Should Be    201
