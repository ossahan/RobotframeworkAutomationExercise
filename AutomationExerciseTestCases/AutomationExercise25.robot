1. Launch browser
2. Navigate to url 'http://automationexercise.com'
3. Verify that home page is visible successfully
4. Scroll down page to bottom
5. Verify 'SUBSCRIPTION' is visible
6. Click on arrow at bottom right side to move upward
7. Verify that page is scrolled up and 'Full-Fledged practice website for Automation Engineers' text is visible on screen

*** Settings ***
Library   SeleniumLibrary
Library    XML
Library    Collections
Variables    ..//PageObjects/AutomationExercise.py

*** Variables ***
${url}   https://automationexercise.com/
${browser}   edge
${expectedElementText}  Full-Fledged practice website for Automation Engineers

*** Test Cases ***
Test Case 25
  Verify Scroll Up using 'Arrow' button and Scroll Down functionality


*** Keywords ***
Verify Scroll Up using 'Arrow' button and Scroll Down functionality
  Open Browser    ${url}   ${browser}
  Maximize Browser Window
  Set Selenium Speed    2
  ${homeColor}  SeleniumLibrary.Get Element Attribute    ${AutExerHome}    style
  Log To Console    ${homeColor}
  Should Contain    ${homeColor}   orange
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Element Should Be Visible    ${AutExerSubsciptionText}
  Wait Until Element Is Enabled    ${AutExerBelowArrow}
  Click Element    ${AutExerBelowArrow}
  ${LIST}  Get WebElements    ${AutExerFullFledged}
  ${textList}   Create List
  FOR      ${Aut}  IN    @{LIST}

  ${textElement}  Get Text   ${Aut}
    Append To List    ${textList}   ${textElement}
    

      Log To Console    ${Aut}
      Log To Console    ${textElement}
   
  END
  
  List Should Contain Value    ${textList}     ${expectedElementText}
  ${textElement}  Get Length   ${textList}
  Log To Console    ${textElement}




