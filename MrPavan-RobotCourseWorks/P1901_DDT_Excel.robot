*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/Keywords/P1802_LoginResources.robot
Library  DataDriver  ../TestData/VuoroNetDatesData.xlsx   sheet_name=Sheet1

Suite Setup  Open my browser
Suite Teardown  Close Browsers
Test Template  Invalid login




*** Variables ***
${allProductsTitle}  Automation Exercise
${url}  https://automationexercise.com/
${expectedHomeTextColor}  orange



*** Test Cases ***
TC01
  Open Browser    ${url}
  Maximize Browser Window


*** Keywords ***
Invalid login
  [Arguments]  ${start}  ${end}
  Input username    ${start}
  Input pass    ${end}
  Click login button
  Error message should be visible



  









