*** Settings ***


*** Variables ***

${columnLength}  10
${end2}  2
${spaceLengthBeforeNumber}  ${columnLength}-2



*** Test Cases ***
Test
  Test1
*** Keywords ***
Test1

   Log To Console    ${SPACE}
  FOR    ${counter1}    IN RANGE    1   ${columnLength}

  FOR    ${counter3}    IN RANGE   0   ${spaceLengthBeforeNumber}
        Log To Console    ${SPACE}  no_newline=true

  END
  ${spaceLengthBeforeNumber}  Evaluate    ${spaceLengthBeforeNumber}-1



  FOR    ${counter2}    IN RANGE    0   ${counter1}
      Log To Console   X${SPACE}   no_newline=true

  END



      Log To Console    ${SPACE}


  END