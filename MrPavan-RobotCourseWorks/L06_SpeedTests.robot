*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
RegTest
    ${speed}=   get selenium speed
    log to console    ${speed}
    open browser    https://demowebshop.tricentis.com/register  chrome
    maximize browser window

    set selenium speed    1
    select radio button    Gender   M
    input text    name:FirstName    Osmo
    input text    name:LastName     Sahanen
    input text    name:Email        osmosahanen@trbnm.com
    input text    name:Password     SahanenOsmo
    input text    name:ConfirmPassword     SahanenOsmo
     ${speed}=   get selenium speed
    log to console    ${speed}
