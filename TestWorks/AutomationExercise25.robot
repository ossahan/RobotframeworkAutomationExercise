*** Settings ***
Library   SeleniumLibrary
Variables    Resource/Locators/AutomationExercise.py

*** Variables ***
${url}   https://automationexercise.com/
${browser}   edge

*** Test Cases ***
Test Case 25
  Verify Scroll Up using 'Arrow' button and Scroll Down functionality


*** Keywords ***
Verify Scroll Up using 'Arrow' button and Scroll Down functionality
  Open Browser    ${url}   ${browser}
  Maximize Browser Window
  Set Selenium Speed    5
  ${homeColor}  SeleniumLibrary.Get Element Attribute    ${AutExerHome}    style
  Log To Console    ${homeColor}
  Should Contain    ${homeColor}   orange
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Element Should Be Visible    ${AutExerSubsciptionText}
  Wait Until Element Is Enabled    ${AutExerBelowArrow}
  Click Element    ${AutExerBelowArrow}
  ${LIST}  Get WebElements    ${AutExerFullFledged}
  FOR      ${Aut}  IN    @{LIST}

      Log To Console    ${Aut}

  END




