*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/P1802_LoginResources.robot

Suite Setup         Open my browser
#Suite Teardown    Close Browsers
Test Template       Invalid login


*** Variables ***
${rightEmail}=          admin@yourstore.com
${rightPassword}=       admin
${wrongPassword}=       xyzsa
${wrongUser}=           trsgxvx@yourstore.com


*** Test Cases ***    username    password
Right User empty pass    ${rightEmail}    ${EMPTY}
Right User wrong pass    ${rightEmail}    ${wrongPassword}
Wrong User Right pass    ${wrongUser}    ${rightPassword}
Wrong User empty pass    ${wrongUser}    ${EMPTY}
Wrong User wrong pass    ${wrongUser}    ${wrongPassword}


*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pass    ${password}
    Click login button
    Error message should be visible
