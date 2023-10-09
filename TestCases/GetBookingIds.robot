*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Resource    ../env.robot

*** Test Cases ***
Get Booking ID
    ${response}=    GET    ${GetBookingIds}
    Log To Console    ${response.content}
    Log To Console    ${response.json()}
