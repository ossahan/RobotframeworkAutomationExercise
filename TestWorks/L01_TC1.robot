*** Settings ***

Library
Library    SeleniumLibrary



*** Variables ***
${browser}    chrome
${url}    https://demo.nopcommerce.com/
*** Test Cases ***
LoginTest
   # create webdriver
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    loginToApllication
    #close browser


*** Keywords ***
loginToApllication
     click link    xpath://*[@class="ico-login"]
    input text    id:Email  pezoteyo@hml.com
    input text    id:Password    Test*123
    click button    xpath://*[@class="button-1 login-button"]
    capture page screenshot

