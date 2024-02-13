*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Resource    ../env.robot


*** Variables ***
${responseCode}


*** Keywords ***
Get Booking
    ${response}    GET    ${GetBooking}/${id}
    Status Should Be    200
    Log To Console    ${response.content}
    Log To Console    ${response.json()}[bookingdates][checkin]
