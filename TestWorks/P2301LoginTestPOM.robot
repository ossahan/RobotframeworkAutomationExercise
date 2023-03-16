*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/P2302LoginKeywords.robot


*** Variables ***
${Browser}   headlesschrome
${url}   https://demowebshop.tricentis.com/login
${userName}  osmosahanen@trbnm.com
${Password}  SahanenOsmo

*** Test Cases ***
Login Test
    Open My Browser     ${url}      ${Browser}
    Enter User Name    ${username}
    Enter Password    ${Password}
    Click Sign In
    Verify Succesfull Login

    #Close my browsers



