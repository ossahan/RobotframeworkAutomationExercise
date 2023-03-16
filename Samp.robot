*** Settings ***
Library  SeleniumLibrary
Library    String
Library  FakerLibrary

*** Variables ***
${url}   https://google.com
${tilanUudenNumeron}   xpath://label[contains(.,'Tilaan uuden numeron')]
${lataaLisaa}   xpath://a[contains(.,'Lataa lisää numeroita')]
${resultLocator}    //*[@id="result-stats"]



*** Test Cases ***
TC1
    Open Browser   ${url}    edge
    Maximize Browser Window
    Sleep    1

    ${present}=  Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="L2AGLb"]/div
    Run Keyword If    ${present}    Click Element    xpath://*[@id="L2AGLb"]/div







Test
    Open Browser    https://www.google.com.tr    chrome
    Click Button    Tümünü kabul et
    Input Text      name=q    Robot Framework
    Press Keys     name=q   ENTER
    
