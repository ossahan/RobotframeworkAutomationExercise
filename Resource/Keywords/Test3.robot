*** Settings ***
Library  Collections
*** Variables ***
${columnLength}  10
${spaceLengthBeforeNumber}  ${columnLength}-2
${cou}  100

*** Test Cases ***
Test
  Test4

*** Keywords ***
Test4
  Log To Console    ${SPACE}
 
   FOR    ${counter1}    IN RANGE     1        ${columnLength}

       FOR    ${counter2}    IN RANGE    1    ${counter1}+1
           Log To Console    ${cou}${SPACE}   no_newline=true

      ${cou}  Evaluate    ${cou}+1

       END
       Log To Console    ${SPACE}
       
  END




