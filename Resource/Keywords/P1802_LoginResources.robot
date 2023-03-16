*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${LOGIN URL}    https://admin-demo.nopcommerce.com/
${BROWSER}      chrome


*** Keywords ***
Open my browser
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Close Browsers
    Close All Browsers

Open Login Page
    Go To    ${LOGIN URL}

Input username
    [Arguments]    ${username}
    Input Text    id:Email    ${username}

Input pass
    [Arguments]    ${password}
    Input Text    id:Password    ${password}

Click login button
    Click Element    xpath://button[@type='submit']

Click logout button
    Click Link    xpath://button[@type='submit']

Error message should be visible
    Page Should Contain    Login was unsuccessful

Dashboard page should be visible
    Page Should Contain    Dashboard
