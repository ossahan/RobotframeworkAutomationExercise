*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Tabbed Windows Test
    open browser    https://demo.automationtesting.in/Windows.html    edge
    maximize browser window
    click element    xpath://*[@id="Tabbed"]/a/button

    switch window    title=Selenium
    click element    xpath://*[@id="main_navbar"]/ul/li[6]

