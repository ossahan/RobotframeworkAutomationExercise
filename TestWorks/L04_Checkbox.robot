*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://asunnot.oikotie.fi/myytavat-asunnot

*** Test Cases ***
Testing Radio Buttons and Check Boxes
    open browser   ${url}    ${browser}
    maximize browser window
    #set selenium speed    2sconds
    select frame    id=sp_message_iframe_761217
    click element    xpath://*[@title="Hyväksy kaikki evästeet"]
    unselect frame
    scroll element into view    xpath://*[@for="search-input-roomCount-4"]
#    ${value}=    get webelement    xpath://*[@for="search-input-roomCount-1"]
#    log to console     ${value}

    #Selecting radio buttons

    click element    xpath://*[@for="search-input-roomCount-3"]
    click element    xpath://*[@for="search-input-roomCount-4"]
    click element    xpath://*[@for='search-input-roomCount-5']
    #select radio button    roomCount  '2':'2h'
    sleep    3



*** Keywords ***

