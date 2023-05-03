*** Settings ***
Library    Collections

*** Variables ***
@{List}  a,b,c,d,e,f,g
*** Test Cases ***
Test
  Test  6  Y
*** Keywords ***
Test
  [Arguments]  ${satirSayisi}  ${sekil}


  FOR    ${counter1}    IN RANGE    1      ${satirSayisi}
  FOR    ${counter2}    IN RANGE    ${satirSayisi}  1   -1
  IF    ${counter1}==1 and ${counter2}== 6
    Log To Console     \n${sekil}   no_newline=true
   ELSE
     Log To Console     ${sekil}   no_newline=true
   END



  END
  Log To Console   ${SPACE}
  ${satirSayisi}=  Evaluate    ${satirSayisi}-1

  END


  FOR    ${counter1}    IN RANGE    1      ${satirSayisi}
  FOR    ${counter2}    IN RANGE    1  ${satirSayisi}

     Log To Console     ${sekil}   no_newline=true




  END
  Log To Console   ${SPACE}
  ${satirSayisi}=  Evaluate    ${satirSayisi}-1

  END






