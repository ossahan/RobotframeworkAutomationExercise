*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://qbek.github.io/selenium-exercises/en/radio_buttons.html

*** Test Cases ***
Testing Radio Buttons and Check Boxes
    open browser   ${url}    ${browser}
    maximize browser window
    set selenium speed    1seconds

   # ${value}=    get webelement    xpath://*[@for="search-input-roomCount-1"]
    # log to console     ${value}

    #Selecting radio buttons
    select radio button    radio-select    rmffm
    select radio button    radio-select    radiozet
    select radio button    radio-select    polskieradio


    #select radio button    roomCount  '2':'2h'
    sleep    3



*** Keywords ***

