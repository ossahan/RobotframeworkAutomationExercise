*** Settings ***
Library             SeleniumLibrary
Resource            ../Resource/Keywords/P1802_LoginResources.robot
Library             DataDriver    ../TestData/LoginData.csv

Suite Setup         Open my browser
Suite Teardown      Close Browsers
Test Template       Invalid login


*** Test Cases ***
LoginTestWithExcel using    ${username}    ${password}


*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pass    ${password}
    Click login button
    Error message should be visible

