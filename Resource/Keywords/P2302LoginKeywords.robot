*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py

*** Keywords ***
Open My Browser
   [Arguments]   ${url}   ${Browser}
   Open Browser  ${url}   ${Browser}
   Maximize Browser Window
   
Enter User Name
    [Arguments]   ${username}
    Input Text    ${emailTextbox}    ${username}
  
Enter Password
    [Arguments]  ${Password}
    Input Text   ${loginPassword}  ${Password}
    
Click Sign In
   Click Button    ${btnSignIn}

Verify Succesfull Login
   ${loginText}   Get Text    xpath://a[@href='/logout']
   Log To Console    ${loginText}

   Element Text Should Be    ${loginPageVerificationElement}    Log out


Close my browsers
    Close All Browsers