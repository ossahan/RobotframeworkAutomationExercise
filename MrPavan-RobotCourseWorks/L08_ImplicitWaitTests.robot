*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
RegTest
    open browser    https://demowebshop.tricentis.com/register  chrome
    maximize browser window
    ${implicittime}=     get selenium implicit wait    #implicit wait yazip sure yazmayinca hic bekleme olmuyor.
    log to console    ${implicittime}    #0 seconds

    set selenium implicit wait    3 seconds    #Bu komutu buraya yazmak herhangi bir locatei bulmak
                                                #icin icin error vermeden once en fazla  verilen sure kadar bekleme yapmaya yarar

    ${implicittime}=     get selenium implicit wait
    log to console    ${implicittime}    #3 seconds olarak yazdiracaktir

    select radio button    Gender   M
    input text    name:FirstName    Osmo
    input text    name:LastName     Sahanen
    input text    name:Email        osmosahanen@trbnm.com
    input text    name:Password     SahanenOsmo
    input text    name:ConfirmPassword     SahanenOsmo
    close browser
