*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
RegTest
    open browser    https://demowebshop.tricentis.com/register  chrome
    maximize browser window
    ${time}=    get selenium timeout
    Log to console      ${time}    #this script prints to the console to find out how long the default waiting time is.


    set selenium timeout    10seconds    # bu metodu buraya ekleyince normalde 5 saniye olan default bekleme suresine daha farkli bir deger atayabiliyoruz
    wait until page contains    Register   # normalde 5 saniye olan bekleme suresi yukardaki metodla beraber 10 saniye olarak ayarlanmis oldu


    select radio button    Gender   M
    input text    name:FirstName    Osmo
    input text    name:LastName     Sahanen
    input text    name:Email        osmosahanen@trbnm.com
    input text    name:Password     SahanenOsmo
    input text    name:ConfirmPassword     SahanenOsmo
    close browser
