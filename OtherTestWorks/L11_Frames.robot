*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Testing Frames
    open browser    https://www.selenium.dev/selenium/docs/api/java/index.html?overview-summary.html    chrome
    maximize browser window

    select frame    packageListFrame  #etc. xpath=//*[@name="packageListFrame"]      #write here name of the frame or id or xpath
    click link     org.openqa.selenium
    unselect frame
     sleep    3

    select frame    xpath=//*[@name="packageFrame"]    #That way also possible
    click link    WebDriver
    unselect frame
     sleep    3


    select frame    classFrame
    click link     Index
    unselect frame
     sleep    3

    close browser


