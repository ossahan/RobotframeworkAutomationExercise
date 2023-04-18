*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Mouse Actions
    Right click/open context menu
    double click options
    drag and drop actions


*** Keywords ***
Right click/open context menu
    open browser    https://swisnl.github.io/jQuery-contextMenu/demo/async-promise.html   edge
    maximize browser window
    open context menu    xpath://span[contains(text(),'right click me')]
    sleep    3

Double click options
    go to       https://demo.guru99.com/test/simple_context_menu.html
    maximize browser window

    set selenium speed    1
    select frame     id:gdpr-consent-notice
    click element    id:save
    unselect frame
    double click element    xpath://*[@id="authentication"]/button
    handle alert     Accept


Drag and drop actions
   go to     https://demo.guru99.com/test/drag_drop.html
   maximize browser window

   drag and drop     id:fourth    id:amt7
   ${dragDropText}=    get text    xpath://*[@id="bal3"]/table/tbody
   element should be visible    xpath://*[@id="bal3"]/table/tbody
   log to console    ${dragDropText}
   close browser








