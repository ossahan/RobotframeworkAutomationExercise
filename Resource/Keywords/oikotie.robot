*** Settings ***

Library    SeleniumLibrary

Library    ExcelLibrary
Library    String

Library    Collections
*** Variables ***
${url}   https://asunnot.oikotie.fi/myytavat-asunnot?pagination=1&locations=%5B%5B64,6,%22Helsinki%22%5D%5D&price%5Bmin%5D=100000&price%5Bmax%5D=280000&size%5Bmin%5D=90&roomCount%5B%5D=4&roomCount%5B%5D=5&buildingType%5B%5D=2&buildingType%5B%5D=64&buildingType%5B%5D=4&buildingType%5B%5D=8&buildingType%5B%5D=32&buildingType%5B%5D=128&cardType=100
${searchRecents1}  xpath=/html/body/main/div[5]/listing-search/section[2]/div/div/div/search-result-cards-v2/div/div
${haeKohteet}  xpath=(//*[@class='button__text'])[4]
${ElementsInEsittely}  xpath=//*[@class='card-tags']
${frameLocation}   id=sp_message_iframe_783479
${rowNum}  Set Variable  1
${row}    2

${filePath}  TestData/hello.xlsx
${SheetName}  Sayfa1
${AcceptCookies}  xpath=//*[text()='Hyväksy kaikki evästeet']


*** Test Cases ***
Oikotie
  Oikotie esittely  ${url}
  Handle iFrame    ${frameLocation}  ${AcceptCookies}
   Handle Excel document    ${filePath}   ${SheetName}     1
   Find listings with "ESITTELY" time    ${ElementsInEsittely}



*** Keywords ***
Oikotie esittely
   [Arguments]  ${url}
   Open Browser      ${url}  chrome
   ${title}  Get Title
   Maximize Browser Window
   Set Selenium Implicit Wait    5
Handle iFrame
   [Arguments]   ${frameLocation}  ${AcceptCookies}
   Select Frame    ${frameLocation}
   Click Element    ${AcceptCookies}
   Unselect Frame
#   Scroll Element Into View    xpath=(//span[@class='button__text'])[4]
#   ${hae}  Get Text    ${haeKohteet}
#   ${hae}  Get Substring    ${hae}    13  -1
#   Log To Console    ${hae}
   
   ${EsittelyPageLink}  Set Variable

 Handle Excel document
    [Arguments]   ${filePath}    ${SheetName}   ${DocId}
    Open Excel Document       ${filePath}     ${DocId}
    Get Sheet  Sayfa1
    ${column}     Read Excel Cell    1    1
    ${time}  Get Time
    Write Excel Cell    1   ${column}   ${time}
    Close Current Excel Document

Find listings with "ESITTELY" time 
   [Arguments]  ${ElementsInEsittely}
   @{elementLists}  Get WebElements    ${ElementsInEsittely}
   ${index}  Set Variable  1

   FOR    ${element}    IN    @{elementLists}
          Scroll Element Into View    ${element}
          ${elementText}  Get Text   ${element}
          ${present}  Run Keyword And Return Status    Should Contain    ${elementText}    ESITTELY
        IF    ${present}

                ${EsittelyPageLink}  SeleniumLibrary.Get Element Attribute   xpath=/html/body/main/div[5]/listing-search/section[2]/div/div/div/search-result-cards-v2/div/div[${index}]/card-v2/card-v2-regular/a    href
                Log To Console    ${EsittelyPageLink}

                Go To    ${EsittelyPageLink}

                ${present}  Run Keyword And Return Status  Element Should Be Enabled    id=sp_message_iframe_783479
        IF    ${present}
              Select Frame    id=sp_message_iframe_783479
                
                Click Element    xpath=//*[text()='Hyväksy kaikki evästeet']
                Unselect Frame
        END

                Open Excel Document      TestData/hello.xlsx       2
                Get Sheet  Sayfa1
                ${column}     Read Excel Cell    1    1
                Write Excel Cell   ${row}    ${column}        ${EsittelyPageLink}
                ${dsd}  Read Excel Cell   ${row}    ${column}
                Save Excel Document    TestData/hello.xlsx
                Log To Console    ${dsd}
                Close Current Excel Document
                Switch Browser  1
        END


         ${row}  Evaluate  ${row}+1
         ${index}  Evaluate  ${index}+1
    END

                ${column}  Evaluate    ${column}+1
                Open Excel Document      TestData/hello.xlsx       3
                Get Sheet  Sayfa1
                Write Excel Cell    1    1    ${column}
                Close Current Excel Document












   