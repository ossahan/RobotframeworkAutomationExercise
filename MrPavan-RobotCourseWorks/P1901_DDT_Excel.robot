*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${allProductsTitle}  Automation Exercise
${url}  https://automationexercise.com/
${expectedHomeTextColor}  orange



*** Test Cases ***
TC01
  Open Browser    ${url}  gc
  Maximize Browser Window







