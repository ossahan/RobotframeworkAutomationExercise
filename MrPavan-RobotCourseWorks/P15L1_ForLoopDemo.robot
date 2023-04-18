*** Settings ***
Library      SeleniumLibrary
Library    Collections

*** Test Cases ***
ForLoop
  ForLoop1
        ForLoop6WithExit
*** Keywords ***
ForLoop1
      ${LIST}  Create List
     # ${counter}
      FOR  ${i}   IN RANGE      1    10000     5

      #FOR  ${counter}    IN RANGE  3   19

               IF    ${i}%4==0 and ${i}%9 ==0

               Append To List  ${LIST}     ${i}

              END


      #END





      END
      Log To Console   ${LIST}'


       FOR    ${element}    IN    @{LIST}
       Remove From List    ${LIST}        ${element}

      END

       log to console  ${LIST}

ForLoop2
        FOR        ${i}      IN  1    2    3    4  5    6    7    8
        log to console    ${i}
        exit for loop if    ${i}==3
        END

ForLoop3WithList
        @{items}    create list    1   2  3  4  5
        FOR     ${i}    IN     @{items}
        log to console    ${i}
        END

ForLoop4
        FOR     ${i}    IN     osman    fadime    saime    zahide
        log to console    ${i}
        END

ForLoop5
        @{namesList}    create list    osman    fadime    saime    zahide
        FOR     ${i}    IN     @{namesList}
        log to console    ${i}
        END

ForLoop6WithExit

     @{items}    create list    1   2  3  4  5

        FOR    ${i}    IN    @{items}
        log to console     ${i}
        exit for loop if    ${i}==3
        END




