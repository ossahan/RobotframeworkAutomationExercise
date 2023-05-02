*** Settings ***
Library  SeleniumLibrary
Resource   ../Resource/Keywords/VuoroNetLoginResources.robot
Variables  ../PageObjects/Locators.py
Library  DataDriver  ../TestData/VuoroNetDatesData.xlsx  sheet_name=Sheet2
Library    Screenshot
Library    ExcelLibrary
Library    DateTime

Suite Setup  Open Browser To Login Page
Test Template  Time Schedule
Suite Teardown  Close Browsers

*** Variables ***
${url}  https://vuoro.net

*** Test Cases ***
TC01
  Open Browser  ${url}
  Maximize Browser Window


*** Keywords ***

Open Browser To Login Page
  Open my browser
  Open Excel Document    E:\VuoroNetDatesData.xlsx    Sheet2
  ${UserName}  Read Excel Cell  2  2
  ${Password}  Read Excel Cell  2  3
  Close Current Excel Document
  Set Selenium Implicit Wait    5
  Click Element    xpath=//*[@value='Kirjaudu']
  Input username    ${UserName}
  Input pass    ${Password}

  Click Button    Sign in

Time Schedule
    [Arguments]   ${start}   ${end}
   ${startLIST}  Create List   ${start}
   ${endLIST}  Create List   ${end}
   Log To Console    ${startLIST}  



    Log To Console    ${start}
    Log To Console    ${end}
    Click Element    ${AikaVali}

    Clear Element Text    ${StartDate} 
    Input Text        ${StartDate}           ${start}
    Clear Element Text    ${EndDate}
    Input Text         ${EndDate}             ${end}

    Click Button    ${AsetaAikaVali}
    Click Button    ${HaeVuorot}
    Scroll Element Into View    id=ctl00_ContentPlaceHolder1_UCUsageChart1_Label1
    ${SS}  Get Current Date
    ${SS}  Convert Date  ${SS}  date_format=%d.%m.%Y %H:%M  exclude_millis=yes
    Capture Page Screenshot   ${SS}.jpg

    Set Selenium Implicit Wait    5




