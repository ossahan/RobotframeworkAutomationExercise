*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
HandlingAlerts
    open browser    https://the-internet.herokuapp.com/javascript_alerts    chrome
    maximize browser window


    #click element    xpath://*[text()='Click for JS Alert']
    click element    //*[text()='Click for JS Confirm']


    #handle alert    Leave
    #handle alert    Accept
    handle alert    dismiss
    alert should not be present
