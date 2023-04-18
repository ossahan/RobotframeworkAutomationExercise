*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TableValidations
    TableHandling


*** Keywords ***
TableHandling
    open browser    https://www.hotelmycamp.com    edge
    maximize browser window
    click element    id:details-button
    click element    id:proceed-link
    click element    xpath://*[@id="navLogon"]/a
    input text    id:UserName     manager
    input text    id:Password    Manager1!
    click button    id:btnSubmit

    wait until element is visible    xpath://*[@id="datatable_ajax"]/tbody/tr/td
    ${column}    get element count    xpath://*[@id="datatable_ajax"]/tbody/tr/td
    ${row}       get element count    xpath://*[@id="datatable_ajax"]/tbody/tr[5]/td

    log to console      ${column}
    log to console     ${row}

    ${anyData}    get text    xpath://*[@id="datatable_ajax"]/tbody/tr[2]/td[3]
    log to console    ${anyData}
    ${anyData1}    get text     xpath://*[@id="datatable_ajax"]/tbody/tr
    log to console    ${anyData1}

    table column should contain     xpath://*[@id="datatable_ajax"]/tbody/tr    3      customerservice

