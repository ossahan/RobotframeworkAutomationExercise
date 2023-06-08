*** Settings ***
Library    ExcelLibrary

*** Test Cases ***
Test
  Open Excel Document    TestData/hello.xlsx   1
  Get Sheet  Sayfa1
  Write Excel Cell    1    5    osmansah

   ${dsd}  Read Excel Cell    1    2
   Save Excel Document    TestData/hello.xlsx
   Log To Console    ${dsd}
   Close Current Excel Document
   ${Num}  Set Variable  1
   FOR    ${counter}    IN RANGE    1   20
   Log To Console    ${Num}
   ${Num}  Evaluate    ${Num}+1


   END
