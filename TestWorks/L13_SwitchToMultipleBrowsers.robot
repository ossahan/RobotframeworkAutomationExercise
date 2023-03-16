*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
MultipleBrowsers Test
    open browser    https://www.socksstations.com    edge

    maximize browser window
    sleep    3

    open browser    https://www.sockston.com    edge
    maximize browser window


    switch browser     1
    ${title1}=    get title
    log to console    ${title1}

    switch browser    2
    ${title2}=    get title
    log to console    ${title2}

    sleep    3
    close browser



