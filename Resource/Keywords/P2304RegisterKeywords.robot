*** Settings ***
Library         SeleniumLibrary
Variables       ../PageObjects/Locators.py


*** Keywords ***
Open my browser
    [Arguments]    ${url}    ${Browser}
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window

Mark your gender
    [Arguments]    ${Gender}
    Select Radio Button    Gender    ${Gender}

Enter Last Name
    [Arguments]    ${lastname}
    Input Text    ${lastNameReg}    ${lastname}

Enter Password
    [Arguments]    ${password}
    Input Text    ${passwordReg}    ${password}
    Input Text    ${confirmPasswordReg}    ${password}

Click register Button
    Click Button    ${registerButton}

Verify Account Registered
    Page Should Contain    Your registration completed

Enter First Name
    [Arguments]    ${firstname}
    Input Text    ${firstNameReg}    ${firstname}

Enter Email
    [Arguments]    ${email}
    Input Text    ${emailReg}    ${email}
