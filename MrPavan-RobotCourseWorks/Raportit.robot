*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library   ../PageObjects/mrb.py




*** Variables ***
${url}  https://accounts.google.com
${chromedriver_path}         "C:\development\chromedriver.exe"

*** Test Cases ***
Report
  Raport

*** Keywords ***
Raport
  #${chromedriver_path}=   mrb.Get Chromedriver Path
  #Create Webdriver    chrome   executable_path=${chromedriver_path}

  ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method    ${options}    add_argument    incognito
  Create WebDriver    Chrome    chrome_options=${options}

  Go to  ${url}

  Maximize Browser Window

  Input Text    identifier    osmansahan111
    Set Selenium Speed    5
  Click Element    identifierNext


  #Add Cookie    GMAIL_AT   AF6bupMpvuutxmPsXvNjEeZvLbTCXXJNkA







