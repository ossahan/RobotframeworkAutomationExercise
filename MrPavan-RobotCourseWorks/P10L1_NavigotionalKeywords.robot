*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
NavigationTest
    open browser    https://www.google.com    edge
    ${loc}=    get location
    log to console    ${loc}

    go to    https://www.bing.com
    ${loc}=    get location
    log to console    ${loc}

    go back
    ${loc}=    get location
    log to console    ${loc}

