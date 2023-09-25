*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Resource    env.robot


*** Variables ***
${responseCode}


*** Test Cases ***
Get Booking
    ${response}    GET    ${GetBooking}/24
    Status Should Be    200
    Log To Console    ${response.content}
    Log To Console    ${response.json()}[bookingdates][checkin]
