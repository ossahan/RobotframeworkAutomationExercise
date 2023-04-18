*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    edge
${url}    https://www.2dehands.be/



*** Test Cases ***
Handling DropDowns and Lists
    open browser    ${url}    ${browser}
    maximize browser window
    click button    id=gdpr-consent-banner-accept-button
    select from list by label  categoryId    Handtassen en Accessoires
    sleep    3
    select from list by index    categoryId    22
    sleep    3


    close browser

*** Keywords ***
