*** Settings ***

Library    SeleniumLibrary

Library    ExcelLibrary
Library    String
Library    XML
Library    Collections
*** Variables ***
${url}   https://asunnot.oikotie.fi/myytavat-asunnot?pagination=1&locations=%5B%5B64,6,%22Helsinki%22%5D%5D&price%5Bmin%5D=100000&price%5Bmax%5D=280000&size%5Bmin%5D=90&roomCount%5B%5D=4&roomCount%5B%5D=5&buildingType%5B%5D=2&buildingType%5B%5D=64&buildingType%5B%5D=4&buildingType%5B%5D=8&buildingType%5B%5D=32&buildingType%5B%5D=128&cardType=100
${searchRecents1}  xpath=/html/body/main/div[5]/listing-search/section[2]/div/div/div/search-result-cards-v2/div/div
${haeKohteet}  xpath=(//*[@class='button__text'])[4]
${esittely}  xpath=//*[@class='card-tags']


*** Test Cases ***
Oikotie
  Oikotie esittely
*** Keywords ***
Oikotie esittely
   Open Browser      ${url}  chrome
   Maximize Browser Window
   Set Selenium Implicit Wait    5
   Select Frame    id=sp_message_iframe_783479
   Click Element    xpath=//*[text()='Hyväksy kaikki evästeet']
   Unselect Frame
   Scroll Element Into View    xpath=(//span[@class='button__text'])[4]
   ${hae}  Get Text    ${haeKohteet}
   ${hae}  Get Substring    ${hae}    13  -1
   Log To Console    ${hae}




   @{elementLists}  Get WebElements    ${esittely}
   ${rowNum}  Set Variable  1
   ${Num}  Set Variable  1

   FOR    ${element}    IN    @{elementLists}
          ${elementText}  Get Text   ${element}
          ${present}  Run Keyword And Return Status    Should Contain    ${elementText}    ESITTELY
        IF    ${present}

                ${new}  SeleniumLibrary.Get Element Attribute   xpath=/html/body/main/div[5]/listing-search/section[2]/div/div/div/search-result-cards-v2/div/div[${num}]/card-v2/card-v2-regular/a    href
                Log To Console    ${new}

                Open Excel Document      TestData/hello.xlsx       1
                Get Sheet  Sayfa1
                Write Excel Cell    1    ${Num}    ${new}
                ${dsd}  Read Excel Cell    1    ${Num}
                Save Excel Document    TestData/hello.xlsx
                Log To Console    ${dsd}
        END

         Remove String  ${elementText}
         Remove String  ${new}
         ${Num}  Evaluate  +1
   END
       Close Current Excel Document











   