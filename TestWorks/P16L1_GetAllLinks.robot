*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${i}=  1

*** Test Cases ***
LinksTest
        GetAllLinksTest

*** Keywords ***
GetAllLinksTest
    open browser    https://eksisozluk.com/    edge
    maximize browser window
    click element    xpath://button[contains(.,'İzin ver')]    #Accept rules
   #click element    xpath://button[@id='gdpr-consent-banner-accept-button']    #same as above with different commands
   ${AllLinksCount}=    get element count    xpath://a
   log to console    ${AllLinksCount}

   @{LinkItems}    create list

   FOR     ${i}     IN RANGE    ${AllLinksCount}
   ${linkText}=    get text    xpath:(//a)[${i}+1]
   LOG TO CONSOLE     ${linkText}
   END
   log to console    ${AllLinksCount}
