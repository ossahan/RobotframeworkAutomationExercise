*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
MyTestCase
    open browser     https://demowebshop.tricentis.com/register  chrome
    maximize browser window

    open browser    https://automationexercise.com/    chrome
    maximize browser window

    close all browsers
